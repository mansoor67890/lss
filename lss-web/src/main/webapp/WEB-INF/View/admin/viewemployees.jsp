<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.glyphicon-lg
{
    font-size:4em
}
.info-block
{
    border-right:5px solid #eeeeee;margin-bottom:25px
}
.info-block .square-box
{
    width:100px;min-height:110px;margin-right:22px;text-align:center!important;background-color:#676767;padding:20px 0
}
.info-block.block-info
{
    border-color:#20819e
}
.info-block.block-info .square-box
{
    background-color:#20819e;color:#FFF
}
</style>

<div class="container">
	<div class="row">
		<h2>Employees</h2>
        <div class="col-lg-12">
            <input type="search" class="form-control" id="input-search" placeholder="Search Employees..." >
        </div>
        <br><br>
        <div class="searchable-container">
          <c:forEach var="employee" items="${employeeList}">
            <div class="items col-xs-12 col-sm-6 col-md-6 col-lg-6 clearfix">
               <div class="info-block block-info clearfix">
                    <div class="square-box pull-left">
                        <span class="glyphicon glyphicon-user glyphicon-lg"></span>
                    </div>
                    <h4><a href="${pageContext.request.contextPath}/admin/profile/${employee.code}">${employee.name}</a></h4>
                    <p>Code: ${employee.code}</p>
                     <h5>Email: ${employee.email}</h5>
                    <span>Phone: ${employee.employeeDetails.phoneNo}</span>
                </div>
            </div>
      		
      		</c:forEach>
        </div>
	</div>
</div>

<script type="text/javascript">
$(function() {    
    $('#input-search').on('keyup', function() {
      var rex = new RegExp($(this).val(), 'i');
        $('.searchable-container .items').hide();
        $('.searchable-container .items').filter(function() {
            return rex.test($(this).text());
        }).show();
    });
});
</script>

