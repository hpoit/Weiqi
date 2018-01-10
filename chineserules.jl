"Chinese rules: https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html"

struct player
    for player = (:black, :white)
    eval(quote
        ($player)(1,2) = ($player)(($player)(1,2))
    end)
    end
end 

struct move end
struct liberties end
struct group end
struct removal end
struct forbidden end
struct gameover end
struct winner end
