if not writefile or not readfile or not getcustomasset then 
    getgenv().getasset = function() return end
    print("getasset is not supported")
    return
end

local owner = "t1ware"
local branch = "main"

local repository = `https://github.com/{owner}/assets/blob/{branch}/`

function getasset(asset)
    local folder = isfolder(".assets/") and ".assets/" or false
    if not folder then
        makefolder(".assets/")
        folder = ".assets/"
    end

    local file = isfile(folder..asset) and readfile(folder..asset) or false
    if not file then
        writefile(folder..asset, game:HttpGet(repository..asset))
        file = readfile(folder..asset)
    end

    return getcustomasset(folder..asset)
end

getgenv().getasset = getasset
