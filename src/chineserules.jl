using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

mutable struct NewPosition
    color::Color # imports from src/board.jl
    coords::Tuple{Int64, Int64}
end

"For beginning or after beginning of a game"
function nextcolor(color)
    if color == Black
        nextcolor = White
    elseif color == White
        nextcolor = Black
    else
        nextcolor == Black
    end
end

"Given `coords`, apply `NewPosition` as `color` to the board"
applynewposition!(board::Board, np::NewPosition) = board.array[np.coords...] = np.color

getnewposition!(board::Board,np::NewPosition) = board.array(np.coords...)

"A `color` with `coords == [0,0]` is a pass"
function pass(np)
    if np.color == Black; np.coords == [0,0]
        pass = Black
    elseif np.color == White; np.coords == [0,0]
        pass = White
    end
    # anything else?
end

"Defines cardinal directions of `np.coords`"
function liberties(np)
    row, col = np.coords
    if np.coords[row-1, col] == Empty
        north = np.coords[row-1, col]
    end
    if np.coords[row, col+1] == Empty
        east = np.coords[row, col+1]
    end
    if np.coords[row+1, col] == Empty
        south = np.coords[row+1, col]
    end
    if np.coords[row, col-1] == Empty
        west = np.coords[row, col-1]
    end
end

"""
Function breadth-first search (BFS) for grouped liberties of colors:
- For each vertex/color/liberty `v`, `shortestdistance` is the minimum number
of edges in any path from `v` back to source vertex.
- The `shortestdistance` from the source vertex contains `v`
and its `predecessor`. A source vertex has no `predecessor`, denoted by
`null`
"""

function BFS(source, adjlist, destination)
    distance = Dict(source => 0)
    queue = [source] # empty coords to be searched
    while !isempty(queue)
        current = shift!(queue)
        if current == destination
            return distance[destination]
        end
        for neighbor in adjlist[current]
            if !haskey(distance, neighbor)
                distance[neighbor] = distance[current] + 1
                push!(queue, neighbor)
            end
        end
    end
    error("$np and $destination are not connected")
end

"""
Adjacency lists for BFS:

First adjacency list has `np.coords` as keys and `np.color` as values
Second adjacency list has `np.coords` as keys and `empty` as values
"""

"Create adjacency list given sequence of color and tuples of colors"
function createadjlist(color, colors)
    result = Dict(c => eltype(Color)[] for c in Color)
    for (a, b) in colors
        push!(result[a], b)
        push!(result[b], a)
    end
    result
end

"Link BFS to adjacency list"
BFS(color, colors, source, destination) =
    BFS(createadjlist(color, colors), source, destination)

function removal end
function forbidden end
function gameover end
function winner end
