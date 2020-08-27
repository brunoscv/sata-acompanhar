<div class="page-title">
	<div class="container">
		<h3>Gráficos de Resultado de Avaliação</h3>
        <a href="<?php echo site_url("consultas/avaliacoes");?>" class="btn btn-primary pull-right"><span class="fa fa-arrow-left"></span> Voltar </a>
	</div>
</div>
<section class="dashboard-header">
	<div class="container-fluid">
		<div class="row">
            <p class="text-center"> <strong>Paciente : BRUNO ADRIANO SOARES DE CARVALHO</strong></p>
            <!-- Line Chart  -->
            <div class="col-lg-5 col-lg-offset-3 col-12">
                <div class="line-chart d-flex align-items-center justify-content-center">
                    <canvas id="lineChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
 $(document).ready(function(event) {
var ctx2 = document.getElementById("lineChart").getContext("2d");
        var data2 = {
            labels: ["2", "1", "0", "N", "D"],
            datasets: [
                // {
                //     label: "My First dataset",
                //     fillColor: "rgba(220,220,220,0.5)",
                //     strokeColor: "rgba(220,220,220,0.8)",
                //     highlightFill: "rgba(220,220,220,0.75)",
                //     highlightStroke: "rgba(220,220,220,1)",
                //     data: [65, 59, 80, 81, 56, 55, 40]
                // },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(34,186,160,0.5)",
                    strokeColor: "rgba(34,186,160,0.8)",
                    highlightFill: "rgba(34,186,160,0.75)",
                    highlightStroke: "rgba(34,186,160,1)",
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
            ]
        };
        
        var chart2 = new Chart(ctx2).Bar(data2, {
            scaleBeginAtZero : true,
            scaleShowGridLines : true,
            scaleGridLineColor : "rgba(0,0,0,.05)",
            scaleGridLineWidth : 1,
            scaleShowHorizontalLines: true,
            scaleShowVerticalLines: true,
            barShowStroke : true,
            barStrokeWidth : 2,
            barDatasetSpacing : 1,
            legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
            responsive: true
        });
    });
</script>