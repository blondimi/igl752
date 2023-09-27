dtmc

formula n  = (r + p + c);       // Nombre d'agents
formula m  = ((n * (n-1)) / 2); // Nombre d'interactions entre les agents
formula mr = ((r * (r-1)) / 2); // Nombre d'interactions entre les agents de type roche
formula mp = ((p * (p-1)) / 2); // Nombre d'interactions entre les agents de type papier
formula mc = ((c * (c-1)) / 2); // Nombre d'interactions entre les agents de type ciseau

module systeme
	r : [0..4] init 2; // Nombre d'agents de type roche
	p : [0..4] init 1; // Nombre d'agents de type papier
	c : [0..4] init 1; // Nombre d'agents de type ciseau

	[] (n = 4) -> ((r * p) / m) : (r' = r - 1) & (p' = p + 1) +
                      ((r * c) / m) : (c' = c - 1) & (r' = r + 1) +
                      ((p * c) / m) : (p' = p - 1) & (c' = c + 1) +
                      ((mr + mp + mc) / m) : (r' = r) & (p' = p) & (c' = c);
endmodule

// Propositions atomiques
label "roche"  = (p = 0) & (c = 0);
label "papier" = (r = 0) & (c = 0);
label "ciseau" = (r = 0) & (p = 0);

// Requêtes
//  P=?  [ F "roche" ]
//  P=?  [ F "papier" ]
//  P=?  [ F "ciseau" ]
