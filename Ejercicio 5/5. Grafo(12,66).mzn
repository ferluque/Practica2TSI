% % -----------------seed( 0 )-------------------
% int: NUM_NODOS = 12 ;
% int: NUM_ARISTAS = 66 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|6 , 1 |4 , 12 |4 , 8 |10 , 4 |6 , 3 |5 , 8 |7 , 9 |9 , 11 |2 , 7 |8 , 9 |2 , 6 |10 , 9 |10 , 5 |4 , 1 |4 , 6 |1 , 3 |4 , 9 |2 , 4 |4 , 8 |1 , 2 |10 , 1 |11 , 5 |8 , 4 |12 , 3 |8 , 3 |1 , 5 |6 , 7 |9 , 5 |2 , 5 |10 , 11 |11 , 9 |2 , 8 |10 , 4 |7 , 8 |12 , 3 |12 , 1 |4 , 6 |10 , 11 |5 , 12 |5 , 7 |5 , 4 |5 , 9 |5 , 4 |11 , 8 |6 , 1 |2 , 6 |10 , 4 |1 , 6 |1 , 2 |3 , 5 |3 , 1 |4 , 3 |11 , 1 |8 , 6 |10 , 1 |11 , 3 |12 , 11 |8 , 12 |3 , 10 |3 , 4 |12 , 4 |3 , 4 |5 , 2 |3 , 12 |10 , 11 |2 , 5 |];

% % -----------------seed( 1 )-------------------
% int: NUM_NODOS = 12 ;
% int: NUM_ARISTAS = 66 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|6 , 12 |9 , 10 |12 , 6 |1 , 2 |8 , 7 |10 , 3 |5 , 6 |3 , 5 |12 , 11 |3 , 5 |8 , 10 |2 , 8 |1 , 7 |10 , 8 |7 , 10 |2 , 1 |2 , 9 |9 , 4 |11 , 10 |9 , 8 |4 , 7 |6 , 2 |10 , 4 |5 , 9 |2 , 12 |11 , 5 |1 , 4 |10 , 3 |1 , 5 |10 , 3 |8 , 11 |10 , 9 |7 , 10 |4 , 8 |8 , 5 |12 , 6 |10 , 4 |7 , 9 |1 , 3 |11 , 8 |8 , 10 |8 , 4 |11 , 1 |9 , 8 |8 , 2 |2 , 4 |1 , 9 |7 , 5 |6 , 7 |3 , 12 |6 , 12 |8 , 9 |12 , 5 |5 , 8 |8 , 5 |10 , 1 |3 , 1 |11 , 8 |2 , 8 |10 , 9 |11 , 5 |1 , 2 |10 , 9 |3 , 4 |2 , 3 |8 , 3 |];

% % -----------------seed( 2 )-------------------
int: NUM_NODOS = 12 ;
int: NUM_ARISTAS = 66 ;
array[1..NUM_ARISTAS,1..2] of int: aristas =[|9 , 7 |12 , 3 |12 , 9 |8 , 3 |2 , 12 |6 , 11 |5 , 6 |8 , 4 |7 , 5 |11 , 12 |4 , 8 |7 , 11 |2 , 11 |4 , 6 |9 , 5 |7 , 4 |10 , 3 |1 , 5 |3 , 5 |11 , 2 |8 , 9 |3 , 11 |10 , 9 |8 , 2 |7 , 9 |11 , 6 |10 , 11 |4 , 1 |12 , 1 |11 , 3 |9 , 11 |9 , 3 |10 , 7 |6 , 7 |7 , 4 |9 , 3 |2 , 5 |9 , 2 |7 , 10 |6 , 2 |3 , 5 |11 , 8 |7 , 12 |5 , 6 |11 , 9 |11 , 4 |12 , 1 |1 , 6 |8 , 12 |6 , 12 |1 , 9 |7 , 11 |6 , 12 |2 , 11 |8 , 12 |5 , 4 |7 , 12 |2 , 5 |11 , 12 |1 , 9 |11 , 6 |5 , 12 |3 , 10 |8 , 2 |10 , 3 |2 , 12 |];

array[1..NUM_ARISTAS] of var int : colores;

constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if not ((aristas[i,1]==aristas[j,1] /\ aristas[i,2]==aristas[j,2]) \/ 
      (aristas[i,1]==aristas[j,2] /\ aristas[i,2]==aristas[j,1])) then
        forall(k in 1..2) (
          if aristas[i,1]==aristas[j,k] \/ aristas[i,2]==aristas[j,k] then
            colores[i] != colores[j]
          endif
        )
      endif
    )
  ); 
  
constraint forall(i in colores)(colores[i]>0);
% Aristas repetidas (i,j)(i,j)
constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if aristas[i,1]==aristas[j,1] /\ aristas[i,2]==aristas[j,2] then
        colores[i] == colores[j]
      endif
    )
  );
% Aristas repetidas (i,j) (j,i)
constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if aristas[i,1]==aristas[j,2] /\ aristas[i,2]==aristas[j,1] then
        colores[i] == colores[j]
      endif
    )
  );

solve minimize max(colores); 
        
output["colores={"];
output[show(colores[i])++"," | i in 1..NUM_ARISTAS];
output["}"];
output["\n" ++ "Cantidad de colores: " ++ show(max(colores))];
