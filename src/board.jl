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
cb = createboard(magnitude)

"Defines cardinal directions of a stone on board"
function neighbors(row::Int64, col::Int64, cb)
    north = (row+1, col)
    south = (row-1, col)
    east = (row, col+1)
    west = (row, col-1)
    return cb.array[north...], cb.array[south...], cb.array[east...], cb.array[west...]
end

# test for 361 intersections
# make distinguished marks for star points when possible
