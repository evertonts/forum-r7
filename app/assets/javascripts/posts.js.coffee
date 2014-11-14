# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	console.log($('a[data-post-id]'))
	$.each($('a[data-post-id]'), (_index, _value) ->
		console.log(this)
		
		$(this).click(() ->
			id = $(this).attr('data-post-id')
			url = $(this).attr('href')
			window.removeForm()
			$.get(url, ((data) -> window.appendContent(data, id)), 'html')
			return false
		)
	)

window.appendContent = (content, id) ->
	$('#form-content-' + id).append(content)
	$('#reply_text').focus()

window.removeForm = () ->
	if $('.reply-form').length
		$('.reply-form').remove();
		
$(document).ready(ready)
$(document).on('page:load', ready)