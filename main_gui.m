function varargout = main_gui(varargin)
% MAIN_GUI MATLAB code for main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help main_gui
 
% Last Modified by GUIDE v2.5 26-Jan-2016 00:52:47
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui_OutputFcn, ...
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
 
 
% --- Executes just before main_gui is made visible.
function main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui (see VARARGIN)
 
% Choose default command line output for main_gui
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = main_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
 
% --- Executes on selection change in menu_iir.
function menu_iir_Callback(hObject, eventdata, handles)
% hObject    handle to menu_iir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: contents = cellstr(get(hObject,'String')) returns menu_iir contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_iir
 
 
% --- Executes during object creation, after setting all properties.
function menu_iir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_iir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
 
% --- Executes on selection change in menu_fir.
function menu_fir_Callback(hObject, eventdata, handles)
% hObject    handle to menu_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: contents = cellstr(get(hObject,'String')) returns menu_fir contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_fir
 
 
% --- Executes during object creation, after setting all properties.
function menu_fir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function txt_file_Callback(hObject, eventdata, handles)
% hObject    handle to txt_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of txt_file as text
%        str2double(get(hObject,'String')) returns contents of txt_file as a double
 
 
% --- Executes during object creation, after setting all properties.
function txt_file_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
% --- Executes on button press in btn_browse.
function btn_browse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%get input file name
global FS_input;
[filename,filepath] = uigetfile('*.wav','Select the wave file');
filename = strcat(filepath,filename);
set(handles.txt_file,'string',filename);
if(~isempty(filename))
    set(handles.menu_display,'value',1);
    [y,Fs] = wavread(filename);
    FS_input = Fs;
    set(handles.txt_fs,'string',Fs);
end
changeOutput(handles);              %calc the new output signal
 
% --- Executes on button press in btn_play.
function btn_play_Callback(hObject, eventdata, handles)
% hObject    handle to btn_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%calc the output signal after play butting is pressed
changeOutput(handles);              
global output2 output1 Fs;
wavplay(output1,Fs,'async');        %play output signal (with gain)
 
% --- Executes on button press in btn_stop.
function btn_stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear playsnd;                      %stop the output signal
 
% --- Executes on button press in btn_save.
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile;    %get the selected file name and path
global output1 Fs;
wavWrite(output1,Fs,strcat(PathName,FileName)); %store output in a wav file
 
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);          
 
 
 
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
 
 
% --- Executes on button press in btn_zeroall.
% set all gain values to zero
function btn_zeroall_Callback(hObject, eventdata, handles)
% hObject    handle to btn_zeroall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1,'value',0);
set(handles.slider2,'value',0);
set(handles.slider3,'value',0);
set(handles.slider4,'value',0);
set(handles.slider5,'value',0);
set(handles.slider6,'value',0);
set(handles.slider7,'value',0);
set(handles.slider8,'value',0);
set(handles.slider9,'value',0);
changeOutput(handles);
 
% --- Executes on button press in btn_maxall.
%set all gain values to 20
function btn_maxall_Callback(hObject, eventdata, handles)
% hObject    handle to btn_maxall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1,'value',20);
set(handles.slider2,'value',20);
set(handles.slider3,'value',20);
set(handles.slider4,'value',20);
set(handles.slider5,'value',20);
set(handles.slider6,'value',20);
set(handles.slider7,'value',20);
set(handles.slider8,'value',20);
set(handles.slider9,'value',20);
changeOutput(handles);
 
% --- Executes on button press in btn_lowall.
%set all gain values to -20
function btn_lowall_Callback(hObject, eventdata, handles)
% hObject    handle to btn_lowall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1,'value',-20);
set(handles.slider2,'value',-20);
set(handles.slider3,'value',-20);
set(handles.slider4,'value',-20);
set(handles.slider5,'value',-20);
set(handles.slider6,'value',-20);
set(handles.slider7,'value',-20);
set(handles.slider8,'value',-20);
set(handles.slider9,'value',-20);
changeOutput(handles);
% --- Executes during object creation, after setting all properties.
function label_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
 
% --- Executes on selection change in menu_display.
function menu_display_Callback(hObject, eventdata, handles)
% hObject    handle to menu_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: contents = cellstr(get(hObject,'String')) returns menu_display contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_display
changeOutput(handles);
 
% --- Executes during object creation, after setting all properties.
function menu_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
% --- Executes when selected object is changed in panel_filters.
% choose the type of filters if IIR or FIR
% also chooses the the type of FIR filter
function panel_filters_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_filters 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.radio_iir,'value') == get(handles.radio_iir,'max'))
    set(handles.menu_iir,'enable','on');
    set(handles.menu_fir,'enable','off');
end
if(get(handles.radio_fir,'value') == get(handles.radio_fir,'max'))
    set(handles.menu_iir,'enable','off');
    set(handles.menu_fir,'enable','on');
end
%change the output to match the chosen filter
changeOutput(handles);
 
 
%this functions is responsible for changing the output signal according to
%the gain of the sliders and the chosen filter.
function changeOutput(handles)
 
%order of the chosen filter
N =26;
%The sampling frequency entered by the user.
global Fs;
Fs = str2num(get(handles.txt_fs,'string'));
fileName =get(handles.txt_file,'string');
global output1 output2 arr_global FS_input;
%checks if there's no input signal.
if(~isempty(fileName))
    input = wavread(fileName);
    %a vector to store the bands of frequency for each of the 9 filters
    cutOff =[170 310 600 1000 3000 6000 12000 14000 16000];
    %a vector to stor the sliders handlers
    sliders = [ handles.slider2 handles.slider3 handles.slider4 handles.slider5 handles.slider6 handles.slider7 handles.slider8 handles.slider9];
    %checks if iir filter is chosen
    if(get(handles.radio_iir,'value') == get(handles.radio_iir,'max'))
        hd  = fdesign.lowpass('N,F3dB', N, 170,Fs );
        h = design(hd,'butter');        %gets the impulse response of the desired iir filter
        f= filter(h , input);           %gets the output signal from the filter with impulse resoponse (h) and input (input)
        %stores the output f in global variables output1 (after multiplying it with the gain) and output 2
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        %stores the output of the low path filter.
        arr_response{1} = f;
        %similir to the above section but with the band filters from 2 to 9
        %we store the output from each filter and add it to the output 
        %signal output1 and output2, 
        for i=1:8
            hd = fdesign.bandpass('N,F3dB1,F3dB2', N,cutOff(i) , cutOff(i+1), Fs);
            h = design(hd,'butter');
            f= filter(h,input);
            arr_response{i+1} = f;
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
 
    end
    %checks if FIR filter was chosen
    if(get(handles.radio_fir,'value') == get(handles.radio_fir,'max'))
      %get the id of the type of FIR fiter.
      choice = get(handles.menu_fir,'value'); 
      if(choice == 1)
        %if choice is 1 the equiripple FIR filter is chosen
        %first design the low path filter and similar to IIR filter we
        %adjust the output signal and store it with gain and without it
        %calculate the coef of the filter.
        h  = firpm(N, [0 170 171 Fs/2]/(Fs/2), [1 1 0 0], [1 1], {20});
        f= filter(h ,1, input);
        %stores the output f in global variables output1 (after multiplying it with the gain) and output 2
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        arr_response{1} = f;        
        for i=1:8
           %similir to the above section but with the band filters from 2 to 9
           %we store the output from each filter and add it to the output 
           %signal output1 and output2 
           %calculate the coef of the filter.
            h = firpm(N, [0 cutOff(i) cutOff(i)+1 cutOff(i+1) cutOff(i+1)+1 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [1 1 1], {20});
            f= filter(h ,1, input);
            arr_response{i+1} = f;
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
      end
      if(choice == 2)
        %if the choice is 2 the FIR chosen is least square
        %create a low path least square filter with 170 pass frequency and
        %171 stop freq, and weight stop and pass equal to 1.
        %calculate the coef of the desired filter.
        h  = firls(N, [0 170 171 Fs/2]/(Fs/2), [1 1 0 0], [1 1]);
        %get the output of the low path filter and store it
        f= filter(h ,1, input);
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        arr_response{1} = f;        
        for i=1:8
            %calculate the coef of desired filter for each one of the 8 band filters.
            h = firls(N, [0  cutOff(i) cutOff(i)+1 cutOff(i+1) cutOff(i+1)+1 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [1 1 1]);       
            %get the output of the low path filter and store it
            f= filter(h ,1, input);
            arr_response{i+1} = f;            
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
 
      end
      if(choice == 3)
        %if the choice is 3 the FIR chosen is window of type rectangular
        %create a low path window of type rectangular filter with 170 pass frequency and
        %171 stop freq, and weight stop and pass equal to 1.
        %calculate the coef of the desired filter.
        win = rectwin(N+1);
        flag = 'scale';
 
        h  = fir1(N, 170/(Fs/2), 'low', win, flag);
        f= filter(h ,1, input);
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        arr_response{1} = f;        
        for i=1:8
            %calculate the coef of desired filter for each one of the 8
            %band filters.
            h = fir1(N, [cutOff(i) cutOff(i+1)]/(Fs/2), 'bandpass', win, flag);
            f= filter(h ,1, input);
            arr_response{i+1} = f;            
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
 
      end
      if(choice == 4)
        %if the choice is 4 the FIR chosen is window of type chebychev
        %create a low path window of type chebychev filter with 170 pass frequency and
        %171 stop freq, and weight stop and pass equal to 1.
        %calculate the coef of the desired filter.
        SidelobeAtten = 100;
        win = chebwin(N+1, SidelobeAtten);
        flag = 'scale';
        h  = fir1(N, 170/(Fs/2), 'low', win, flag);
        f= filter(h ,1, input);
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        arr_response{1} = f;        
        for i=1:8
            %calculate the coef of desired filter for each one of the 8
            %band filters.
            h = fir1(N, [cutOff(i) cutOff(i+1)]/(Fs/2), 'bandpass', win, flag);
            f= filter(h ,1, input);
            arr_response{i+1} = f;            
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
 
      end
      if(choice == 5)
        %if the choice is 4 the FIR chosen is window of type Hamming
        %create a low path window of type Hamming filter with 170 pass frequency and
        %171 stop freq, and weight stop and pass equal to 1.
        %calculate the coef of the desired filter.
        win = hamming(N+1 );
        flag = 'scale';
        h  = fir1(N, 170/(Fs/2), 'low', win, flag);
        f= filter(h ,1, input);
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f;
        arr_response{1} = f;        
        for i=1:8
            %calculate the coef of desired filter for each one of the 8
            %band filters.
            h = fir1(N, [cutOff(i) cutOff(i+1)]/(Fs/2), 'bandpass', win, flag);
            f= filter(h ,1, input);
            arr_response{i+1} = f;            
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
        end
        %%global equal part
        arr_global = arr_response;
 
      end
      if(choice == 6)
         %if the choice is 4 the FIR chosen is window of type Hamming
        %create a low path window of type Hamming filter with 170 pass frequency and
        %171 stop freq, and weight stop and pass equal to 1.
        %calculate the coef of the desired filter.
        win = blackmanharris(N+1);
        flag = 'scale';
        h  = fir1(N, 170/(Fs/2), 'low', win, flag);
        f= filter(h ,1, input);
        output1 = f * 10^(get(handles.slider1 ,'value')/20);
        output2 = f ;
        arr_response{1} = f;        
        for i=1:8
            %calculate the coef of desired filter for each one of the 8
            %band filters.
            h = fir1(N, [cutOff(i) cutOff(i+1)]/(Fs/2), 'bandpass', win, flag);
            f= filter(h ,1, input);
            output1 = output1 + f * (10^(get(sliders(i) ,'value')/20));
            output2 = output2 + f;
            arr_response{i+1} = f;            
        end
        %%global equal part
        arr_global = arr_response;
 
      end
    end
    %%plot part
    if(get(handles.menu_display,'value')== 3)
        %plot output with gains
        plot_in_gui(handles,output1,Fs);
    end
    if(get(handles.menu_display,'value')== 2)
        %plot output without gains
       plot_in_gui(handles,output2,Fs);
    end
    if(get(handles.menu_display,'value')== 1)
        %plot input without modification
        plot_in_gui(handles,input,FS_input);
    end
 
    drawnow;
end
 
function txt_fs_Callback(hObject, eventdata, handles)
% hObject    handle to txt_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of txt_fs as text
%        str2double(get(hObject,'String')) returns contents of txt_fs as a double
changeOutput(handles);
 
 
% --- Executes during object creation, after setting all properties.
function txt_fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
% --- Executes on key press with focus on btn_maxall and none of its controls.
function btn_maxall_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btn_maxall (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
 
 
% --- Executes on button press in btn_plots.
function btn_plots_Callback(hObject, eventdata, handles)
% hObject    handle to btn_plots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plots_gui;
%-------plots sound 
function plot_in_gui(handles,output,Fs)
Nsamps = length(output);
t = (1/Fs)*(1:Nsamps);          %Prepare time data for plot
 
axes(handles.axes_time);
plot(t, output);
xlim([0 1/Fs*Nsamps]);
 
axes(handles.axes_mag);
%y_fft = abs(fftshift(fft(output)));            %Retain Magnitude
y_fft = fft(output);
y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
%f = Fs*(0:Nsamps-1)/Nsamps*2;
 
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot
plot(f, abs(y_fft));
xlim([0 20000]);