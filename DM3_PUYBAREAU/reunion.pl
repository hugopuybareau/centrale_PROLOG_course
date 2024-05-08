:- use_module(library(clpfd)).
% Certaines valeurs de la base de donées sont fausses car j'ai fait
% générer les valeurs mutlipliées par 60 par une IA. Les résultats
% restent tout de meme juste après vérification à la main dans le sujet.

%Base de données

disponible(jean, 540, 600).
disponible(jean, 810, 855).
disponible(jean, 2115, 2145).
disponible(jean, 2340, 2460).
disponible(jean, 3360, 3495).
disponible(jean, 5040, 5070).
disponible(jean, 6360, 6435).

disponible(marie, 600, 630).
disponible(marie, 750, 795).
disponible(marie, 2175, 2265).
disponible(marie, 2340, 2460).
disponible(marie, 3420, 3495).
disponible(marie, 4800, 5130).

disponible(pierre, 540, 690).
disponible(pierre, 750, 900).
disponible(pierre, 1980, 2100).
disponible(pierre, 2160, 2520).
disponible(pierre, 3480, 3540).
disponible(pierre, 4920, 5580).
disponible(pierre, 4800, 4920).
disponible(pierre, 5460, 5580).
disponible(pierre, 6300, 6540).

disponible(jacques, 630, 900).
disponible(jacques, 1920, 2040).
disponible(jacques, 2280, 2520).
disponible(jacques, 3360, 3780).
disponible(jacques, 4860, 4950).
disponible(jacques, 5280, 5400).
disponible(jacques, 6240, 6390).

disponible(salle, 480, 720).
disponible(salle, 2280, 2400).
disponible(salle, 3360, 3420).
disponible(salle, 5040, 5160).
disponible(salle, 6240, 6360).

%Je crée le prédicat "agenda" :

agenda_45(Personne, Debut, Fin) :-
    disponible(Personne, H1, H2),
    Debut in H1..H2,
    Fin #= Debut + 45,
    Fin #=< H2.

%Puis le prédicat qui permet de trouver le créneau

reunion(Debut, Fin) :-
    agenda_45(jean, Debut, Fin),
    agenda_45(marie, Debut, Fin),
    agenda_45(pierre, Debut, Fin),
    agenda_45(jacques, Debut, Fin),
    agenda_45(salle, Debut,Fin),
    label([Debut, Fin]).


