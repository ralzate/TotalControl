// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-datepicker
//= require jquery-ui
//= require jquery-ui/widgets/datepicker



// Js para el datepicker
$.datepicker.regional['es'] = {
    closeText: 'Cerrar',
    prevText: '< Ant',
    nextText: 'Sig >',
    currentText: 'Hoy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
    $(function () {
    $("#fecha").datepicker();
    });

    $( function() {
        $( "#datepicker" ).datepicker( $.datepicker.regional[ "es" ] );
        $( "#locale" ).on( "change", function() {
        $( "#datepicker" ).datepicker( "option",
            $.datepicker.regional[ $( this ).val() ] );
        });
    });


// Js para esconder los mensajes de devise del login
$( ".user_email" ).removeClass()


// Js para cambiar el color de las temperaturas
$(document).ready(function() {
    var sub = $('.entrada').each(function() {  
    var numero = ($(this).text());
    if(numero>60){
        $(this).css('background-color', '#FF4000');

        }      
    }); 
});