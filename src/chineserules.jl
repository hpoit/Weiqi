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

"Given `coords`, apply `NewPosition` as `color` to the board"
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

"Defines cardinal directions of `np.coords`"
function liberties(np)
    row, col = np.coords
    if np.coords[row-1, col] == Empty
        north = np.coords[row-1, col]
    end
    if np.coords[row, col+1] == Empty
        east = np.coords[row, col+1]
    end
    if np.coords[row+1, col] == Empty
        south = np.coords[row+1, col]
    end
    if np.coords[row, col-1] == Empty
        west = np.coords[row, col-1]
    end
end

"Breadth-first search for grouped liberties of colors (vertices)"
function BFS(board, np, destination)
    row, col = np.coords
    distance = Dict(np => 0)
    queue = [np]
    while !isempty(queue)
        current = shift!(queue)
        if current == destination
            return distance[destination]
        end
        for neighbor in board[current]
            if !haskey(distance, neighbor)
                distance[neighbor] = distance[current] + 1
                push!(queue, neighbor)
            end
        end
    end
    error("$np and $destination are not connected")
end

"Create adjacency list given sequence of color and tuples of colors"
function adjacencylist(color, colors)
    result = Dict(c => eltype(color)[] for c in color)
    for (a, b) in colors
        push!(result[a], b)
        push!(result[b], a)
    end
    result
end

"Link BFS to adjacency list"
BFS(color, colors, np, destination) =
    BFS(adjacencylist(color, colors), np, destination)

function removal end
function forbidden end
function gameover end
function winner end
