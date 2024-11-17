--[[ Reading game memory --]]

local pointers = {}

CLIENT = 00400000

-- X position
local X_POINTER = readmem(0x01139C0C, "d")

-- Y position
local Y_POINTER = readmem(0x01139C0C, "d")

-- X ROT
local X_ROT_POINTER = readmem(0x01139C0C, "d")

-- Y ROT
local Y_ROT_POINTER = readmem(0x01139C0C, "d")

-- Returns char's x-axis location
function pointers.getX()
    local x = readmem(X_POINTER + 0x810, "f") / 20
    return x > 0 and math.floor(x) or math.ceil(x)
end

-- Returns char's y-axis location
function pointers.getY()
    local y = readmem(Y_POINTER + 0x814, "f") / 20
    return y > 0 and math.floor(y) or math.ceil(y)
end

-- Returns x
function pointers.fishX()
    local x = readmem(X_ROT_POINTER + 0x828, "f")
    return x > 0 and math.floor(x) or math.ceil(x)
end

-- Returns  y
function pointers.fishY()
    local y = readmem(Y_ROT_POINTER + 0x82C, "f")
    return y > 0 and math.floor(y) or math.ceil(y)
end

-- fish
function pointers.fish()
    return readmem(0x010508D8, "d") == 1 and true or false
end

-- fish
function pointers.isFishing()
    return readmem(0x010509C8, "d") == 1 and true or false
end

function pointers.lootWindow()
    return readmem(0x10508D8, "d") == 1 and true or false
end

function pointers.mouseX()
    return readmem(0x012C2DDC, "d")
end

function pointers.mouseY()
    return readmem(0x012C2DE0, "d")
end

return pointers
