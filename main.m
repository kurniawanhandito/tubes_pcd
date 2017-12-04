function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
% 
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 04-Dec-2017 09:23:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_OpeningFcn, ...
    'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_browse.
function btn_browse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.*'},'Pilih Gambar');
fullpathname=strcat(pathname,filename);
img=imread(fullpathname);
imshow(img,'Parent',handles.div_image);
% set resolution
resolution=fn_resolution(img);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_save.
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
[filename,pathname]=uiputfile({'*.jpg','jpg'},'Save Image as JPG');
imwrite(img,fullfile(pathname, filename),'jpg');

% --- Executes on button press in btn_crop.
function btn_crop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
x1=str2num(get(handles.txt_x1,'String'));
y1=str2num(get(handles.txt_y1,'String'));
width=str2num(get(handles.txt_w,'String'));
height=str2num(get(handles.txt_h,'String'));
imshow(img,'Parent',handles.div_image);
hold on;
rectangle('Position',[x1 y1 width height],'LineWidth',1,'LineStyle','--','EdgeColor', 'b');
rect=[x1 y1 width height];
imgCrop=imcrop(img,rect);
figure, imshow(imgCrop); title('Cropped Image');
% set resolution
resolution=fn_resolution(imgCrop);
set(handles.txt_resolution,'String',resolution);

function txt_zoom_Callback(hObject, eventdata, handles)
% hObject    handle to txt_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_zoom as text
%        str2double(get(hObject,'String')) returns contents of txt_zoom as a double

% --- Executes during object creation, after setting all properties.
function txt_zoom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_zoom_in.
function btn_zoom_in_Callback(hObject, eventdata, handles)
% hObject    handle to btn_zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
times=str2num(get(handles.txt_zoom,'String'));
imgZoom=fn_zoomIn(img,times);
% imshow(imgZoom,'Parent',handles.div_image);
figure, imshow(imgZoom); title('Zoom in Image');
% set resolution
resolution=fn_resolution(imgZoom);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_zoom_out.
function btn_zoom_out_Callback(hObject, eventdata, handles)
% hObject    handle to btn_zoom_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
times=str2num(get(handles.txt_zoom,'String'));
imgZoom=fn_zoomOut(img,times);
% imshow(imgZoom,'Parent',handles.div_image);
figure, imshow(imgZoom); title('Zoom out Image');
% set resolution
resolution=fn_resolution(imgZoom);
set(handles.txt_resolution,'String',resolution);

function txt_resolution_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resolution as text
%        str2double(get(hObject,'String')) returns contents of txt_resolution as a double

% --- Executes during object creation, after setting all properties.
function txt_resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_flip_vertical.
function btn_flip_vertical_Callback(hObject, eventdata, handles)
% hObject    handle to btn_flip_vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
imgFlip=fn_flipV(img);
imshow(imgFlip,'Parent',handles.div_image);
% set resolution
resolution=fn_resolution(imgFlip);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_flip_horizontal.
function btn_flip_horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to btn_flip_horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
imgFlip=fn_flipH(img);
imshow(imgFlip,'Parent',handles.div_image);
% set resolution
resolution=fn_resolution(imgFlip);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_rotate_90.
function btn_rotate_90_Callback(hObject, eventdata, handles)
% hObject    handle to btn_rotate_90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
imgRotate=fn_rotate90(img);
imshow(imgRotate,'Parent',handles.div_image);
% set resolution
resolution=fn_resolution(imgRotate);
set(handles.txt_resolution,'String',resolution);

function txt_degree_Callback(hObject, eventdata, handles)
% hObject    handle to txt_degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_degree as text
%        str2double(get(hObject,'String')) returns contents of txt_degree as a double


% --- Executes during object creation, after setting all properties.
function txt_degree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_rotate.
function btn_rotate_Callback(hObject, eventdata, handles)
% hObject    handle to btn_rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
degree=str2num(get(handles.txt_degree,'String'));
imgRotate=fn_rotate(img,degree);
% imshow(imgRotate,'Parent',handles.div_image);
figure, imshow(imgRotate); title('Image Rotated');
% set resolution
resolution=fn_resolution(imgRotate);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_hist_show.
function btn_hist_show_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hist_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
fn_hist(img);

% --- Executes on button press in btn_hist_eq.
function btn_hist_eq_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hist_eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getimage(handles.div_image);
imgEq=fn_hist_eq(img);
% imshow(imgEq,'Parent',handles.div_image);
figure, imshow(imgEq); title('Histogram Equalization Result');
% set resolution
resolution=fn_resolution(imgEq);
set(handles.txt_resolution,'String',resolution);

% --- Executes on button press in btn_hist_spec.
function btn_hist_spec_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hist_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function txt_hist_spec_Callback(hObject, eventdata, handles)
% hObject    handle to txt_hist_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_hist_spec as text
%        str2double(get(hObject,'String')) returns contents of txt_hist_spec as a double


% --- Executes during object creation, after setting all properties.
function txt_hist_spec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_hist_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_modus.
function btn_modus_Callback(hObject, eventdata, handles)
% hObject    handle to btn_modus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_median.
function btn_median_Callback(hObject, eventdata, handles)
% hObject    handle to btn_median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_mean.
function btn_mean_Callback(hObject, eventdata, handles)
% hObject    handle to btn_mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txt_x1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_x1 as text
%        str2double(get(hObject,'String')) returns contents of txt_x1 as a double


% --- Executes during object creation, after setting all properties.
function txt_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_y1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_y1 as text
%        str2double(get(hObject,'String')) returns contents of txt_y1 as a double


% --- Executes during object creation, after setting all properties.
function txt_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_w_Callback(hObject, eventdata, handles)
% hObject    handle to txt_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_w as text
%        str2double(get(hObject,'String')) returns contents of txt_w as a double


% --- Executes during object creation, after setting all properties.
function txt_w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_h_Callback(hObject, eventdata, handles)
% hObject    handle to txt_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_h as text
%        str2double(get(hObject,'String')) returns contents of txt_h as a double


% --- Executes during object creation, after setting all properties.
function txt_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
