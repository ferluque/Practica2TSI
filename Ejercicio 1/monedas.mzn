% Use this editor as a MiniZinc scratch book
% Definición de variables:
set of int: INDICEScents = 1..6;
set of int: INDICES = 1..8;
array [INDICES] of var int: cantidades;
array [INDICES] of var int: VALORES = {1,2,5,10,20,50,100,200};
int : alcanzar;
% Definición de restricciones:
% la suma debe ser igual que alcanzar
constraint cantidades[1]+cantidades[2]*2+cantidades[3]*5+cantidades[4]*10+cantidades[5]*20+cantidades[6]*50+cantidades[7]*100+cantidades[8]*200 == alcanzar;
% las cantidades deben ser mayores que 0
constraint forall(c in cantidades)(c>=0);
% ES BUENA IDEA RESTRINGIR LA BÚSQUEDA MÁS

% Indica que es un CSP (podría ser un COP)
% solve minimize sum(cantidades);
solve satisfy;
% Definición del output
output[show(cantidades[i])++" monedas de "++show(VALORES[i])++" céntimos\n" | i in INDICEScents];
output[show(cantidades[i])++" monedas de "++show(VALORES[i]/100)++" €\n" | i in 7..8];
