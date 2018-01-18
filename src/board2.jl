
const repeat = "The attempted repeated move is illegal."
const occupied = "The selected intersection is occupied."
const suicide = "The attempted move would result in a suicide."

const neutral = "-"
const unknown = PointState.empty
const blackterritory = PointState.black
const whiteterritory = PointState.white

const active = "active"
const idle = "idle"
const ended = "ended"

#struct Color
#    black, white
#    Color(black) = new(black)
#    Color(white) = new(white)
#end

struct Direction
    north, east, south, west, all
    Direction(north) = new(north)
    Direction(east) = new(east)
    Direction(south) = new(south)
    Direction(west) = new(west)
    Direction(all) = new(all)
end

end

struct MoveError
    repeat, occupied, suicide
    MoveError(repeat) = new(repeat)
    MoveError(occupied) = new(occupied)
    MoveError(suicide) = new(suicide)
end

struct TerritoryOwner
    unknown, neutral, blackterritory, whiteterritory
    TerritoryOwner(unknown) = new(unknown)
    TerritoryOwner(neutral) = new(neutral)
    TerritoryOwner(blackterritory) = new(blackterritory)
    TerritoryOwner(whiteterritory) = new(whiteterritory)
end

struct GameStatus
    active, idle, ended
    GameStatus(active) = new(active)
    GameStatus(idle) = new(idle)
    GameStatus(ended) = new(ended)
end
