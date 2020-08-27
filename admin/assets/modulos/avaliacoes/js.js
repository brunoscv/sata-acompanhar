$(function() {
    $(document).ready(function(event) {

        var ctx21 = document.getElementById("lineChartRespostas").getContext("2d");
        var data21 = {
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
                    data: [1, 1, 1, 2, 3]
                }
            ]
        };
        
        var chart2 = new Chart(ctx21).Bar(data21, {
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
})