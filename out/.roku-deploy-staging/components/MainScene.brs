sub init()

    InitScreenStack()
    showFirstScreen()
    m.top.signalBeacon("AppLaunchComplete")
    ' SetupGoogleAnalytics4()

    ' m.global.analytics.callFunc("logEvent", "app_open", {
    '     "screen_name": "FirstScreen"
    ' })

    ' trendtube31@gmail.com
    ' Password: H19bKu+oFbi29nzT0Ht0DQ==
    ' DevID: 4b8fb6c0d97dbbde1f2afc9717053fab3fedd8e9


    ' m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
    ' m.readMarkupGridTask.observeField("content", "showmarkupgrid")
    ' m.readMarkupGridTask.control = "RUN"

end sub


function onKeyEvent(key as string, press as boolean) as boolean

    handled = false

    if press

        if key = "back"

            handled = true
        end if
    end if
    return handled

end function