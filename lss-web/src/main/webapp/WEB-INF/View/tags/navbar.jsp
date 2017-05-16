<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

</style>

 		<div id="wrapper">
 <!-- Sidebar -->
        <div class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
	        <div class="logo text-left">
	               <img src="${pageContext.request.contextPath}/resources/img/lss-logo2-300.png" class="img-responsive center-block" alt="Logo" >
	               <br>
	              <ul class="list">
	                   <li class="dropdown" id="dlist">
		                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-toggle="tooltip" data-placement="bottom" title="Student Portfolio Menu"><i class="fa fa-safari" aria-hidden="true"></i>Student Portfolio<b class="caret"></b></a>
		                   <ul class="dropdown-menu">
		                   	   <li><a href="${pageContext.request.contextPath}/allstudents" data-toggle="tooltip" data-placement="bottom" title="Click for Student Information">All Students</a></li>
					           <li><a href="${pageContext.request.contextPath}/studentadmit" data-toggle=tooltip" data-placement="bottom" title="Click to Admit Student">Student Admit</a></li>
					           <%-- <li><a href="${pageContext.request.contextPath}/studentinformation" data-toggle="tooltip" data-placement="bottom" title="Click for Student Information">Student Information</a></li> --%>
					           <li><a href="${pageContext.request.contextPath}/studentpromotion" data-toggle="tooltip" data-placement="bottom" title="Click to Promote Student">Student Promotion</a></li>
		                   		
					        </ul>
	                   </li>
		                   <li class="dropdown" id="dlist">
		                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-toggle="tooltip" data-placement="bottom" title="Fee Portfolio Menu"><i class="fa fa-safari" aria-hidden="true"></i>Fee Portfolio<b class="caret"></b></a>
		                   <ul class="dropdown-menu">
					           <li><a href="${pageContext.request.contextPath}/createstudentpayment" data-toggle="tooltip" data-placement="bottom" title="Click to Create Student Payment">Create Student Payment</a></li>
					           <li><a href="${pageContext.request.contextPath}/studentpayments" data-toggle="tooltip" data-placement="bottom" title="Click for Student Payments">Student Payments</a></li>
		                   	</ul>
	                   </li>
	                   
	                    <li class="dropdown" id="dlist">
		                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-toggle="tooltip" data-placement="bottom" title="Total Fee Management Menu"><i class="fa fa-safari" aria-hidden="true"></i>Total Fee Management<b class="caret"></b></a>
		                   <ul class="dropdown-menu">
					           <li><i class="fa fa-thumbs-up" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/paidfeerecord" data-toggle="tooltip" data-placement="bottom" title="Click to check Paid Fee Record">Paid Fee Record</a></li>
					           <li><i class="fa fa-thumbs-up" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/unpaidfeerecord" data-toggle="tooltip" data-placement="bottom" title="Click to check Unpaid Fee Record">Unpaid Fee Record</a></li>
					           <li><i class="fa fa-thumbs-up" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/totalfeerecord" data-toggle="tooltip" data-placement="bottom" title="Click to check Total Fee Record">Total Fee Record</a></li>
		                   	</ul>
	                   </li>
	                   
	                    <li class="dropdown" id="dlist">
		                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-toggle="tooltip" data-placement="bottom" title="Settings Menu"><i class="fa fa-safari" aria-hidden="true"></i>Settings<b class="caret"></b></a>
		                   <ul class="dropdown-menu">
					           <li><i class="fa fa-thumbs-up" aria-hidden="true"></i><a onclick="ajaxcall('settingsForm.action')" data-toggle="tooltip" data-placement="bottom" title="Click to change Account Settings">Account Settings</a> </li>
					          </ul>
		                   </li>
		                   
		                   <li class="dropdown">
								<c:url var="logoutUrl" value="/j_spring_security_logout" ></c:url>
								<form class="" action="${logoutUrl}" method="post">
									<input class="btn btn-danger" type="submit" value="Log out" /> <input
										type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</li>
		                   
	              </ul>
	           </div>
        </div>
   
    <div class="container-fluid">
        <div class="row">
            <div id="page-content-wrapper">
            <button id="hamburgerbtn" type="button" class="hamburger is-closed" data-toggle="offcanvas"  data-toggle="tooltip" data-placement="bottom" title="Please Click Here">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            </div>
           </div>
        </div>
        </div>
        <div id="modal-loading"></div>



<script type="text/javascript">
    
 
    $(document).ready(function () {
    	  var trigger = $('.hamburger'),
    	      overlay = $('.overlay'),
    	     isClosed = false;

    	    trigger.click(function () {
    	      hamburger_cross();
    	      
    	    });

    	    function hamburger_cross() {

    	      if (isClosed == true) {          
    	        overlay.hide();
    	        trigger.removeClass('is-open');
    	        trigger.addClass('is-closed');
    	        isClosed = false;
    	      } else {   
    	        overlay.show();
    	        trigger.removeClass('is-closed');
    	        trigger.addClass('is-open');
    	        isClosed = true;
    	        
    	      }
    	  }
    	  
    	  $('[data-toggle="offcanvas"]').click(function () {
    	        $('#wrapper').toggleClass('toggled');
    	  });  
    	});
   // $(this).replaceWith("<div>" + $("#admitform").jsp() + "</div>");
   
   function ajaxcall(action)
{
	   var ajc=action;
	    $.ajax({
        type: "GET",
        url: ajc,
        success: function( returnedData ) {
            $("#main-content").html( returnedData );
        }
    });
 } 
 
</script>
 
 <script type="text/javascript">
 
 $(document).on('click', '#close-preview', function(){ 
     $('.image-preview').popover('hide');
     // Hover befor close the preview
     $('.image-preview').hover(
         function () {
            $('.image-preview').popover('show');
         }, 
          function () {
            $('.image-preview').popover('hide');
         }
     );    
 });
 
 $(function() {
     // Create the close button
     var closebtn = $('<button/>', {
         type:"button",
         text: 'x',
         id: 'close-preview',
         style: 'font-size: initial;',
     });
     closebtn.attr("class","close pull-right");
     // Set the popover default content
     /* $('.image-preview').popover({
         trigger:'manual',
         html:true,
         title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
         content: "There's no image",
         placement:'bottom'
     }); */
     // Clear event
     $('.image-preview-clear').click(function(){
         $('.image-preview').attr("data-content","").popover('hide');
         $('.image-preview-filename').val("");
         $('.image-preview-clear').hide();
         $('.image-preview-input input:file').val("");
         $(".image-preview-input-title").text("Browse"); 
     }); 
     // Create the preview image
     $(".image-preview-input input:file").change(function (){     
         var img = $('<img/>', {
             id: 'dynamic',
             width:250,
             height:200
         });      
         var file = this.files[0];
         var reader = new FileReader();
         // Set preview image into the popover data-content
         reader.onload = function (e) {
             $(".image-preview-input-title").text("Change");
             $(".image-preview-clear").show();
             $(".image-preview-filename").val(file.name);            
             img.attr('src', e.target.result);
             $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
         }        
         reader.readAsDataURL(file);
     });  
 });
 
 //$('#datetimepicker1').datetimepicker();
 
 $body = $("body");

 $(document).on({
     ajaxStart: function() { $body.addClass("loading");    },
      ajaxStop: function() { $body.removeClass("loading"); }    
 });
 
 </script>








