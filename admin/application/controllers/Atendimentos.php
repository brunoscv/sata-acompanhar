<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Atendimentos extends MY_Controller {
	public $data;	
	function __construct(){
		parent::__construct();
		$this->_auth();
		
        $this->load->model("Atendimentos_model");
        $this->load->model("Pacientes_model");
        $this->load->model("Profissionais_model");
		
		//adicione os campos da busca
        //$camposFiltros["c.id"] = "Cod.";
        $camposFiltros["p.nome_pac"] 	= "Paciente";
        $camposFiltros["pr.nome_prof"] 	= "Profissional";
		$this->data['campos']    		= $camposFiltros;
	}
	
	function index(){
		$user_id = $this->session->userdata('userdata')['id'];
		$admin = $this->session->userdata('userdata')['principal'];

		//arShow($this->session->userdata());exit;
		$perPage = '10';
		$offset = ($this->input->get("per_page")) ? $this->input->get("per_page") : "0";

		$countAtendimentos = $this->db
							->select("count(a.id) AS quantidade")
                            ->from("atendimentos AS a")
                            ->join("pacientes as p", "a.pacientes_id = p.id")
							->join("profissionais as pr", "a.profissionais_id = pr.id")
							->join("especialidades as e", "pr.especialidades_id = e.id")
							->get()->row();

		if( !is_null($this->input->get('filtro_valor')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}

		if($admin != 1) {
			$this->db->where("a.profissionais_id", $user_id);
		}
		$quantidadeAtendimentos = $countAtendimentos->quantidade;
	
		$resultAtendimentos = $this->db
                            ->select("a.*, p.nome_pac, pr.nome_prof, e.nome_espec")
                            ->from("atendimentos AS a")
                            ->join("pacientes AS p", "a.pacientes_id = p.id")
							->join("profissionais AS pr", "a.profissionais_id = pr.id")
							->join("especialidades AS e", "pr.especialidades_id = e.id")
							->limit($perPage,$offset)
							->order_by("a.id", "DESC")
                            ->get();

		if( !is_null($this->input->get('filtro_field')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}

		if($admin != 1) {
			$this->db->where("a.profissionais_id", $user_id);
		}
		$this->data['listaAtendimentos'] = $resultAtendimentos->result();
		

		//arShow($this->data['listaAtendimentos'] = $resultAtendimentos->result()); exit;


		$this->load->library('pagination');
		$config['base_url'] = site_url("atendimentos/index")."?";
		$config['total_rows'] = $quantidadeAtendimentos;
		$config['per_page'] = $perPage;
		
		$this->pagination->initialize($config);
		
		$this->data['paginacao'] = $this->pagination->create_links(); 
	}
    
    function criar(){
		$this->data['item'] = new stdClass();
		
		//Campos relacionados
        //caso seja necessario adicione os relacionamento aqui
        $pacientes = $this->Pacientes_model->getPacientes();
		$this->data['listaPacientes'] = array();
		$this->data['listaPacientes'][''] = "Escolha um Paciente";
		foreach ($pacientes as $pacientes) {
			$this->data['listaPacientes'][$pacientes->id] = $pacientes->nome_pac;
        }
        $profissionais = $this->Profissionais_model->getProfissionais();
		$this->data['listaProfissionais'] = array();
		$this->data['listaProfissionais'][''] = "Escolha um Profissional";
		foreach ($profissionais as $profissionais) {
			$this->data['listaProfissionais'][$profissionais->id] = $profissionais->nome_prof;
		}
		//fim Campos relacionados
		
		if($this->input->post('enviar')){
			
			if( $this->form_validation->run('Atendimentos') === FALSE || !empty($this->data['msg_error']) ){
				$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
			} else {
				
				//Preenche objeto com as informações do formulário		
				$consulta	= array();
                //$consulta['id'] 		        = $this->input->post('id', TRUE);
                $consulta['pacientes_id'] 		= $this->input->post('pacientes_id', TRUE);
                $consulta['profissionais_id'] 	= $this->input->post('profissionais_id', TRUE);
                $consulta['status'] 		    = 1;
                $consulta['createdAt'] 		    = date("Y-m-d");
                
                $this->db->insert("atendimentos", $consulta);
	
				$this->session->set_flashdata("msg_success", "Registro adicionado com sucesso!");
				redirect('atendimentos/index');
			}
		} 
	}

	public function editar_atendimentos(){
		$id = $this->uri->segment(3);
		
		//Campos relacionados
		//caso seja necessario adicione os relacionamento aqui
		//fim Campos relacionados

		$consulta = $this->db
						->from("atendimentos AS m")
						->where("id", $id)->get()->row();

		if(!$consulta){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('atendimentos/index');
		} else {
			$this->data['item'] = $consulta;
			if( $this->input->post('enviar') ){
				if( $this->form_validation->run('Atendimentos') === FALSE ){
					$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
				} else {
					
					$consulta	= array();
                    //$consulta['id']	= $this->input->post('id', true);
                    $consulta['pacientes_id']	    = $this->input->post('pacientes_id', true);
                    $consulta['profissionais_id']	= $this->input->post('profissionais_id', true);
                    $consulta['status']	            = $this->input->post('status', true);
                    $consulta['createdAt']	        = $this->input->post('createdAt', true);
                    $consulta['updatedAt']	        = $this->input->post('updatedAt', true);
					
					$this->db->where("id",$id);
					$this->db->update("atendimentos",$consulta);
				
					$this->session->set_flashdata("msg_success", "Registro <b>#{$consulta->id}</b> atualizado!");
					redirect('atendimentos/index');
				}
			}
		}
	}
	
	public function delete_atendimentos($id){
		$id = $this->uri->segment(3);
		
		$consulta = $this->db
						->from("atendimentos AS m")
						->where("id", $id)->get()->row();
		$this->data['item'] = $consulta;
		
		if( !$consulta ){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('atendimentos/index');
		} else {
			$this->data['item'] = $consulta;
			
			if( $this->input->post("enviar") ){
				$this->db->where("id", $consulta->id);
				$this->db->delete("atendimentos");
				
				$this->session->set_flashdata("msg_success", "Registro excluido com sucesso!");
				redirect('atendimentos/index');
			}
		}
	}

	function avaliacoes($atendimentos_id = null){
		$perPage = '10';
		$offset = ($this->input->get("per_page")) ? $this->input->get("per_page") : "0";

		$countAvaliacoes = $this->db
			->select("count(a.id) AS quantidade")
			->from("avaliacoes AS a")
			->join("atendimentos AS c", "a.atendimentos_id = c.id")
			->join("pacientes AS p", "c.pacientes_id = p.id")
			->join("profissionais AS pr", "c.profissionais_id = pr.id")
			->get()->row();


		if( !is_null($this->input->get('filtro_field')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		// if($atendimentos_id) {
		// 	$this->db->where("atendimentos_id", $atendimentos_id);
		// }
		$quantidadeAvaliacoes = $countAvaliacoes->quantidade;


		$resultAvaliacoes = $this->db
			->select("a.id, c.id AS atendimentos_id, p.nome_pac, pr.nome_prof, a.status, a.createdAt")
			->from("avaliacoes AS a")
			->join("atendimentos AS c", "a.atendimentos_id = c.id")
			->join("pacientes AS p", "c.pacientes_id = p.id")
			->join("profissionais AS pr", "c.profissionais_id = pr.id")
			->limit($perPage,$offset)
			->get();
		
		if( !is_null($this->input->get('filtro_field')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		// if($atendimentos_id) {
		// 	$this->db->where("atendimentos_id", $atendimentos_id);
		// }
		$this->data['listaAvaliacoes'] = $resultAvaliacoes->result();
		

		$this->load->library('pagination');
		$config['base_url'] = site_url("atendimentos/avaliacoes")."?";
		$config['total_rows'] = $quantidadeAvaliacoes;
		$config['per_page'] = $perPage;
		$this->pagination->initialize($config);
		
		$this->data['paginacao'] = $this->pagination->create_links(); 
	}

	public function criar_avaliacoes(){
		
	}

	public function resultados(){
		
	}
	
	public function atendimentos($atendimentos_id = null){
	
		$perPage = '10';
		$offset = ($this->input->get("per_page")) ? $this->input->get("per_page") : "0";

		$countAtendimentos = $this->db
			->select("count(a.id) AS quantidade")
			->from("atendimentos AS a")
			->join("atendimentos AS c", "a.atendimentos_id = c.id")
			->join("pacientes AS p", "c.pacientes_id = p.id")
			->join("profissionais AS pr", "c.profissionais_id = pr.id")
			->get()->row();


		if( !is_null($this->input->get('filtro_field')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		if($atendimentos_id) {
			$this->db->where("atendimentos_id", $atendimentos_id);
		}
		$quantidadeAtendimentos = $countAtendimentos->quantidade;


		$resultAtendimentos = $this->db
			->select("a.id, c.id AS atendimentos_id, p.nome_pac, pr.nome_prof, a.qtd_atendimentos, a.freq_atendimentos, a.data_inicio, a.data_fim, a.status, a.createdAt")
			->from("atendimentos AS a")
			->join("atendimentos AS c", "a.atendimentos_id = c.id")
			->join("pacientes AS p", "c.pacientes_id = p.id")
			->join("profissionais AS pr", "c.profissionais_id = pr.id")
			->limit($perPage,$offset)
			->get();
		
		if( !is_null($this->input->get('filtro_field')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		if($atendimentos_id) {
			$this->db->where("atendimentos_id", $atendimentos_id);
		}
		$this->data['listaAtendimentos'] = $resultAtendimentos->result();
		

		$this->load->library('pagination');
		$config['base_url'] = site_url("atendimentos/atendimentos")."?";
		$config['total_rows'] = $quantidadeAtendimentos;
		$config['per_page'] = $perPage;
		$this->pagination->initialize($config);
		
		$this->data['paginacao'] = $this->pagination->create_links(); 
	}

    public function gerarAtendimentos($atendimentos_id) {
        $atendimento = array();
        $atendimento = $this->db
						->from("atendimentos AS a")
						->where("id", $atendimentos_id)
                        ->get()->result();
        //arShow($atendimento); exit;
            
        for ($i=1; $i <= $atendimento[0]->qtd_atendimentos ; $i++) {
            $atendimentosSessoes = array();
            $atendimentosSessoes['atendimentos_id'] 	= $atendimentos_id;
            $atendimentosSessoes['data_ref'] 		    = date("Y-m-d");
			$atendimentosSessoes['atendimentos_id'] 		= $atendimentos_id;
			$atendimentosSessoes['presenca'] 		 	= 0;
            $atendimentosSessoes['status'] 		 		= 1;
			$atendimentosSessoes['createdAt'] 	 		= date("Y-m-d");
			
            $this->db->insert("atendimentos_sessoes", $atendimentosSessoes);
        }
        return $atendimentosSessoes;     
    }

    private function _inserir_atendimentos_realizados() {

	}
	
	// function criar_atendimentos(){
	// 	$this->data['item'] = new stdClass();
		
	// 	//Campos relacionados
	// 	//caso seja necessario adicione os relacionamento aqui
	// 	//fim Campos relacionados

	// 	if($this->input->post('enviar')){
	// 		if( $this->form_validation->run('Atendimentos') === FALSE || !empty($this->data['msg_error']) ){
	// 			$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
	// 		} else {
	// 			//Preenche objeto com as informações do formulário			
	// 			$atendimento = array();
	// 			$atendimento['id'] 				  = $this->input->post('id', TRUE);
	// 			$atendimento['atendimentos_id'] 	  = $this->input->post('atendimentos_id', TRUE);
	// 			$atendimento['qtd_atendimentos']  = $this->input->post('qtd_atendimentos', TRUE);
	// 			$atendimento['freq_atendimentos'] = $this->input->post('freq_atendimentos', TRUE);
	// 			$atendimento['data_ref'] 		  = $this->input->post('data_ref', TRUE);
	// 			$atendimento['status'] 			  = $this->input->post('status', TRUE);
	// 			$atendimento['createdAt'] 		  = $this->input->post('createdAt', TRUE);
	// 			$atendimento['updatedAt'] 		  = $this->input->post('updatedAt', TRUE);
			
	// 			$this->db->insert("atendimentos", $atendimento);
    //             $atendimentos_id = $this->db->insert_id();

    //             $this->gerarAtendimentos($atendimentos_id, $atendimentos_id);
	
	// 			$this->data['msg_success'] = $this->session->set_flashdata("msg_success", "Registro adicionado com sucesso!");
	// 			redirect('atendimentos/index');
	// 		}
	// 	}   	
  	// }
    
	// public function editar_atendimentos(){
	// 	$id = $this->uri->segment(3);
		
	// 	//Campos relacionados
	// 	//caso seja necessario adicione os relacionamento aqui
	// 	//fim Campos relacionados
		

	// 	$atendimento = $this->db
	// 					->from("atendimentos AS m")
	// 					->where("id", $id)->get()->row();

	// 	if(!$atendimento){
	// 		$this->session->set_flashdata("msg_error", "Registro não encontrado!");
	// 		redirect('atendimentos/index');
	// 	} else {
	// 		$this->data['item'] = $atendimento;
	// 		if( $this->input->post('enviar') ){
	// 			if( $this->form_validation->run('Atendimentos') === FALSE ){
	// 				$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
	// 			} else {
					
	// 				$atendimento	= array();
	// 										$atendimento['id']	= $this->input->post('id', true);
	// 										$atendimento['atendimentos_id']	= $this->input->post('atendimentos_id', true);
	// 										$atendimento['qtd_atendimentos']	= $this->input->post('qtd_atendimentos', true);
	// 										$atendimento['freq_atendimentos']	= $this->input->post('freq_atendimentos', true);
	// 										$atendimento['data_ref']	= $this->input->post('data_ref', true);
	// 										$atendimento['status']	= $this->input->post('status', true);
	// 										$atendimento['createdAt']	= $this->input->post('createdAt', true);
	// 										$atendimento['updatedAt']	= $this->input->post('updatedAt', true);
					
	// 				$this->db->where("id",$id);
	// 				$this->db->update("atendimentos",$atendimento);
				
	// 				$this->data['msg_success'] = $this->session->set_flashdata("msg_success", "Registro <b>#{$atendimento->id}</b> atualizado!");
	// 				redirect('atendimentos/index');
	// 			}
	// 		}
	// 	}
	// }
	
	// public function delete_atendimentos($id){
	// 	$id = $this->uri->segment(3);
		
	// 	$atendimento = $this->db
	// 					->from("atendimentos AS m")
	// 					->where("id", $id)->get()->row();
	// 	$this->data['item'] = $atendimento;
		
	// 	if( !$atendimento ){
	// 		$this->data['msg_error'] = $this->session->set_flashdata("msg_error", "Registro não encontrado!");
	// 		redirect('atendimentos/index');
	// 	} else {
	// 		$this->data['item'] = $atendimento;
			
	// 		if( $this->input->post("enviar") ){
	// 			$this->db->where("id", $atendimento->id);
	// 			$this->db->delete("atendimentos");
				
	// 			$this->data['msg_success'] = $this->session->set_flashdata("msg_success", "Registro excluido com sucesso!");
	// 			redirect('atendimentos/index');
	// 		}
	// 	}
	// }

	public function sessoes($atendimentos_id = null){
	
		$perPage = '20';
		$offset = ($this->input->get("per_page")) ? $this->input->get("per_page") : "0";

		if( !is_null($this->input->get('busca')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		if(!$atendimentos_id) {
			$countAtendimentosSessoes = 
				$this->db
					 ->select("count(as.id) AS quantidade")
					 ->from("atendimentos_sessoes AS as")
					//  ->join("atendimentos AS c", "a.atendimentos_id = c.id")
					//  ->join("pacientes AS p", "c.pacientes_id = p.id")
					//  ->join("profissionais AS pr", "c.profissionais_id = pr.id")
					 ->get()->row();
		} else {
			$countAtendimentosSessoes = 
				$this->db
					 ->select("count(as.id) AS quantidade")
					 ->from("atendimentos_sessoes AS as")
					//  ->join("atendimentos AS c", "a.atendimentos_id = c.id")
					//  ->join("pacientes AS p", "c.pacientes_id = p.id")
					//  ->join("profissionais AS pr", "c.profissionais_id = pr.id")
					 ->where(array("as.atendimentos_id" => $atendimentos_id, "as.atendimentos_id" => $atendimentos_id))
					 ->get()->row();
		}
		$quantidadeAtendimentosSessoes = $countAtendimentosSessoes->quantidade;
		
		if( !is_null($this->input->get('busca')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		if(!$atendimentos_id) {
			$resultAtendimentosSessoes = 
				$this->db
					 ->select("as.id, c.id AS atendimentos_id, as.atendimentos_id, p.nome_pac, pr.nome_prof, as.data_atendimento, as.presenca, as.status, as.createdAt")
					//  ->select("*")
					 ->from("atendimentos_sessoes AS as")
					 ->join("atendimentos AS c", "as.atendimentos_id = c.id")
					 ->join("pacientes AS p", "c.pacientes_id = p.id")
					 ->join("profissionais AS pr", "c.profissionais_id = pr.id")
					 ->limit($perPage,$offset)
					 ->get();
		} else {
			$resultAtendimentosSessoes = 
				$this->db
					 ->select("as.id, c.id AS atendimentos_id, as.atendimentos_id, p.nome_pac, pr.nome_prof, as.data_atendimento, as.presenca, as.status, as.createdAt")
					 ->from("atendimentos_sessoes AS as")
					 ->join("atendimentos AS c", "as.atendimentos_id = c.id")
					 ->join("pacientes AS p", "c.pacientes_id = p.id")
					 ->join("profissionais AS pr", "c.profissionais_id = pr.id")
					 ->where(array("as.atendimentos_id" => $atendimentos_id, "as.atendimentos_id" => $atendimentos_id))
					 ->limit($perPage,$offset)
					 ->get();
		}
		$this->data['listaAtendimentos'] = $resultAtendimentosSessoes->result();
		
		
		$this->load->library('pagination');
		$config['base_url'] = site_url("atendimentos/sessoes/". $consultas_id . "/" . $atendimentos_id)."?";
		$config['total_rows'] = $quantidadeAtendimentosSessoes;
		$config['per_page'] = $perPage;
		$this->pagination->initialize($config);
		
		$this->data['paginacao'] = $this->pagination->create_links(); 
	}

	public function mudar_presenca_consulta($sessoes_id, $presenca) {
		
		$result = array();
		$sessoes = array();
		$sessoes = $this->db->from("atendimentos_sessoes AS as")->where("id", $sessoes_id)->get()->row();
		
		if(!$sessoes){
			$result['sucesso'] = false;
		} else {
			$itemSessao			   			= array();
			$itemSessao['updatedAt'] 		= date("Y-m-d");
			$itemSessao['data_atendimento'] = date("Y-m-d : H:i:s");
			
			if($presenca == 1) {
				$itemSessao['presenca']	= 0;
				
				$this->db->where("id",$sessoes_id);
				$this->db->update("atendimentos_sessoes", $itemSessao);
			} else {
				$itemSessao['presenca'] = 1;
				
				$this->db->where("id",$sessoes_id);
				$this->db->update("atendimentos_sessoes", $itemSessao);
			}

			$result['sucesso'] = true;
			$result['presenca'] = $itemSessao;
		}
		header('Content-Type: application/json');
		echo json_encode($result);
		exit;
	}
    	
}

/* End of file Atendimentos.php */
/* Location: ./system/application/controllers/Atendimentos.php */