// create namespace
// It should be don through CJS with Require JS
var FizzBuzz = FizzBuzz || {};

FizzBuzz.pagination = function () {

    var
        $form = $('#pagination-form'),
        $links = $('.pagination a'),
        $page = $('#page'),
        $options = $('#per_page'),
        $setLikes = $('a.set-like'),


        submitForm = function($link){
            var action = $form.attr('action');
            action = action.split('/');
            if ($link != undefined){
                action[2] = $link.data().page;
            }
            action[3] = $options.val();
            action = action.join('/');
            $form.attr(action);
            $form.submit();
        },

        handleAjaxResponse = function(){
          $setLikes.on("ajax:success", function(e, data){
              console.log(data);
             if (data.res === true){
                 var $li = $(this).parent('li');
                 (data.liked === true)
                     ? $li.addClass('liked')
                     : $li.removeClass('liked');
             }
          });
        },

        bindEvents = function(){
            $links.click(function(e){
                e.preventDefault();
                submitForm($(this));
            });

            $options.change(function(){
                $form.submit();
            });

        };

    return {
        init: function(){
            bindEvents();
            handleAjaxResponse();
        }
    }


};
