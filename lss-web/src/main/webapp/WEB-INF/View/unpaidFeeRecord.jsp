
<div id="unpaidfeerecordform">

<div class="container">
<div class="col-md-2"></div>
  <div class="col-md-9">
    <div class="panel panel-primary" data-collapsed="0">
      <div class="panel-heading">
        <div class="panel-title">
          <i class="entypo-plus-circled"></i>
          <h>Unpaid Fee Record</h>
        </div>
      </div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-12">
            <blockquote class="blockquote-blue">
              <p><strong>Unpaid Fee Information</strong></p>
              <p>To get student fee information first select class and then select section of following class. 
              By entering roll number in Search Box individually student fee information can be fetched. 
              Through Action Button student payments history can be checked and delete manually.
              </p><b>Thanks!</b>
            </blockquote>
          </div>
        </div>
        <hr>

        <form action="#" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post" accept-charset="utf-8" novalidate="novalidate" id="studentpaymentform">

          <div class="row">

            <div class="form-group">
              <label for="field-2" class="col-sm-2 control-label">Class</label>

              <div class="col-sm-3">
                <select name="class_id" class="form-control" data-validate="required" id="class_id" data-message-required="Value Required" onchange="return get_class_sections(this.value)" data-toggle="tooltip" data-placement="bottom" title="Please Select Class">
                  <option value="">Select Class</option>

                  <option value="1">
                    Play Group </option>
                  <option value="2">
                    Nursery </option>
                  <option value="3">
                    Prep </option>
                  <option value="4">
                    One </option>
                  <option value="5">
                    Two </option>
                  <option value="6">
                    Three </option>
                  <option value="7">
                    Four </option>
                  <option value="8">
                    Five </option>
                  <option value="9">
                    Six </option>
                  <option value="10">
                    Seven </option>
                  <option value="11">
                    Eight </option>
                  <option value="12">
                    Nine </option>
                  <option value="13">
                    Ten </option>
                </select>
              </div>


              <div class="form-group">
                <label for="field-2" class="col-sm-1 control-label">Section</label>
                <div class="col-sm-3">
                  <select name="section_id" class="form-control" id="section_selector_holder" data-toggle="tooltip" data-placement="bottom" title="Please Select Class Section">
                    <option value="">Select Class Section</option>

                    <option value="1">
                      A </option>
                    <option value="2">
                      B </option>
                    <option value="3">
                      C </option>
                    <option value="4">
                      D </option>
                    <option value="5">
                      E </option>
                  </select>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="panel-body">
              <div class="col-md-12">
                <ul class="nav nav-tabs bordered">
                  <li class="active">
                    <a href="#unpaid" data-toggle="tab">
                      <span class="hidden-xs">Student List</span>
                    </a>
                  </li>

                </ul>


                <div class="tab-content">
                  <br>
                  <div class="tab-pane active" id="unpaid">


                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">
                      <div class="row">
                        <div class="col-xs-6 col-left">
                          <div id="DataTables_Table_0_length" class="dataTables_length">
                            <label>
                              <select size="1" name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="select2-offscreen" tabindex="-1" data-toggle="tooltip" data-placement="bottom" title="Please Select List Range Per Page">
                                <option value="10" selected="selected">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                              </select> per page</label>
                          </div>
                        </div>
                        <div class="col-xs-6 col-right" align="right">
                          <div class="dataTables_filter" id="DataTables_Table_0_filter">
                            <label>Search by roll #:
                              <input type="text" aria-controls="DataTables_Table_0" data-toggle="tooltip" data-placement="bottom"
								title="Please Enter Student Roll #">
                            </label>
                          </div>
                        </div>
                      </div>
                      <br>
                      <table class="table table-hover" id="tablebg">
                        <thead align="center">
                          <tr>
                            <th align="center" style="width: 50px">Roll#</th>
                            <th align="center" style="width: 350px">Name</th>
                            <th align="center" style="width: 450px">Status</th>
                            <th align="center" style="width: 450px">Options</th>
                          </tr>
                        </thead>
                        <tbody style="width: 100%;">
                          <c:forEach begin="0" end="10" varStatus="loop">
                            <tr>
                              <td align="center">1</td>
                              <td align="center">Jkl</td>
                              <td>
                                <div class="col-md-12">
                                  <a href="#" class="btn btn-danger btn-sm">Unpaid</a>
                                </div>
                              </td>

                             <td class=" ">
                                <div class="btn-group">
                                  <button type="button" class="btn btn-default btn-md dropdown-toggle" data-toggle="dropdown" id="actionbtn" data-toggle="tooltip" data-placement="bottom"
								title="Click to Open Action Menu">Action <span class="caret"></span>
                                  </button>
                                  <ul class="dropdown-menu dropdown-default pull-right" role="menu" id="actionbtnul">
                                    
                                    <!-- VIEWING LINK -->
                                    <li>
                                      <a href="#" data-toggle="modal" data-target="#modalviewinvoice" data-toggle="tooltip" data-placement="bottom"
								title="Click to View Payment History">
                                        <i class="glyphicon glyphicon-credit-card"></i> View Invoice </a>
                                    </li>
                                    <li class="divider"></li>

                                    <!-- DELETION LINK -->
                                    <li>
                                      <a href="#" data-toggle="modal" data-target="#modaldelete" data-toggle="tooltip" data-placement="bottom"
								title="Click to Delete Student Record">
                                        <i class="glyphicon glyphicon-trash"></i> Delete </a>
                                    </li>
                                  </ul>
                                </div>
                              </td>
                            </tr>

                            <tr>
                              <td align="center">2</td>
                              <td align="center">Sdf</td>
                              <td>
                                <div class="col-md-12">
                                  <a href="#" class="btn btn-danger btn-sm">Unpaid</a>

                                </div>
                              </td>
                              <td class=" ">
                                <div class="btn-group">
                                  <button type="button" class="btn btn-default btn-md dropdown-toggle" data-toggle="dropdown" id="actionbtn" data-toggle="dropdown" id="actionbtn" data-toggle="tooltip" data-placement="bottom"
								title="Click to Open Action Menu">Action <span class="caret"></span>
                                  </button>
                                  <ul class="dropdown-menu dropdown-default pull-right" role="menu" id="actionbtnul">
                                    <!-- VIEWING LINK -->
                                    <li>
                                      <a href="#" data-toggle="modal" data-target="#modalviewinvoice" data-toggle="tooltip" data-placement="bottom"
								title="Click to View Payment History">
                                        <i class="glyphicon glyphicon-credit-card"></i> View Invoice </a>
                                    </li>
                                    <li class="divider"></li>

                                    <!-- DELETION LINK -->
                                    <li>
                                      <a href="#" data-toggle="modal" data-target="#modaldelete" data-toggle="tooltip" data-placement="bottom"
								title="Click to Delete Student Record">
                                        <i class="glyphicon glyphicon-trash"></i> Delete </a>
                                    </li>
                                  </ul>
                                </div>
                              </td>
                            </tr>

                          </c:forEach>
                        </tbody>

                      </table>

		<!-- ------------  -->

<!-- Modal View Invoice -->

<div class="modal fade" id="modalviewinvoice" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
								title="Click to Close">&times;</button>
          <h4 class="modal-title">Unpaid Fee Record</h4>
        </div>
        <div class="col-md-12">
        
    
    <div class="panel panel-default panel-shadow" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title"><h>Payment History</h></div>
            </div>
            <div class="panel-body">
                
	<table class="table table-bordered" id="viewinvoicetable">
                        <thead align="center">
                          <tr>
                            <th align="center" style="width: 50px">Roll#</th>
                            <th align="center" style="width: 350px">Name</th>
                            <th align="center" style="width: 450px">Status</th>
                            <th align="center" style="width: 450px">Date</th>
                          </tr>
                        </thead>
                        <tbody style="width: 100%;">
                          <c:forEach begin="0" end="10" varStatus="loop">
                            <tr>
                              <td align="center">1</td>
                              <td align="center">Jkl</td>
                              <td>
                                <div class="col-md-12">
                                  <a href="#" class="btn btn-danger btn-sm">Unpaid</a>
                                </div>
                              </td>
                              <td>12 Mar,2016</td>
							</tr>

                            <tr>
                              <td align="center">2</td>
                              <td align="center">Jkl</td>
                              <td>
                                <div class="col-md-12">
                                  <a href="#" class="btn btn-danger btn-sm">Unpaid</a>

                                </div>
                              </td>
                              <td>10 Apr,2016</td>
                            </tr>

                          </c:forEach>
                        </tbody>

                      </table>
                
            </div>
        </div>
	</div>
              <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
								title="Click to Close">Close</button>
        </div>
    
      </div>
      
    </div>
  </div>

<!-- ------------  -->

<!-- Modal Delete -->

<div class="modal fade" id="modaldelete" role="dialog">
    <div class="modal-dialog">
    
            <div class="modal-content" style="margin-top:100px;">
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
								title="Click to Close">×</button>
                    <h4 class="modal-title" style="text-align:center;">Are you sure to delete this information ?</h4>
                </div>
                
                
                <div class="modal-footer" style="margin:0px; border-top:0px; text-align:center;">
                    <a href="dashBoard.jsp" class="btn btn-danger" id="delete_link" data-toggle="tooltip" data-placement="bottom"
								title="Click to Delete Record">Delete</a>
                    <button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="tooltip" data-placement="bottom"
								title="Click to Go Back">Cancel</button>
                </div>
            </div>
       </div>
  </div>

<!-- ------------  -->




                      <div class="row">
                        <div class="col-xs-12" align="right">
                          <nav aria-label="Page navigation example">
                            <ul class="pagination">
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous" data-toggle="tooltip" data-placement="bottom"
								title="Click to go to Previous Page">
                                  <span aria-hidden="true">&laquo;</span>
                                  <span class="sr-only">Previous</span>
                                </a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next" data-toggle="tooltip" data-placement="bottom"
								title="Click to go to Next Page">
                                  <span aria-hidden="true">&raquo;</span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </li>
                            </ul>
                          </nav>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
  </div>
</div>



