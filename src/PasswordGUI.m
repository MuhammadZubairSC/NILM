%Author:Muhammad Zubair SC
%Title: NILM

function varargout = PasswordGUI(varargin)
% PASSWORDGUI MATLAB code for PasswordGUI.fig
%      PASSWORDGUI, by itself, creates a new PASSWORDGUI or raises the existing
%      singleton*.
%
%      H = PASSWORDGUI returns the handle to a new PASSWORDGUI or the handle to
%      the existing singleton*.
%
%      PASSWORDGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PASSWORDGUI.M with the given input arguments.
%
%      PASSWORDGUI('Property','Value',...) creates a new PASSWORDGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PasswordGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PasswordGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PasswordGUI

% Last Modified by GUIDE v2.5 21-Jun-2017 23:48:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PasswordGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PasswordGUI_OutputFcn, ...
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


% --- Executes just before PasswordGUI is made visible.
function PasswordGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PasswordGUI (see VARARGIN)

% Choose default command line output for PasswordGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PasswordGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PasswordGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_proceed.
function pushbutton_proceed_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pass_word=get(handles.password,'UserData');
Response_1=strcmp(pass_word,'1234');
Response_2=strcmp(pass_word,'4567');
DataT=fopen('Secure.txt','r');
DataSR=fscanf(DataT,'%d',[1 1]);
fclose(DataT);
if(DataSR==444)
    [Input3,fs]=audioread('Wrong Password.wav');
    sound(Input3,fs);
    pause(1/4);
    set(handles.indicator,'BackgroundCOlor',[1 0 0]);
    set(handles.pushbutton_proceed,'Enable','off');
    set(handles.password,'Enable','off');
    set(handles.indicator,'String','Access Denied! Contact Administration');
    uiwait(msgbox('Due to Unauthorised Access to NILM, Your System  has been Blocked!')); 
    hold_value=EmailGPS(3);
    close('all');
else

if(Response_1==1)
    [Input3,fs]=audioread('PasswordAccept.mp3');
    sound(Input3,fs);
    pause(1/4);
    DataSW=fopen('Secure.txt','w');
    fprintf(DataSW,'');
    fclose(DataSW); 
    set(handles.indicator,'BackgroundCOlor',[0 0.5 0]);
    set(handles.indicator,'String','Password Accepted!');
    hold_value=EmailGPS(1);
    uiwait(msgbox('Opening Access to NILM!'));
    close(gcbf);
    NILM();
elseif(Response_2==1)
    [Input3,fs]=audioread('PasswordAccept.mp3');
    sound(Input3,fs);
    pause(1/4);
    DataSW=fopen('Secure.txt','w');
    fprintf(DataSW,'');
    fclose(DataSW); 
    set(handles.indicator,'BackgroundCOlor',[0 0.5 0]);
    set(handles.indicator,'String','Password Accepted!');
    hold_value=EmailGPS(2);
    uiwait(msgbox('Opening Access to NILM!'));
    close(gcbf);
    NILM();    
else
   [Input2,fs]=audioread('Try Again.wav');
    sound(Input2,fs);
    pause(1/3);
    set(handles.indicator,'BackgroundCOlor',[1 0 0]);
    set(handles.indicator,'String','Wrong Password! Please Try Again');
    DataT=fopen('Secure.txt','r');
    DataSR=fscanf(DataT,'%d',[1 1]);
    fclose(DataT);
    if(DataSR==4)
    DataSW=fopen('Secure.txt','w');
    fprintf(DataSW,'44');
    fclose(DataSW);
    elseif(DataSR==44)
    
    DataSW=fopen('Secure.txt','w');
    fprintf(DataSW,'444');
    fclose(DataSW); 
    else
    DataSW=fopen('Secure.txt','w');
    fprintf(DataSW,'4');
    fclose(DataSW); 
    end
    
end
end





function password_Callback(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of password as text
%        str2double(get(hObject,'String')) returns contents of password as a double

pass_word= get(handles.password,'String');

set(handles.password,'UserData',pass_word); 
set(handles.password,'String','');

% --- Executes during object creation, after setting all properties.
function password_CreateFcn(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
