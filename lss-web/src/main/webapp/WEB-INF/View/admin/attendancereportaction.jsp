 
  
  <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>Leave Application</h1>${leaves.leaveType.name}<h2></h2>
        </div>
      </div>
      <div class="row clearfix">
          <div class="col-md-12 column">
              <div class="panel panel-info">
                <div class="panel-heading">
                  <h3 class="panel-title">
                   ${leaves.employee.name}
                    <div class="pull-right">Applied on: ${leaves.applicationDate}</div>
            
                  </h3>
                </div>                
              </div>
            

              <div class="row clearfix">
                  <div class="col-md-12 column">
                      <div class="list-group">
                        
                          <div class="list-group-item">
                              <h4 class="list-group-item-heading">
                               From ${leaves.fromDate}
                                To    ${leaves.toDate}
                            
                                  <a href="#"  data-toggle="tooltip" data-placement="bottom" title="Access website and use site API">
                                    <i class="fa fa-question-circle"></i>
                                  </a>
                              </h4>
                              <p class="list-group-item-text">
                                 Reason: <span class="label label-info">${leaves.reason}</span>
                              </p>
                          </div>
                        
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <script type="text/javascript">

		$(function() {
	

			$('.timein').val('09:00');
			
			$('.timein').change().datetimepicker({
				 format:'H:i',
				    step:5,
				    datepicker: false
				
			});

			$('.timeout').val('17:00');
			$('.timeout').change().datetimepicker({
				 format:'H:i',
				    step:5,
				    datepicker: false
			});
			
		});

			
			
		</script>
		
		
  