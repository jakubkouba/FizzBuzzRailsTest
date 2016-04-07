// create namespace
// It should be don through CJS with Require JS
var FizzBuzz = FizzBuzz || {};

FizzBuzz.pagination = function () {

    var
        $form = $('#pagination-form'),
        $links = $('.pagination a'),
        $page = $('#page'),


        submitForm = function($link){
            $page.val($link.data().page);
            $form.submit();
        },

        bindEvents = function(){
          $links.click(function(e){
              e.preventDefault();
              submitForm($(this));
          });
        };

    return {
        init: function(){
            bindEvents();
        }
    }


};
