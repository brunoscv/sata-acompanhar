<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$config['Responsaveis'] = array(
							array(
								'field' => "id",
								'label' => "Id",
								'rules' => ""
									),
							array(
								'field' => "nome_resp",
								'label' => "Nome",
								'rules' => "required"
									),
							array(
								'field' => "cpf_resp",
								'label' => "CPF",
								'rules' => ""
									),
							array(
								'field' => "telefone_resp",
								'label' => "Tel",
								'rules' => ""
									),
							array(
								'field' => "telefonedois_resp",
								'label' => "Cel",
								'rules' => ""
									),
							array(
								'field' => "status",
								'label' => "Status",
								'rules' => ""
									),
							array(
								'field' => "createdAt",
								'label' => "Criado",
								'rules' => ""
									),
							array(
								'field' => "updatedAt",
								'label' => "Modificado",
								'rules' => ""
									),
);

/* End of file responsaveis.php */
/* Location: ./system/application/config/form_validation/responsaveis.php */