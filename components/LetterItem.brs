sub init()
    m.top.id = "letterGrid"
    m.label1 = m.top.findNode("label1")


    ' m.focuslabel = m.top.findNode("focusLabel")
end sub


sub showcontent()

    ' m.letterLabel.text = m.top.title
    itemcontent = m.top.itemContent
    for each lett in itemcontent.letters
        m.label1 .text = lett
    end for
     
    
    ' lettersGroup = m.top.findNode("lettersGroup")
    ' if itemcontent.letters <> invalid and itemcontent.letters.count() >= 1
    '     ?"Letters:"; itemcontent.letters

    '     label1 = lettersGroup.findNode("label1")
    '     label2 = lettersGroup.findNode("label2")
    '     label3 = lettersGroup.findNode("label3")
    '     label4 = lettersGroup.findNode("label4")
    '     label5 = lettersGroup.findNode("label5")
    '     label6 = lettersGroup.findNode("label6")
    '     label7 = lettersGroup.findNode("label7")
    '     label8 = lettersGroup.findNode("label8")
    '     label9 = lettersGroup.findNode("label9")
    '     label10 = lettersGroup.findNode("label10")
    '     label11 = lettersGroup.findNode("label11")
    '     label12 = lettersGroup.findNode("label12")

    '     ' Assign each label individually
    '     if itemcontent.letters.count() > 0 then label1.text = itemcontent.letters[0]
    '     if itemcontent.letters.count() > 1 then label2.text = itemcontent.letters[1]
    '     if itemcontent.letters.count() > 2 then label3.text = itemcontent.letters[2]
    '     if itemcontent.letters.count() > 3 then label4.text = itemcontent.letters[3]
    '     if itemcontent.letters.count() > 4 then label5.text = itemcontent.letters[4]
    '     if itemcontent.letters.count() > 5 then label6.text = itemcontent.letters[5]
    '     if itemcontent.letters.count() > 6 then label7.text = itemcontent.letters[6]
    '     if itemcontent.letters.count() > 7 then label8.text = itemcontent.letters[7]
    '     if itemcontent.letters.count() > 8 then label9.text = itemcontent.letters[8]
    '     if itemcontent.letters.count() > 9 then label10.text = itemcontent.letters[9]
    '     if itemcontent.letters.count() > 10 then label11.text = itemcontent.letters[10]
    '     if itemcontent.letters.count() > 11 then label12.text = itemcontent.letters[11]

    ' else
    '     ?"No letters found or invalid letters data"
    ' end if
end sub


' sub showcontent()
'     itemcontent = m.top.itemContent

'     if itemcontent <> invalid and itemcontent.images.count() > 0
'         ?"Image 0:"; itemcontent.images[0]
'         m.itemposter.uri = itemcontent.images[0]
'     else
'         ?"No images found for this item"
'     end if
' end sub

