
console.log("Inicio 0.0.2");

var arrSocket ={};

var usuario = 0;

var net = require('net');  
//connection.query(sqlExec, []);

function onConnect()
{
    console.log("Connected to Flash");
    
    
}


function enviaMasivo(arrSocket, socket, arrOpt, opt, me){
	console.log('enviaMasivo');
	//console.log(socket);
	if(socket.hasOwnProperty('id')){
		for (var allSock in arrSocket){
			console.log('todas las partidas para usuario ' + allSock);
			//console.log(socket);
			if(allSock == socket.id || me){                
				arrSocket[allSock].write('RECEP|' + opt + '|' + arrOpt, 'utf8');
				console.log('Corresponde para usuario ' + allSock);
			}	
			//break;
		}
	}
	
}

function newSocket(socket) {
	console.log("/************************************************************/");
	console.log('ingresando en newSocket');
	console.log('Welcome to the Telnet server!\n');
	socket.on('data', function(data) {
		receiveData(socket, data);
	})
/*	socket.on('end', function() {
		closeSocket(socket);
	})
	socket.on("close", function(){
		onClose(socket);
	});
	socket.on('error', function(err) {
		console.log('[ERROR DE SOCKET]');
	})*/
	
	socket.on('disconnect', function(err) {
		console.log('[ERROR DE SOCKET FINAL....DESCONEXION]');
	})
	
	/*socket.addListener('build', function() {
		console.log('[HOLA]');
	})
	socket.nombre = 'U' + usuario;
	ee.emit('build');*/
	
	arrSocket['U' + (++usuario)] = socket;

}


function receiveData(socket, d) {
	if(d === "@quit") {
		socket.end('Goodbye!\n');
	}
	else {
		var opt = '' + d;
		var usuario;
		var partida = 0;
		var creador;
		var oponente;
		var finStream;
		socket.arrOpt = arrOpt;
		//arrSocket
		console.log("********************************************************************");
		console.log("From Flash = " + d);
		//console.log(connection);
		if(connection){
			
		}
	//    mySocket.write(d, 'utf8');
		var arrOpt = opt.split('|');
		
		console.log(arrOpt);
	 
		console.log("EJECUTANDO");
		switch(arrOpt[0]){
			case "LOGIN":
				user = JSON.parse(arrOpt[1]);
				socket.id = user.username;
				arrSocket[user.username] = socket;
				finStream = arrOpt[arrOpt.length - 1];
				socket.write("RECEP|MSG|OK|Conectado" + '|'+ arrOpt[arrOpt.length - 1], 'utf8');  
				
				var json = '';
			break;
			case "NUEVO_TICKET":
				ticket = JSON.parse(arrOpt[1]);
				console.log(ticket);
				console.log('Buscando usuario....');
				finStream = arrOpt[arrOpt.length - 1];
				enviaMasivo(arrSocket, socket, finStream, 'NUEVO_TICKET', false);
				
				var json = '';
			break;

		}
	}
}

	
/******************************************************************************/

var server = net.createServer(newSocket);

server.listen(9003);
