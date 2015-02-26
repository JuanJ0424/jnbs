# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready', ->

  $('#js-corner-checkout').on 'click', ->
    $('html').toggleClass 'overlayed'
    $('.corner-order-container').toggleClass('closed').toggleClass('opened')
    $('.overlay').one 'click', ->
      $('.corner-order-container').removeClass('opened').addClass('closed')

  $('.overlay').on 'click', ->
    $('html').removeClass 'overlayed'

  $('.draggable-icecream').on 'dragstart', (e) ->
    i = $(this).data('id')
    console.log i
    if e.dataTransfer
      e.dataTransfer.setData 'text', i
    else if e.originalEvent.dataTransfer
      e.originalEvent.dataTransfer.setData 'text', i

    $('body').addClass('dragging')
    setTimeout -> # Delay for weird bug in webkit
        $('body').addClass('overlayed')
      ,1
    console.log 'drag'
    return

  $('.draggable-icecream').on 'dragend', (e) ->
    $('body').removeClass('dragging')
    $('body').removeClass('overlayed')
    console.log 'drag'
    return

  # $('#dropzone').on 'drop', (e) ->
  #   e.preventDefault();
  #   data = e.dataTransfer.getData "id"
  #   e.target.appendChild(document.getElementById(data));
  #   $.post("/add", {id: ic_id});
  #   setTimeout(function(){ $scope.get_cart(); }, 500);

  $('#chat-btn').on 'click', ->
    $('html').addClass 'overlayed'
    $('#chats').addClass 'show'
    $('.overlay').one 'click', ->
      $('#chats').removeClass 'show'

  # Slider
  slides = 0
  actual_slide = 0
  $('#slider li').each () ->
    $(@).addClass('actual') if slides == 0
    $('#slider-controls').append "<div class=\"control-dot #{if slides == 0 then 'actual'}\" data-slide=\"#{slides}\"></div>"
    slides++

  move_slide_to = (where) ->
    return false if actual_slide == where
    $("#slider li:nth(#{ actual_slide })").removeClass('actual').addClass 'out'
    $("#slider li:nth(#{ where })").removeClass('out').addClass 'actual'
    $('.control-dot').removeClass 'actual'
    $(".control-dot:nth(#{ where })").addClass 'actual'
    actual_slide = where

  moving_slides = ->
    move_slide_to (actual_slide + 1)%slides
    return

  slides_interval = setInterval moving_slides, 6000

  $('.control-dot').on 'click', () ->
    move_slide_to $(@).data 'slide'
    clearInterval slides_interval
    # slides_interval = setInterval moving_slides, 6000
  
  $('[data-close-btn]').on 'click', () ->
    $(@).parents('.alert-box').addClass 'go-away'
  
  