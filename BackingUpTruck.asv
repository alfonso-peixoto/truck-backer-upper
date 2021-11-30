%
% Exemplo para a máquina de lavar-roupas.
%

clc; clear;

%  %
%  % Desenhar superfície
%  %
%  x=linspace(0,100,31);
%  phi=linspace(-90,270,41);
%  for i=1:length(x)
%      for j=1:length(phi);
%          y(i,j)=DetermineTheta(x(i),phi(j));
%      end
%  end
%  
%  surf(phi,x,y);
%  xlabel('phi');
%  ylabel('x');
%  zlabel('theta');
%  print -depsc surftruck.eps

% Simulacao;
Entrada(:,1)=input('Informe [Posicao x, Posição y, Angulo Phi]:');

% Deslocamento;
d=1;
it_max=1000;
ind=1;
while ((Entrada(2,ind)<=99)&&(ind<=it_max))
	Entrada(3,ind+1)=Entrada(3,ind)+DetermineTheta(Entrada(1,ind),Entrada(3,ind));
	Entrada(1, ...
        ind+1)=Entrada(1,ind)+d*cos(Entrada(3,ind+1)*pi/180);
	Entrada(2,ind+1)=Entrada(2,ind)+d*sin(Entrada(3,ind+1)*pi/180);
	ind=ind+1;
end

figure(1);
plot(Entrada(1,:),Entrada(2,:),'s');
axis([0 100 0 100]);
xlabel('x'); ylabel('y'); grid;

