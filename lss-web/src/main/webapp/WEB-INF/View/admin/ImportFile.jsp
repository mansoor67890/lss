<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
        <hgroup>
          <h2>
            Upload File! 
          </h2>
          <small class="promise"><em>Select Excel File (xls format)</em></small>
         </hgroup>
    	 <div class="well">
             <form enctype="multipart/form-data" method="post" action="uploadFile" class="form-horizontal">
              <div class="input-group">
                 <input type="file" id="file" name="file" required="required" accept=".xls" />
              </div>
              <br>
              <button type="submit" class="btn btn-primary">Upload</button>
             </form>
    	 </div>
		</div>
	</div>
</div>
</section>