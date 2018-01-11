"Chinese rules: https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html"

abstract type Player end
struct Blackplayer <: Player
    black::Black # <: Stone from board.jl
end
struct Whiteplayer <: Player
    white::White # <: Stone from board.jl
end

mutable struct Position
    stone::Stone # abstract type from board.jl
    row # from cb.array[,] in board.jl
    column # from cb.array[,] in board.jl
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

struct Liberties end
struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
