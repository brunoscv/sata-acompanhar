<?php
class Responsaveis extends MY_Controller {
	public $data;	
	function __construct(){
		parent::__construct();
		$this->_auth();
		
		$this->load->model("Responsaveis_model");
		$this->load->model("Pacientes_model");
		
		//adicione os campos da busca
		$camposFiltros["r.nome_resp"] = "Nome";
		$this->data['campos']    			= $camposFiltros;
	}
	
	function index(){
		$perPage = '10';
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
		$countResponsaveis = $this->db
			->select("count(r.id) AS quantidade")
			->from("responsaveis AS r")
			->get()->row();
		$quantidadeResponsaveis = $countResponsaveis->quantidade;
		
		if( !is_null($this->input->get('busca')) ){
			$campo = $this->input->get('filtro_field', true);
			$valor = $this->input->get('filtro_valor', true);

			if($campo && $valor){
				if( array_key_exists($campo, $this->data['campos']) ){
					$this->db->where("{$campo} LIKE","%".$valor."%");
				}
			}
		}
		
		$resultResponsaveis = $this->db
			->select("*")
			->from("responsaveis AS r")
			->limit($perPage,$offset)
			->get();
		$this->data['listaResponsaveis'] = $resultResponsaveis->result();
		
		$this->load->library('pagination');
		$config['base_url'] = site_url("responsaveis/index")."?";
		$config['total_rows'] = $quantidadeResponsaveis;
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
		//fim Campos relacionados
		
		
		if($this->input->post('enviar')){
			
			if( $this->form_validation->run('Responsaveis') === FALSE || !empty($this->data['msg_error']) ){
				$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
			} else {
				
				//Preenche objeto com as informações do formulário				
				$responsaveis	= array();
				//$responsaveis['id'] 							= $this->input->post('id', TRUE);
				$responsaveis['nome_resp'] 					= $this->input->post('nome_resp', TRUE);
				$responsaveis['cpf_resp'] 					= $this->input->post('cpf_resp', TRUE);
				$responsaveis['telefone_resp'] 			= $this->input->post('telefone_resp', TRUE);
				$responsaveis['telefonedois_resp']	= $this->input->post('telefonedois_resp', TRUE);
				$responsaveis['status'] 						= 1;
				$responsaveis['createdAt'] 					= date("Y-m-d");
				
				$sql = $this->db->insert("responsaveis", $responsaveis);

				if($sql) {
					$pacienteResponsavel['responsaveis_id'] = $this->db->insert_id();
					$pacienteResponsavel['pacientes_id'] 		= $this->input->post('pacientes_id', TRUE);
					$pacienteResponsavel['status']					= 1;
					$pacienteResponsavel['createdAt'] 			= date("Y-m-d");

					$this->db->insert("paciente_responsavel", $pacienteResponsavel);
				}

				$this->session->set_flashdata("msg_success", "Registro adicionado com sucesso!");
				redirect('responsaveis/index');
			}
		}   	
  }
    
	public function editar(){
		$id = $this->uri->segment(3);
		
		//Campos relacionados
		//caso seja necessario adicione os relacionamento aqui
		$pacientes = $this->Pacientes_model->getPacientes();
		$this->data['listaPacientes'] = array();
		$this->data['listaPacientes'][''] = "Escolha um Paciente";
		foreach ($pacientes as $pacientes) {
			$this->data['listaPacientes'][$pacientes->id] = $pacientes->nome_pac;
    }
		//fim Campos relacionados
		

		$responsaveis = $this->db
						->from("responsaveis AS m")
						->where("id", $id)->get()->row();

		if(!$responsaveis){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('responsaveis/index');
		} else {
			$this->data['item'] = $responsaveis;
			if( $this->input->post('enviar') ){
				if( $this->form_validation->run('Responsaveis') === FALSE ){
					$this->data['msg_error'] = (!empty($this->data['msg_error'])) ? $this->data['msg_error'] : validation_errors("<p>","</p>");
				} else {
					
					$responsaveis	= array();
					$responsaveis['id'] 								= $this->input->post('id', TRUE);
					$responsaveis['nome_resp'] 					= $this->input->post('nome_resp', TRUE);
					$responsaveis['cpf_resp'] 					= $this->input->post('cpf_resp', TRUE);
					$responsaveis['telefone_resp'] 			= $this->input->post('telefone_resp', TRUE);
					$responsaveis['telefonedois_resp']	= $this->input->post('telefonedois_resp', TRUE);
					$responsaveis['status'] 						= $this->input->post('status', TRUE);
					$responsaveis['createdAt'] 					= $this->input->post('createdAt', TRUE);
					$responsaveis['updatedAt'] 					= $this->input->post('updatedAt', TRUE);
					
					$this->db->where("id",$id);
					$this->db->update("responsaveis",$responsaveis);
				
					$this->session->set_flashdata("msg_success", "Registro <b>#{$responsavei->id}</b> atualizado!");
					redirect('responsaveis/index');
				}
			}
		}
	}
	
	public function delete($id){
		$id = $this->uri->segment(3);
		
		$responsaveis = $this->db
			->from("responsaveis AS m")
			->where("id", $id)->get()->row();
		$this->data['item'] = $responsaveis;
		
		if( !$responsaveis ){
			$this->session->set_flashdata("msg_error", "Registro não encontrado!");
			redirect('responsaveis/index');
		} else {
			$this->data['item'] = $responsaveis;
			
			if( $this->input->post("enviar") ){
				
				$this->db->where("id", $responsaveis->id);
				$this->db->delete("responsaveis");
				
				$this->session->set_flashdata("msg_success", "Registro excluido com sucesso!");
				redirect('responsaveis/index');
			}
		}
	}
}

/* End of file Responsaveises.php */
/* Location: ./system/application/controllers/Responsaveises.php */