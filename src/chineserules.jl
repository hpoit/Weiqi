using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

mutable struct NewPosition
    color::Color # imports from src/board.jl
    coords::Tuple{Int, Int}
end

applynewposition!(board::Board, np::NewPosition) = board.array[np.color, np.coords]

function nextcolor(color)
    if color == Black
        nextcolor = White
    else color == White
        nextcolor = Black
    end
end

function pass(color)
    if color == Empty
        
end

mutable struct Nextplayer end

mutable struct PositionHistory <: AbstractMatrix{NewPosition}
    array::Matrix{NewPosition}
end

mutable struct Boardstate
    ph::PositionHistory
    nextplayer::Nextplayer
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
