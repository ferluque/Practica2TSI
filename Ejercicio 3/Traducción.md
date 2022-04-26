| Característica\Casa | 1       | 2    | 3    | 4    | 5    |
| ------------------- | ------- | ---- | ---- | ---- | ---- |
| Región              | Andaluz |      |      |      |      |
| Profesión           |         |      |      |      |      |
| Animal              |         |      |      |      |      |
| Bebida              |         |      |      |      |      |
| Color casa          |         | Azul |      |      |      |

| Característica\Codificación | 1       | 2        | 3           | 4          | 5        |
| --------------------------- | ------- | -------- | ----------- | ---------- | -------- |
| Región                      | Andaluz | Vasco    | Catalán     | Gallego    | Navarro  |
| Profesión                   | pintor  | escultor | diplomático | violinista | médico   |
| Animal                      | perro   | zorro    | caballo     | caracoles  |          |
| Bebida                      | te      | café     | leche       | zumo       |          |
| Color casa                  | rojo    | azul     | blanca      | verde      | amarilla |

a. Si region[i]=Vasco(2): color[i]=rojo(1)

b. Si region[i]=Catalan(3): ma  scota[i]=perro(1)

c. Si region[i]=Gallego(4):profesion[i]=pintor(1)

d. Si region[i]=Navarro(5):bebida[i]=te(1)

e. region[1]=Andaluz(1)

f. Si color[i]=Verde(4): bebida[i]=cafe(2)

g. Si color[i]=Blanca(3): color[i+1]=Verde(4)

h. Si profesion[i]=Escultor(2): animal[i]=caracoles(4)

i. Si profesion[i]=Diplomatico(3): color[i]=5

j. bebida[3]=leche(3)

k. Si region[i]=Andaluz(1): color[i-1]=Azul(2) o color[i+1]=Azul(2)

l. Si profesion[i]=Violinista(4): bebida[i]=zumo(4)

m. Si profesion[i]=Medico(5): animal[i-1]=zorro(2) o animal[i+1]=zorro(2)

n. Si profesion[i]=Diplomatico(3): animal[i-1]=caballo(3) o animal[i+1])=caballo(3)