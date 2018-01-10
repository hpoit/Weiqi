"Chinese rules: https://www.cs.cmu.edu/~wjh/go/rules/Chinese.html"

struct player
    for player = (:black, :white)
    eval(quote
        ($player)(black,white) = ($player)(($player)(black,white))
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
