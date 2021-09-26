%Author:Muhammad Zubair SC
%Title: NILM

% readmail and do online control
%% Format control_command control_position and if turn off all than say off all
% Possible commands
% OFF Lamp1
% ON Lamp1
% OFF Lamp2
% ON Lamp2
% OFF Blender
% ON Blender
% OFF Floodlight
% ON Floodlight
% OFF All
function remote_control(s)
reademail;
logical_control=strcmp(subject,'Change State');
if(logical_control==1)
flag_num=123456789;
flag_1=num2str(flag_num);
flag_1(9)='X';
[Control_command,byproduct]=strtok(body,' ');
[Control_position,byproduct]=strtok(byproduct,' ');
Control_position=strtok(Control_position);
switch(Control_position)
    case {'Lamp1','lamp1'}
        switch(Control_command)
            case {'OFF','off'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(5));
            case {'ON','on'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(1));
            otherwise;
        end
    case {'Lamp2','lamp2'}
         switch(Control_command)
            case {'OFF','off'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(6));
            case {'ON','on'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(2));
             otherwise;
         end
    case {'Blender','blender'}
         switch(Control_command)
            case {'OFF','off'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(7));
            case {'ON','on'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(3));
             otherwise;
         end
    case {'Floodlight','floodlight'}
         switch(Control_command)
            case {'OFF','off'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(8));
            case {'ON','on'}
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(4));
             otherwise;
         end
    case {'All','all'}
        if(strcmp(Control_command,'OFF')||strcmp(Control_command,'Off'))
                fprintf(s,'Z');
                m=0;
                while(~strcmp('Waiting',fscanf(s,'%s')))
                m=m+1;
                if(m>=1030)
                fprintf(s,'Z');
                end
                end
                fprintf(s,flag_1(9));
        end
    otherwise;
end
end