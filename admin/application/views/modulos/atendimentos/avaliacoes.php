<div id="main-wrapper" class="container" style="margin-top: 2em; height: 100vh;">
	<div class="row" data-container="all">
        <div class="col-md-12">
            <div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Controle de Avaliações</h4>
					<a href="<?php echo site_url("consultas/criar_avaliacoes/");?>" class="btn btn-primary pull-right"><span class="fa fa-plus"></span> Novo </a>
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
                                    <th style="text-align:center">Gráfico(s)</th>
									<th>Status</th>
									<th>Criado</th>
									<th class="td-actions"></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($listaAvaliacoes as $item): ?>
								<tr>
									<!-- <td><span class="label label-danger"> Inativo </span></td> -->
									<td><?php echo $item->id; ?></td>
									<td><?php echo $item->consultas_id; ?></td>
									<td><?php echo $item->nome_pac; ?></td>
									<td><?php echo $item->nome_prof; ?></td>
									<td style="text-align:center"><a class="btn btn-primary" href="<?php echo site_url().'consultas/resultados';?>"><i class="fa fa-line-chart"></i></a></td>
									
									<td><?php echo (($item->status == 1) ? '<span class="label label-success"> Ativo </span>' : (($item->status == 2) ? '<span class="label label-success"> Concluído </span>' : '<span class="label label-danger"> Inativo </span>')); ?></td>
									
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
<!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/atendimentos/js.js"></script> -->
<script type="text/javascript">
    $(document).ready(function(event) {
        $('[data-toggle="popover"]').popover(); 
    });
</script>