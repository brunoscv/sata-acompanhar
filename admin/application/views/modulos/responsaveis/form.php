<div id="main-wrapper" class="container" style="margin-top: 2em; height: 100vh;">
	<div class="row" data-container="all">
        <div class="col-md-12">
			<div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Responsaveis / <?php echo (@$item->id) ? "Editar" : "Adicionar"?> </h4>
					<a href="<?php echo site_url("responsaveis/");?>" class="btn btn-primary pull-right"><span class="fa fa-list"></span> Ir para a Listagem</a>
				</div>
				<div class="panel-body" style="margin-top:10px;">
					<?php $this->load->view('layout/messages.php'); ?>
					<form id="form_responsaveis" action="<?php echo current_url(); ?>" class="form-horizontal" method="post">
						<input name="id" type="hidden" id="id" class="form-control" value="<?php echo set_value("id", @$item->id) ?>" />
						<div class="form-group">
							<label class="col-sm-2 control-label" for="pacientes_id">Paciente</label>
							<div class="col-sm-10">
								<?php echo form_dropdown('pacientes_id', $listaPacientes, set_value('pacientes_id', @$item->pacientes_id), 
								'data-size="7" data-live-search="true" class="form-control fill_selectbtn_in own_selectbox" id="pacientes" required=""'); ?>
								<?php echo form_error('pacientes_id'); ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="nome_resp">Nome</label>
							<div class="col-sm-10">
								<input name="nome_resp" type="text" id="nome_resp" class="form-control" value="<?php echo set_value("nome_resp", @$item->nome_resp) ?>" />
							<?php echo form_error('nome_resp'); ?>
							</div>
						</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="cpf_resp">CPF</label>
								<div class="col-sm-10">
									<input name="cpf_resp" type="text" id="cpf_resp" class="form-control" value="<?php echo set_value("cpf_resp", @$item->cpf_resp) ?>" />
								<?php echo form_error('cpf_resp'); ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="telefone_resp">Tel</label>
								<div class="col-sm-10">
									<input name="telefone_resp" type="text" id="telefone_resp" class="form-control" value="<?php echo set_value("telefone_resp", @$item->telefone_resp) ?>" />
								<?php echo form_error('telefone_resp'); ?>
								</div>
							</div>
								<div class="form-group">
								<label class="col-sm-2 control-label" for="telefonedois_resp">Cel</label>
								<div class="col-sm-10">
									<input name="telefonedois_resp" type="text" id="telefonedois_resp" class="form-control" value="<?php echo set_value("telefonedois_resp", @$item->telefonedois_resp) ?>" />
								<?php echo form_error('telefonedois_resp'); ?>
								</div>
							</div>
																			
						<div class="form-actions">
							<div class="col-sm-10 col-offset-2">
								<input type="submit" name="enviar" class="btn btn-primary" value="Salvar" />
								<a href="<?php echo site_url("responsaveis"); ?>" class="btn">
									Cancelar
								</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/responsaveis/js.js"></script> -->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/responsaveis/validate.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$("#pacientes").selectpicker();
		$("#filtro_field").selectpicker();
		$("#cpf_resp").mask("999.999.999-99");
		$("#telefone_resp").mask("(99)9999-9999");
		$("#telefonedois_resp").mask("(99)99999-9999");
	});
</script>