# Sample Output

Given `src = vA` and `dst = vH`:

```
Adjacency List:
A: 	[B, D, H]
B: 	[A, C, D]
C: 	[B, D, F]
D: 	[A, B, C, E]
E: 	[D, F, H]
F: 	[C, E, G]
G: 	[F, H]
H: 	[A, E, G]
===================================
All Simple Paths:
#1	[A, H]
#2	[A, D, E, H]
#3	[A, B, D, E, H]
#4	[A, B, C, D, E, H]
#5	[A, B, C, F, E, H]
#6	[A, B, C, F, G, H]
#7	[A, D, C, F, E, H]
#8	[A, D, C, F, G, H]
#9	[A, D, E, F, G, H]
#10	[A, B, D, C, F, E, H]
#11	[A, B, D, C, F, G, H]
#12	[A, B, D, E, F, G, H]
#13	[A, D, B, C, F, E, H]
#14	[A, D, B, C, F, G, H]
#15	[A, B, C, D, E, F, G, H]
0.0007469654083251953 seconds elapsed
===================================
The Least Number of Hop(s): 
	1
The Shortest Path(s):
	[A, H]
0.00038802623748779297 seconds elapsed
===================================
Program ended with exit code: 0
```