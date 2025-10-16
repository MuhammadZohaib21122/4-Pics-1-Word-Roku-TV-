sub init()
    m.posterGrid = m.top.findNode("posterGrid")
    m.hintLabel = m.top.findNode("hintLabel")
    m.answerLabel = m.top.findNode("answerLabel")
    m.letterGrid = m.top.findNode("letterGrid")
    m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
    m.readMarkupGridTask.observeField("content", "showmarkupgrid")
    m.readMarkupGridTask.observeField("content", "showmarkLetterupgrid")
    m.readMarkupGridTask.control = "RUN"
    m.letterGrid.setFocus(true)
end sub


sub showmarkupgrid()
    if m.readMarkupGridTask.content <> invalid and m.readMarkupGridTask.content.getChildCount() > 0
        ?"Log 1"
        m.posterGrid.content = m.readMarkupGridTask.content
        ?"Total items in MarkupGrid: "; getMarkupGridItemCount()
    else
        ?"Error: No content available for MarkupGrid."
    end if


    ' if m.posterGrid.content <> invalid
    '     count = m.posterGrid.content.getChildCount()
    '     ?"Content has"; count; "children"

    '     for i = 0 to count - 1
    '         child = m.posterGrid.content.GetChild(i)
    '         ?"Child"; i; "ID:"; child.id
    '         ?"Images:"; child.images
    '         ?"Answer:"; child.answer
    '         ?"Letters:"; child.letters
    '         ?"Hint:"; child.hint
    '         ?"--------------------"
    '     end for
    ' else
    '     ?"No content assigned"
    ' end if

    if m.posterGrid.content <> invalid and m.posterGrid.content.getChildCount() > 0
    itemNode = m.posterGrid.content.GetChild(0)
    ?"Hint:"; itemNode.hint
    m.hintLabel.text = "Hint : " + itemNode.hint
    m.answerLabel.text = "Answer :: " + itemNode.answer
else
    ?"No content or invalid content"
end if

    ' ?"m.posterGrid.content.getChild()"m.posterGrid.content.getChild()
    ' m.hintLabel.text = "Hint:" + m.posterGrid.content.getChild()
end sub



sub showmarkLetterupgrid()
    if m.readMarkupGridTask.content <> invalid and m.readMarkupGridTask.content.getChildCount() > 0
        ?"Log 1"
        m.letterGrid.content = m.readMarkupGridTask.content
        ?"Total items in MarkupGrid: "; getMarkupGridItemCount()
    else
        ?"Error: No content available for MarkupGrid."
    end if


    if m.letterGrid.content <> invalid
        count = m.letterGrid.content.getChildCount()
        ?"Content has"; count; "children"

        for i = 0 to count - 1
            child = m.letterGrid.content.GetChild(i)
            ' ?"Child"; i; "ID:"; child.id
            ' ?"Images:"; child.images
            ' ?"Answer:"; child.answer
            ?"Letters:"; child.letters
            ' ?"Hint:"; child.hint
            ?"--------------------"
        end for
    else
        ?"No content assigned"
    end if

    if m.letterGrid.content <> invalid and m.letterGrid.content.getChildCount() > 0
    itemNode = m.letterGrid.content.GetChild(0)
    
else
    ?"No content or invalid content"
end if

    ' ?"m.letterGrid.content.getChild()"m.letterGrid.content.getChild()
    ' m.hintLabel.text = "Hint:" + m.letterGrid.content.getChild()
end sub


function getMarkupGridItemCount() as integer
    ?"Log 2"

    if m.posterGrid.content <> invalid then
        return m.posterGrid.content.getChildCount()
        ?""m.posterGrid.content.getChildCount()
    else
        return 0

    end if
end function
