# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#post_tag_names").inputosaurus
	width : '350px',inputDelimiters : [' ',',']

$(document).on('page:load', ->
	$("#post_tag_names").inputosaurus
		width : '350px', inputDelimiters : [' ',',']
)