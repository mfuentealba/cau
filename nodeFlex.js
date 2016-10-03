
console.log("Inicio 0.0.2");

var arrSocket ={};

var usuario = 0;

var net = require('net');  
//connection.query(sqlExec, []);

function onConnect()
{
    console.log("Connected to Flash");
    
    
}


function enviaMasivo(arrSocket, obj, arrOpt, opt, me){
	console.log('enviaMasivo');
	
	for (var allSock in arrSocket){
		console.log('todas las partidas para usuario ' + allSock);
		arrSocket[allSock].write('RECEP|' + opt + '|' + obj + '|' + arrSocket[allSock].finStream, 'utf8');
		console.log('Corresponde para usuario ' + allSock);
		console.log('RECEP|' + opt + '|' + obj + '|' + arrSocket[allSock].finStream);
		
		/*if(allSock == socket.id || me){                
			arrSocket[allSock].write('RECEP|' + opt + '|' + arrOpt, 'utf8');
			console.log('Corresponde para usuario ' + allSock);
		}*/	
		
	}
	
	
}

function newSocket(socket) {
	console.log("/************************************************************/");
	console.log('ingresando en newSocket');
	console.log('Welcome to the Telnet server!\n');
	socket.on('data', function(data) {
		receiveData(socket, data);
	})
	socket.on('end', function() {
		closeSocket(socket);
	})
	socket.on("close", function(){
		onClose(socket);
	});
	socket.on('error', function(err) {
		console.log('[ERROR DE SOCKET]');
	})
	
	socket.on('disconnect', function(err) {
		console.log('[ERROR DE SOCKET FINAL....DESCONEXION]');
	})
	
	/*socket.addListener('build', function() {
		console.log('[HOLA]');
	})
	socket.nombre = 'U' + usuario;
	ee.emit('build');*/
	
	//arrSocket['U' + (++usuario)] = socket;

}


function closeSocket(socket) {
	console.log('***************************************');
	console.log('ingresando en closeSocket');//53820010
		
	
	
}

function onClose(socket)
{
	console.log("ingresando en onClose");
	
}

function onError()
{
    console.log("SE DESCONECTO");
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
		
		var arrOpt = opt.split('|');
		
		console.log(arrOpt);
	 
		console.log("EJECUTANDO");
		switch(arrOpt[0]){
			case "LOGIN":
				//user = JSON.parse(arrOpt[1]);
				user = arrOpt[1];
				socket.id = user;
				arrSocket[user] = socket;
				socket.finStream = arrOpt[arrOpt.length - 1];
				socket.write("RECEP|MSG|OK|Conectado" + '|'+ arrOpt[arrOpt.length - 1], 'utf8');  
				
				var json = '';
			break;
			case "NUEVO_TICKET":
				ticket = JSON.parse(arrOpt[1]);
				console.log(ticket);
				console.log('Buscando usuario....');
				finStream = arrOpt[arrOpt.length - 1];
				socket.id = user.username;
				enviaMasivo(arrSocket, arrOpt[1], finStream, 'NUEVO_TICKET', false);
				
				var json = '';
			break;
			
			case "REASIGNACION_TICKET":
				/*ticket = JSON.parse(arrOpt[1]);
				console.log(ticket);
				console.log('REASIGNACION_TICKET N° ' + ticket.id);*/
				finStream = arrOpt[arrOpt.length - 1];
				socket.id = user.username;
				enviaMasivo(arrSocket, arrOpt[1], finStream, 'REASIGNACION_TICKET', false);
				
				var json = '';
			break;

		}
	}
}

	
/******************************************************************************/

var server = net.createServer(newSocket);

server.listen(9003);
