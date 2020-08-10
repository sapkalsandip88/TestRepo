<!DOCTYPE html>
<html>
  <head>
    <title>Test Master</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, textarea, label { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
      h1 {
      position: absolute;
      margin: 0;
      font-size: 40px;
      color: #fff;
      z-index: 2;
      line-height: 83px;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 150px;
      }
      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 8px  #cc7a00; 
      }
      .banner {
      position: relative;
      height: 100px;
      background-image: url("images/home/product3.jpg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.2); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select, textarea {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      input[type="date"] {
      padding: 4px 5px;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color: #cc7a00;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 3px 0 #cc7a00;
      color: #cc7a00;
      }
      .item {
      position: relative;
      margin: 10px 0;
      }
      .item span {
      color: red;
      }
      input[type="date"]::-webkit-inner-spin-button {
      display: none;
      }
      .item i, input[type="date"]::-webkit-calendar-picker-indicator {
      position: absolute;
      font-size: 20px;
      color: #cc7a00;
      }
      .item i {
      right: 1%;
      top: 30px;
      z-index: 1;
      }
      [type="date"]::-webkit-calendar-picker-indicator {
      right: 1%;
      z-index: 2;
      opacity: 0;
      cursor: pointer;
      }
      input[type=radio], input[type=checkbox]  {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 5px 20px 15px 0;
      cursor: pointer;
      }
      .question span {
      margin-left: 30px;
      }
      .question-answer label {
      display: block;
      }
      label.radio:before {
      content: "";
      position: absolute;
      left: 0;
      width: 17px;
      height: 17px;
      border-radius: 50%;
      border: 2px solid #ccc;
      }
      input[type=radio]:checked + label:before, label.radio:hover:before {
      border: 2px solid #cc7a00;
      }
      label.radio:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 5px;
      width: 8px;
      height: 4px;
      border: 3px solid #cc7a00;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      button {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background: #cc7a00;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      button:hover {
      background: #ff9800;
      }
      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .name-item input, .name-item div {
      width: calc(50% - 20px);
      }
      .name-item div input {
      width:97%;}
      .name-item div label {
      display:block;
      padding-bottom:5px;
      }
      }
    </style>
  </head>
  <script type="text/javascript">
  function calDiscount()
  {
	  //alert("Discount");
	  var discper=document.getElementById("discount").value;
	  var actprice=document.getElementById("actprice").value;	  
	 var discamt=(parseFloat(actprice)*parseFloat(discper))/100;
	 document.getElementById("price").value=parseFloat(actprice)-parseFloat(discamt);
	 
  }
  </script>
  <body>
  
    <div class="testbox">
    
      <form method="post" action="/addTest">
       <c:choose>
        <c:when test="${not empty sucessmsg}">	
        <center><h4 style="color:red;margin-top:-150px;">${sucessmsg}</h4></center>
        </c:when>
		<c:when test="${not empty errormsg}">
		<center><h4 style="color:red;margin-top:-150px;">${errormsg}</h4></center>
        </c:when>
		</c:choose>
        <div class="banner">
          <h1>Add New Test</h1>
        </div>
        
        <p>Test Information</p>
        <div class="item">
          <label for="name">Test Name<span>*</span></label>
          <input id="testname" type="text" name="testname" required/>
        </div>
		<div class="item">
          <label for="name">Alternative Name<span>*</span></label>
          <input id="altname" type="text" name="altname" required/>
        </div>
        <div class="item">
		<label for="name">Category<span>*</span></label>
          <select id="category" name="category">
            <option selected value="" disabled selected></option>
            <option value="course-type" >Small</option>
            <option value="short-courses">Medium</option>
            <option value="featured-courses">Large</option>
            <option value="undergraduate">Extra Large</option>
          </select>
        </div>
		<div class="item">
		<label for="name">Package<span>*</span></label>
          <select id="packages" name="packages">
            <option selected value="" disabled selected></option>
            <option value="course-type" >Small</option>
            <option value="short-courses">Medium</option>
            <option value="featured-courses">Large</option>
            <option value="undergraduate">Extra Large</option>
          </select>
        </div>
        <div class="item">
          <label for="address">Actual Price<span>*</span></label>
          <input id="actprice" type="text" name="actprice" value="0" onblur="calDiscount();" required/>
        </div>
        <div class="item">
          <label for="city">Discount %<span>*</span></label>
          <input id="discount" type="text" name="discount" value="0" onblur="calDiscount();" required/>
        </div>
        <div class="item">
          <label for="state">Price<span>*</span></label>
          <input id="price" type="text" name="price" value="0"  onblur="calDiscount();" required/>
        </div>
        <div class="item">
          <label for="zip">No Of parameters<span>*</span></label>
          <input id="nop" type="text" name="nop" required/>
        </div>
        <div class="item">
          <label for="zip">Recommended For<span>*</span></label>
          <div class="item">
		<label for="name">Male<span>*</span></label>
          <select id="male" name="male">
            <option selected value="" disabled selected></option>
            <option value="YES" >YES</option>
            <option value="NO">NO</option>
          </select>
       
		<label for="name">Female<span>*</span></label>
          <select id="female" name="female">
            <option selected value="" disabled selected></option>
            <option value="YES" >YES</option>
            <option value="NO">NO</option>
          </select>
        </div>
			<div class="item">
          <label for="zip">Age<span>*</span></label>
          <input id="age" type="text" name="age" required/>
        </div>
        </div>
        <div class="item">
          <label for="zip">Prerequisite<span>*</span></label>
          <input id="prerequisite" type="text" name="prerequisite" required/>
        </div>
		<div class="item">
          <label for="zip">Description<span>*</span></label>
          <textarea id="dscr" name="dscr" rows="4" cols="50" required></textarea>
        </div>
        
        <div class="btn-block">
          <button type="submit" href="/">SUBMIT</button>
        </div>
      </form>
    </div>
  </body>
</html>