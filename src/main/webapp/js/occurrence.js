  $(function(){
      	$('#tabs li a').click(function(e){
      
      		$('#tabs li, #content_tab .current').removeClass('current').removeClass('fadeInLeft');
      		$(this).parent().addClass('current');
      		var currentTab = $(this).attr('href');
      		$(currentTab).addClass('current fadeInLeft');
      		e.preventDefault();
      	});
      });
      
      $(document).ready(function () {
        $("span.question").hover(function () {
          $(this).append('<div class="tooltip">${rc.getMessage("occpage.heather.desc.normal")}</div>');
        }, function () {
          $("div.tooltip").remove();
        });
      });
      
      $(document).ready(function () {
        $("span.question2").hover(function () {
          $(this).append('<div class="tooltip2">${rc.getMessage("occpage.heather.desc.dwc")}</div>');
        }, function () {
          $("div.tooltip2").remove();
        });
      });
	  
      $(document).ready(function(){
       
          $(".bhl").hide();
      	$(".bhl_hide").show();
       
          $('.bhl_hide').click(function(){
          $(".bhl").slideToggle();
      $(".eol").hide();
      $(".colif").hide();
          });
      	
      	$(".eol").hide();
      	$(".eol_hide").show();
       
          $('.eol_hide').click(function(){
          $(".eol").slideToggle();
      $(".bhl").hide();
      $(".colif").hide();
          });
      	
      	$(".colif").hide();
      	$(".colif_hide").show();
       
          $('.colif_hide').click(function(){
          $(".colif").slideToggle();
          $(".bhl").hide();
      $(".eol").hide();
          });
       
      });