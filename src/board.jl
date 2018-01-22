abstract type Color end

struct Empty <: Color end
struct Black <: Color end
struct White <: Color end

Base.show(io::IO, ::Empty) = print(io, "·")
Base.show(io::IO, ::Black) = print(io, "⚈")
Base.show(io::IO, ::White) = print(io, "⚆")

mutable struct Board <: AbstractMatrix{Color}
    array::Matrix{Color}
end

Base.size(board::Board) = size(board.array)
Base.getindex(board::Board, i) = board.array[i]
Base.IndexStyle(::Board) = IndexLinear()

empty = Empty()
black = Black()
white = White()

createboard(magnitude) = Board(Matrix{Empty}(magnitude, magnitude))

magnitude = 19; cb = createboard(magnitude)
# test for 361 intersections
# make distinguished marks for star points when possible
