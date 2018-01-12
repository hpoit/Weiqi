"Chinese rules: https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html"

abstract type Player end
struct Blackplayer <: Player
    black::Black # <: Stone from board.jl
end
struct Whiteplayer <: Player
    white::White # <: Stone from board.jl
end

mutable struct NewPosition
    stone::Stone # abstract type from board.jl
    row # from cb.array[,] in board.jl
    column # from cb.array[,] in board.jl
end

function (np::NewPosition)(stone,row,column)
    ###
end

function nextplayer(stone) end

mutable struct PositionHistory
    newposition::NewPosition
end

mutable struct Move
    player::Player
    position::Position
end

function didplayerpass(player, position)
    if position = cb.array[0, 0]
        println("$player passed")
    end
end

mutable struct Nextplayer end

mutable struct Boardstate
    positionhistory::PositionHistory
    newposition::NewPosition
    nextplayer::Player
end

function(bs::Boardstate)(x)
    if newposition.stone = Black
        nextplayer = Whiteplayer
    else nextplayer = Blackplayer
    end

struct Liberties end
struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
