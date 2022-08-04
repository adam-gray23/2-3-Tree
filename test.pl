/*(tree(3, nil, nil)).
(tree(3, 10, nil, nil, nil)).
(tree(3, 10, nil, tree(6, nil, nil), nil)).*/
/* height(tree(5,10,tree(3,tree(1,nil,nil),nil),nil,tree(15,nil,nil)), 3) */

/* member base cases */

/* base case for two node */
member(X, tree(X, nil, nil)) :- !.
/* base cases for a 3 node */
member(X, tree(X, _, _, _, _)):- !.
member(X, tree(_, X, _, _, _)):- !.

/* find if number is node in a 2 node tree */

/* if given number X and tree with head and left branch */
/* if X is less than the head (could be on left branch) */
/* recursively call member to search on left branch for X */
member(X, tree(H, L, _)) :- H > X, member(X, L).
/* if given number X and tree with head and right branch */
/* if X is greater than the head (could be on right branch) */
/* recursively call member to search on right branch for X */
member(X, tree(H, _, R)) :- H < X, member(X, R).

/* find if number is node in a 3 node tree */

/* if given number X and tree with 2 heads and Left branch */
/* if X less boths heads, recursively call member to search */
/* for X on Left branch */
member(X, tree(H1, H2, L, _, _)) :- H1 > X, H2 > X, member(X, L).
/* if given number X and tree with 2 heads and Middle branch */
/* if X greater than Head1 and less than Head2, recursively */
/* call member to search for X on Middle branch */
member(X, tree(H1, H2, _, M, _)) :- H1 < X, H2 > X, member(X, M).
/* if given number X and tree with 2 heads and Right branch */
/* if X greater than both Heads, recursively */
/* call member to search for X on Right branch */
member(X, tree(H1, H2, _, _, R)) :- H1 < X, H2 < X, member(X, R).


/* base case for height */

height(nil, 0).

/* two node height */
/* given a tree with any root and a left and right branch, and a height*/
/* get the height of the left and right branches */
/* if the height of either left or right branch + 1 is equal to N, return true */
height(tree(_, L, R), N) :- height(L, L_Num), height(R, R_Num), N is max(L_Num, R_Num) + 1.

/* three node height */
/* given tree with two heads, and a left, middle and right branch, and a height */
/* same to two node height, get the height of left and right branch, as well as middle branch */
/* A is max height of left and middle, and if N is same as the max of A and right branch, return true */
height(tree(_, _, L, M, R), N) :- height(L, L_Num), height(M, M_Num), height(R, R_Num), A is max(L_Num, M_Num), N is max(A, R_Num) + 1.


/* add base cases */

/* for empty tree */
add(X, nil, tree(X,nil,nil)):- !.

/* making a two node tree a 3 node tree */
add(X, tree(H, _, _), tree(X, H, _, _, _)) :- X =< H.
add(X, tree(H, _, _), tree(H, X, _, _, _)) :- X > H.

/* adding to a tree with two heads */
add(X, tree(H1, H2, nil, _, _), tree(H1, H2, tree(X, _, _), _, _)) :- X =< H1.
add(X, tree(H1, H2, _, nil, _), tree(H1, H2, _, tree(X, _, _), _)) :- X > H1, X < H2.
add(X, tree(H1, H2, _, _, nil), tree(H1, H2, _, _, tree(X, _, _))) :- X > H2, X > H1.

