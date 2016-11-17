 %Calibration data from IT8.7 target

TargetNames = {'A12', 'A15','B19','D6', 'D9', 'G9', 'H3', 'I15', 'J8', 'K13', 'white'};

CalibrationValues =[
    0.3650	0.2671	0.1732 %A12
    0.6831	0.7202	0.5619 %A15
    0.5082	0.5278	0.5442 %B19, most similar to Vittel-blue. Also L22 is close but too dark for good calibration!
    0.1919	0.2000	0.0554 %D6
    0.4722	0.4912	0.2731 %D9
    0.3202  0.3596  0.3188 %G9
    0.0232	0.0326	0.0602 %H3
    0.5986  0.6239  0.0774 %I15
    0.1035	0.0871	0.3189 %J8
    0.2479	0.3829	0.4990 %K13
    0.9642  1.0000  0.8252 %white
    ];

%Measured RGB voltages
MeasuredVoltages =[

    1.1588    0.3494    0.3901
    1.2575    1.0852    1.0573
    0.9176    0.8249    1.0297
    0.4581    0.3239    0.1491
    0.9951    0.7709    0.5794
    0.5560    0.5805    0.5974
    0.0673    0.0887    0.1282
    1.2768    0.9156    0.2587
    0.1603    0.1604    0.5816
    0.2218    0.7751    0.9072
    1.8676    1.6012    1.7309];

%Least square fit
offset=ones(11,1);
MeasuredVoltagesValues=[offset, MeasuredVoltages];

CorrelationMatrix=CalibrationValues'/MeasuredVoltagesValues'

%Then you can convert any RGB-voltage measurement into XYZ
RGBmeasurement=[1 0.35  0.25] %example measurement

XYZ=(CorrelationMatrix*[1 RGBmeasurement(1) RGBmeasurement(2) RGBmeasurement(3)]')'

        
%convert CIEXYZ to CIELab        
Lab= XYZ2LAB(XYZ)
        
%convert CIEXYZ to RGB (based on white reference D50 as used by LaserSoft imaging)
RGB=XYZ2RGB(XYZ)