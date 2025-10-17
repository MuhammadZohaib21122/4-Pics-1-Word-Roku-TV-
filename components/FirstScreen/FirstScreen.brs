sub init()
    m.posterGrid = m.top.findNode("posterGrid") 
    m.hintLabel = m.top.findNode("hintLabel")
    m.answerLabel = m.top.findNode("answerLabel")
    m.inputLabel = m.top.findNode("inputLabel")
    m.btnOK = m.top.findNode("ok")
    m.removeBtn = m.top.findNode("removeBtn")
    m.LCountLabel = m.top.findNode("LCountLabel")
    m.errorLabel = m.top.findNode("errorLabel")

    m.winGroup = m.top.findNode("winGroup")
    m.levelCountLabel = m.top.findNode("levelCountLabel")
    m.nextLevelBtn = m.top.findNode("nextLevelBtn")
    m.nextLevelBtn.observeField("buttonSelected", "nextLevelBtnSelected")

    m.poster1 = m.top.findNode("poster1")
    m.poster2 = m.top.findNode("poster2")
    m.poster3 = m.top.findNode("poster3")
    m.poster4 = m.top.findNode("poster4")

    m.lossGroup = m.top.findNode("lossGroup")
    m.lossLevelCountLabel = m.top.findNode("lossLevelCountLabel")
    m.skipLevelBtn = m.top.findNode("skipLevelBtn")
    m.skipLevelBtn.observeField("buttonSelected", "nextLevelBtnSelected")
    m.tryAgainBtn = m.top.findNode("tryAgainBtn")
    m.tryAgainBtn.observeField("buttonSelected", "tryAgainBtnSelected")

    m.lettersGroup = m.top.findNode("lettersGroup")
    m.btn1 = m.lettersGroup.findNode("btn1")
    m.btn2 = m.lettersGroup.findNode("btn2")
    m.btn3 = m.lettersGroup.findNode("btn3")
    m.btn4 = m.lettersGroup.findNode("btn4")
    m.btn5 = m.lettersGroup.findNode("btn5")
    m.btn6 = m.lettersGroup.findNode("btn6")
    m.btn7 = m.lettersGroup.findNode("btn7")
    m.btn8 = m.lettersGroup.findNode("btn8")
    m.btn9 = m.lettersGroup.findNode("btn9")
    m.btn10 = m.lettersGroup.findNode("btn10")
    m.btn11 = m.lettersGroup.findNode("btn11")
    m.btn12 = m.lettersGroup.findNode("btn12")

    m.label1 = m.lettersGroup.findNode("label1")
    m.label2 = m.lettersGroup.findNode("label2")
    m.label3 = m.lettersGroup.findNode("label3")
    m.label4 = m.lettersGroup.findNode("label4")
    m.label5 = m.lettersGroup.findNode("label5")
    m.label6 = m.lettersGroup.findNode("label6")
    m.label7 = m.lettersGroup.findNode("label7")
    m.label8 = m.lettersGroup.findNode("label8")
    m.label9 = m.lettersGroup.findNode("label9")
    m.label10 = m.lettersGroup.findNode("label10")
    m.label11 = m.lettersGroup.findNode("label11")
    m.label12 = m.lettersGroup.findNode("label12")

    m.btn1.observeField("buttonSelected", "btn1")
    m.btn2.observeField("buttonSelected", "btn2")
    m.btn3.observeField("buttonSelected", "btn3")
    m.btn4.observeField("buttonSelected", "btn4")
    m.btn5.observeField("buttonSelected", "btn5")
    m.btn6.observeField("buttonSelected", "btn6")
    m.btn7.observeField("buttonSelected", "btn7")
    m.btn8.observeField("buttonSelected", "btn8")
    m.btn9.observeField("buttonSelected", "btn9")
    m.btn10.observeField("buttonSelected", "btn10")
    m.btn11.observeField("buttonSelected", "btn11")
    m.btn12.observeField("buttonSelected", "btn12")
    m.btnOK.observeField("buttonSelected", "btnOK")
    m.removeBtn.observeField("buttonSelected", "removeBtnSelected")

    ' m.letterGrid = m.top.findNode("letterGrid")
    ' m.readMarkupGridTask.observeField("content", "showmarkLetterupgrid")

    m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
    m.readMarkupGridTask.observeField("content", "showmarkupgrid")
    m.readMarkupGridTask.control = "RUN"
    m.btn1.setFocus(true)
end sub


sub showmarkupgrid()
    if m.readMarkupGridTask.content <> invalid and m.readMarkupGridTask.content.getChildCount() > 0
        ?"Log 1"
        m.posterGrid.content = m.readMarkupGridTask.content
        ?"Total items in MarkupGrid: "; getMarkupGridItemCount()
    else
        ?"Error: No content available for MarkupGrid."
    end if


    if m.posterGrid.content <> invalid
        count = m.posterGrid.content.getChildCount()
        ?"Content has"; count; "children"

        for i = 0 to count - 1
            m.child = m.posterGrid.content.GetChild(i)
            ?"Child"; i; "ID:"; m.child.id
            ?"Images:"; m.child.images
            ?"Answer:"; m.child.answer
            ?"Letters:"; m.child.letters
            ?"Hint:"; m.child.hint
            ?"--------------------"
        end for
    else
        ?"No content assigned"
    end if

    m.poster1.uri = m.child.images[0]
    m.poster2.uri = m.child.images[1]
    m.poster3.uri = m.child.images[2]
    m.poster4.uri = m.child.images[3]

    m.label1.text = m.child.letters[0]
    m.label2.text = m.child.letters[1]
    m.label3.text = m.child.letters[2]
    m.label4.text = m.child.letters[3]
    m.label5.text = m.child.letters[4]
    m.label6.text = m.child.letters[5]
    m.label7.text = m.child.letters[6]
    m.label8.text = m.child.letters[7]
    m.label9.text = m.child.letters[8]
    m.label10.text = m.child.letters[9]
    m.label11.text = m.child.letters[10]
    m.label12.text = m.child.letters[11]

    if m.posterGrid.content <> invalid and m.posterGrid.content.getChildCount() > 0
        itemNode = m.posterGrid.content.GetChild(0)
        ?"Hint:"; itemNode.hint
        m.hintLabel.text = "Hint : " + itemNode.hint
        m.answerLabel.text = itemNode.answer
        ' m.answerLabel.text = "Answer :: " + itemNode.answer
    else
        ?"No content or invalid content"
    end if

    ' ?"m.posterGrid.content.getChild()"m.posterGrid.content.getChild()
    ' m.hintLabel.text = "Hint:" + m.posterGrid.content.getChild()
    Lcount = loadLevelCount()
    m.LCountLabel.text = "Level " + Str(Lcount)
end sub



' sub showmarkLetterupgrid()
'     if m.readMarkupGridTask.content <> invalid and m.readMarkupGridTask.content.getChildCount() > 0
'         ?"Log 1"
'         m.letterGrid.content = m.readMarkupGridTask.content
'         ?"Total items in MarkupGrid: "; getMarkupGridItemCount()
'     else
'         ?"Error: No content available for MarkupGrid."
'     end if


'     if m.letterGrid.content <> invalid
'         count = m.letterGrid.content.getChildCount()
'         ?"Content has"; count; "children"

'         for i = 0 to count - 1
'             m.child = m.letterGrid.content.GetChild(i)
'             ' ?"Child"; i; "ID:"; child.id
'             ' ?"Images:"; child.images
'             ' ?"Answer:"; child.answer
'             ?"Letters:"; m.child.letters
'             ' ?"Hint:"; child.hint
'             ?"--------------------"
'         end for

'         m.label1.text = m.child.letters[0]
'         m.label2.text = m.child.letters[1]
'         m.label3.text = m.child.letters[2]
'         m.label4.text = m.child.letters[3]
'         m.label5.text = m.child.letters[4]
'     else
'         ?"No content assigned"
'     end if

'     if m.letterGrid.content <> invalid and m.letterGrid.content.getChildCount() > 0
'     itemNode = m.letterGrid.content.GetChild(0)

' else
'     ?"No content or invalid content"
' end if

'     ' ?"m.letterGrid.content.getChild()"m.letterGrid.content.getChild()
'     ' m.hintLabel.text = "Hint:" + m.letterGrid.content.getChild()
' end sub



function getMarkupGridItemCount() as integer
    ?"Log 2"

    if m.posterGrid.content <> invalid then
        return m.posterGrid.content.getChildCount()
        ?""m.posterGrid.content.getChildCount()
    else
        return 0

    end if
end function

function OnKeyEvent(key as string, press as boolean) as boolean

    result = false

    if press
        if key = "right"

            if m.btn1.hasFocus()
                m.btn2.setFocus(true)

            else if m.btn2.hasFocus()
                m.btn3.setFocus(true)


            else if m.btn2.hasFocus()
                m.btn3.setFocus(true)


            else if m.btn3.hasFocus()
                m.btn4.setFocus(true)


            else if m.btn4.hasFocus()
                m.btn5.setFocus(true)


            else if m.btn5.hasFocus()
                m.btn6.setFocus(true)

            else if m.btn6.hasFocus()
                m.btnOK.setFocus(true)
            else if m.btn12.hasFocus()
                m.btnOK.setFocus(true)


            else if m.btn7.hasFocus()
                m.btn8.setFocus(true)


            else if m.btn8.hasFocus()
                m.btn9.setFocus(true)


            else if m.btn9.hasFocus()
                m.btn10.setFocus(true)

            else if m.btn10.hasFocus()
                m.btn11.setFocus(true)

            else if m.btn11.hasFocus()
                m.btn12.setFocus(true)

            else if m.skipLevelBtn.hasFocus()
                m.tryAgainBtn.setFocus(true)

            else if m.removeBtn.hasFocus()
                m.btn1.setFocus(true)


            end if
            result = true

        else if key = "left"

            if m.btn2.hasFocus()
                m.btn1.setFocus(true)

            else if m.btn3.hasFocus()
                m.btn2.setFocus(true)


            else if m.btn4.hasFocus()
                m.btn3.setFocus(true)


            else if m.btn5.hasFocus()
                m.btn4.setFocus(true)


            else if m.btn6.hasFocus()
                m.btn5.setFocus(true)


            else if m.btn8.hasFocus()
                m.btn7.setFocus(true)


            else if m.btn9.hasFocus()
                m.btn8.setFocus(true)

            else if m.btn10.hasFocus()
                m.btn9.setFocus(true)

            else if m.btn11.hasFocus()
                m.btn10.setFocus(true)

            else if m.btn12.hasFocus()
                m.btn11.setFocus(true)

            else if m.btnOK.hasFocus()
                m.btn6.setFocus(true)

            else if m.btn1.hasFocus()
                m.removeBtn.setFocus(true)

            else if m.btn7.hasFocus()
                m.removeBtn.setFocus(true)

            else if m.tryAgainBtn.hasFocus()
                m.skipLevelBtn.setFocus(true)


            end if

            result = true


        else if key = "up"


            if m.btn7.hasFocus()
                m.btn1.setFocus(true)

            else if m.btn8.hasFocus()
                m.btn2.setFocus(true)

            else if m.btn9.hasFocus()
                m.btn3.setFocus(true)


            else if m.btn10.hasFocus()
                m.btn4.setFocus(true)


            else if m.btn11.hasFocus()
                m.btn5.setFocus(true)


            else if m.btn12.hasFocus()
                m.btn6.setFocus(true)

            end if


            result = true

        else if key = "down"

            if m.btn1.hasFocus()
                m.btn7.setFocus(true)

            else if m.btn2.hasFocus()
                m.btn8.setFocus(true)

            else if m.btn3.hasFocus()
                m.btn9.setFocus(true)


            else if m.btn4.hasFocus()
                m.btn10.setFocus(true)


            else if m.btn5.hasFocus()
                m.btn11.setFocus(true)


            else if m.btn6.hasFocus()
                m.btn12.setFocus(true)

            end if

            result = true

        else if key = "back"
            if m.winGroup.visible = false or m.lossGroup.visible = false
                m.top.getScene().exitApp = true

            else if m.lossGroup.visible = true
                m.tryAgainBtn.setFocus(true)

            else if m.winGroup.visible = true
                nextLevelBtnSelected()

            ' else if m.errorLabel.visible = true
            '     m.errorLabel.visible = false
            '     m.btn1.setFocus(true)
            end if


            result = true

        end if
    end if

    return result
end function

function btn1()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label1.text

end function
function btn2()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label2.text

end function
function btn3()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label3.text

end function
function btn4()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label4.text

end function
function btn5()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label5.text

end function
function btn6()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label6.text

end function
function btn7()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label7.text

end function
function btn8()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label8.text

end function
function btn9()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label9.text

end function
function btn10()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label10.text

end function
function btn11()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label11.text

end function
function btn12()
    m.errorLabel.visible = false
    m.inputLabel.text = m.inputLabel.text + m.label12.text

end function

function btnOK()

    if m.inputLabel.text = m.answerLabel.text
        ?"✅ Correct! Level Complete!"
        levelCount = loadLevelCount()
        m.winGroup.visible = true
        m.levelCountLabel.text = "Level : " + Str(levelCount)
        m.nextLevelBtn.setFocus(true)



    else

        ?m.inputLabel.text + "❌ Wrong Answer! Try again."
        ' m.errorLabel.visible = true
        if m.inputLabel.text = ""
            m.errorLabel.visible = true
            ' m.top.setFocus(false)
        else
            levelCount = loadLevelCount()
            m.lossLevelCountLabel.text = "Level : " + Str(levelCount)
            m.lossGroup.visible = true
            m.skipLevelBtn.setFocus(true)
        end if


    end if
end function

function removeBtnSelected()
    currentText = m.inputLabel.text
    m.inputLabel.text = left(currentText, len(currentText) - 1)
     m.errorLabel.visible = false
end function

function nextLevelBtnSelected()
    m.winGroup.visible = false
    m.btn1.setFocus(true)
    m.inputLabel.text = ""
    levelCount = loadLevelCount()
    if levelCount >= 110
        saveLevelCount(1)

        m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
        m.readMarkupGridTask.observeField("content", "showmarkupgrid")
        m.readMarkupGridTask.control = "RUN"
    else
        saveLevelCount(levelCount + 1)

        m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
        m.readMarkupGridTask.observeField("content", "showmarkupgrid")
        m.readMarkupGridTask.control = "RUN"
    end if
    m.lossGroup.visible = false
end function

function tryAgainBtnSelected()
    m.inputLabel.text = ""
    m.lossGroup.visible = false
    m.btn1.setFocus(true)
end function