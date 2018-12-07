# Intercom for MacOS 📞

An extremely light Intercom MacOS Framework for sending events and tracking users.

<img src="/Assets/GithubHeader.png?raw=true" width="888">

### Setup

1.  Create a new app at https://developers.intercom.com.
2.  Go to Configure -> Authentication.
3.  Copy your token

###### Warning

Before using your token make sure you tick off all the permissions you don't need. Most apps would only need `Write users and companies` and `Write events` permissions. If by accident you leak a token with read permissions this could mean your whole user base gets leaked.

### Installation: Carthage

1.  Add `github "maximedegreve/Intercom-MacOS"` to your Cartfile.
2.  Run carthage update.
3.  Go to your Xcode project's "General" settings. Drag `maximedegreve/Intercom-MacOS.framework` from `Carthage/Build/macOS` to the "Embedded Binaries" section. Make sure “Copy items if needed” is selected and click Finish.

### Example

```
import Intercom

Intercom.shared.setup(accessToken: "YOUR TOKEN")

let event = IntercomEvent(eventName: "invited-friend", userId: "314159", metaData: nil)
Intercom.shared.events.submit(event)
```

### More documentation

Soon
