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

mutable struct NewPosition <: AbstractMatrix{NewPosition}
    array::Matrix{NewPosition}
    # player::Player
    # row # from cb.array[,] in board.jl
    # column # from cb.array[,] in board.jl
end

function (np::NewPosition)(player,row,column)
    # if last NewPosition was Blackplayer
    # then current NewPosition is Whiteplayer
    # else current NewPosition is Blackplayer
    # end
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

mutable struct PositionHistory <: NewPosition
    ###
end

mutable struct Boardstate <: PositionHistory
    ###
end

function(bs::Boardstate)(x)
    if newposition.stone == Black
        nextplayer == Whiteplayer
    else nextplayer == Blackplayer
    end
end

struct Liberties end
struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
