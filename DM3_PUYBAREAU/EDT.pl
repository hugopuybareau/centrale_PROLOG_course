:- use_module(library(clpfd)).

emploi_du_temps(Session) :-
    Session = [A, B, C, D, E, F, G, H, I, J, K],
    Session ins 1..4,
%Car 11 sessions pour 12 créneaux au total
%dans 3 salles différentes (3x4=12)
    dif(A,J),
    dif(J,I),
    dif(I,E),
    dif(E,C),
    dif(C,F),
    dif(F,G),
    dif(D,H),
    dif(B,D),
    dif(K,E),

    all_different([B, I, H, G]),
    all_different([A, G, E]),
    all_different([B, H, K]),
    all_different([A, B, C, H]),
    all_different([D, F, J]),

    J #> E,
    K #> D,
    K #> F,

    label(Session).
