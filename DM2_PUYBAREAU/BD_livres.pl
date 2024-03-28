% BD. des livres
:- use_module(library(clpfd)).


livres(auteur('Victor', 'Hugo'), [('Juliette Drouet',  32), ('Notre Dame de Paris', 45), ('Les Miserables', 35),
                                            ('Quatre Vingt Treize', 24), ('Feuilles d automne', 30), ('Les Contemplations', 25)]).
livres(auteur('Leo', 'Ferre'), [('Testament Phonographe', 25), ('La bourse', 25), ('Benoit Misere', 30)]).
livres(auteur('Max', 'Weber'), [('Economie et Societe', 24), ('Le savant et le Politique', 29), ('Theorie de la science', 34), ('La bourse', 25)]).
livres(auteur('Blaise', 'Pascal'), [('Pensees', 25), ('De l esprit Geometrique', 45)]).
livres(auteur('Confucius', 'Confucius'), [('Confucius', 35), ('La morale', 30), ('Les entretiens', 25)]).
livres(auteur('Jacques', 'Lacan'), [('D un autre � l autre', 30), ('Mon enseignement', 50)]).
livres(auteur('Sigmund', 'Freud'), [('Sur le r�ve', 30), ('Totem et Tabou', 25), ('M�taPsycologie', 40)]).
livres(auteur('Michel', 'Foucault'), [('Surveiller et punir', 34), ('Histoire de la folie', 25), ('L ordre du discours', 35)]).
livres(auteur('Jacques', 'Derrida'), [('Feu la cendre', 30), ('M�moire d aveugle' , 20), ('Voiles', 25 ) , ('Demeure' , 35), ('Position', 20) ]).
livres(auteur('Michel', 'Serres'), [('Atlas, Philosophie des reseaux', 30), ('Tiers Instruit', 25)]).
livres(auteur('Simone', 'Weil'), [('Pensees', 30), ('Attente de Dieu', 20), ('La Condition Ouvriere', 35) , ('Cahiers', 25)]).
livres(auteur('Simone', 'De Beauvoir'), [('La Force des Choses', 35), ('L Invitee', 22), ('Les Mandarins', 35) , ('Tout Compte Fait', 20)]).
livres(auteur('Honore', 'de BALZAC'), [('La bourse', 35), ('Adieu', 32),('Episode sous la terreur', 30)]).
livres(auteur('Enki', 'Bilal'), [('Le Monstre - RDV a Paris', 15), ('Quatre', 13), ('Hors jeu', 14)]).

% --------------------------------------------------------------------------------------------------------------

% Trouver et afficher les livres d'un auteur dont le prix est inférieur à un certain prix
livre_prix_min(Prenom, Nom, Prix) :-
    livres(auteur(Prenom, Nom), Livres),
    filtrer_livres_prix_inf(Livres, Prix, Resultats),
    afficher_livres(Resultats).

% Filtrer les livres dont le prix est inférieur à Prix
filtrer_livres_prix_inf([], _, []).
filtrer_livres_prix_inf([(Titre, P)|Reste], Prix, [Titre|Filtres]) :-
    P < Prix,
    filtrer_livres_prix_inf(Reste, Prix, Filtres).
filtrer_livres_prix_inf([(_, P)|Reste], Prix, Filtres) :-
    P >= Prix,
    filtrer_livres_prix_inf(Reste, Prix, Filtres).

% Afficher les titres des livres filtrés
afficher_livres([]).
afficher_livres([Titre|Reste]) :-
    write(Titre), nl,
    afficher_livres(Reste).
