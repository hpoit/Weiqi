using Weiqi

import Weiqi: empty, black, white, magnitude

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

abstract type Player end
struct Blackplayer <: Player end
struct Whiteplayer <: Player end

mutable struct NewPosition{T<:Player}
    player::T
    coords::Tuple{Int64, Int64}
    stone::Stone
end

bp = Blackplayer()
wp = Whiteplayer()

function nextplayer(newpos)
    if newpos.player == bp
        nextplayer = wp
    elseif newpos.player == wp
        nextplayer = bp
    else
        nextplayer == bp
    end
end

# incomplete testing
"If a `player` chooses `coords == [0,0]`, `player` passes and `nextplayer(np)` is called"
function pass(newpos)
    if newpos.player == bp && newpos.coords == [0,0]
        pass = Black
    elseif newpos.player == wp && newpos.coords == [0,0]
        pass = White
    else
        println("No passes")
    end
end

"Defines cardinal directions of ALL `newpos` on board"
function neighbors(newpos, board::Board)
    north = (row+1, col)
    south = (row-1, col)
    east = (row, col+1)
    west = (row, col-1)
    return board[north...], board[south...], board[east...], board[west...]
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
