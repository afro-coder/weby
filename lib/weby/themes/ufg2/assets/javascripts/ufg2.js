$(document).ready(function(){
  //
  $('.form_search input[type=submit]').click(function(ev){
    ev.preventDefault();
    var $this = $(this);
    $this.parents('.form_search').find('#search').toggleClass('show-input');
    $this.toggleClass('open');
    return false;
  });

  $('body').click(function(ev){
    if( $(ev.target).closest('.search_box_component').length == 0 ) {
      var searchToggle = $('.form_search input[type=submit]');
      searchToggle.parents('.form_search').find('#search').removeClass('show-input');
      searchToggle.removeClass('open');
    }
  });

  $('#search').keydown(function(ev){
    if (ev.which == 13 || ev.keyCode == 13) {
      $(this).closest('form').submit();
      return false;
    }
  });

  $('.increase-font').click(function(){
    var bd = $('body');
    if (bd.hasClass('zoom-out')) {
      bd.removeClass('zoom-out');
    } else {
      bd.addClass('zoom-in');
    }
    return false;
  })

  $('.decrease-font').click(function(){
    var bd = $('body');
    if (bd.hasClass('zoom-in')) {
      bd.removeClass('zoom-in');
    } else {
      bd.addClass('zoom-out');
    }
    return false;
  });

  //Stick menu on scroll
  // When the user scrolls the page, execute stickyHeader
  $(window).scroll(stickyHeader);

  // Get the menuBar
  var menuBar = $('.menu-bar');

  // Get the offset position of the navbar
  var sticky = menuBar.offset().top;

  // Add the sticky class to the menuBar when you reach its scroll position. Remove "sticky" when you leave the scroll position
  function stickyHeader() {
    if (window.pageYOffset > sticky) {
      menuBar.addClass('fixed');
      //menuBar.parentElement.style.paddingTop = ''+menuBar.offsetHeight+'px';
    } else {
      menuBar.removeClass('fixed');
      //menuBar.parentElement.style.paddingTop = '0px';
    }
  }

  ////modal
  $(document).on('click', '[data-toggle=modal]', function(){
    $($(this).data('target')).toggleClass('open');
    return false;
  }).on('click', '[data-dismiss=modal]', function(){
    $(this).closest('.modal').removeClass('open');
    return false;
  });

  ////accordion
  $(document).on('click', '[data-toggle=collapse]', function(){
    var parent = $($(this).data('parent'))
    if (parent.length > 0){
      parent.find('.accordion-body').removeClass('in');
    }
    $($(this).attr('href')).toggleClass('in');
    return false;
  });

  //Change list-grid
  $('.show_list').click(function(ev){
    $('.show_grid').removeClass('active');
    $(this).addClass('active');
    $('#news').removeClass('grid');
    $('#news').addClass('list');
  });

  $('.show_grid').click(function(ev){
    $('.show_list').removeClass('active');
    $(this).addClass('active');
    $('#news').removeClass('list');
    $('#news').addClass('grid');
  });

  thisToggleAdvancedSearch();
});

function thisToggleAdvancedSearch(){
  $(".advanced-search").fadeToggle(function(){
    if(!$(this).is(':visible')){
      $(".advanced-search input[type=radio]").prop('checked', false);
    }else{
      $('#search_type_1').prop('checked', true);
    }
  });
  return false;
}