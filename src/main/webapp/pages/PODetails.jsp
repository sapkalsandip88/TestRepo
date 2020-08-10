<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*,java.text.*,java.util.*,javax.sql.DataSource,javax.naming.Context,javax.naming.InitialContext"%>
<html>
                
<head>
<title>Purchase Order Details</title>
<%
        String message=(String)request.getAttribute("message");
	String location=(String)session.getAttribute("location");
	ArrayList addAll=new ArrayList();
	String VAL="";
	VAL = (String)request.getParameter("ALL");
	System.out.println("lllllllllllllll"+VAL);
	System.out.println("lllllllllllllll"+location);
%>
<script>	
		//addAR(<%=VAL%>);
		$(".JOB1").show();
		$("#tabs_main").tabs('select',1);
</script>
<script>
$(function() {
                $("#accordion").accordion({
                        autoHeight: false,
                        collapsible: true,
                        active: false
                });
        });
$(function(){
$("#invoicedate").datepicker({  dateFormat: 'dd/mm/yy'  });
$("#duedate").datepicker({  dateFormat: 'dd/mm/yy'  });
$("#veninvoicedate").datepicker({  dateFormat: 'dd/mm/yy'  });
});

</script>
<script>
        <%
                if(message==null || message.equals("") || message.equals("null"))
                {}
                else
                {
        %>
                var mes="<%=message%>";
        <%}%>
</script>
<style type="text/css">
table.adminlist {
 width: 100%;
}
table.adminlist thead th {
    text-align: centre;
    background: #66a9bd;
}

</style>
<script type="text/javascript">
function showResponse(responseXML, statusText, xhr, $form)
  {
        var employees = responseXML.getElementsByTagName("table")[0];
        for(loop1 =0; loop1 < employees.childNodes.length; loop1++)
        {
		//alert("HHHIIIIIIII");
		var employee = employees.childNodes[loop1];
                var message1= employee.getElementsByTagName("message")[0];
                message=message1.childNodes[0].nodeValue;
        }
		
		$("#dialog-confirm").text(message);
                $('#dialog-confirm').dialog('open');
  }
	$(document).ready(function() {
        var options =
        {
                success:  showResponse  ,
                resetForm: true
        };
        $('form').submit(function(){
        //$('#submitbtn').attr('disabled', 'disabled');
        });
        $('#myForm1').ajaxForm(options);
	$("#tabs_main").tabs();
	$('.SEARCH1').show();
	$('.JOB1').hide();

  });

</script>
<script>
   function validate()
   {
                
                var tbl = document.getElementById('DetailsTable');
                document.getElementById('list').value="";
                var rowcontainer=DetailsTable.rows;
                for(var i=1;i<rowcontainer.length;i++)
                {
			document.getElementById('list').value +=document.getElementById('ven_type'+i).value+"*";

                        if(document.getElementById('vdname'+i).value=="")
                        {
                                alert("Please Enter Vendor Name");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('vdname'+i).value+"*";
                        }

                        if(document.getElementById('pono1'+i).value=="")
                        {
                                alert("Please Enter PO  Number");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('pono1'+i).value+"*";
                        }
			
			if(document.getElementById('venetd'+i).value=="")
                        {
                                  alert("Please Enter ETD");
                                  return false;
                               // document.forms[0].list.value +="NA"+"*";
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('venetd'+i).value+"*";
                        }

                        if(document.getElementById('qunty'+i).value=="")
                        {
                                  alert("Please Enter Qauntity");
                                  return false;
                               // document.forms[0].list.value +="NA"+"*";
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('qunty'+i).value+"*";
                        }
			if(document.getElementById('veninvoice_no'+i).value=="")
                        {
                                  alert("Please Enter Vendor Invoice NO");
                                  return false;
                               // document.forms[0].list.value +="NA"+"*";
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('veninvoice_no'+i).value+"*";
                        }

			if(document.getElementById('veninvoice_amt'+i).value=="")
                        {
                                  alert("Please Enter Vendor Invoice Amount");
                                  return false;
                               // document.forms[0].list.value +="NA"+"*";
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('veninvoice_amt'+i).value+"*";
                        }
			if(document.getElementById('veninvoicedate'+i).value=="")
                        {
                                  alert("Please Enter Vendor Invoice DATE");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list').value +=document.getElementById('veninvoicedate'+i).value+"*";
                        }
			document.getElementById('list').value +=document.getElementById('venpymtstatus'+i).value+"*";
                }
 

                var tbl = document.getElementById('DetailsTableCha');
                document.getElementById('list1').value="";
                var rowcontainer=DetailsTableCha.rows;
                for(var i=1;i<rowcontainer.length;i++)
                {
                        if(document.getElementById('chaname'+i).value=="")
                        {
                                alert("Please Enter CHA Name");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list1').value +=document.getElementById('chaname'+i).value+"*";
                        }

                        if(document.getElementById('chapono1'+i).value=="")
                        {
                                alert("Please Enter PO  Number");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list1').value +=document.getElementById('chapono1'+i).value+"*";
                        }
		 }
                var tbl = document.getElementById('DetailsTableTrans');
                document.getElementById('list2').value="";
                var rowcontainer=DetailsTableTrans.rows;
                for(var i=1;i<rowcontainer.length;i++)
                {
                        if(document.getElementById('transname'+i).value=="")
                        {
                                alert("Please Enter CHA Name");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transname'+i).value+"*";
                        }

                        if(document.getElementById('transpono1'+i).value=="")
                        {
                                alert("Please Enter PO  Number");
                                return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transpono1'+i).value+"*";
                        }
			
			if(document.getElementById('trns_etd'+i).value=="")
                        {
                                  alert("Please Enter Invoice ETD");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('trns_etd'+i).value+"*";
                        }

                        if(document.getElementById('trnspickloc'+i).value=="")
                        {
                                  alert("Please Enter PickUp Location ");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('trnspickloc'+i).value+"*";
                        }

                        if(document.getElementById('trnsdelloc'+i).value=="")
                        {
                                  alert("Please Enter Delivery Location");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('trnsdelloc'+i).value+"*";
                        }

                        if(document.getElementById('transqunty'+i).value=="")
                        {
                                  alert("Please Enter Qauntity");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transqunty'+i).value+"*";
                        }
                        if(document.getElementById('transinvoice_no'+i).value=="")
                        {
                                  alert("Please Enter Invoice NO");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transinvoice_no'+i).value+"*";
                        }

			if(document.getElementById('transinvoice_amt'+i).value=="")
                        {
                                  alert("Please Enter Invoice Amount");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transinvoice_amt'+i).value+"*";
                        }

                        if(document.getElementById('transinvoicedate'+i).value=="")
                        {
                                  alert("Please Enter Invoice DATE");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transinvoicedate'+i).value+"*";
                        }
			
                        if(document.getElementById('transpymtstatus'+i).value=="")
                        {
                                  alert("Please Enter Payment Status");
                                  return false;
                        }
                        else
                        {
                        document.getElementById('list2').value +=document.getElementById('transpymtstatus'+i).value+"*";
                        }
                }


                        /*alert("Vendor List=="+document.getElementById('list').value);
			alert("CHA List=="+document.getElementById('list1').value);
			alert("Trans List=="+document.getElementById('list2').value);
			*/
                        return true;

   }
</script>

<script>
        function party()
        {
		var  orderno2= $('#order_no').val();
                if(orderno2=='')
                {
                        //alert("Pls Enter PO No.....");
                        //return false;
			orderno="NEW";
			$('#orderno').val("NEW");
                }
				$('#orderno').val("NEW");
     
                                $("#clname").val('');
                                $("#pono").val('');
                                $("#quantity").val('');
				$("#itmdesc").val('');
                                $("#invoicecode").val('');
                                $("#invoicedate").val('');
                                $("#inv_qty").val('');
                                $("#inv_amt").val('');
                                $("#duedate").val('');
                                $("#pymt_status").val('');   
                                clearRows_r();                            
                                
                                $('.SEARCH1').show(); 
		                $(".JOB1").hide();
                		$("#tabs_main").tabs('select',1);
				$("#cal").val('ADD');
        }
</script>
<SCRIPT language="Javascript">
function clearRows_r()
        {
          var tbl = document.getElementById('DetailsTable');
          var rowCount = tbl.rows.length;
          var lastRow = tbl.rows.length;
          for(var i=1;i<=(rowCount-1);i++)
          {
                tbl.deleteRow(lastRow-i);
          }
        }
</SCRIPT>

<SCRIPT language="Javascript">
function clearRows_cha()
        {
          var tbl = document.getElementById('DetailsTableCha');
          var rowCount = tbl.rows.length;
          var lastRow = tbl.rows.length;
          for(var i=1;i<=(rowCount-1);i++)
          {
                tbl.deleteRow(lastRow-i);
          }
        }
</SCRIPT>
<SCRIPT language="Javascript">
function clearRows_trans()
        {
          var tbl = document.getElementById('DetailsTableTrans');
          var rowCount = tbl.rows.length;
          var lastRow = tbl.rows.length;
          for(var i=1;i<=(rowCount-1);i++)
          {
                tbl.deleteRow(lastRow-i);
          }
        }
</SCRIPT>


<script>
	function modify1()
        {              
                $('#displayimg_div').append("Loading ....&nbsp;&nbsp;<img src='../images/loading.gif'>");
                var row = $(this).closest("tr").get(0);
                var orderno2= $('#order_no').val();
		
 
                if(orderno2=='')
                {
                        alert("Pls Enter Order No.....!!");
                        return false;
                }
			clearRows_r();
			clearRows_cha();
			clearRows_trans();
                $.ajax({
                        type: "GET",
                        url: "../servlet/VCTOrderDetailsAjax",
                        data: "orderno2="+orderno2,
                        dataType: "json",async:   false,
                        success: function (jsondata) {
                        if (jsondata.response == 'SUCCESS') {
				$.each(jsondata.details, function(i, object) {
                                                var makeid = '#'+i;
                                                $(makeid).val(object);

                                });
                                $.each(jsondata.details1, function(i, object) {
                                        var cont_array = new Array();
                                        $.each(object, function(property, value) {
                                                cont_array[property] = object[property];
                                        });
                                        AddRows(cont_array[0],cont_array[1],cont_array[2],cont_array[3],cont_array[4],cont_array[5],cont_array[6],cont_array[7],cont_array[8]);
                                });

				$.each(jsondata.details2, function(i, object) {
                                        var cont_array = new Array();
                                        $.each(object, function(property, value) {
                                                cont_array[property] = object[property];
                                        });
                                        AddRowscha(cont_array[0],cont_array[1]);
                                });
				
				 $.each(jsondata.details3, function(i, object) {
                                        var cont_array = new Array();
                                        $.each(object, function(property, value) {
                                                cont_array[property] = object[property];
                                        });
                                        AddRowstrans(cont_array[0],cont_array[1],cont_array[2],cont_array[3],cont_array[4],cont_array[5],cont_array[6],cont_array[7],cont_array[8],cont_array[9]);
                                });
                        }
                        }
                });
		$("#orderno").val=orderno2;
                $("#checkmode").val('MODIFY');
                $('.SEARCH1').show();
                $(".JOB1").show();                
                $("#tabs_main").tabs('select',1);
        }
</script>
<script>
$(function(){

		$("#order_no").autocomplete("getdata.jsp?Test=select distinct orderno from orderdetails where location='<%=location%>' and orderno ilike",{minLength: 3,autoFill: true ,delay: 1000});

		$("#cl_name").autocomplete("../form/getdata.jsp?Test=select distinct cust_name from po_customermaster where location='<%=location%>' and type='Customer' and cust_name ilike",{minLength: 3,autoFill: true ,delay: 0,selectFirst:true,validSelection:true,cacheLength:1,Distinct: true});
		$("#clname").autocomplete("../form/getdata.jsp?Test=select distinct cust_name from po_customermaster where location='<%=location%>' and type='Customer' and cust_name ilike",{minLength: 3,autoFill: true ,delay: 0,selectFirst:true,validSelection:true,cacheLength:1,Distinct: true});

});

</script>

<script>
        function AddRows(ven_type,vdname,pono1,venetd,qunty,veninvoice_no,veninvoice_amt,veninvoicedate,venpymtstatus)         //from,to1,to2)
        {
                var tbl = document.getElementById('DetailsTable');
                var lastRow = tbl.rows.length;
                var iteration = lastRow;
                //var row = tbl.insertRow(lastRow);
                var row = tbl.tBodies[0].insertRow(-1);
                if(lastRow%2==0)
                {tbl.rows[lastRow].className = 'row1';}
                else
                {tbl.rows[lastRow].className = 'row0';}

		var cellRight0 = row.insertCell(0);
                var el = document.createElement('select');
                el.className = 'ui-widget select ui-corner-all';
                el.name = 'ven_type'+iteration;
                el.id = 'ven_type'+iteration;
                el.options[0] = new Option('Manufacturer', 'Manufacturer');
                el.options[1] = new Option('Raw Material', 'Raw Material');
                el.value = ven_type;
                cellRight0.appendChild(el);

                var cellRight1 = row.insertCell(1);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'vdname'+iteration;
                el.size='25';
                el.value = vdname;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight1.appendChild(el);
		
		var cellRight2 = row.insertCell(2);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'pono1'+iteration;
                el.size='15';
		el.value = pono1;
		el.disabled=true;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight2.appendChild(el);

		var cellRight3 = row.insertCell(3);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'venetd'+iteration;
                el.size='10';
                el.value = venetd;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight3.appendChild(el);

                 $("#venetd"+iteration).datepicker({  dateFormat: 'dd/mm/yy'  });

                var cellRight4 = row.insertCell(4);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'qunty'+iteration;
                el.size='10';
                el.value = qunty;
		el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight4.appendChild(el);

		var cellRight5 = row.insertCell(5);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'veninvoice_no'+iteration;
                el.size='10';
                el.value = veninvoice_no;
                //el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight5.appendChild(el);

		var cellRight6 = row.insertCell(6);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'veninvoice_amt'+iteration;
                el.size='10';
                el.value = veninvoice_amt;
                el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight6.appendChild(el);

		var cellRight7 = row.insertCell(7);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'veninvoicedate'+iteration;
                el.size='10';
                el.value = veninvoicedate;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight7.appendChild(el);

		 $("#veninvoicedate"+iteration).datepicker({  dateFormat: 'dd/mm/yy'  });

		var cellRight8 = row.insertCell(8);
                var el = document.createElement('select');
		el.className = 'ui-widget select ui-corner-all';
		el.name = 'venpymtstatus'+iteration;
                el.id = 'venpymtstatus'+iteration;	
		el.options[0] = new Option('PENDING', 'PENDING');
                el.options[1] = new Option('PAID', 'PAID');
                el.value = venpymtstatus;
                cellRight8.appendChild(el);

		
		var cellRight9= row.insertCell(9);
                var el = document.createElement('a');
                el.setAttribute('href','#');
		el.onclick=function(){deleterw1(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/Minus.png');
                img.style.cssText = 'border-color: white'
                el.appendChild(img);
		cellRight9.appendChild(el);

		var cellRight10= row.insertCell(10);
                var el = document.createElement('a');
                el.setAttribute('href','#');
                el.onclick=function(){generatepo(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/bttnpo.png');
                img.style.cssText = 'border-color: white'
		img.style.cssText ='width:70px'
                el.appendChild(img);
                cellRight10.appendChild(el);

var query="select distinct cust_name from po_customermaster  where location='<%=location%>' and type='Vendor' and cust_name ilike";
        $("#vdname"+iteration).quickselect({ajax:'../servlet/GetAuto_Data',match:'quicksilver',ajaxParams:{query :query} ,autoSelectFirst:false,minChars:'2',mustMatch:true});

        }
</script>
<script>
        //function AddRowscha(chaname,chapono1,chaqunty,chainvoice_no,chainvoicedate,chapymtstatus)         //from,to1,to2)
	function AddRowscha(chaname,chapono1)
        {
                var tbl = document.getElementById('DetailsTableCha');
                var lastRow = tbl.rows.length;
                var iteration = lastRow;
                //var row = tbl.insertRow(lastRow);
                var row = tbl.tBodies[0].insertRow(-1);
                if(lastRow%2==0)
                {tbl.rows[lastRow].className = 'row1';}
                else
                {tbl.rows[lastRow].className = 'row0';}

                var cellRight0 = row.insertCell(0);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'chaname'+iteration;
                el.size='25';
                el.value = chaname;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight0.appendChild(el);

                var cellRight1 = row.insertCell(1);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'chapono1'+iteration;
                el.size='15';
                el.value = chapono1;
		el.disabled=true;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight1.appendChild(el);

         /*       var cellRight2 = row.insertCell(2);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'chaqunty'+iteration;
                el.size='25';
                el.value = chaqunty;
                el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight2.appendChild(el);

                var cellRight3 = row.insertCell(3);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'chainvoice_no'+iteration;
                el.size='25';
                el.value = chainvoice_no;
                el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight3.appendChild(el);

                var cellRight4 = row.insertCell(4);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'chainvoicedate'+iteration;
                el.size='25';
                el.value = chainvoicedate;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight4.appendChild(el);

                var cellRight5 = row.insertCell(5);
                var el = document.createElement('select');
                el.className = 'ui-widget select ui-corner-all';
                el.name = 'chapymtstatus'+iteration;
                el.id = 'chaymtstatus'+iteration;
                el.options[0] = new Option('PENDING', 'PENDING');
                el.options[1] = new Option('PAID', 'PAID');
                el.value = chapymtstatus;
                cellRight5.appendChild(el);
*/

                var cellRight2= row.insertCell(2);
                var el = document.createElement('a');
                el.setAttribute('href','#');
                el.onclick=function(){deleterw1cha(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/Minus.png');
                img.style.cssText = 'border-color: white'
                el.appendChild(img);
                cellRight2.appendChild(el);

		var cellRight3= row.insertCell(3);
                var el = document.createElement('a');
                el.setAttribute('href','#');
                el.onclick=function(){generatepocha(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/bttnpo.png');
                img.style.cssText = 'border-color: white'
                img.style.cssText ='width:70px'
                el.appendChild(img);
                cellRight3.appendChild(el);

var query="select distinct cust_name from po_customermaster  where location='<%=location%>' and type='CHA' and cust_name ilike";
        $("#chaname"+iteration).quickselect({ajax:'../servlet/GetAuto_Data',match:'quicksilver',ajaxParams:{query :query} ,autoSelectFirst:false,minChars:'2',mustMatch:true});

        }
</script>
<script>
        function AddRowstrans(transname,transpono1,trns_etd,trnspickloc,trnsdelloc,transqunty,transinvoice_no,transinvoice_amt,transinvoicedate,transpymtstatus)         //from,to1,to2)
        {
                var tbl = document.getElementById('DetailsTableTrans');
                var lastRow = tbl.rows.length;
                var iteration = lastRow;
                //var row = tbl.insertRow(lastRow);
                var row = tbl.tBodies[0].insertRow(-1);
                if(lastRow%2==0)
                {tbl.rows[lastRow].className = 'row1';}
                else
                {tbl.rows[lastRow].className = 'row0';}

                var cellRight0 = row.insertCell(0);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transname'+iteration;
                el.size='25';
                el.value = transname;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight0.appendChild(el);

                var cellRight1 = row.insertCell(1);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transpono1'+iteration;
                el.size='15';
                el.value = transpono1;
		el.disabled=true;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight1.appendChild(el);

                var cellRight2 = row.insertCell(2);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'trns_etd'+iteration;
                el.size='10';
                el.value = trns_etd;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight2.appendChild(el);

                 $("#trns_etd"+iteration).datepicker({  dateFormat: 'dd/mm/yy'  });

                var cellRight3 = row.insertCell(3);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'trnspickloc'+iteration;
                el.size='10';
                el.value = trnspickloc;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight3.appendChild(el);

                var cellRight4 = row.insertCell(4);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'trnsdelloc'+iteration;
                el.size='10';
                el.value = trnsdelloc;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight4.appendChild(el);


                var cellRight5 = row.insertCell(5);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transqunty'+iteration;
                el.size='10';
                el.value = transqunty;
                el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight5.appendChild(el);

                var cellRight6 = row.insertCell(6);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transinvoice_no'+iteration;
                el.size='10';
                el.value = transinvoice_no;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight6.appendChild(el);

		var cellRight7 = row.insertCell(7);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transinvoice_amt'+iteration;
                el.size='10';
                el.value = transinvoice_amt;
                el.onblur=function(){isNum(this);};
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight7.appendChild(el);

                var cellRight8 = row.insertCell(8);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'transinvoicedate'+iteration;
                el.size='10';
                el.value = transinvoicedate;
                el.className = 'text ui-widget-content ui-corner-all';
                cellRight8.appendChild(el);

                 $("#transinvoicedate"+iteration).datepicker({  dateFormat: 'dd/mm/yy'  });

                var cellRight9 = row.insertCell(9);
                var el = document.createElement('select');
                el.className = 'ui-widget select ui-corner-all';
                el.name = 'transpymtstatus'+iteration;
                el.id = 'transpymtstatus'+iteration;
                el.options[0] = new Option('PENDING', 'PENDING');
                el.options[1] = new Option('PAID', 'PAID');
                el.value = transpymtstatus;
                cellRight9.appendChild(el);


                var cellRight10= row.insertCell(10);
                var el = document.createElement('a');
                el.setAttribute('href','#');
                el.onclick=function(){deleterw1trans(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/Minus.png');
                img.style.cssText = 'border-color: white'
                el.appendChild(img);
                cellRight10.appendChild(el);

		var cellRight11= row.insertCell(11);
                var el = document.createElement('a');
                el.setAttribute('href','#');
                el.onclick=function(){generatepotrans(this.parentNode.parentNode.rowIndex);};
                var img=document.createElement('img');
                img.setAttribute('src','../images/bttnpo.png');
                img.style.cssText = 'border-color: white'
                img.style.cssText ='width:70px'
                el.appendChild(img);
                cellRight11.appendChild(el);
		
var query="select distinct cust_name,location from po_customermaster  where location='<%=location%>' and type='Transporter' and cust_name ilike";
             $("#transname"+iteration).quickselect({ajax:'../servlet/GetAuto_Data',match:'quicksilver',ajaxParams:{query :query} ,autoSelectFirst:false,minChars:'2',mustMatch:true});
/*        $("#transname"+iteration).quickselect({ajax:'../servlet/GetAuto_Data',match:'quicksilver',ajaxParams:{query :query} ,autoSelectFirst:false,minChars:'2',mustMatch:true,maxVisibleItems:30,delay:1000,additionalFields:[$('#trnspickloc'+iteration)],
                        formatItem:function(data, index, total)
                        {
                                return data[0];
                        }

});*/
	var  orderno2= $('#order_no').val();
var query="select distinct  del_location  from orderdetails_vendor  where location='<%=location%>'  and orderno='"+orderno2+"' and del_location  ilike";
	$("#trnsdelloc"+iteration).quickselect({ajax:'../servlet/GetAuto_Data',match:'quicksilver',ajaxParams:{query :query} ,autoSelectFirst:false,minChars:'2',mustMatch:true});

        }
</script>

<script>
function generatepo(j)
{
	var orderno2= $('#order_no').val();
	var cust_type="Vendor";
	$.ajax({
                        type: "GET",
                        url: "../servlet/GenaratePoAjax",
                        data: "cust_type="+cust_type,
                        dataType: "json",async:   false,
                        success: function (jsondata) {
                        if (jsondata.response == 'SUCCESS') {

				 $.each(jsondata.detailsX, function(i, object) {
                                                var makeid = '#'+i;
                                              //alert(makeid+j);
                                                $(makeid+j).val(object);

                                });
                        }
                        }
                });
	return false;
}
</script>
<script>
function generatepocha(j)
{
//      alert(tbl);
        var orderno2= $('#order_no').val();
        var cust_type="CHA";
        $.ajax({
                        type: "GET",
                        url: "../servlet/GenaratePoAjax",
                        data: "cust_type="+cust_type,
                        dataType: "json",async:   false,
                        success: function (jsondata) {
                        if (jsondata.response == 'SUCCESS') {
				
				 $.each(jsondata.detailsX, function(i, object) {
                                                var makeid = '#'+i;
                                                $(makeid+j).val(object);

                                });

                        }
                        }
                });
}
</script>
<script>
function generatepotrans(j)
{
//      alert(tbl);
        var orderno2= $('#order_no').val();
        var cust_type="Transporter";
        $.ajax({
                        type: "GET",
                        url: "../servlet/GenaratePoAjax",
                        data: "cust_type="+cust_type,
                        dataType: "json",async:   false,
                        success: function (jsondata) {
                        if (jsondata.response == 'SUCCESS') {
		
				 $.each(jsondata.detailsX, function(i, object) {
                                                var makeid = '#'+i;
                                                $(makeid+j).val(object);

                                });
                        }
                        }
                });
}
</script>

<script>
function deleterw1(i)
{
        var tbl = document.getElementById('DetailsTable');
        tbl.deleteRow(i);
}

</script>
<script>
function deleterw1cha(i)
{
        var tbl = document.getElementById('DetailsTableCha');
        tbl.deleteRow(i);
}

</script>
<script>
function deleterw1trans(i)
{
        var tbl = document.getElementById('DetailsTableTrans');
        tbl.deleteRow(i);
}

</script>

<script>
	function conton()
	{
		$("#checkmode").val('MODIFY');
	}
</script>
<script>	
	function callll()
	{
		if($("#cal").val()=='ADD')
		{
			impFunction1();
		}
		else
		{
			conton();
			impFunction();
		}	
	}
function msg(mes)
{
        $("#dialog-confirm").text(mes);
        $('#dialog-confirm').dialog('open');
}
function isNum(obj)
        {
          var str = obj.value;
          if(isNaN( str ))
                  {
                        var message="Pls Enter Numeric Value.....!";
                        $("#dialog-confirm").text(message);
                        $('#dialog-confirm').dialog('open');
                        obj.value="0";
                        return false;
                  }
        }
</script>
<script>
$(document).ready(function() {
//   $('#pymt_status').css('color','red'); 
   $('#pymt_status').change(function() {
      var current = $('#pymt_status').val();
      if (current != 'RECEIVED') {
          $('#pymt_status').css('color','red');
      } else {
          $('#pymt_status').css('color','');
      }
   }); 
});
</script>
<script>
        $(function(){
        $('.addcall').live('click',function()
        {
                var wHandle;
                var frame="<HTML><HEAD><TITLE> Submit Details</TITLE><BODY onLoad='document.forms[0].submit()'> <FORM method=post action='../form/POCustomerMaster.jsp'  name=SUBMITDETAILS></FORM> </BODY> </HEAD> </HTML>";
                wHandle=window.open('','','width=1200,height=400,scrollbars=YES, TOP=80,LEFT=200');
                wHandle.document.open();
                wHandle.document.write(frame);
                wHandle.document.close();
        });
});
</script>

</head>
<body>
<div id="tabs_main">            <!-- MAIN TAB STATS HEAR -->
        <ul>
                <li class='SEARCH1'><a href="#SEARCH" ><span>SEARCH</span></a></li>
                <li class='JOB1'><a href="#JOB"><span>ADD NEW</span></a></li>
        </ul>
<input type='hidden' id='foradddetails'>
<div id="SEARCH">       <!-- div searche start -->
<form method="post" id ="myForm_search" >
<div class="form-content">
        <table class="adminlist">
                <tr class="row0">
                <th colspan="8">ORDER SEARCH</th>
                </tr>
                <tr class="row0">
                        <td align="center"> Order No :
                        <input type="text" class="text ui-widget-content ui-corner-all " id="order_no" namde="order_no" size="50" /></td>

                </tr>

        </table>
        <br>
        <div class="submit"  align="center">
                <input type="button"  id="s_submitbtn"  class="ui-button ui-widget ui-state-default ui-corner-all"  value="search" onclick="modify1();"/>
                <!--<input type="button" value="ADD NEW"  class="ui-button ui-widget ui-state-default ui-corner-all" onclick="party();" />-->
        </div>
        <br>
</div>                 
</form>
</div>                  <!-- div search end -->

<div id="JOB">
<form method="post" id ="myForm1" action="../servlet/VCTOrderDetalsAdd">
	<input type="hidden" name="otheradd" id="otheradd" value="ADD">
	<input type="hidden" name="checkmode" id="checkmode" >
	<input type="hidden" name="cal" id="cal" >
	<input type="hidden" name="list" id="list">
	<input type="hidden" name="list1" id="list1">
	<input type="hidden" name="list2" id="list2">
        <div class="form-content">
	<table class="adminlist">		
				<th  align="center">ORDER DETAILS</th>
			</table>
        <table class="adminlist">
                                <tr class="row1">
                                        <td colspan="2" align="right">Order No</td>
					<td><input type="text" class="text ui-widget-content ui-corner-all" name="orderno" id="orderno" size="30" readonly/></td>
					<td colspan="2" align="right">Client Name</td>
                                        <td><input type="text" class="text ui-widget-content ui-corner-all" name="clname" id="clname" size="30" readonly/></td>
                                        <td colspan="3" align="right">PO No.</td>
                                        <td><input type="text" class="text ui-widget-content ui-corner-all" name="pono" id="pono" size="30" readonly/></td>
					<td colspan="2" align="right">Item Description</td>
                                        <td><textarea  name="itmdesc" id="itmdesc" class="textarea ui-widget-content ui-corner-all"  rows=2 cols=30 onBlur="replaceAll(this);replaceAmpr(this)" readonly/></textarea></td>
                                </tr>
                    </table>
                <br>
		 <!-- <table class="adminlist">
                   <th align="center">VENDOR DETAILS</th>
                   </table>-->
			 <div id="tabs">
                      <ul>
                        <li><a href="#vn"><span>VENDOR</span></a></li>
                        <li><a href="#cha"><span>CHA</span></a></li>
                        <li><a href="#trans"><span>TRANSPORTER</span></a></li>
                      </ul>
                <div id="vn">
	
			<table class="adminlist"  id="ar_tbl">
				<table class="adminlist" id="DetailsTable">
	                        <tr>
				  <th align=left>Type</th>
                                  <th align=left>Vendor Name</th>
                                  <th align=left>PO No</th>
				   <th align=left>ETD</th>
                                  <th align=left>Quantity</th>
				  <th align=left>Invoice No.</th>
				  <th align=left>Invoice Amt.</th>
				  <th align=left>Invoice Date</th>
				  <th align=left>Payment Status</th>
				  <th><a class= 'toolbar' href= '#' onClick="AddRows('','','','','','','','');conton();"><img src='../images/Add.png' alt='Add Rows' align='middle' name='lookup' border='0'></a></th>
                                  <th></th>
				</tr>
                                </table>
		</div>
		<div id="cha">
			<table class="adminlist"  id="ar_tbl">
                                <table class="adminlist" id="DetailsTableCha">
                                <tr>
                                  <th align=left>CHA Name</th>
                                  <th align=left>PO No</th>
                                  <th><a class= 'toolbar' href= '#' onClick="AddRowscha('','');conton();"><img src='../images/Add.png' alt='Add Rows' align='middle' name='lookup' border='0'></a></th>
				  <th></th>
                                </tr>
                                </table>
		</div>
                <div id="trans">
                        <table class="adminlist"  id="ar_tbl">
                                <table class="adminlist" id="DetailsTableTrans">
                                <tr>
                                  <th align=left>Transporter Name</th>
                                  <th align=left>PO No</th>
				  <th align=left>ETD</th>
				  <th align=left>Pickup location</th>
                                  <th align=left>Delivery location</th>
                                  <th align=left>Quantity</th>
                                  <th align=left>Invoice No</th>
				   <th align=left>Invoice Amt.</th>
                                  <th align=left>Invoice Date</th>
                                  <th align=left>Payment Status</th>
                                  <th><a class= 'toolbar' href= '#' onClick="AddRowstrans('','','','','','','','','','');conton();"><img src='../images/Add.png' alt='Add Rows' align='middle' name='lookup' border='0'></a></th>
				  <th></th>
                                </tr>
                                </table>
		</div>

<br>
                <div class="submit"  align="center">
                <input type="submit" name="submitbtn" id="submitbtn" value="Submit" onClick="return validate();"/>
                </div>
                  </div>
		 </div>

</div>
</div>
</div>
<div id="dialog-confirm" title="Confirmation Box" style="display: none;">
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Booking Finalization Done Successfully !!!</p>
</form>
</div>
</body>
</html>

