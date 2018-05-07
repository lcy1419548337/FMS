 jQuery(function($) {
        
        $(".sidebar-dropdown > a").click(function(){
	        $(".sidebar-submenu").slideUp(250);
        	if ($(this).parent().hasClass("active")){
 		         $(".sidebar-dropdown").removeClass("active");
 		         $(this).parent().removeClass("active");
        	}else{
        		$(".sidebar-dropdown").removeClass("active");
        		$(this).next(".sidebar-submenu").slideDown(250);
        	 	$(this).parent().addClass("active");
        	}

        });

         $("#toggle-sidebar").click(function(){
	         $(".page-wrapper").toggleClass("toggled");
	         var content = document.getElementById("contentMain");
	         var theHead = document.getElementById("theHead");
	         //alert(content.style.width == "100%");
	         if (content.style.width == "100%"){
	             content.style.width = "85%";
	             theHead.style.width = "85%";
             }else {
                 content.style.width = "100%";
                 theHead.style.width = "100%";
             }
       	 });

           if(! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
                   $(".sidebar-content").mCustomScrollbar({
                            axis:"y",
                            autoHideScrollbar: true,
                            scrollInertia: 300
                    });
                    $(".sidebar-content").addClass("desktop");

            }
    });