function [H]=funcionCaracteristicaDuctos(k, Q, NPSH)
	if length(Q)>1
		H=k*Q.^2+NPSH; 
	else
		H=k*Q^2+NPSH;
	end	
end