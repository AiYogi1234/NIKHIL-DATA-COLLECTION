%%
clc;
clear all;
a = arduino("COM3","Mega2560");

%%
  muxChannel=[
    0 0 0 0;
    1 0 0 0;
    0 1 0 0;
    1 1 0 0;
    0 0 1 0;
    1 0 1 0;
    0 1 1 0;
    1 1 1 0;
    0 0 0 1;
    1 0 0 1;
    0 1 0 1;
    1 1 0 1;
    0 0 1 1;
    1 0 1 1;
    0 1 1 1;
    1 1 1 1;
    ];

  

row_mux1 = ["D22" "D23" "D24" "D25"];

col_mux1 = ["D8" "D9" "D10" "D11"];
col_mux2 = ["D28" "D29" "D30" "D31"];
col_mux3 = ["D3" "D4" "D5" "D6"];

readings = zeros(52,36);
sensorValue = 0;
signalPin = "D14";

sensorPin = "A0";

enmux1 = "D17";
enmux2 = "D16";
enmux3 = "D15";

%%

configurePin(a,signalPin,'DigitalOutput');
configurePin(a,enmux1,'DigitalOutput');
configurePin(a,enmux2,'DigitalOutput');
configurePin(a,enmux3,'DigitalOutput');

for i=1:4
    configurePin(a,row_mux1(i),'DigitalOutput');
end

for i=1:4
    configurePin(a,col_mux1(i),'DigitalOutput');
end

for i=1:4
    configurePin(a,col_mux2(i),'DigitalOutput');
end

for i=1:4
    configurePin(a,col_mux3(i),'DigitalOutput');
end

%%
writeDigitalPin(a,enmux1,0);
writeDigitalPin(a,signalPin,1);
for row=1:15
    for temp=1:4
        writeDigitalPin(a,row_mux1(temp),muxChannel(row,temp));
    end
    for col=1:15
        for temp1=1:4
            writeDigitalPin(a,col_mux1(temp1),muxChannel(col,temp1));
        end
        
        sensorValue=readVoltage(a,sensorPin);
        if sensorValue<0.5
            sensorValue = 0;
        end
        fprintf("%0.3f",sensorValue);
        fprintf('\n');
        readings(row,col)=sensorValue;

    end
end
writeDigitalPin(a,enmux1,1);
writeDigitalPin(a,signalPin,0);

%%
writeDigitalPin(a,enmux2,0);
writeDigitalPin(a,signalPin,1);
for row=1:15
    for temp=1:4
        writeDigitalPin(a,row_mux1(temp),muxChannel(row,temp));
    end
    for col=1:15
        
        for temp1=1:4
            writeDigitalPin(a,col_mux2(temp1),muxChannel(col,temp1));
        end
        

        sensorValue=readVoltage(a,sensorPin);
        if sensorValue<0.5
            sensorValue = 0;
        end
        fprintf("%0.3f",sensorValue);
         fprintf('\n');
        readings(row,col+15)=sensorValue;
        
    end
end

writeDigitalPin(a,enmux2,1);
writeDigitalPin(a,signalPin,0);

writeDigitalPin(a,signalPin,1);
writeDigitalPin(a,enmux3,0);
for row=1:15
    for temp=1:4
        writeDigitalPin(a,row_mux1(temp),muxChannel(row,temp));
    end
    for col=1:6
        
        for temp1=1:4
            writeDigitalPin(a,col_mux3(temp1),muxChannel(col,temp1));
        end
        

        sensorValue=readVoltage(a,sensorPin);
        if sensorValue<0.5
            sensorValue = 0;
        end
        fprintf("%0.3f",sensorValue);
         fprintf('\n');
        readings(row,col+30)=sensorValue;
        
    end
end
%writeDigitalPin(a,enmux3,1);
%writeDigitalPin(a,signalPin,0);





