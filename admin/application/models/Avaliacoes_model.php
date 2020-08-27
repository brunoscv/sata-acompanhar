<?php

class Avaliacoes_model extends CI_Model {
	public $table = "avaliacoes";
	public function __construct() {
		parent::__construct();
	}

	function get_perguntas() {
		return $this->db->query(" SELECT *
								  FROM perguntas
								  ORDER BY id ASC")
				 		->result();
	}
	
}
