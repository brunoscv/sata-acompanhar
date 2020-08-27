<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Avaliacoes extends MY_Controller {
	public $data;	
	function __construct(){
		parent::__construct();
		$this->_auth();
		
		$this->load->model("Avaliacoes_model");
		
		//adicione os campos da busca
		$camposFiltros["a.id"] = "Cod.";
		$camposFiltros["a.consultas_id"] 	  = "Cod. Consulta";
		$camposFiltros["a.qtd_atendimentos"]  = "Qtd Atendimentos";
		$camposFiltros["a.freq_atendimentos"] = "Freq. Atendimentos";
		$camposFiltros["a.data_ref"] 		  = "Data Ref.";
		$camposFiltros["a.status"] 			  = "Status";
		$camposFiltros["a.createdAt"] 		  = "Criado";
		$camposFiltros["a.updatedAt"] 		  = "Modificado";
		$this->data['campos']    			  = $camposFiltros;
	}
	
	function index($atendimentos_id = null){
		$perPage = '10';
		$offset = ($this->input->get("per_page")) ? $this->input->get("per_page") : "0";
		$atendimentos_id = $this->uri->segment(3);

		if( !is_null($this->input->get('busca')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		$countAvaliacoes = $this->db
							->select("count(a.id) AS quantidade")
							->from("avaliacoes AS a")
							->join("atendimentos AS atd", "a.atendimentos_id = atd.id")
							->join("pacientes AS p", "atd.pacientes_id = p.id")
							->join("profissionais as pr", "atd.profissionais_id = pr.id")
							->where("a.atendimentos_id", $atendimentos_id)
							->order_by("a.id", "DESC")
							->get()->row();
		$quantidadeAvaliacoes = $countAvaliacoes->quantidade;
		
		if( !is_null($this->input->get('busca')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		$resultAvaliacoes = $this->db
							->select("a.*, p.nome_pac, pr.nome_prof")
							->from("avaliacoes AS a")
							->join("atendimentos AS atd", "a.atendimentos_id = atd.id")
							->join("pacientes AS p", "atd.pacientes_id = p.id")
							->join("profissionais as pr", "atd.profissionais_id = pr.id")
							->where("a.atendimentos_id", $atendimentos_id)
							->order_by("a.id", "DESC")
							->limit($perPage,$offset)
							->get();
		$this->data['listaAvaliacoes'] = $resultAvaliacoes->result();
		$this->data['atendimentos_id'] = $atendimentos_id;
		
		$this->load->library('pagination');
		$config['base_url'] = site_url("avaliacoes/index")."?";
		$config['total_rows'] = $quantidadeAvaliacoes;
		$config['per_page'] = $perPage;
		
		$this->pagination->initialize($config);
		$this->data['paginacao'] = $this->pagination->create_links(); 
	}
    
  	function criar($atendimentos_id = null){
		  $atendimentos_id = $this->uri->segment(3);
		//$this->data['item'] = new stdClass();
		
		//Campos relacionados
		//caso seja necessario adicione os relacionamento aqui
		$perguntas = $this->db
						->from("perguntas AS p")
						->get()->result();
		$this->data['item'] = $perguntas;
		//fim Campos relacionados
		
		if($this->input->post('enviar')){
		
				//Preenche objeto com as informações do formulário				
				$avaliacoes	= array();
				//Insere os dados do atendimento na tabela de atendimentos
                $avaliacoes['atendimentos_id'] = $atendimentos_id;
				$avaliacoes['status'] 		   = 1;
				$avaliacoes['createdAt'] 	   = date("Y-m-d");

				
				$this->db->insert("avaliacoes", $avaliacoes);
				$avaliacoes_id = $this->db->insert_id();
				
				
				$respostas	= array();
				foreach($_POST['resposta'] as $option_num => $option_val) {
					$respostas['avaliacoes_id']    = $avaliacoes_id;
					$respostas['status'] 	      = 1;
					$respostas['createdAt'] 	  = date("Y-m-d");
					$respostas['perguntas_id'] = $option_num;
					$respostas['valor'] 	   = $option_val;
					
					$this->db->insert("respostas", $respostas);
				}
				
				$this->session->set_flashdata("msg_success", "Registro adicionado com sucesso!");
				redirect('avaliacoes/index/'. $atendimentos_id);

		}   	
	  }
	  
	public function ver(){
		$avaliacoes_id = $this->uri->segment(3);
		
		//Campos relacionados
		//caso seja necessario adicione os relacionamento aqui
		//fim Campos relacionados
		
		$respostas = $this->db->select("r.*, prg.desc_pergunta, prg.tipo, av.id AS avaliacoes_id, atd.id AS atendimentos_id")
					->from("respostas AS r")
					->join("perguntas AS prg", "r.perguntas_id = prg.id")
					->join("avaliacoes AS av", "r.avaliacoes_id = av.id")
					->join("atendimentos AS atd", "av.atendimentos_id = atd.id")
					->join("pacientes AS p", "atd.pacientes_id = p.id")
					->join("profissionais as pr", "atd.profissionais_id = pr.id")
					->where("avaliacoes_id", $avaliacoes_id)
					->get()->result();

		if(!$respostas){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('atendimentos');
		} else {
			$this->data['item'] = $respostas;
			$this->data['avaliacoes_id'] = $avaliacoes_id;

		}
	}
    
	public function editar(){
		$id = $this->uri->segment(3);
		
		//Campos relacionados
		//caso seja necessario adicione os relacionamento aqui
		//fim Campos relacionados
		
		$avaliacoes = $this->db
					  ->from("avaliacoes AS a")
					  ->where("id", $id)
					  ->get()->row();

		if(!$avaliacoes){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('avaliacoes');
		} else {
			$this->data['item'] = $avaliacoes;
			if( $this->input->post('enviar') ){
				if( $this->form_validation->run('Avaliacoes') === FALSE ){
					$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
				} else {
					$avaliacoes							= array();
					$avaliacoes['id']					= $this->input->post('id', true);
					$avaliacoes['consultas_id']			= $this->input->post('consultas_id', true);
					$avaliacoes['qtd_atendimentos']		= $this->input->post('qtd_atendimentos', true);
					$avaliacoes['freq_atendimentos']	= $this->input->post('freq_atendimentos', true);
					$avaliacoes['data_ref']				= $this->input->post('data_ref', true);
					$avaliacoes['status']				= $this->input->post('status', true);
					$avaliacoes['createdAt']			= $this->input->post('createdAt', true);
					$avaliacoes['updatedAt']			= $this->input->post('updatedAt', true);
					
					$this->db->where("id",$id);
					$this->db->update("avaliacoes",$avaliacoes);
				
					$this->session->set_flashdata("msg_success", "Registro <b>#{$avaliacoes->id}</b> atualizado!");
					redirect('avaliacoes/');
				}
			}
		}
	}
	
	public function delete(){
		$id = $this->uri->segment(3);
		
		$avaliacoes = $this->db
					  ->from("avaliacoes AS m")
					  ->where("id", $id)
					  ->get()->row();
		$this->data['item'] = $avaliacoes;
		
		if( !$avaliacoes ){
			$this->data['msg_error'] = $this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('avaliacoes');
		} else {
			$this->data['item'] = $avaliacoes;
			
			if( $this->input->post("enviar") ){
				
				$this->db->where("id", $avaliacoes->id);
				$this->db->delete("avaliacoes");
				
				$this->data['msg_success'] = $this->session->set_flashdata("msg_success", "Registro excluido com sucesso!");
				redirect('avaliacoes');
			}
		}
	}
}

/* End of file Atendimentoses.php */
/* Location: ./system/application/controllers/Atendimentoses.php */