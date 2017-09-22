// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  // $('.users-search form input').autocomplete({
  //   source: function( request, response ) {
  //     $.ajax({
  //       url: `../users/search`,
  //       dataType: "json",
  //       data: {
  //         term: request.term
  //       },
  //       success: function( data ) {
  //         response( data );
  //       }
  //     })
  //   }
  // })

  $input = $('.users-search-auto');
  $collaborators = $('.collaborators-list');
  board_id = parseInt($input.data('board-id'));
  options = {
    getValue: 'first_name',
    url: function(term){
      return '/users/search?term=' + term;
    },
    list: {
      onChooseEvent: function() {
        var connection_id = $input.getSelectedItemData().id;
        var connection_full_name = $input.getSelectedItemData().full_name;
        var connection_email = $input.getSelectedItemData().email;
        $.ajax({
          type: 'POST',
          url: '/relationships',
          data: {
            connection_id: connection_id,
            board_id: board_id
          }
        })
        .done(function(message) {
          // add a flash message to inform if user is added
          console.log(message.message);
          $collaborators.prepend(`<div class="collaborator">${connection_full_name}</div>`).hide().fadeIn(700);
          $input.val('');
        });



      }
    }
  };

  $input.easyAutocomplete(options)
})
