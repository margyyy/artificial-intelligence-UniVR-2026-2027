#import "@preview/colorful-boxes:1.4.3"
#set page(
  paper: "a4",
  numbering: "1"
)
#set heading(numbering: "1.1")
#set text(
  size: 10pt,
)

#outline()
#pagebreak()




= Che cos'è l'intelligenza artificiale

- Nasce negli anni 50 con Alan Turing con il *Turing Test*
- 1996 *Deep Blue* per giocare a scacchi
- 2026 *Generative AI*

=== The imitation gaming

"Propongo di prendere in considerazione la domanda: «Le macchine possono pensare?». Si dovrebbe iniziare definendo il significato dei termini «macchina» e «pensare». Le definizioni potrebbero essere formulate in modo da riflettere, per quanto possibile, l’uso comune delle parole; tuttavia, questo atteggiamento è pericoloso. Se il significato delle parole «macchina» e «pensare» deve essere ricavato esaminando il modo in cui vengono comunemente usate, è difficile sottrarsi alla conclusione che.. ""


=== Artificial Intelligence 
Nel 1956 fecero un progetto per capire se si potevano sviluppare dei sistemi per risolvere problemi più complessi in ambito umano
e qui si usa per la prima volta il termine "Artificial Intelligence"

=== AI oggi

Robocup 2026
#image("assets/image.png")

#pagebreak()

= Che cos'è il machine learning

La programmazione permette ai calcolatori di risolvere task, mentre il machine learning insegna ai calcolatori
come risolvere gli stessi medesimi problemi ma in modo autonomo.

*Perche il machine learning è tanto usato?* \
Grazie alla raccolta dei dati negli ultimi anni usare tecniche di ML per risolvere problemi è diventato molto più facile.

=== Tre famiglie principali

#image("assets/image-1.png")

- *Non supervisionato* : non diamo informazioni al calcolatore se non solo la rappresentazione dei dati, la macchina decide in che modo suddividere i gruppi
- *Supervisionato* : diamo informazioni al calcolatore definendo noi in che modo descriminare i dati
- *Reinforcment learning* : un agente compie azioni nel mondo con un meccanismo di riccompense 


== Agenti intelligenti

Nella comunità che studia i sistemi ad agenti, è sorprendentemente difficile rispondere alla domanda *“che cos’è un agente?”*, proprio come nell’IA è difficile definire in modo universalmente accettato “che cos’è l’intelligenza?”.
\ \ 
Il termine agent viene usato molto, anche da ricercatori di aree molto vicine, ma non esiste una definizione unica condivisa. Questo non è necessariamente un problema, perché si possono comunque costruire applicazioni utili anche senza accordarsi perfettamente sulla terminologia. \ \ Però c’è il rischio che agent diventi una parola vaga, usata in modo improprio e quindi fonte di confusione.
Per questo gli autori ritengono utile discutere il significato del termine e distinguono due modi principali di intendere “agente”: uno debole, relativamente poco controverso, e uno più forte, più discutibile.

#figure(image("assets/image-3.png", width: 50%))
#pagebreak()

Un agente è dotato di 3 caratteristiche:
- Analizza l'ambiente
- Agisce nell'ambiente
- Ha sempre un obiettivo

=== Come dovrebbe agire un Agente intelligente?
*1) Misurazione delle performance*\
L'agente valuta se l'ambiente è in grado di far raggiungere all'agente l'obiettivo
\
*2) Razionalità*\
L'agente sceglie sempre di massimizzare il valore che lo porta al raggiungimento dell'obiettivo
\
#figure(image("assets/image-4.png", width: 70%))
=== A popular framework: Markov Decision Process

Un esempio classico di agente è *Markov Decision Process* dove abbiamo:\

- *state*: Rappresentazione dell'ambiente
- *action*: Come l'agente può modificare l'ambiente
- *transition model*: Gli effetti che hanno le azione sull'ambiente

$ text("T : state, action") -> text("next state") $
- *reward*: Ricompensa immediata in risposta alla azione
$ text("R : state, action,(next state") -> text("real number") $
- *policy*: scelta delle azioni per massimare la ricompensa nel lungo termine
$ pi: text("(state)") -> text("action") $
#pagebreak()
==== Frozen Lake
#figure(image("assets/image-5.png", width: 55%))
Prendimao in considerazione gli elementi principali della catena di Markov:\
#figure(image("assets/image-6.png", width: 55%))
#pagebreak()
= Risoluzione dei problemi mediante ricerca
Con il termine *agente* ci possiamo riferire a: umani, robot, softbot, termostati ecc.. \ 
L' *agent funtion* associa a ogni possibile sequenza di percezioni un’azione da eseguire:

$ f: P^* -> A $
L'*agent program* invece viene eseguito sul calcolatore per produrre $f$

=== Esempio : Vacuum-cleaner world
#figure(image("assets/image-7.png", width: 60%))
- Perceptions: Posizione nello spazione e il contenuto [A, Dirty]
- Actions: left, right, Suck, NoOp

#figure(image("assets/image-8.png", width: 60%))

#colorful-boxes.colorbox(
  title: "Domanda",
  color: "purple",
  width: auto,
)[
  se un agent ha $|P|$ possibili perceptions, quante entries avrà l'agent function dopo $T$ passi?
]

#colorful-boxes.colorbox(
  title: "Risposta",
  color: "purple",
  width: auto,
)[
  $ sum_(t=1)^T |P|^t $
]

=== Esempio di agent program

#colorful-boxes.colorbox(
  color: "grey",
  width: auto,
)[
  function *Reflex-Vacuum-Agent([location, status])* return an action:\
  ``` if status = Dirty then return Suck ```\
  ``` else if location = A then return Right ``` \
  ``` else if location = B then return Left ``` \
]

== Razionalità
La misura di prestazione fissa valuta la sequenza dell'ambiente.\
- è possibile pulire ogni punto dell'area in tempo $T$?
- un punto per ogni casella pulita ad ogni passo $T$, meno un punto per ogni mossa?
- penalizzare per > K caselle sporche?

Un *rational agent* sceglierà qualsiasi azione che massimizzi il valore atteso della performance data la sequenza di percezioni acquisita fino a quel momento

\
Ricordiamo però che: \
*Rational $!=$ omniscent* 
- percezioni possono non fornire tutte le informazioni rilevanti

*Rational $!=$ clairvoyant*
- le azioni compiute possono non essere quelle che ci saremmo aspettati \
*Rational $!=$ successful*
- poichè $text("rational") => text("exploration, leraning, autonomy")$

#colorful-boxes.colorbox(
  title: "Esercizio",
  color: "purple",
  width: auto,
)[
  Considera il seguente ambiente:

- Ci sono *tre stanze (A, B, C)* e *due robot (r1, r2)*.
- *r1* può pattugliare le stanze *A e B*.
- *r2* può pattugliare le stanze *B e C*.
- *r1* parte dalla stanza *A*, mentre *r2* parte dalla stanza *C*.
- Il *tempo di spostamento tra le stanze è pari a zero*.

*Misura di prestazione:* minimizzare la somma dell’*idleness media* di tutte le stanze.

*Idleness media* = somma degli intervalli di tempo durante i quali la stanza *non viene visitata da nessun robot* / intervallo di tempo totale.

Quale sarebbe un *comportamento razionale* per questo ambiente?
]
#pagebreak()
=== PEAS
Per progettare un *rational agent* dobbiamo specificare il *task environment*.\
Considerando un esempio: the task of designing an automated taxi:
- *performance measure* $arrow$ safety, destination, profits, legality, comfort ...
- *environment* $arrow$ city street/freeways, traffic, pedestrains, weather ...
- *actuators* $arrow$ steering, accelerator, brake, horn, speaker/display ...
- *sensors* $arrow$ video, accelerometers, gauges, engine sensors, keyboard, GPS ...

*Il tipo di ambiente determina in larga misura la progettazione dell'agente*

#figure(image("assets/image-9.png"))

Poichè il mondo reale è ovviamente parizalmente osservabile, stocastico, sequenziale, dinamico, continuo e multi agentico

=== Tipi di problemi
- *Deterministico e completamente osservabile* $arrow$ *problema a stato singolo*
  - L'agente sa esattamente in quale stato si troverà.
  - La soluzione è una *sequenza di azioni*.

- *Non osservabile* $arrow$ *problema conformante*
  - L'agente può non avere alcuna informazione sullo stato in cui si trova.
  - La soluzione, se esiste, è una *sequenza di azioni*.

- *Non deterministico e/o parzialmente osservabile* $arrow$ *problema di contingenza*
  - Le percezioni forniscono nuove informazioni sullo stato corrente.
  - La soluzione è un *piano contingente* oppure una *policy*.
  - Spesso ricerca ed esecuzione vengono alternate.

- *Spazio degli stati sconosciuto* $arrow$ *problema di esplorazione* (*online*)

*Esempio: Vacuum world* \
#figure(image("assets/image-10.png"))

== Problem solving agents

Derivazione di un agente generale: *agenti basati su obiettivi*
- formulano un obiettivo e un problema dato uno stato corrente
- cercano una soluzione
- eseguono la soluzione *ingnorando* le percezioni

Questo a volte viene anche chiamato: *offline problem solving* $arrow$ solutions executed "eyes closed"

\

```typc
function Simple-Problem-Solving-Agent(percept) returns an action
    static: seq, an action sequence, initially empty
            state, some description of the current world state
            goal, a goal, initially null
            problem, a problem formulation

    state ← Update-State(state, percept)

    if seq is empty then
        goal ← Formulate-Goal(state)
        problem ← Formulate-Problem(state, goal)
        seq ← Search(problem)

    action ← First(seq)
    seq ← Rest(seq)

    return action
```

==== Esempio: Viaggio in Romania

#colorful-boxes.colorbox(
  title: "Esempio",
  color: "purple",
  width: auto,
)[
  On holiday in Romania; currently in Arad. \
  Flight leaves tomorrow from Bucharest\
  *Formulate goal* 
  - be in Bucharest
  *Formulate problem*
  - *states*: various cities
  - *actions*: drive between cities
  *Find Solution*:
  - sequence of cities e.g: Arad, Sibiu, Fagaras, Bucharest 
]

#figure(image("assets/image-11.png", width: 82.4%))
Un problema è definito da quattro elementi:

- stato iniziale
  - ad esempio, "ad Arad"

- funzione successore $S(x)$ = insieme di coppie azione-stato
  - ad esempio, $S(A) = {<"Arad" -> "Zerind", "Zerind">, dots}$

- test dell'obiettivo, può essere
  - esplicito, ad esempio, $x = "a Bucharest"$
  - implicito, ad esempio, $"NoDirt(x)"$

- costo del percorso (additivo)
  - ad esempio, somma delle distanze, numero di azioni eseguite, ecc.

$c(x, a, y)$ è il costo del passo, assunto essere $>= 0$

*Una soluzione è una sequenza di azioni
che porta dallo stato iniziale a uno stato obiettivo.*

Il mondo reale è assurdamente complesso poichè lo spazio degli stati deve essere astratto per risolvere il problema

- stato (astratto) = insieme di stati reali

- azione (astratta) = combinazione complessa di azioni reali

ad esempio, "Arad -> Zerind" rappresenta un insieme complesso
di possibili percorsi, deviazioni, soste, ecc.\
Per garantire la realizzabilità, qualsiasi stato reale "ad Arad"
deve poter raggiungere qualche stato reale "a Zerind"

- soluzione (astratta) = insieme di percorsi reali che sono soluzioni nel mondo reale

*Ogni azione astratta dovrebbe essere "più semplice" del problema originale!*

==== Esempio: Vacuum world state soace graph

#figure(image("assets/image-12.png"))

- *states* = screte dirt and robot location (ingore dirt amounts)
- *actions* = Left, Right, Suck, NoOp
- *goal test* = no dirt
- *path cost* = 1 per action (0 for NoOp)

==== Esempio: The 8-Puzzle

#figure(image("assets/image-13.png", width: 80%))

- *states* = integer locations of tiles (ignore intermediate potisions)
- *actions* = move blank left, right, up, down
- *goal test* = given goal state
- *path cost* = 1 per move

[Nota: soluzioni ottimali di n-Puzzle $in$ NP-hard]

==== Esempio: Three Search

#figure(image("assets/image-14.png", width: 80%))

#pagebreak()

==  Implementazione: Stati vs Nodi
Uno *stato* è la rappresentazione di una configurazione fisica
\
Un *nodo* invece è una struttura dati composta da parti di uno search tree
- parent
- action
- children
- depth
- path cost (i.e, g(x))

#figure(image("assets/image-15.png", width: 70%))
La funzione *expand* crea nuovi nodi, usano il *SuccessorFn* del problema per creare il corrispondente stato

#colorful-boxes.colorbox(
  title: "Tree Search",
  color: "grey",
  width: auto,
)[
```typc
function Tree-Search(problem, frontier) returns a solution, or failure
frontier <- Insert(Make-Node(problem.Initial-State))
while not IsEmpty(frontier) do
  node <- Pop(frontier)
  if problem.Goal-Test(node.State) then
    return node
  frontier <- InsertAll(Expand(node, problem))
end loop
return failure
```
]

\

#colorful-boxes.colorbox(
  title: "Expand",
  color: "grey",
  width: auto,
)[
```typc
function Expand(node, problem) returns a set of nodes
successors <- the empty set
for each action, result in Successor-Fn(problem, node.State) do
  s <- a new Node

  s.Parent-Node <- node
  s.Action <- action
  s.State <- result
  s.Path-Cost <- node.Path-Cost + Step-Cost(node.State, action, result)
  s.Depth <- node.Depth + 1

  add s to successors
return successors
```
]
#pagebreak()

=== Strategie di ricerca

Una strategia è definita scegliendo l'ordine di espansione dei nodi.
Le strategie vengono valutate secondo le seguenti dimensioni:

- *completezza* — permette di trovare una soluzione, se ne esiste una?
- *complessità temporale* — numero di nodi generati/espansi
- *complessità spaziale* — numero massimo di nodi mantenuti in memoria
- *ottimalità* — permette di trovare una soluzione di costo minimo?

La complessità temporale e spaziale vengono misurate in funzione di:
- $b$ — fattore di ramificazione massimo dell'albero di ricerca
- $d$ — profondità della soluzione di costo minimo
- $m$ — profondità massima dello spazio degli stati (può essere $infinity$)

*Fallire nel rilevare stati ripetuti può trasformare il problema da lineare a non lineare!*

#figure(image("assets/image-16.png"))

*Definiamo allora il problema come:* \ 
```typc
function Graph-Search(problem, frontier) returns a solution, or failure
explored <- an empty set
frontier <- Insert(Make-Node(problem.Initial-State))

while not IsEmpty(frontier) do
  node <- Pop(frontier)
  if problem.Goal-Test(node.State) then
    return node
  if node.State is not in explored then
    add node.State to explored
    frontier <- InsertAll(Expand(node, problem))
  end if
end loop

return failure
```
