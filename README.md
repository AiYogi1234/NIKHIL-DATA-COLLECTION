#DOCUMENTATION
•	Install MATLAB R2021a from the internet: https://www.mathworks.com/help/install/install-products.html

MATLAB SETUP
•	To access MATLAB, go to the MathWorks website and click on the "Get Matlab" option.
•	 Sign in using the KGP email id account otherwise, create an account with the KGP mail ID or any official email ID.
•	After creating the account, select "Install Matlab" or "Open Online Matlab."
•	Complete the setup of MATLAB.
•	Download the code from the GitHub repository 
•	The GitHub Repository is: https://github.com/AiYogi1234/NIKHIL-DATA-COLLECTION
•	After downloading the code, open the text file in MATLAB
•	Connect the Arduino Mega2560 at COM3 ( a= arduino() works as a connection with arduino board.

CODE SUMMARY
•	The code reads the analog values from the Aurdino in a sequential manner, where initial row selection takes place followed by collecting the data column-wise to finally obtain a 52x36 “readings” matrix.
•	Here we define an Arduino object as “a” which is connected at PORT “COM3” and it clears the entire workspace.
•	Make use of four-row and three-column multiplexers and the pins used for the rows and columns are defined in the form of an array of pin names. 
•	Initial value of the readings is considered to be zero.
•	The code consists of three nested loops, one for each row multiplexer and another two nested loops for each column multiplexer.
•	Within each row loop, the code sets the corresponding digital output pins for the row multiplexer to select one row of sensors at a time.
•	 For each selected row, the code sets the digital output pins for the column multiplexer to select each of the sensors in that row and reads its analog value using the "readVoltage" function. 
•	The analog values are stored in the matrix "readings". The loops iterate through all the rows and columns of the sensor matrix. 
•	Finally, the code outputs the values of the matrix "readings" for further analysis or visualization.


CODE EXPLANATION

PART A
•	a = arduino("COM6","Mega2560")
•	
 "COM6" and "Mega2560" are parameters that are passed to the Arduino function. 
•	"COM3" refers to the specific serial port that the Arduino board is connected to on the computer. 
•	The naming convention for serial ports on Windows typically starts with "COM" followed by a number.
•	"Mega2560" which refers to the specific model of the Arduino board being used.

Part B
•	The line row_mux1 = ["D22" "D23" "D24" "D25"]; is creating a new array called row_mux1 that contains four string values: "D22", "D23", "D24", and "D25". These strings likely represent the digital pins on an Arduino board that will be used to control a multiplexer (mux) circuit to select a specific row of a matrix of buttons or sensors.
Part C
•	sensorValue=readVoltage(a, sensorPin) function helps in reading the voltage value from a sensor connected to the Arduino board through the analog input pin specified by the sensorPin variable. 

•	The readVoltage function is a built-in function in MATLAB's Arduino support package that reads the voltage value from an analog input pin on the specified Arduino board (a in this case). 
•	The sensorValue variable is then assigned the voltage value returned by the readVoltage function, which can be used for further processing or analysis.

