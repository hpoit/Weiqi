abstract type Stone end
struct Black <: Stone end
struct White <: Stone end

abstract type Emptiness end
struct Empty <: Emptiness end

Base.show(io::IO, ::Empty) = print(io, "·")
Base.show(io::IO, ::Black) = print(io, "⚈")
Base.show(io::IO, ::White) = print(io, "⚆")

mutable struct Board <: AbstractMatrix{Union{Stone, Emptiness}}
    array::Matrix{Union{Stone, Emptiness}}
end

Base.size(board::Board) = size(board.array)
Base.getindex(board::Board, i) = board.array[i]
Base.IndexStyle(::Board) = IndexLinear()

empty = Empty()
black = Black()
white = White()

createboard(m) = Board(Matrix{Empty}(m, m))
cb = createboard(19)

# make distinguished marks for star points when possible
