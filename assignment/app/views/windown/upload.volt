{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("windown/", "&larr; Go Back") }}
    </li>
</ul>

<div class="resume">
    <header class="page-header">
	    <h1 class="page-title">Share Application</h1>
    </header>
	<div class="panel panel-default">
	    <div class="panel-heading resume-heading">
			<div class="row">
				<div class="col-lg-12">
					<form action="upload" method="post" enctype="multipart/form-data">
						<div class="col-xs-12 col-sm-4">
						 	<input type="file" name="files[]" multiple>
						 	<img id="myImg" src="" alt="your image"> <br>
						</div>

						<div class="col-xs-12 col-sm-8">
							<p> {{ form.label('Name') }} </p>
							<p> 
								{{ form.render('Name') }} 
							</p>

							<p> {{ form.label('Description') }} </p>
							<p>
								{{ form.render('Description') }}
							</p>
							
							<input type="file" name="files[]" multiple>
							
						</div>			
						<input type="submit" value="Send" class="btn btn-success">
					</form>	
				</div>
			</div>
		</div>
	</div>
</div>

