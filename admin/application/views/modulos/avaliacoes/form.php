<div id="main-wrapper" class="container" style="margin-top: 2em; height: 100vh;">
	<div class="row" data-container="all">
        <div class="col-md-12">
			<div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Avaliações / <?php echo (@$item->id) ? "Editar" : "Adicionar"?> </h4>
					<a href="<?php echo site_url("avaliacoes/");?>" class="btn btn-primary pull-right"><span class="fa fa-list"></span> Ir para a Listagem</a>
				</div>
				<div class="panel-body" style="margin-top:10px;">
					<?php $this->load->view('layout/messages.php'); ?>
					<div class="row">
						<ul class="">
							<li class="">
								<span class="badge">2</span> - Sim, normalmente
							</li>
							<li class="">
								<span class="badge">1</span> - Às vezes ou parcialmente
							</li>
							<li class="">
								<span class="badge">0</span> - Não, nunca
							</li>
							<li class="">
								<span class="badge">N</span> - Não teve oportunidade
							</li>
							<li class="">
								<span class="badge">D</span> - Desconhecido
							</li>
						</ul>
					</div>
					<div class="row">
						<p class="text-center">Área da Comunicação</p>
						<p class="text-center">Menor que 1 ano</p>
						<p class="text-center">Questões 8 / 8</p>
					</div>

					<form id="form_avaliacoes" action="<?php echo current_url(); ?>" class="form-horizontal" method="post">
						<input name="id" type="hidden" id="id" class="form-control" value="<?php echo set_value("id", @$item->id) ?>" />				
						<table class="display table table-hover mg-top-20">
							<thead>
								<tr>
									<th>#</th>
									<th>Pergunta</th>
									<th class="text-center">Tipo</th>
									<th class="text-center">2</th>
									<th class="text-center">1</th>
									<th class="text-center">0</th>
									<th class="text-center">N</th>
									<th class="text-center">D</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($item as $item): ?>
								<tr>
									<!-- <td><span class="label label-danger"> Inativo </span></td> -->
									<td><?php echo $item->id; ?></td>
									<td><?php echo $item->desc_pergunta; ?></td>
									<td class="text-center"><?php echo ($item->tipo == 1) ? '<span>Receptiva</span>' : '<span>Expressiva</span>'; ?></td>
									<td class="text-center"><input type="radio" name="resposta[<?php echo $item->id; ?>]" value="2" /></td>
									<td class="text-center"><input type="radio" name="resposta[<?php echo $item->id; ?>]" value="1" /></td>
									<td class="text-center"><input type="radio" name="resposta[<?php echo $item->id; ?>]" value="0" /></td>
									<td class="text-center"><input type="radio" name="resposta[<?php echo $item->id; ?>]" value="N" /></td>
									<td class="text-center"><input type="radio" name="resposta[<?php echo $item->id; ?>]" value="D" /></td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
																			
						<div class="form-actions">
							<div class="col-sm-12 text-center">
								<input type="submit" name="enviar" class="btn btn-primary" value="ENVIAR" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/atendimentos/js.js"></script> -->
<style type="text/css">
input[type="radio"], input[type="checkbox"] {
    margin: 0;
    margin-top: 1px \9;
    line-height: normal;
}
.radio input[type="radio"], .radio-inline input[type="radio"], .checkbox input[type="checkbox"], .checkbox-inline input[type="checkbox"] {
	margin-top: 4px \9;
	margin-left: -0.6em;
}
</style>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/atendimentos/validate.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$("#data_inicio").datepicker({
			format: 'dd/mm/yyyy',
			autoclose: true,
			language: "pt",
			todayHighlight: true
		});
		$("#data_inicio").mask("99/99/9999");
		$("#data_fim").datepicker({
			format: 'dd/mm/yyyy',
			autoclose: true,
			language: "pt",
			todayHighlight: true
		});
		$("#data_fim").mask("99/99/9999");
	});
</script>