// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $('.collaborators-list').on('click', event => {
    const {target} = event;

    if($(target).hasClass('glyphicon-remove')) {
      const relationship_id = $(target).data('relationship-id')
      $.ajax({
        type: 'DELETE',
        url: `/relationships/${relationship_id}`
      })
      .done(function(message) {
        $(target).parent().fadeOut(400);
      });
    }
  });

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
          // add a flash message to inform if user is added TODO
          $collaborators.prepend(`<div class="collaborator"><span data-relationship-id=${message.relationship_id} class="glyphicon glyphicon-remove"></span>${connection_full_name}</div>`).hide().fadeIn(700);
          $input.val('');
        });
      }
    }
  };
  $input.easyAutocomplete(options)
})
