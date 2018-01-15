using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

# import Weiqi: was not necessary because these structs contain the types
abstract type Player end
struct Blackplayer <: Player
    black::Black # <: Stone from board.jl
end
struct Whiteplayer <: Player
    white::White # <: Stone from board.jl
end

mutable struct NewPosition
    player::Player
    row::Int64
    column::Int64
end

function (np::NewPosition)(player,row,column)
    # I'm stuck! cb.array[5, 8] = black places a stone on the Board
    # from test/board.jl, but it needs to be associated to a Player 
end

function nextplayer(stone) end

mutable struct Move
    player::Player
    position::NewPosition
end

function didplayerpass(player, position)
    if position == Empty
        println("$player passed")
    end
end

mutable struct Nextplayer end

mutable struct PositionHistory <: AbstractMatrix{NewPosition}
    array::Matrix{NewPosition}
end

mutable struct Boardstate
    ph::PositionHistory
    nextplayer
end

function(bs::Boardstate)(x)
    if newposition.stone == Black
        nextplayer::Nextplayer == Whiteplayer
    else nextplayer::Nextplayer == Blackplayer
    end
end

struct Liberties end
struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
