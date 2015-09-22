<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="es.us.isa.ideas.controller.R.RInspector" %>

<script type="text/javascript">
	
			function onClick(tabName){
				if(tabName=='environments'){
					$('#plot').toggleClass('active')
					$('#environment').toggleClass('active')
					$.ajax('/ideas-R-language/inspector/environment',{
						  'type':'post',
						  'data':{},
						  'success':function(result){
						    var jsp= result.context;
						    $('#editorInspectorLoader').load(jsp);
						  				},
						  'onError':function(result){console.log([ERROR]+result.context);},
						  'async':true,});
					
				}else if(tabName=='plots'){
					$('#plot').toggleClass('active')
					$('#environment').toggleClass('active')
					$.ajax('/ideas-R-language/inspector/plots',{
						  'type':'post',
						  'data':{},
						  'success':function(result){
						          var jsp= result.context;
						          $('#editorInspectorLoader').removeAttr("style");
						          $('#editorInspectorLoader').load(jsp);
						                            },
						  'onError':function(result){console.log([ERROR]+result.context);},
						  'async':true,});
				}else{
					window.alert("tab unrecognised.");
				}
			}
			function refresh(tabName){
				//de momento no va a haber nada especial en el refresh
				onClick(tabName);
			}
			function canvasPlot(fileUri){
				var canvas= document.getElementById("canvasPlot");
				var img=$('#selecPlot').val();
				var url='/file/get/'+fileUri+'/IDEAS-R-OutputFolder/'+img;
				//window.alert(fileUri);
				/*$.get(url, function(image){
					var con=canvas.getContext("2d");
					con.drawImage(image,100,100);
				});*/
				var image= new Image();
				image.src=url;
				canvas.height=image.height;
				canvas.width=image.width;
				var con=canvas.getContext("2d");
				con.drawImage(image,10,10);
				/*$.ajax(url,{
					'type' : 'get',
					'success' : function(result){
						image=result;
						canvas.height=image.height;
						canvas.width=image.width;
						var con=canvas.getContext("2d");
						con.drawImage(image,10,10);
						
					},
					'onError' : function(result){},
					'async' : true
				});*/
				
			}
			function expand(TrId){
				var id=TrId.substring(1); //quitarle la v.
				var v=$('.value').children('#value'+id);
				if(v.is(':hidden')){
				    v.slideDown();
				  }else{
				   v.hide(); 
				  }
				
			}
			function chargeImages(fileUri){
				var graficas= $('#selectPlot').children().text().split(" ");
				//window.alert(graficas);
				var image= new Image();
				var canvas= document.getElementById("canvasPlot");
				
				for(var i=graficas.length;i>0;i--){
					var url='/file/get/'+fileUri+'/IDEAS-R-OutputFolder/'+graficas[i];
					image.src=url;
					canvas.height=image.height;
					canvas.width=image.width;
					var con=canvas.getContext("2d");
					con.drawImage(image,10,10);	
					
				}	
			}
			
			
	
 </script>