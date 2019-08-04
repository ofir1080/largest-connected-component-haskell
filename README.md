# Largest Connected Component on a Grid
## Backgraound

Given a grid with different colors in different cells, each color is represented by a different number. The task is to find the largest connected component on the grid.
A Largest component grid refers to a maximum set of cells such that you can move from any cell to any other cell in this set by only moving between side-adjacent cells in the grid. (Thus by only using Up, Down, Right, Left moves.)

(from [geeksforgeeks](https://www.geeksforgeeks.org/largest-connected-component-on-a-grid/))

### Example

![example_grid](https://i.ibb.co/m5zXGFS/Screen-Shot-2019-08-03-at-20-53-03.png)

## Requirments

* Haskell Platform 
* GHCi — Glasgow Haskell Compiler 8.X.X
* Prelude (the default standard library)

## How To Run

### from Terminal (with LCC.hs in current directory):
To open GHCi:
```
~$: ghci
```
The GHCi prompt will look like this:
```
GHCi, version 8.6.3: http://www.haskell.org/ghc/  :? for help
Prelude>
```

Loading LCC module:
```
GHCi, version 8.6.3: http://www.haskell.org/ghc/  :? for help
Prelude> :load LCC.hs
[1 of 1] Compiling Main             ( LCC.hs, interpreted )
Ok, one module loaded.
*Main>
```

To define the above example grid:
```
*Main> example_grid = [((0,0),1),((0,1),4),((0,2),4),((0,3),4),((0,4),4),((0,5),3),((0,6),3),((0,7),1),((1,0),2),
((1,1),1),((1,2),1),((1,3),4),((1,4),3),((1,5),3),((1,6),1),((1,7),1),((2,0),3),((2,1),2),((2,2),1),
((2,3),1),((2,4),2),((2,5),3),((2,6),2),((2,7),1),((3,0),3),((3,1),3),((3,2),2),((3,3),1),((3,4),2),
((3,5),2),((3,6),2),((3,7),2),((4,0),3),((4,1),1),((4,2),3),((4,3),1),((4,4),1),((4,5),4),((4,6),4),
((4,7),4),((5,0),1),((5,1),1),((5,2),3),((5,3),1),((5,4),1),((5,5),4),((5,6),4),((5,7),4)]
```

Running `getLCC :: Cells -> [Index]` with `example_grid`:
```
*Main> getLCC example
[(1,1),(1,2),(2,2),(2,3),(3,3),(4,4),(4,3),(5,3),(5,4)]
*Main> length $ getLCC example
9
```
## Author

**Ofir Abramovich*
