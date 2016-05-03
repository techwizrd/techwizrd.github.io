clear All
clc
A = [
0 1 0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 1 0 1 0 1 0 0 0 0 0 0 0 0;
0 1 0 0 0 1 0 1 0 0 0 0 0 0 0;
0 0 1 0 0 0 0 0 0 0 0 1 0 0 0;
1 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
0 0 0 1 0 0 0 0 0 0 1 0 0 0 0;
0 0 0 0 1 1 0 0 0 1 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
0 0 0 0 0 0 1 1 0 0 1 0 0 0 0;
0 0 0 0 0 0 0 0 1 0 0 0 0 1 0;
0 0 0 0 0 0 0 0 0 1 1 0 1 0 1;
0 0 0 0 0 0 0 0 0 0 0 1 0 1 0];
Ranking = SearchEngine(A,0.15);
Rank = (1:length(Ranking))';
Ranking = [Rank Ranking];
Ranking = sortrows(Ranking,2)