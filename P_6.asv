clc; clearvars; close all;

% global Cost

A=perms(1:6);

A(:,6)=[];

C=ones(720,1);
D=ones(720,1)*2;
E=ones(720,1)*3;
F=ones(720,1)*4;
G=ones(720,1)*5;
H=ones(720,1)*6;

Nodes=[A C;A D;A E;A F;A G;A H];

Distance=[0 66 94 64 132 124; 66 0 36 54 70 145; 94 36 0 52 72 140; 64 54 52 0 118 92; 132 70 72 118 0 209; 124 145 140 92 209 0];

Cost1=zeros(length(Nodes),length(Nodes));
Cost=sparse(Cost1);

 for x=1:length(Nodes)
     for y=1:4
         Cost(x,y*720+x)=Distance(Nodes(x,6),Nodes(x,y+1));
%           if Nodes(x,6)==Nodes(x,y)
               if Nodes(x,y)~=1
                   target=Nodes(x,:);
                   target(1,6)=1;
                   target(1,y)=1;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,1);
               elseif Nodes(x,y)~=2
                   target=Nodes(x,:);
                   target(1,6)=2;
                   target(1,y)=2;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,2);
               elseif Nodes(x,y)~=3
                   target=Nodes(x,:);
                   target(1,6)=3;
                   target(1,y)=3;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,3);
               elseif Nodes(x,y)~=4
                   target=Nodes(x,:);
                   target(1,6)=4;
                   target(1,y)=4;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,4);
               elseif Nodes(x,y)~=5
                   target=Nodes(x,:);
                   target(1,6)=5;
                   target(1,y)=5;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,5);
               elseif Nodes(x,y)~=6
                   target=Nodes(x,:);
                   target(1,6 )=6;
                   target(1,y)=6;
                   Cost(x,find(ismember(Nodes,target,'rows')))=Distance(y,6);
               %figure out how to find empty bin
               end
    %   end
     end
 end
 
 
 
 size(Cost)