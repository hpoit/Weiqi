using Weiqi

import Weiqi: empty, white, black, cb, NewPosition, bp, wp, nextplayer, pass

@testset "assign var `np` to NewPosition(player, coords, stone)" begin
newpos = NewPosition(bp, (1,2), black)
newpos = NewPosition(wp, (1,2), white)
# board state should decide when overwrite can happen

newpos = NewPosition(bp, (1,2), empty) # cannot happen
newpos = NewPosition(wp, (1,2), empty) # cannot happen

newpos.coords
newpos.stone
end

@testset "create newpos_history var and view it" begin
###
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

@testset "test cardinal directions of a `stone`" begin
cb.array[1:19,1:19] = empty;
newpos.coords
liberties(newpos)
end
