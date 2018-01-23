using Weiqi

# Chinese rules https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html

mutable struct NewPosition
    color::Color # imports from src/board.jl
    coords::Tuple{Int, Int}
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

"Given `coords`, apply `NewPosition` as `color`"
applynewposition!(board::Board, np::NewPosition) = board.array[np.coords...] = np.color

"A `color` with `coords == [0,0]` is a pass"
function pass(np)
    if np.color == Black; np.coords == [0,0]
        pass = Black
    elseif np.color == White; np.coords == [0,0]
        pass = White
    end
    # anything else?
end

function liberties() # adj intersections must be unoccupied!
    north = board.array[Int-1, Int]
    east = board.array[Int, Int+1]
    south = board.array[Int+1, Int]
    west = board.array[Int, Int-1]
end

struct Group end
struct Removal end
struct Forbidden end
struct Gameover end
struct Winner end
