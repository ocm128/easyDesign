window.myapp = {
	connect: function(){
		window.myapp.socket= io.connect('http://localhost:5001');
		window.myapp.socket.on('rt-change',function(data){
			console.log(data);
			if(data.resource == "posts"){
				$.tmpl("templates/posts", data).prependTo('#activities');	
			}
			
		});
	}
}