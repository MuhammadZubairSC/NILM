%Author:Muhammad Zubair SC
%Title: NILM

function varargout = NILM(varargin)

% NILM MATLAB code for NILM.fig
%      NILM, by itself, creates a new NILM or raises the existing
%      singleton*.
%
%      H = NILM returns the handle to a new NILM or the handle to
%      the existing singleton*.
%
%      NILM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NILM.M with the given input arguments.
%
%      NILM('Property','Value',...) creates a new NILM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NILM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NILM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NILM

% Last Modified by GUIDE v2.5 23-Nov-2017 02:07:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NILM_OpeningFcn, ...
                   'gui_OutputFcn',  @NILM_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NILM is made visible.
function NILM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NILM (see VARARGIN)

% Choose default command line output for NILM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Disable the background to show any other plot from the GUI and puts it
%behind all the uicontrols

uistack(background, 'bottom');
set(handles.text1,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.text4,'Visible','off');
set(handles.pushbutton_quit,'Visible','off');
set(handles.detection_string,'Visible','off');
set(handles.main_axis,'Visible','off');
set(handles.axes_highlight,'Visible','off');
set(handles.axes_highlightl,'Visible','off');
delete(instrfind);
global s;
s=serial('COM26','BaudRate',115200);
s.Terminator='LF';
s.Timeout=1;
fopen(s);
% UIWAIT makes NILM wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% UIWAIT makes NILM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NILM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
set(handles.text1,'Visible','on');
set(handles.text2,'Visible','on');
set(handles.text3,'Visible','on');
set(handles.text4,'Visible','on');
set(handles.pushbutton1,'String','Loading');

load 2_FeatureData_4.mat net;
channelID=345318;
writeAPIKey='EEM26AWICOINYFI6';
thingSpeakAuthenticate(channelID, 'ReadKey', 'ZY8RBMCZHTKCVSDA', 'WriteKey', 'EEM26AWICOINYFI6');
tic;
timet=0;
po=1029;
Stringnum=strings(po,1);
detection=0;
k=0;
while 1
    k=k+1;
    if(get(handles.pushbutton_quit,'UserData')==5)
    format shortg
    c = clock;
    
    uiwait(msgbox('Thank you for using the program press ok to proceed','Exit')); %Ending statement of program
    close('all');
    break;
    end
    remote_control(s);
    if(k==1)
    axes(handles.main_axis)
    line1 = area(0,0,'LineStyle','none');
    line1.FaceColor = [0 0 0];
    hold on;
    line2 = area(0,0,'LineStyle','none');
    line2.FaceColor = [0.75 1 0.75];
    line3 = area(0,0,'LineStyle','none');
    line3.FaceColor = [0 1 1];
    line4 = area(0,0,'LineStyle','none');
    line4.FaceColor = [0 0.25 0.25];
    line5 = area(0,0,'LineStyle','none');
    line5.FaceColor = [1 0.25 0.25];
    x11= get(line1, 'xData');
    y11= get(line1, 'yData');
    x12= get(line2, 'xData');
    y12= get(line2, 'yData');
    x13= get(line3, 'xData');
    y13= get(line3, 'yData');
    x14= get(line4, 'xData');
    y14= get(line4, 'yData');
    x15= get(line5, 'xData');
    y15= get(line5, 'yData');
    end
    while(~strcmp('Starting',fscanf(s,'%s')))
    end
    for l=1:po
        Stringnum(l,1)=fscanf(s,'%s');
    end
    Feature=featuresExtractor(Stringnum,1);
    [~,yfit] = max(net(Feature')); 
    detection=[detection yfit];
    switch(yfit) 
        case 1
        y1=Feature(1,1);
        y2=0;
        y3=0;
        y4=0;
        y5=Feature(1,1);
        string_text='Lamp One';
        case 2
        y1=Feature(1,1);
        y2=0;
        y3=0;
        y4=Feature(1,1);
        y5=0;
         string_text='Lamp Two';
        case 3
        y1=Feature(1,1);
        y2=Feature(1,1);
        y3=0;
        y4=0;
        y5=0;
        string_text='Blender';
        case 4
        y1=Feature(1,1);
        y2=0;
        y3=Feature(1,1);
        y4=0;
        y5=0;       
        string_text='Floodlight';
        case 5
        y1=Feature(1,1);
        y2=0;
        y3=0;
        y4=0;
        y5=0;       
        string_text='No Load';
        otherwise
    end
    set(handles.detection_string,'String',string_text);
    timet=toc+timet;
    if(y1>=500)
        y1=0;
        y2=0;
        y3=0;
        y4=0;
        y5=0;
    end
    x11=[x11 timet];
    y11=[y11 y1];
    x12=[x12 timet];
    y12=[y12 y2];
    x13=[x13 timet];
    y13=[y13 y3]; 
    x14=[x14 timet];
    y14=[y14 y4];
    x15=[x15 timet];
    y15=[y15 y5];
     if(k<=1)
      y15(1,:)=0;
      y14(1,:)=0;
      y13(1,:)=0;
      y12(1,:)=0;
      y11(1,:)=0;
    end
    tic;
    if(k==1)
    delete(handles.welcomtxt);
    delete(handles.text4);
    delete(handles.text3);
    delete(handles.text2);
    delete(handles.text1);
    delete(handles.pushbutton1);
    set(handles.detection_string,'Visible','on');
    set(handles.pushbutton_quit,'Visible','on');
    set(handles.main_axis,'Visible','on');
    set(handles.main_axis,'XColor','w','YColor','w');
    set(handles.axes_highlight,'Visible','on');
    set(handles.axes_highlight,'XColor','none','YColor','none');
    set(handles.axes_highlightl,'Visible','on');
    set(handles.axes_highlightl,'XColor','none','YColor','none');
    end
    set(line1, 'xData', x11, 'yData', y11);
    set(line2, 'xData', x12, 'yData', y12);
    set(line3, 'xData', x13, 'yData', y13);
    set(line4, 'xData', x14, 'yData', y14);
    set(line5, 'xData', x15, 'yData', y15);
    set(handles.main_axis,'XColor','w','YColor','w');
    xlabel('Time (Seconds)','FontWeight','bold','Color','w','BackgroundColor','k','FontName','Times New Roman','FontSize',16);
    ylabel('Power Consumed (W)','FontWeight','bold','Color','w','BackgroundColor','k','FontName','Times New Roman','FontSize',16);
    title('Non-Intrusive Load Monitoring System','FontWeight','bold','Color','w','BackgroundColor','k','FontName','Times New Roman','FontSize',16);
    legend('Collective Load Profile','Blender','Floodlight','Lamp_{Two}','Lamp_{One}');
    load_data=[y1 y5 y4 y2 y3 0 0];
    thingSpeakWrite(channelID, load_data, 'WriteKey', writeAPIKey);
    pause(20);
end




% --- Executes on button press in pushbutton_quit.
function pushbutton_quit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
fclose(s);
Signal = 5; %Assigns the value 2 to Accelerator variable
set(handles.pushbutton_quit,'UserData',Signal); %saves the value in the 'UserData' property of button
