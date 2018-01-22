using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

mutable struct NewPosition
    color::Color # imports from src/board.jl
    coords::Tuple{Int, Int}
end

"For beginning or after beginning of game"
function nextcolor(color)
    if color == Black
        nextcolor = White
    elseif color == White
        nextcolor = Black
    else
        nextcolor == Black
    end
end

"Given `coords`, apply `NewPosition` as `color`"
applynewposition!(board::Board, np::NewPosition) = board.array[np.coords...] = np.color

"A `color` with `coords == [0,0]` is a pass"
function pass(np)
    if np.color == Black; np.coords == [0,0]
        pass = Black
    elseif np.color == White; np.coords == [0,0]
        pass = White
    end
    ##### anything else?
end

mutable struct PositionHistory <: AbstractMatrix{NewPosition}
    array::Matrix{NewPosition}
end

mutable struct Boardstate
    ph::PositionHistory
    nextcolor
end

function(bs::Boardstate)(x)
    if newposition.stone == Black
        nextcolor == White
    else nextcolor == Black
    end
end

struct Liberties end
struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
