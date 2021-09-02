%Larson
function E = shoreA_to_youngs_modulus(S)
	% E = F/A / (dL/L)
	E = 1e6*10.^(0.0235*S - 0.6403);
end


