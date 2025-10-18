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

function loadCoinCount() as integer
    sec = CreateObject("roRegistrySection", "CoinCount")
    val = sec.Read("CoinCount")

    if val = invalid or val = "" then
        return 0
    else
        return StrToI(val)
    end if
end function
sub saveCoinCount(count)
    if count = invalid then count = 0
    sec = CreateObject("roRegistrySection", "CoinCount")
    sec.Write("CoinCount", str(count))
    sec.Flush()
end sub


' function ShuffleArray(arr as object) as object
'     ' --- Create associative array dynamically (keys 0–11) ---
'     aa = CreateObject("roAssociativeArray")
'     alphabets = arr

'     for i = 0 to 11
'         aa[str(i)] = alphabets[i] ' use string keys for safety
'     end for

'     ?"aa " aa
'     print "Original associative array:"
'     for each k in aa
'         print k; " => "; aa[k]
'     end for

'     ' --- Collect keys ---
'     keys = []
'     for each key in aa
'         keys.push(key)
'     end for

'     ' --- Shuffle keys (Fisher–Yates) ---
'     for i = keys.count() to 2 step -1
'         j = int(rnd(1) * i) + 1
'         temp = keys[i]
'         keys[i] = keys[j]
'         keys[j] = temp
'     end for

'     ?"keys " keys
'     ' --- Build new randomized associative array ---
'     randomizedAA = CreateObject("roAssociativeArray")
'     for each k in keys
'         if k <> invalid
'             ?"k-> "k
'             randomizedAA[k] = aa[k]
'         end if
'     end for

'     print chr(10) + "Randomized associative array:"
'     for each k in randomizedAA
'         print k; " => "; randomizedAA[k]
'     end for
'     ?"randomizedAA"randomizedAA
'     return randomizedAA
' end function



function ShuffleArray(arr as object) as object
    ' --- Create associative array dynamically (keys 0–11) ---
    aa = CreateObject("roAssociativeArray")
    alphabets = arr

    for i = 0 to 11
        aa[str(i)] = alphabets[i] ' use string keys for safety
    end for

    ?"aa " aa
    print "Original associative array:"
    for each k in aa
        print k; " => "; aa[k]
    end for

    ' --- Collect keys ---
    keys = []
    for each key in aa
        keys.push(key)
    end for

    ' --- Shuffle keys (Fisher–Yates) ---
    for i = keys.count() to 2 step -1
        j = int(rnd(1) * i) + 1
        temp = keys[i]
        keys[i] = keys[j]
        keys[j] = temp
    end for

    ?"keys " keys
    ' --- Build new randomized associative array ---
    randomizedAA = CreateObject("roAssociativeArray")
    for each k in keys
        if k <> invalid
            ?"k-> "k
            randomizedAA[k] = aa[k]
        end if
    end for

    print chr(10) + "Randomized associative array:"
    for each k in randomizedAA
        print k; " => "; randomizedAA[k]
    end for
    ?"randomizedAA"randomizedAA

    ' --- ✅ Convert to plain array before returning ---
    shuffledArray = []
    for each k in randomizedAA
        shuffledArray.push(randomizedAA[k])
    end for

    return shuffledArray
end function



























' function ShuffleArray(arr as Object) as Object
'     if arr = invalid or type(arr) <> "roArray" or arr.Count() = 0 then return arr

'     ' Make a manual copy of the array
'     shuffled = []
'     for each item in arr
'         shuffled.Push(item)
'     end for

'     ' Simple pseudo-random seed from current time
'     dt = CreateObject("roDateTime")
'     seed = dt.AsSeconds() * 1103515245 + 12345

'     n = shuffled.Count()
'     for i = n - 1 to 1 step -1
'         ' Update seed (simple linear congruential generator)
'         seed = (seed * 1103515245 + 12345) mod 2147483647
'         frac = (seed mod 1000000) / 1000000.0
'         j = int(frac * (i + 1))

'         ' Swap values
'         temp = shuffled[i]
'         shuffled[i] = shuffled[j]
'         shuffled[j] = temp
'     end for

'     return shuffled
' end function
