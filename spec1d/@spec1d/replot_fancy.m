function [hout,hbout]=replot_fancy(varargin)
%
% function plot(varargin)
%
% SPEC1D/PLOT Plot for spectra
%
% Usage: 1. Simple plot or overlay of spectra: >> plot(s1,s2,s3)
%                                              >> plot(s1,10.*s2)
%        2. Possibility to choose axes type:   >> plot(s1,'semilogy')
%                                              >> plot(s1,'semilogx')
%                                              >> plot(s1,'loglog')
%
% Tags:  Data window: s1d_DataWindow 
%
% DFM 2.10.98

% HMR 21.5.99 Outputs handle to markers and to errorbars (if asked for).
%CK May 2008

r.x=[];r.y=[];r.e=[];

%----- Draw data window !!!must exist


oldvarargin=varargin;
varargin={};

for i=1:length(oldvarargin)
   if isa(oldvarargin{i},'spec1d')
     for n=1:length(oldvarargin{i})
       varargin{end+1}=oldvarargin{i}(n);
     end
   else
       varargin{end+1}=oldvarargin{i};   
   end  
end

colororder=[0 0 1; 0 1 0; 1 0 0; 0 0 0; 1 0 1; 0 1 1];
markerorder=str2mat('o','square','diamond','^','>','<','p');
lineorder=strvcat('-','--',':','-.');

hout=[];
hbout=[];
for i=1:length(varargin)

   if isa(varargin{i},'spec1d')
    
%----- Plot graph and error bars

      x=varargin{i}.x; y=varargin{i}.y; err=varargin{i}.e; yfit=varargin{i}.yfit;
      x=x(:); y=y(:); err=err(:); yfit=yfit(:);
     
      if ~isempty(yfit); 
%         hlf=line(x,yfit,'color',colororder(1+mod(i-1,6),:),...
          hlf=line(x,yfit,'color','r',...
                  'LineStyle','-','LineWidth',2,'Marker','none');
         
      end
%----- build up nan-separated vector for bars
      %%%%CK markersize, tee as big as
      unts=get(gca,'units');
      set(gca,'units','points')
      Xl=get(gca,'Xlim');
      Yl=get(gca,'Ylim');
      axespos=get(gca,'Position');
      set(gca,'units',unts);
      dXdp=diff(Xl)/axespos(3);
      dYdp=diff(Yl)/axespos(4);
      %markers=axespos(3)/10;    
      markers=7 %CK fixed markersize in points
      tee=dXdp*markers/2;
      %%%
      
      ytop = (y + err)';
      ybot = (y - err)';
      
      %ytopm = (y+dYdp*markers/2)';%CK errorbars not inside marker
      %ybotm = (y-dYdp*markers/2)';%CK
      ytopm = y';%CK
      ybotm = y';%CK
      
      %tee = (max(x)-min(x))/100;  % make tee .02 x-distance for error bars
      %tee=1.5*tee;
      
      %tee = 0;
      xleft = (x-tee)';
      xright = (x+tee)';
      nnan=NaN*ones(size(x'));

      %xb=[xleft; xright; nnan; x'; x'; nnan; xleft; xright; nnan];
      %yb=[ybot; ybot; nnan; ybot; ytop; nnan; ytop; ytop; nnan];
      %n=9*size(xb,2);
      %%%%Ck
      xb=[xleft; xright; nnan; x'; x'; nnan; x'; x'; nnan; xleft; xright; nnan];
      yb=[ybot; ybot; nnan; ybot; ybotm; nnan; ytopm; ytop; nnan; ytop; ytop; nnan];
      n=12*size(xb,2);
      %%%%CK
      
      xb=reshape(xb,n,1);
      yb=reshape(yb,n,1);
      
      
   
%----- Draw lines
   
      hle=line(xb,yb,'color',[.5 .5 .5],'linewidth',1,'Color',colororder(1+mod(i-1,6),:));
      %set(hle,'ButtonDownFcn','editline(gco);');
      hll=line(x,y,'color',colororder(1+mod(i-1,6),:),...
         'LineStyle','None','Marker',deblank(markerorder(1+mod(i-1,7),:)),...
         'MarkerSize',markers,'MarkerFaceColor',colororder(1+mod(i-1,6),:));
      if mod(i,2)==0
         set(hll,'markerfacecolor','none')
%         set(hll,'markerfacecolor','w')
      end
   

   end
   hout=[hout;hll];   
   hbout=[hbout;hle];   
end

