function varargout = plots_gui(varargin)
% PLOTS_GUI MATLAB code for plots_gui.fig
%      PLOTS_GUI, by itself, creates a new PLOTS_GUI or raises the existing
%      singleton*.
%
%      H = PLOTS_GUI returns the handle to a new PLOTS_GUI or the handle to
%      the existing singleton*.
%
%      PLOTS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTS_GUI.M with the given input arguments.
%
%      PLOTS_GUI('Property','Value',...) creates a new PLOTS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plots_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plots_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plots_gui

% Last Modified by GUIDE v2.5 26-Jan-2016 19:52:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plots_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @plots_gui_OutputFcn, ...
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


% --- Executes just before plots_gui is made visible.
function plots_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plots_gui (see VARARGIN)

% Choose default command line output for plots_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plots_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plots_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu_band.
function menu_band_Callback(hObject, eventdata, handles)
% hObject    handle to menu_band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_band contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_band
global Fs arr_global ;
if(isempty(arr_global))
    return;
end
if(get(hObject,'value') == 10)
    output = arr_global{1};
    for i = 2:9
        output = output + arr_global{i};
    end
	plot_in_gui2(handles,output,Fs);
else   
    plot_in_gui2(handles,arr_global{get(hObject,'value')},Fs);
end

% --- Executes during object creation, after setting all properties.
function menu_band_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_imp.
function check_imp_Callback(hObject, eventdata, handles)
% hObject    handle to check_imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_imp

%-------plots sound 
function plot_in_gui2(handles,output,Fs)
Nsamps = length(output);
t = (1/Fs)*(1:Nsamps);          %Prepare time data for plot

axes(handles.axes1);
plot(t, output);
xlim([0 1/Fs*Nsamps]);

%frequency response
%y_fft_pure = fft(output);
y_fft = fft(output);
%%y_fft = fftshift(y_fft_pure);
%f = Fs*(0:Nsamps-1)/Nsamps*2;
y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot
%magnitude
axes(handles.axes2);

plot(f, abs(y_fft));
%%xlim([0 max(y_fft)]);
xlim([0 20000]);
%angle
axes(handles.axes3);
y_fft = angle(y_fft);
plot(f, y_fft);
%%xlim([0 max(y_fft)]);
xlim([0 20000]);
