clear All
clc

A = [0 1 0 0 1 1 1;
 0 0 0 1 0 0 0;
 0 0 0 0 1 0 0;
 0 1 0 0 0 0 0;
 1 1 0 0 0 1 0;
 1 0 1 0 0 0 1;
 0 1 0 0 0 0 0];

%Problem 2
%Jump probability 0.15 with matrix A
Ranking1 = SearchEngine(A,0.15);
Rank = (1:length(Ranking1))';
Ranking1 = [Rank Ranking1];
Ranking1 = sortrows(Ranking1,2)

%Problem 3
%Jump Probabilyt 0 with matrix A
Ranking2 = SearchEngine(A,0);
Ranking2 = [Rank Ranking2];
Ranking2 = sortrows(Ranking2,2)
%As a result of the 0 drop the probbility get's lost in pages 2 & 4 which
%are a closed loop to one another. There's a 50/50 chance of being in
%either one.


%Jump Probabilyt 0.5 with matrix A
Ranking3 = SearchEngine(A,0.5);
Ranking3 = [Rank Ranking3];
Ranking3 = sortrows(Ranking3,2)
%Increasing the jump probability to 50% drops the probabilities of the
%highest ranked pages by 50% and doubles the probability of the other
%pages.


%Problem 4
%Suppose 3 wants to change its page rank and beat its competitor page 7. So
%it persuades pages 2 and 4 to display its link.
B = [0 1 0 0 1 1 1;
 0 0 1 1 0 0 0;
 0 0 0 0 1 0 0;
 0 1 1 0 0 0 0;
 1 1 0 0 0 1 0;
 1 0 1 0 0 0 1;
 0 1 0 0 0 0 0];
Ranking4 = SearchEngine(B,0.15);
Ranking4 = [Rank Ranking4];
Ranking4 = sortrows(Ranking4,2)
%3 moves right on up in the world taking rank 3 and pushing down page 4.
%Part 5 also moves up from rank 3 to rank 2.


%Problem 5
%We will now study the effects of removing page 1 from the rankings
C = [ 0 0 1 0 0 0;
 0 0 0 1 0 0;
 1 0 0 0 0 0;
 1 0 0 0 1 0;
 0 1 0 0 0 1;
 1 0 0 0 0 0];
Ranking5 = SearchEngine(C,0.15);
Rank2 = (2:(length(Ranking5)+1))';
Ranking5 = [Rank2 Ranking5];
Ranking5 = sortrows(Ranking5,2)
Ranking1

%As a result of deleting page 1. Page 3 goes up in ranking, page 7 gains
%probability but does decreases in rank. Everything else has a slight, ~2%
%decrease in rank but maintains the same order.