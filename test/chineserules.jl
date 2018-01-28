using Weiqi

import Weiqi: empty, white, black, cb, NewPosition, bp, wp

@testset "assign variable `np` to NewPosition(player, coords, stone)" begin
np = NewPosition(bp, (1,2), black)
np = NewPosition(wp, (1,2), white)

np = NewPosition(bp, (1,2), empty) # cannot happen
np = NewPosition(wp, (1,2), empty) # cannot happen

np.coords
np.stone
end

@testset "call `function nextplayer(np)`" begin
np.player
nextplayer(np)
end
