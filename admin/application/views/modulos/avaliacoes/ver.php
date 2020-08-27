<div id="main-wrapper" class="container" style="margin-top: 2em; height: 100vh;">
	<div class="row">
        <div class="col-md-12">
			<div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Resultados </h4>
					<a href="<?php echo site_url("avaliacoes/index/". @$item[0]->atendimentos_id);?>" class="btn btn-primary pull-right"><span class="fa fa-list"></span> Ir para a Listagem</a>
				</div>
				<div class="panel-body" style="margin-top:10px;">
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
                    <table class="display table table-hover mg-top-20">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Pergunta</th>
                                <th class="text-center">Tipo</th>
                                <th class="text-center">Resposta</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($item as $item): ?>
                            <tr>
                                <!-- <td><span class="label label-danger"> Inativo </span></td> -->
                                <td><?php echo $item->id; ?></td>
                                <td><?php echo $item->desc_pergunta; ?></td>
                                <td class="text-center"><?php echo ($item->tipo == 1) ? '<span>Receptiva</span>' : '<span>Expressiva</span>'; ?></td>
                                <td class="text-center"><?php echo $item->valor; ?></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="main-wrapper" class="container">
	<div class="row">
        <div class="col-md-12">
			<div class="panel panel-white has-shadow">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Gráfico de Resultados </h4>
				</div>
				<div class="panel-body" style="margin-top:10px;">
                    <!-- Line Chart  -->
                    <div class="col-lg-12 col-12">
                        <div class="line-chart d-flex align-items-center justify-content-center text-justify" style="margin: 0 auto;">
                            <canvas id="lineChartRespostas" style="margin: 0 auto; width: 7em; height:7em; text-align:center; padding: 0 10em"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/modulos/avaliacoes/js.js"></script>