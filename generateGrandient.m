function generateGrandient()

ColorString2 ='#3D1675';
ColorString1 ='#61B3B5';

colorValue1 = getColorString(ColorString1);
colorValue2 = getColorString(ColorString2);

ColorValues = [linspace(colorValue1(1),colorValue2(1),16)',...
                        linspace(colorValue1(2),colorValue2(2),16)',...
                        linspace(colorValue1(3),colorValue2(3),16)'];

disp(ColorValues);
end

function colorValue = getColorString(ColorString)
colorValue = zeros(1,3);
if length(ColorString) >= 3
  if ColorString(1:3) == "rgb"
    colorValue = str2num(ColorString(5:end-1));
    colorValue = colorValue/255;
  elseif ColorString(1) == '('
    colorValue = str2num(ColorString(2:end-1));
    colorValue = colorValue/255;
  elseif ColorString(1) == '#'
    colorValue = sixteen2ten(ColorString);
    colorValue = colorValue/255;
  elseif length(ColorString) == 6
    colorValue = sixteen2ten(['#' ColorString]);
    colorValue = colorValue/255;
  end
end
end

function num=sixteen2ten(string)
    exchange_list='0123456789ABCDEF#';
%     exchange_list='0123456789abcdef#';
    num=zeros(1,3);
    for i=1:3
        tempCoe1=find(exchange_list==string(i*2))-1;
        tempCoe2=find(exchange_list==string(i*2+1))-1;
        num(i)=16*tempCoe1+tempCoe2;
    end
end