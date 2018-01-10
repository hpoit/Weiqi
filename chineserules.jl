"Chinese rules: https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html"

struct player
    Stone
end

for player = (Black, White)
eval(quote
    ($player)(Black,White) = ($player)(($player)(Black,White))
end)
end

struct move end
struct liberties end
struct group end
struct removal end
struct forbidden end
struct gameover end
struct winner end
