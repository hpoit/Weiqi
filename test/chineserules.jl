using Weiqi

import Weiqi: empty, white, black, cb
import Weiqi: NewPosition, bp, wp, nextplayer, pass, neighbors, liberties

@testset "assign var `np` to NewPosition(player, coords, stone)" begin
newpos = NewPosition(bp, (1,2), black)
newpos = NewPosition(wp, (1,2), white)
# board state should decide when overwrite can happen

newpos = NewPosition(bp, (1,2), empty) # cannot happen
newpos = NewPosition(wp, (1,2), empty) # cannot happen

newpos.coords
newpos.stone
end

@testset "call `function nextplayer(np)`" begin
newpos.player
nextplayer(newpos)
end

@testset "set a pass, then unset it" begin
newpos = NewPosition(bp, (0,0), black)
pass(newpos)

newpos = NewPosition(bp, (1,1), black)
pass(newpos)
end

@testset "test `function neighbors(cb, row::Int64, col::Int64)`" begin
# assume cb = createboard(19)
neighbors(cb, 1, 1)
neighbors(cb, 19, 19)
neighbors(cb, 7, 13)
end

@testset "test `function liberties(cb, row::Int64, col::Int64)``" begin
cb.array[3:5,3:5] = black; # create black block
cb
liberties(cb, 4, 5) # black block
liberties(cb, 3, 3) # black block
liberties(cb, 5, 4) # black block
end
