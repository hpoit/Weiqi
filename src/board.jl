abstract type Stone end

struct Empty <: Stone end
struct Black <: Stone end
struct White <: Stone end

Base.show(io::IO, ::Black) = print(io, "⚈")
Base.show(io::IO, ::White) = print(io, "⚆")
Base.show(io::IO, ::Empty) = print(io, "·")

mutable struct Board <: AbstractMatrix{Stone}
    array::Matrix{Stone}
end

Base.size(board::Board) = size(board.array)
Base.getindex(board::Board, i) = board.array[i]
Base.IndexStyle(::Board) = IndexLinear()

empty = Empty()
black = Black()
white = White()

createboard(magnitude) = Board(Matrix{Empty}(magnitude, magnitude))

magnitude = 19; cb = createboard(magnitude) # test for 361 intersections
# make distinguished marks for star points when possible

"Test board"
cb.array[5, 8] = black # struct Move in Board State?
cb.array[13,17] = white
cb

"Empty board"
cb.array[1:19,1:19] = empty # [row, column]
cb
