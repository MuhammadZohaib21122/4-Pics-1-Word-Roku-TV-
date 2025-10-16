sub Main(args as object)
    ShowChannelRSGScreen(args)
end sub
sub ShowChannelRSGScreen(args as object)
    'The roSCScreen object is a SceneGraph cavas that displays the contents of a Scene node instance 
    screen= CreateObject("roSGScreen")
    'message port is the place where events are sent
    m.port = CreateObject("roMessagePort")
    'sets the message port which will be used for events from the screen 
    screen.SetMessagePort(m.port)
    'every screen object must have a Scene node, or a node that derives from the node 
    scene=screen.CreateScene("MainScene")
    screen.Show() 'Init methd in MainScene.brs is invoked
    
    'scenelauncgArgs=args
    scene.launchArgs = args
    ?"args" args
    inputObject=CreateObject("roInput")
    inputObject.SetMessagePort(m.port)
    scene.observeField("exitApp", m.port)
    ' event loop
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return

        else if msgType = "roSGNodeEvent"
            return
        end if

        if Type(msg) = "roInputEvent"
            if msg.IsInput()
                inputData = msg.getInfo()
                ?"Input---->"
                ' m.top.SignalBeacon("AppLaunchComplete")
                ' pass the deeplink to UI
                if inputData.DoesExist("mediaType") and inputData.DoesExist("contentId")
                    deeplink = {
                        contentId: inputData.contentID
                        mediaType: inputData.mediaType
                    }
                    scene.inputArgs = deeplink
                end if
            end if
        end if

    end while
end sub
