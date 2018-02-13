using Weiqi

import Weiqi: empty, black, white, magnitude, cb

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

"Lists all cardinal directions (empty or not) around a stone"
function neighbors(cb, row::Int64, col::Int64)
    neighbor_list = Tuple{Int, Int}[]
    if row != 1
        push!(neighbor_list, (row-1, col))
    end
    if row != size(cb, 1)
        push!(neighbor_list, (row+1, col))
    end
    if col != size(cb, 2)
        push!(neighbor_list, (row, col+1))
    end
    if col != 1
        push!(neighbor_list, (row, col-1))
    end
    neighbor_list
end

"Searches for empty cardinal directions (liberties) around a stone or group of stones"
function liberties(cb, row::Int64, col::Int64)
    stone = cb.array[row, col]
    checked = fill(false, size(cb)) # heap allocation
    checked[row, col] = true # mark true for visited (row, col) (loop invariant)
    open_set = [] # non-visited nodes
    closed_set = [] # visited nodes
    for neighbor ∈ neighbors(cb, row, col)
        neighbor_row, neighbor_col = neighbor
        if !checked[neighbor_row, neighbor_col] # if (row, col) not visited
            if cb.array[neighbor_row, neighbor_col] == stone # if i equals arg
                push!(open_set, neighbor)
            elseif cb.array[neighbor_row, neighbor_col] == empty
                push!(closed_set, neighbor) # liberties
            end
            checked[neighbor_row, neighbor_col] == true # loop invariant for correct termination
        end
    end
    while !isempty(open_set)
        coords = shift!(open_set) # check neighbors of this coordinate and do the same as above
    end
    closed_set # liberties
end

function removal end
function forbidden end
function gameover end
function winner end
