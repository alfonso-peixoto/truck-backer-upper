% Função para determiner o ângulo theta
function theta_value=DetermineTheta(x_value,y_value,phi_value)

PosicaoX=[-10,0,10, 35
    	   30,45,45,65
	       60,70,70,80
	       75,80,80,85
	       80,90,100,110];

PosicaoY=[-10, 0,20,45
 	       40,60,60,75
	       70,80,80,90
	       85,95,95,105
	       100,105,110,115];

Phi=[ -95,-45, 9
       -9, 23,54
       36, 63,90
       72,90,108
       90,117,144
      126,157,189
      171,225,275];

Theta=[-45,-30,-15
       -25,-15, -5
       -12, -6,  0
       - 5,  0,  5
         0,  6, 12
         5, 15, 25
        15, 30, 45];

Rules=[6 5 6 5 6
       5 2 5 5 6
       2 1 5 5 5
       1 1 1 4 5     %B1
       1 1 1 3 3 
       1 1 7 1 3
       2 1 7 7 2
       
       6 5 6 5 7
       5 5 5 5 7
       2 2 5 5 7
       1 1 1 4 6     %B2
       1 1 1 3 3
       1 1 7 1 3
       2 1 7 7 2
       
       6 5 6 5 7
       5 5 5 5 7
       2 2 5 5 7
       1 1 1 4 7     %B3
       1 1 1 3 6
       1 1 7 2 6
       2 1 7 1 2
       
       5 6 4 7 1
       4 4 4 6 1
       2 1 4 5 1
       1 1 1 4 5     %B4
       7 7 1 3 3
       7 7 7 2 2
       6 7 6 1 1
       
       4 4 6 7 1
       4 4 5 6 1
       2 2 5 5 1
       1 1 1 4 6      %B5
       1 1 1 3 5
       7 7 7 2 2
       6 7 6 1 1]';
   
t=linspace(-30,30,61);  
mftheta=zeros(size(t));
for i=1:size(PosicaoX,1);
  for j=1:size(PosicaoY,1);
      for k=1:size(Phi,1);
         w=min(TRAP(x_value,PosicaoX(i,:)),TRI(phi_value,Phi(k,:)));
         w=min(w,TRAP(y_value,PosicaoY(j,:)));            
         mftheta=max(mftheta,min(w,TRI(t,Theta(Rules(i,k),:))));
      end
  end
end

% Defuzzificacao;
theta_value=sum(t.*mftheta)/sum(mftheta);

%[95,5,45]
%[97,5,45]
%[97,5,270]
%[10,10,45]
%[85,15,-90]
%[10,50,-90]
%[10,10,-90]
