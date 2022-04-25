#### Concepto de problema de satisfacción de restricciones (CSP, Constraint Satisfaction Problem)

Representado como una tupla con 3 elementos:

* $X$: Conjunto de variables
* $D$: Conjunto de dominios para $X$
* $C$: Conjunto de restricciones sobre $X$

Las restricciones se leen con AND, es decir, se deben cumplir todas. En términos generales <u>es preferible un menor número de restricciones</u>, para minimizar el árbol de búsqueda que funciona por debajo.

---

#### Concepto de problema de optimización de restricciones (COP, Constraint Optimization Problem)

Representado como una tupla con 4 elementos:

* $<X,D,C>$ como en CSP
* $f$ es una función de coste sobre $X$ a minimizar/maximizar

---

#### Técnicas de resolución

* Constraint Programing: Paradigma general para cualquier CSP
* Más que no nos interesan.

##### Diferencias

* **Codificación del problema**

El algoritmo y la heurística serán transparentes a nosotros en esta práctica.

* Algoritmos para resolver el problema. Todos aplican alguna variante de algún método de búsqueda
  * Heurística usada por el algoritmo de búsqueda

EN LA PRÁCTICA 1 USAR CODIFICACIÓN DE ENTEROS.

