people([carry(ber,_,_),carry(gina,_,_),carry(rachel,_,_),carry(trisha,_,_)]).
answer(X) :- people(X),
        member(carry(I,22,J),X),
	member(carry(K,L,green),X),
        member(carry(M,24,N),X),
	member(carry(rachel,A,white),X),
        member(carry(gina,B,C),X),
        member(carry(ber,D,blue),X), B is D+4,
        member(carry(trisha,E,F),X),
        member(carry(G,20,H),X), H=red;H=white.
	
