sub init()
  m.top.id = "posterGrid"
  m.itemposter = m.top.findNode("itemPoster")
  ' m.focuslabel = m.top.findNode("focusLabel")
end sub


sub showcontent()
    itemcontent = m.top.itemContent

    if itemcontent <> invalid and itemcontent.images.count() = 4
        ?"Loading 4 images for item..."
        m.top.findNode("poster1").uri = itemcontent.images[0]
        m.top.findNode("poster2").uri = itemcontent.images[1]
        m.top.findNode("poster3").uri = itemcontent.images[2]
        m.top.findNode("poster4").uri = itemcontent.images[3]
    else
        ?"Invalid image data or less than 4 images"
    end if
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

