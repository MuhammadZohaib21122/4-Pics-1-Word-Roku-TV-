function loadLevelCount() as integer
    sec = CreateObject("roRegistrySection", "LevelCount")
    val = sec.Read("LevelCount")

    if val = invalid or val = "" then
        return 1
    else
        return StrToI(val)
    end if
end function
sub saveLevelCount(count)
    if count = invalid then count = 1
    sec = CreateObject("roRegistrySection", "LevelCount")
    sec.Write("LevelCount", str(count))
    sec.Flush()
end sub
