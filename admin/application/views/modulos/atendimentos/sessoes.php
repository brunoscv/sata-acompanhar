<div id="main-wrapper" class="container" style="margin-top: 2em; height: 100vh;">
	<div class="row" data-container="all">
        <div class="col-md-12">
            <div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Controle de Sessões</h4>
					<a href="<?php echo site_url("consultas/atendimentos/" . $listaAtendimentos[0]->consultas_id);?>" class="btn btn-primary pull-right"><span class="fa fa-arrow-left"></span> Voltar </a>
				</div>
				<div class="panel-body" style="margin-top:10px;">
					<div class="table-responsive">
						<?php $this->load->view('layout/search.php'); ?>
						<table class="display table table-hover mg-top-20 tablesaw tablesaw-stack" data-tablesaw-mode="stack">
							<thead>
								<tr>
									<th>#</th>
									<th>Consulta</th>
									<th>Paciente</th>
									<th>Profissional</th>
									<th>Data Atd.</th>
									<th>Presença</th>
									<th>Status</th>
									<th>Criado</th>
									<th class="td-actions"></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($listaAtendimentos as $item): ?>
								<tr>
									<!-- <td><span class="label label-danger"> Inativo </span></td> -->
									<td><?php echo $item->id; ?></td>
									<td><?php echo $item->consultas_id; ?></td>
									<td><?php echo $item->nome_pac; ?></td>
									<td><?php echo $item->nome_prof; ?></td>
									<td><?php echo ( (!$item->data_atendimento)  ? '<span class=""> - </span>' : date('d/m/Y H:i', strtotime($item->data_atendimento)) ); ?></td>
									<td><?php echo (($item->presenca == 1) ? "<span class='btn btn-success mudarPresenca' sessoes_id='{$item->id}' presenca='{$item->presenca}' consultas_id='{$item->consultas_id}' atendimentos_id='{$item->atendimentos_id}'><i class='fa fa-check'></i> </span>" : "<span class='btn btn-danger mudarPresenca' sessoes_id='{$item->id}' presenca='{$item->presenca}' consultas_id='{$item->consultas_id}' atendimentos_id='{$item->atendimentos_id}'><i class='fa fa-check'></i> </span>"); ?></td>
									<td><?php echo (($item->status == 1) ? '<span class="label label-success"> Ativo </span>' : (($item->status == 2) ? '<span class="label label-success"> Concluído </span>' : '<span class="label label-danger"> Inativo </span>')); ?></td>
									<td><?php echo date("d/m/Y", strtotime($item->createdAt)); ?></td>
									<td class="td-actions">
										<button type="button" 
												class="btn btn-default fa fa-ellipsis-v" 
												id="myPopover" 
												data-toggle="popover"
												data-anamation="true"
												data-html="true"
												data-content="<a href='<?php echo site_url("consultas/editar_atendimentos/".$item->id); ?>' class='editar_info'>
																<p><i class='btn-icon-only fa fa-pencil'></i></span> Editar</p>
																<a href='<?php echo site_url("atendimentos/delete_atendimentos/".$item->id); ?>' class='delete_info'>
																<p><i class='btn-icon-only fa fa-trash'></i></span> Excluir</p> "
												data-placement="bottom">
										</button>
									</td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
						<div class="paginate pull-right">
							<?php echo (isset($paginacao)) ? $paginacao : ''; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<?php echo base_url(); ?>assets/plugins/bootbox/bootbox.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/consultas/js.js"></script>
<script type="text/javascript">
    $(document).ready(function(event) {
        $('[data-toggle="popover"]').popover(); 
    });
</script>