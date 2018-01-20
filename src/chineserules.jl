using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

function pass(color)
    if color == Empty ######
    #####
end

mutable struct NewPosition
    color::Color # imports from src/board.jl
    coords::Tuple{Int, Int}
end

"Apply `NewPosition` with `color`, given `coords`"
applynewposition!(board::Board, np::NewPosition) = board.array[np.coords...] = np.color

function nextcolor(color)
    if color == Black
        nextcolor = White
    elseif color == White
        nextcolor = Black
    else
        nextcolor == Black
    end
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
