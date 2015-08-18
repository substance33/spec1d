function mc_win 
%
% MATLAB scan for RESCAL.
% Windowing for scan simulations.
% Written by Alan Tennant 22.10.95
% Modified: Des McMorrow   7.11.95
% 
%  ++++++++ specifics for modifications ++++++++++++++++++++++
%
% 'Rescal: Simulation' == Control window has title/name
% 'Rescal: Simulation' == 'tag' for the control window
% 'hmc_paras'          == the handle for the input data.
%
% Called by: rescal 
% Calls  to: mc_conv
%

% ========= Set default fonts ======================

set(0,'DefaultAxesFontName','times')
set(0,'DefaultAxesFontSize',14)
set(0,'DefaultTextFontName','times')
set(0,'DefaultAxesFontSize',14)

% ========= Create control window ==================

%----- Size of window

Fpos1=100; Fposb=100; Fwidth=550; Fheight=220;

% Make sure that the program isn't running! 

if ~isempty(findobj('Tag','Rescal: Simulation'))

   error(' MC Scan Parameter window already open!')

end

% ==================================================

MC_pars=figure('Position',[Fpos1 Fposb Fwidth Fheight],...
		'NextPlot','New',...
		'Color',get(0,'DefaultUicontrolBackgroundColor'), ...
		'MenuBar','none',...
		'Name','Rescal: Simulation',...
		'NumberTitle','off',...
		'Resize','off',...
		'Tag','Rescal: Simulation',...
		'DefaultUicontrolBackgroundColor',[1 1 1],...
		'DefaultUicontrolForegroundColor',[0 0 0],...
		'DefaultUicontrolHorizontalAlignment','left',...
		'Visible','on');

% ==================================================          

Tpos1=10; Twidth=50; Theight=18; Tspacev=-25; Tspaceh=140; Tposb=Fheight-60;
Epos1=Tpos1+Twidth+5; Ewidth=60; Eheight=18; Espacev=-25; Espaceh=140;
Eposb=Fheight-60;

% ============= Q Position for scan start entered.

uicontrol(MC_pars,...
	'Style','text',...
	'String','Hstart',...
	'Position',[Tpos1 Tposb Twidth Theight]);      

hmc_paras(1)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Kstart',...
	'Position',[Tpos1+Tspaceh Tposb Twidth Theight]);      

hmc_paras(2)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Lstart',...
	'Position',[Tpos1+2*Tspaceh Tposb Twidth Theight]);      

hmc_paras(3)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+2*Espaceh Eposb Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Estart',...
	'Position',[Tpos1+3*Tspaceh Tposb Twidth Theight]);      

hmc_paras(4)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+3*Espaceh Eposb Ewidth Eheight]);

% ============= Q positions for end of scan

uicontrol(MC_pars,...
	'Style','text',...
	'String','Hend',...
	'Position',[Tpos1 Tposb+Tspacev Twidth Theight]);      

hmc_paras(5)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Kend',...
	'Position',[Tpos1+Tspaceh Tposb+Tspacev Twidth Theight]);      

hmc_paras(6)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Lend',...
	'Position',[Tpos1+2*Tspaceh Tposb+Tspacev Twidth Theight]);      

hmc_paras(7)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+2*Espaceh Eposb+Espacev Ewidth Eheight]);
                               
uicontrol(MC_pars,...
	'Style','text',...
	'String','Eend',...
	'Position',[Tpos1+3*Tspaceh Tposb+Tspacev Twidth Theight]);      

hmc_paras(8)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+3*Espaceh Eposb+Espacev Ewidth Eheight]);
                
% ================== Number of scan points & Monte Carlo events===

uicontrol(MC_pars,...
	'Style','text',...
	'String','NSC',...
	'Position',[Tpos1 Tposb+2*Tspacev Twidth Theight]);      

hmc_paras(9)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+2*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','NMC',...
	'Position',[Tpos1+Tspaceh Tposb+2*Tspacev Twidth Theight]);      

hmc_paras(10)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+2*Espacev Ewidth Eheight]);

                               
% ============== Dispersion Parameters ===============================

%----- Hzb, Kzb, Lzb

uicontrol(MC_pars,...
	'Style','text',...
	'String','Hzb',...
	'Position',[Tpos1 Tposb+3*Tspacev Twidth Theight]);      

hmc_paras(11)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+3*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Kzb',...
	'Position',[Tpos1+Tspaceh Tposb+3*Tspacev Twidth Theight]);      

hmc_paras(12)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+3*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Lzb',...
	'Position',[Tpos1+2*Tspaceh Tposb+3*Tspacev Twidth Theight]);      

hmc_paras(13)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+2*Espaceh Eposb+3*Espacev Ewidth Eheight]);
                               
uicontrol(MC_pars,...
	'Style','text',...
	'String','Egap',...
	'Position',[Tpos1+3*Tspaceh Tposb+3*Tspacev Twidth Theight]);      

hmc_paras(14)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+3*Espaceh Eposb+3*Espacev Ewidth Eheight]);

%----- Hzero, Kzero, Lzero

uicontrol(MC_pars,...
	'Style','text',...
	'String','Hzero',...
	'Position',[Tpos1 Tposb+4*Tspacev Twidth Theight]);      

hmc_paras(15)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+4*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Kzero',...
	'Position',[Tpos1+Tspaceh Tposb+4*Tspacev Twidth Theight]);      

hmc_paras(16)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+4*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Lzero',...
	'Position',[Tpos1+2*Tspaceh Tposb+4*Tspacev Twidth Theight]);      

hmc_paras(17)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+2*Espaceh Eposb+4*Espacev Ewidth Eheight]);

%----- Hphase, Kphase, Lphase

uicontrol(MC_pars,...
	'Style','text',...
	'String','Hphase',...
	'Position',[Tpos1 Tposb+5*Tspacev Twidth Theight]);      

hmc_paras(18)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+5*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Kphase',...
	'Position',[Tpos1+Tspaceh Tposb+5*Tspacev Twidth Theight]);      

hmc_paras(19)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+5*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','Lphase',...
	'Position',[Tpos1+2*Tspaceh Tposb+5*Tspacev Twidth Theight]);      

hmc_paras(20)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+2*Espaceh Eposb+5*Espacev Ewidth Eheight]);

%----- Width, T(K)                          
     
uicontrol(MC_pars,...
	'Style','text',...
	'String','Gamma',...
	'Position',[Tpos1 Tposb+6*Tspacev Twidth Theight]);      

hmc_paras(21)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1 Eposb+6*Espacev Ewidth Eheight]);

uicontrol(MC_pars,...
	'Style','text',...
	'String','T(K)',...
	'Position',[Tpos1+Tspaceh Tposb+6*Tspacev Twidth Theight]);      

hmc_paras(22)=uicontrol(MC_pars,...
	'Style','edit',...
	'Position',[Epos1+Espaceh Eposb+6*Espacev Ewidth Eheight]);

%----- Message window

uicontrol(MC_pars,...
	'Style','text',...
        'Tag','MC Message Window',...
	'Horizontalalignment','Center',...
	'Position',[Fwidth/8 Fheight-30 Fwidth*0.75 Theight]);      
                                  
%----- Save handles to parameter windows

uicontrol('Visible','off','Tag','hmc_paras','Userdata',hmc_paras)

%----- Load default simulation parameters

rc_getp('sfile','rescal.sim');
               
%========= Push button controls =======================================

        
%----------------'Exit' menu----------------------------------------
                                                                                 
hmc_win_exit=uimenu(MC_pars,'Label','Exit');
uimenu(hmc_win_exit,'Label',' Exit ', ...
                    'Callback', ['close (findobj(''Tag'',''Rescal: Simulation''));'...
                                 'close (findobj(''Tag'',''Rescal: Simulation Plot''))']);

hmc_win_pars=uimenu(MC_pars,'Label','Parameters');
uimenu(hmc_win_pars,'Label','Get parameters','Callback', 'rc_getp(''sfile'')');
uimenu(hmc_win_pars,'Label','Save parameters','Callback','rc_savp(''sfile'')');

hmc_win_run=uimenu(MC_pars,'Label','Run');
uimenu(hmc_win_run,'Label',' Run ', 'Callback', 'mc_conv'); 

                                        


