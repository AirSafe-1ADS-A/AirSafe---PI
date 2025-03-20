const int PINO_SENSOR_MQ2 = A2;  // Cria uma variavél fixa para a saída do sensor na A2

const int VALOR_MINIMO = 100; // Cria uma variável de valor minimo e a define com 100
const int VALOR_MAXIMO = 1000; // Cria uma variável de valor maximo e a define com 1000

const float tolerancia = 0.19;// Cria uma variável de tolerancia para a respiração




void setup(){ //Função que será executada uma vez
	Serial.begin(9600); // Define que iniciará a comunicação em 9 segundos e 6 milisegundos
}





void loop(){ //Função que será executada continuamente sem parar
 	int valorSensor = analogRead(PINO_SENSOR_MQ2); 
  // Define o valor do sensor para a leitura do pino ou seja o Pino do Sensor

	float porcentagem = ((float)(valorSensor - VALOR_MINIMO) / (VALOR_MAXIMO - VALOR_MINIMO)); 
  // Calculo para informar a porcentagem (escala menor, não foi elevado a 100)
	
	if (porcentagem < 0){ // Inicia uma condição onde se a porcentagem for menor que 0 
		porcentagem = 0; // Atribui que a porcentagem é igual a 0
	} else if (porcentagem > 100) { // Inicia uma condição onde se a porcentagem for maior que 100 
		porcentagem = 100; // Atribui que a porcentagem é igual a 100
	}

Serial.print("Porcentagem:"); // Mensagem ilustrativa
Serial.print(porcentagem); // Mostra o número da porcentagem
Serial.print(" Tolerancia:"); // Mensagem ilustrativa
Serial.println(tolerancia); // Mostra o valor da tolerancia

delay(1000); // Delay de 1 segundo para iniciar novamente
}

