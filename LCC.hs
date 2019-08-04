-- Largest Connected Component

type Color = Int
type Index = (Int,Int)
type Cells = [(Index,Color)]

getLCC :: Cells -> [Index]
getLCC cells = map (\(i,c) -> i) $ extractMax cells

extractMax :: Cells -> Cells
extractMax cells = foldl (\max current -> if length current > length max then current else max) [] $ getAllComponents cells

getAllComponents :: Cells -> [Cells]
getAllComponents cells = map (\cell -> removeDuplicates (getComponent cells cell)) cells

removeDuplicates :: Cells -> Cells
removeDuplicates l = foldl (\seen x -> if x `elem` seen then seen else seen ++ [x]) [] l

getComponent :: Cells -> (Index,Color) -> Cells
getComponent _ (_,-1) = []
getComponent cells ((x,y), c) = let current = ((x,y), c)
                                    up = getCell cells (x, y + (-1))
                                    down = getCell cells (x, y + 1)
                                    left = getCell cells (x + (-1), y)
                                    right = getCell cells (x + 1, y)
                                    newGrid = removeCell cells ((x,y), c)
                                    findNeighbors = getSimilarNeighbor c
                                    applyNeighbors = getComponent newGrid
                                in current : applyNeighbors (findNeighbors up) ++ applyNeighbors (findNeighbors down) ++ applyNeighbors (findNeighbors left) ++ applyNeighbors (findNeighbors right)

getSimilarNeighbor :: Color -> (Index,Color) -> (Index,Color)
getSimilarNeighbor c ((ix,iy),ic) = if isInRange (ix,iy) && ic == c then ((ix,iy),ic) else ((-1,-1),-1) 

removeCell :: Cells -> (Index,Color) -> Cells
removeCell [] _ = []
removeCell (((ix,iy),ic):xs) ((x,y),c) = if ix /= x || iy /= y then  ((ix,iy),ic) : removeCell xs ((x,y),c) else removeCell xs ((x,y),c)

getCell :: Cells -> Index -> (Index,Color)
getCell [] _ = ((-1,-1), -1)
getCell (((x,y),c):xs) (ix,iy) = if x == ix && y == iy then ((x,y),c) else getCell xs (ix,iy)

isInRange :: Index -> Bool
isInRange (x,y) = x >= 0 && x < 6 && y >= 0 && y < 8




getCells :: Cells
getCells  = [((0,0),1),((0,1),4),((0,2),4),((0,3),4),((0,4),4),((0,5),3),((0,6),3),((0,7),1),((1,0),2),((1,1),1),((1,2),1),((1,3),4),((1,4),3),((1,5),3),((1,6),1),((1,7),1),((2,0),3),((2,1),2),((2,2),1),((2,3),1),((2,4),2),((2,5),3),((2,6),2),((2,7),1),((3,0),3),((3,1),3),((3,2),2),((3,3),1),((3,4),2),((3,5),2),((3,6),2),((3,7),2),((4,0),3),((4,1),1),((4,2),3),((4,3),1),((4,4),1),((4,5),4),((4,6),4),((4,7),4),((5,0),1),((5,1),1),((5,2),3),((5,3),1),((5,4),1),((5,5),4),((5,6),4),((5,7),4)]
