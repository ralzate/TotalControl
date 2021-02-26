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
//= require chartkick
//= require Chart.bundle


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
    if(numero>38){
        $(this).css('background-color', '#FF4000');

        }      
    }); 


    // Elimino los mensajes custom de validaciones
    // $( ".invalid-feedback" ).empty();
    // $(".invalid-feedback").text('Este campo no es valido');
});



// Cambia a disable si algun campo esta vacio en el form de personas
$(document).ready(function() {

    // Inputs para el modelo de usuario
    var $inputs = $('#usuario_email'),
        $inputs = $('#usuario_nombre'),
        $submit = $("#usuario_guardar");

    function checkEmpty() {
        return $inputs.filter(function() {
            return !$.trim(this.value);
        }).length === 0;
    }

    $inputs.on('blur', function() {
        $submit.prop("disabled", !checkEmpty());
    }).blur();


    // Inputs del modelo de peronas
    var $inputs = $('#persona_nombre'),
        $inputs = $('#persona_apellido'),
        $inputs = $('#persona_telefono'),
        $inputs = $('#persona_direccion'),
        $inputs = $('#persona_identificacion'),
        $submit = $("#persona_guardar");

    function checkEmpty() {
        return $inputs.filter(function() {
            return !$.trim(this.value);
        }).length === 0;
    }

    $inputs.on('blur', function() {
        $submit.prop("disabled", !checkEmpty());
    }).blur();


    // Inputs del modelo de registros
    var $inputs = $('#registro_temperatura_ingreso'),
    $inputs = $('#registro_temperatura_salida'),
    $submit = $("#registro_guardar");

    function checkEmpty() {
        return $inputs.filter(function() {
            return !$.trim(this.value);
        }).length === 0;
    }

    $inputs.on('blur', function() {
        $submit.prop("disabled", !checkEmpty());
    }).blur();

});