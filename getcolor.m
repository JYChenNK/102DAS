function getcolor()

% ColorsStrings = {'#f7d794','#f5cd79','#f3a683','#f19066',...
%                            '#ea8685','#e66767','#e77f67','#e15f41',...
%                            '#f8a5c2','#f78fb3','#cf6a87','#c44569',...
%                            '#63cdda','#3dc1d3','#778beb','#546de5',...
%                            '#786fa6','#574b90','#596275','#303952'};

% ColorsStrings = {'#fad390','#f6b93b','#fa983a','#e58e26',...
%                            '#f8c291','#e55039','#eb2f06','#b71540',...
%                            '#6a89cc','#4a69bd','#1e3799','#0c2461',...
%                            '#82ccdd','#60a3bc','#3c6382','#0a3d62',...
%                            '#b8e994','#78e08f','#38ada9','#079992'};

% ColorsStrings = {'#55efc4','#00b894','#81ecec','#00cec9',...
%                            '#74b9ff','#0984e3','#a29bfe','#6c5ce7',...
%                            '#ffeaa7','#fdcb6e','#fab1a0','#e17055',...
%                            '#ff7675','#d63031','#fd79a8','#e84393',...
%                            '#dfe6e9','#b2bec3','#636e72','#2d3436'};

% 6
% ColorsStrings = {'#90CAF9','#64B5F6','#42A5F5','#2196F3',...
%                            '#1E88E5','#1976D2','#1565C0','#0D47A1',};
% 7                      
% ColorsStrings = {'#81D4FA','#4FC3F7','#29B6F6','#03A9F4',...
%                            '#039BE5','#0288D1','#0277BD','#01579B',};
% % 8
% ColorsStrings = {'#80DEEA','#4DD0E1','#26C6DA','#00BCD4',...
%                            '#00ACC1','#0097A7','#00838F','#006064',};
% % 9
% ColorsStrings = {'#80CBC4','#4DB6AC','#26A69A','#009688',...
%                            '#00897B','#00796B','#00695C','#004D40',};                        
% % 10
% ColorsStrings = {'#A5D6A7','#81C784','#66BB6A','#4CAF50',...
%                            '#43A047','#388E3C','#2E7D32','#1B5E20',};
% % % 11
% ColorsStrings = {'#C5E1A5','#AED581','#9CCC65','#8BC34A',...
%                            '#7CB342','#689F38','#558B2F','#33691E',};
% % 12
% ColorsStrings = {'#FFE082','#FFD54F','#FFCA28','#FFC107',...
%                            '#FFB300','#FFA000','#FF8F00','#FF6F00',};
% % 13
% ColorsStrings = {'#FFCC80','#FFB74D','#FFA726','#FF9800',...
%                            '#FB8C00','#F57C00','#EF6C00','#E65100',};
% % % 14
% ColorsStrings = {'#FFAB91','#FF8A65','#FF7043','#FF5722',...
%                            '#F4511E','#E64A19','#D84315','#BF360C',};
% % 15
ColorsStrings = {'#BCAAA4','#A1887F','#8D6E63','#795548',...
                           '#6D4C41','#5D4037','#4E342E','#3E2723',};
% % 16
% ColorsStrings = {'#E5E5E5','#D4D4D4','#A3A3A3','#737373',...
%                            '#525252','#404040','#262626','#171717',};
                         
ColorValues = zeros(length(ColorsStrings),3);

for i = 1:length(ColorsStrings)
  ColorValues(i,:) = getColorString(ColorsStrings{i});
end
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

function getColorInput()
ColorString = inputdlg('Input Color Value','Color');
ColorString = ColorString{1};
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
  disp(colorValue);
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

function string=ten2sixteen(num)
%the num should be a 1x3 Integer mat limited in [0 255]
exchange_list={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
string='#';
  for i=1:3
      temp_num=num(i);
      string(1+i*2-1)=exchange_list{(temp_num-mod(temp_num,16))/16+1};
      string(1+i*2)=exchange_list{mod(temp_num,16)+1};
  end
end