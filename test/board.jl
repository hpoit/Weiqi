using Weiqi

import Weiqi: empty, black, white, cb

# Test board
cb.array[5, 8] = black # struct Move in BoardState?
cb.array[13,17] = white
cb

# Empty board
cb.array[1:19,1:19] = empty # [row, column]
cb
