using Weiqi

import Weiqi: empty, black, white, cb

@testset "set and access coords and stone to board" begin
# Set coordinate (1,2) as black, white, empty on board
cb.array[1,2] = black;
cb.array[1,2] = white;
cb.array[1,2] = empty;
cb

# Access coordinate (1,2) on board, with associated color
cb.array[1,2]
cb.array[1,3]

# Empty all board
cb.array[1:19,1:19] = empty;
end
