padrede('victor','alejandro').
padrede('victor','nicolay').
padrede('victor','ada').
padrede('victor','andrey').
padrede('victor','angelo').
padrede('victor','jonathan').
padrede('carmen','alejandro').
padrede('carmen','nicolay').
padrede('carmen','ada').
padrede('carmen','andrey').
padrede('carmen','angelo').
padrede('carmen','jonathan').
padrede('alejandro','paola').
padrede('alejandro','diego').
padrede('marcela','paola').
padrede('marcela','diego').
padrede('ada','isabella').
padrede('ada','victoria').
padrede('jose','isabella').
padrede('jose','victoria').
padrede('angelo','josue').
padrede('angelo','marcelo').
padrede('yanine','josue').
padrede('yanine','marcelo').
padrede('jonathan','leonardo').
padrede('deyo','leonardo').
padrede('ana','guillermo').
padrede('ana','alejo').
padrede('ana','juan').
padrede('ana','patricia').
padrede('ana','mauricio').
padrede('ana','marcela').
padrede('guillermo','luis').
padrede('angeles','luis').
padrede('juan','laura').
padrede('juan','angela').
padrede('juan','sebastian').
padrede('helena','laura').
padrede('helena','angela').
padrede('yesika','sebastian').
padrede('mauricio','andres').
padrede('mauricio','nicolas').
padrede('mauricio','paula').
padrede('andrea','andres').
padrede('janeth','nicolas').
padrede('janeth','paula').
padrede('patricia','daniela').

hombre('victor').
hombre('alejandro').
hombre('nicolay').
hombre('andrey').
hombre('angelo').
hombre('jonathan').
hombre('diego').
hombre('jose').
hombre('marcelo').
hombre('leonardo').
hombre('guillermo').
hombre('alejo').
hombre('juan').
hombre('mauricio').
hombre('luis').
hombre('sebastian').
hombre('sebastian').
hombre('andres').
hombre('nicolas').
hombre('nicolas').

mujer('carmen').
mujer('paola').
mujer('yanine').
mujer('deyo').
mujer('marcela').
mujer('isabella').
mujer('victoria').
mujer('ana').
mujer('patricia').
mujer('angeles').
mujer('laura').
mujer('angela').
mujer('helena').
mujer('laura').
mujer('angela').
mujer('yesika').
mujer('paula').
mujer('andrea').
mujer('janeth').
mujer('paula').
mujer('ada').

hijode(A,B) :- padrede(B,A),hombre(A).
hijade(A,B) :- padrede(B,A),mujer(A).

madrede(A,B) :- padrede(A,B), mujer(A).

abuelode(A,B) :- padrede(A,C), padrede(C,B), hombre(A); padrede(A,C), madrede(C,B), hombre(A).
abuelade(A,B) :- madrede(A,C), padrede(C,B); madrede(A,C), madrede(C,B).

hermanode(A,B) :- padrede(C,A), padrede(C,B), A \== B, hombre(A).
hermanade(A,B) :- padrede(C,A), padrede(C,B), A \== B, mujer(A).

nietode(A,B) :- abuelode(B,A), hombre(A); abuelade(B,A), hombre(A).
nietade(A,B) :- abuelode(B,A), mujer(A); abuelade(B,A), mujer(A).

tiode(A,B) :- padrede(C,B), hermanode(A,C), hombre(A); madrede(C,B), hermanode(A,C), hombre(A).
tiade(A,B) :- padrede(C,B), hermanade(A,C), mujer(B); madrede(C,B), hermanade(A,C), mujer(B).

sobrinode(A,B) :- tiode(B,A), hombre(A); tiade(B,A), hombre(A).
sobrinade(A,B) :- tiode(B,A), mujer(A); tiade(B,A), mujer(A).

primode(A,B) :- tiode(C,A), padrede(C,B), hombre(A); tiode(C,A), madrede(C,B), hombre(A); tiade(C,A), padrede(C,B), hombre(A); tiade(C,A), madrede(C,B), hombre(A).
primade(A,B) :- tiode(C,A), padrede(C,B), mujer(A); tiode(C,A), madrede(C,B), mujer(A); tiade(C,A), padrede(C,B), mujer(A); tiade(C,A), madrede(C,B), mujer(A).

familiarde(A,B) :- padrede(A,B); hijode(A,B); hijade(A,B); tiode(A,B); tiade(A,B); hermanode(A,B); hermanade(A,B); abuelade(A,B); abuelode(A,B); nietode(A,B); nietade(A,B); primade(A,B); primode(A,B); sobrinade(A,B); sobrinode(A,B).

cunadode(A,B) :- parejade(A,C), hermanode(C,B), hombre(A).
cunadade(A,B) :- parejade(A,C), hermanode(C,B), mujer(A).

suegrode(A,B) :- padrede(A,C), parejade(C,B), hombre(A).
suegrade(A,B) :- padrede(A,C), parejade(C,B), mujer(A). 

padres(R,M) :- findall(Y,padrede(Y,R),M).

parejade(A,B) :- padrede(A,C), padrede(B,C), A \== B.
esfeliz(X) :- parejade(X,_).

familiares(A, B) :- 
    findall(Y, familiarde(A, Y), B).


