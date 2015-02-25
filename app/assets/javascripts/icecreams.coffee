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
  
  