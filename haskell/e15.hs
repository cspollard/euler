data PathTree = End (Int, Int) | Node (Int, Int) (PathTree, PathTree, PathTree, PathTree)

allPaths n = 
