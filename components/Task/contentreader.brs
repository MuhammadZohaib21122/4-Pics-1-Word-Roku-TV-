sub init()
    m.top.functionName = "getcontent"
end sub

sub getcontent()
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://devtest-storage.b-cdn.net/Roku/4%20Pic%201%20Word/1.json")
    rsp = xfer.GetToString()
    json = ParseJson(rsp)

    if json <> invalid and json.Count() > 0 then
        ?"JSON Data Retrieved Successfully"

        parentContentNode = CreateObject("RoSGNode", "ContentNode")

        targetId = loadLevelCount()

        ?"Looking for ID:"; targetId

        for each item in json
            if item <> invalid and item.id = targetId then
                ?"Found Match For ID:"; item.id

                itemNode = parentContentNode.CreateChild("ItemData")

                if item.DoesExist("id") then itemNode.id = item.id
                if item.DoesExist("images") then itemNode.images = item.images
                if item.DoesExist("answer") then itemNode.answer = item.answer
                ' if item.DoesExist("letters") then itemNode.letters = item.letters
                if item.DoesExist("hint") then itemNode.hint = item.hint

                if item.DoesExist("letters") then 
                    
                end if
                ?"---------------------------"
                ?"ID: "; item.id
                ?"Images: "; item.images
                ?"Letters: "; item.letters
                ?"Hint: "; item.hint
                ?"Answer: "; item.answer
                ?"---------------------------"
                exit for 
            end if
        next

        if parentContentNode.GetChildCount() = 0 then
            ?"No item found for ID: "; targetId
        end if
    else
        ?"Invalid or Empty JSON"
    end if

    m.top.content = parentContentNode
    
end sub

