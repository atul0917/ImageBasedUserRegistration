<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body style="background: url(img/pexels-rafael-guajardo-604684.jpg); background-size:cover;background-attachement:fixed;">

<div class="container">
<div class="row">
<div class="col m6 offset-m3">
<div class="card">
<div class="card-content">
<h3 style="margin-top:10px;"class="center-align"> Register Here !!</h3>
<h5 id="msg" class="center-align "></h5>
<div class="form center-align">

<form action="Register" method="post" id="myform" enctype="multipart/form-data">
<input type="text" name="user_name" placeholder="Enter your Name">
<input type="password" name="user_password" placeholder="Enter your Password">
<input type="Email" name="user_email" placeholder="Enter your Email">
<div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input name="image" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
<button type="submit" class="bn #039be5 light-blue">
Submit
</button>


</form>
</div>

<div class="loader center-align" style="margin-top:10px; display:none;">
<div class="preloader-wrapper active">
    <div class="spinner-layer spinner-red-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>
  
  <h5>Please Wait....</h5>
</div>
</div>
</div>

</div>
</div>
</div>

<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
 
  <script >
  $(document).ready(function(){
	  console.log("Page is ready...")
	   $("#myform").on('submit',function(event){
		   event.preventDefault();
		   
		  // var f=$(this).serialize();
		  
		  let f=new FormData(this);
		   console.log(f);
		   
		   $(".loader").show();
		   $(".form").hide();
		   
		   
		   $.ajax({
			   url:"Register",
			   data:f,
			   type: 'Post',
			   success: function(data,textStatus,jqXHR){
				   console.log(data);
				   console.log("Success.....")
				   $(".loader").hide();
				   $(".form").show();
				   if(data.trim()==='done'){
					   $('#msg').html("Successfully Registered !!")
					   $('#msg').addClass('green-text')
				   }
				   else{
					  
					   
					   $('#msg').html("Something went Wrong on server!!")
					   
				 	   $('#msg').addClass('red-text')
				   }
			   },
			   error: function(jqXHR,textStatus,errorThrow){
				   console.log(data);
				   console.log("Error.....") 
				   $(".loader").hide();
				   $(".form").show();
				   
				   $('#msg').html("Something went Wrong on server!!")
				   $('#msg').addClass('red-text')
			   },
			   processData: false,
			   contentType: false
	
			   
		   })
		   
	   })
	  
  })
  </script>
</body>
</html>