"""
Juno's block detection is indentation based -- evaluating the first line is
equivalent to typing `module Weiqi` into the repl. Eval the file.
"""

module Weiqi

include("board.jl")
include("chineserules.jl")

end
