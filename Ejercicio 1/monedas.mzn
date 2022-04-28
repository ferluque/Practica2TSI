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
% Una cantidad de una moneda no puede ser mayor que la cantidad a alcanzar dividida entre
% el valor de esa moneda (si tenemos que llegar a 199 centimos, no puede haber más de 199 monedas de 1 cent, ni 100 de 2 cent...
constraint forall(i in INDICES)(cantidades[i]<=(alcanzar div VALORES[i])+1);

% Quitar la parte entera (apartado b)
constraint
  % Si tenemos entre 1 euro y 2 solo 1 moneda de 1 euro
  if alcanzar>100 /\ alcanzar<200 then
    cantidades[7]==1
  else
    % Si tenemos mas de 2 euros
    if alcanzar>200 then
      % Tantas monedas de 2 euros como quepan
      cantidades[8]==(alcanzar div VALORES[8]) /\
      % Y tantas de 1euro como sobren (si hay euros impares)
      cantidades[7]==(alcanzar mod VALORES[8]) div VALORES[7]
    endif
  endif;

% Indica que es un CSP (podría ser un COP)
solve minimize sum(cantidades);
% solve satisfy;
% Definición del output
output[show(cantidades[i])++" monedas de "++show(VALORES[i])++" céntimos\n" | i in INDICEScents];
output[show(cantidades[i])++" monedas de "++show(VALORES[i]/100)++" €\n" | i in 7..8];
