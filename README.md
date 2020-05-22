# swift-undirected-graph

A basic implementation of undirected graph using adjacency list in Swift.

Open `UndirectedGraph.xcodeproj` to see the project in Xcode.

This challenge was taken from [moovup / programming-test](https://github.com/moovup/programming-test).

## 😱 The Problem

Given the undirected graph:

![Graph](graph.png)

- Write a function that returns all the possible paths between A­-H.
- Write a function that returns the least number of hops (shortest path) between A­-H.

The 12 edges are:
```
A -> B; A -> D; A -> H
B -> C; B -> D
C -> F; C -> D
D -> E
E -> F; E -> H
F -> G
G -> H
```

## ✨ Implementation
**Swift**

I am a beginner in Swift and have never tried the Swift command-line tool. I think it's time to give it a try by implementing some simple algorithms. 

New things learnt:

  - [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html): Associated Types, and Generic Types.
  - [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID271): Mutating Methods
  - [Optional Chaining](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html#ID246): : Optional Chaining as an Alternative to Forced Unwrapping

**Graph**

Graph is implemented using **Adjancency List**.

- The search function `getPaths` is based on DSF.
- In `searchPaths`, a set of vertices `visited` is used to keep track of the visited nodes. 

## ⛏ Issues faced

**XCTest**

- The framework can be used, however by default target membership cannot be changed, causing linker errors.
- It might be owing to the program being a command-line app. ([Source](https://stackoverflow.com/questions/28070399/writing-xctestcase-for-mac-os-command-line-tool))
- Solution was to manually edit the scheme:
  - Add test target in Build, toggle Test
  - Enable test target in Test
  - Make sure that the test cases have target membership set to the test target only

## 🔎 Sample Output
Click [here](output.md).

## 🎓 Acknowledgement

[**Algorithms**](http://www.csie.ntnu.edu.tw/~u91029/Graph.html)

An excellent site (in zh-Hant) that helped me a lot since my freshman year.

[**GeeksforGeeks**](https://www.geeksforgeeks.org/find-paths-given-source-destination/)

An example of printing all paths from a given source to a destination in a directed graph.