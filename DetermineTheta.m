function theta_value=DetermineTheta(x_value,phi_value)

%
% Funçao que determine o angulo theta do problema backing-up a truck.
%

Posicao=[-10,0,10,35
 	30,40,40,50
	45,50,50,55
	50,60,60,70
	65,90,100,110];
%  
%  % Gerar gráfico da posição;
%  t=linspace(0,100,101);
%  for i=1:5
%    Pvalues(:,i)=TRAP(t,Posicao(i,:))';
%  end
%  plot(t,Pvalues,'linewidth',4);
%  axis([0 100 0 1.1]);
%  text(0,1.05,'X1');
%  text(40,1.05,'X2');
%  text(50,1.05,'X3');
%  text(60,1.05,'X4');
%  text(90,1.05,'X5');
%  grid;
%  print -depsc mfposicao.eps
    
Phi=[ -95,-45,9
  -9,23,54
  36,63,90
  72,90,108
  90,117,144
  126,157,189
  171,225,275];

%  % Gerar gráfico do angulo phi;
%  t=linspace(-90,270,361);
%  for i=1:7
%    Phivalues(:,i)=TRI(t,Phi(i,:))';
%  end
%  plot(t,Phivalues,'linewidth',4);
%  axis([-90 270 0 1.1]);
%  text(-45,1.05,'Phi1');
%  text(23,1.05,'Phi2');
%  text(63,1.05,'Phi3');
%  text(90,1.05,'Phi4');
%  text(117,1.05,'Phi5');
%  text(157,1.05,'Phi6');
%  text(225,1.05,'Phi7');
%  grid;
%  print -depsc mfphi.eps    

Theta=[-45,-30,-15
  -25,-15,-5
  -12,-6,0
  -5,0,5
  0,6,12
  5,15,25
  15,30,45];

%  % Gerar gráfico do angulo theta;
%  t=linspace(-30,30,61);
%  for i=1:7
%    Thetavalues(:,i)=TRI(t,Theta(i,:))';
%  end
%  plot(t,Thetavalues,'linewidth',4);
%  axis([-30 30 0 1.1]);
%  text(-30,1.05,'T1');
%  text(-15,1.05,'T2');
%  text(-6,1.05,'T3');
%  text(0,1.05,'T4');
%  text(6,1.05,'T5');
%  text(15,1.05,'T6');
%  text(25,1.05,'T7');
%  grid;
%  print -depsc mftheta.eps    

Rules=[5 5 6 6 6
  5 5 6 6 7
  3 3 4 4 4
  3 3 3 5 6
  2 2 3 3 3
  2 2 4 6 6
  2 2 3 3 3]';

%{
Rules=[5 6 6 7 7
  3 5 6 7 7
  2 3 5 6 7
  2 2 4 6 6
  1 2 3 5 6
  1 1 2 3 5
  1 1 2 2 3]';
%}

t=linspace(-30,30,61);  
mftheta=zeros(size(t));
for i=1:size(Posicao,1);
  for j=1:size(Phi,1);
    w=min(TRAP(x_value,Posicao(i,:)),TRI(phi_value,Phi(j,:)));
    mftheta=max(mftheta,min(w,TRI(t,Theta(Rules(i,j),:))));
  end
end

% Defuzzificacao;
theta_value=sum(t.*mftheta)/sum(mftheta);