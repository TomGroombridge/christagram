# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready', ->
  input_width = $('#post_title').width()
  
  $("#post_tag_names").inputosaurus
    width: input_width + 'px', inputDelimiters: [' ',',']