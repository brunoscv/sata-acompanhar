
$(function() {
    $(document).ready(function(e) {
        $("body").on('click', '.mudarPresenca', function(event){
            event.preventDefault();
            var sessoes_id = $(this).attr("sessoes_id"); 
            var presenca = $(this).attr("presenca"); 
            var consultas_id = $(this).attr("consultas_id"); 
            var atendimentos_id = $(this).attr("atendimentos_id"); 

            bootbox.dialog({
                message: "Tem certeza que deseja <b>MODIFICAR</b> esse atendimento?",
                size: 'small',
                buttons: {
                    cancel: {
                        label: 'Não',
                        className: 'btn-danger',
                        callback: function(){
                            console.log('Custom cancel clicked');
                        }
                    },
                    confirm: {
                        label: 'Sim',
                        className: 'btn-success',
                        callback: function(){
                            $.ajax({
                                url:  base_url + 'consultas/mudar_presenca_consulta/' + sessoes_id + '/' + presenca,
                                type: "POST",
                                dataType: 'json',
                                data: { 
                                    sessoes_id: sessoes_id,
                                    presenca: presenca,
                                },
                                success: function(data) {
                                    
                                    var json_obj = data.presenca; //parse JSON
                                    if(data.sucesso == true) {
                                        console.log(data.presenca.presenca);
                                       window.location.href = "/saudecasa/admin/consultas/sessoes/" + consultas_id + '/' + atendimentos_id;
                                    }
                                },
                                complete: function(data) {
                                    toastr.success("Ação Completada com Sucesso");                                   
                                    console.log(data);
                                }
                            });	
                        }
                    },
                }
            });
        });
    });
});