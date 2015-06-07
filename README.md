# hubot-meteorchat

### Purpose

Quickly create new hubot integrations for Meteor based chats.

### Soundbyte for PR

> *The universal hubot adapter for Meteor based chat and real-time messaging platforms.*

### Contents

* universal adapter code
* drivers for some leading Meteor based chat platforms
* tooling to make adapter development and bot development EASY

#### Architecture

Divide into:

* universal adapter (containing a driver)
* chat platform specific drivers

Keep the separation clean while extending api/interface versatility.

Tooling included separately.

#### Intermediate goals

* Rocket.Chat driver
* nullchat driver
* Spacetalk driver
* tooling to make driver development simple (otherwise setup/config takes hours, or even days)
* tooling to make bot development/launch simple (time to move on from classic 'free but needs to ping' Heroku...)

#### Status

Work in progress.  Currently:

* Rocket.Chat driver - rapid development
* nullchat driver - basic working
* universal adapter -  going through 'learning process' as it adapts to changes of various platforms
* Spacetalk driver - awaits roadmap OK and community contributor

Please submit PRs if you like to help.  Give us some feedback and star the repository if you find it useful.

NOTE:  Because of the rapid evolution nature in this category, the chat specific drivers will *always* be developed and evolving under the auspices of the particular chat platform.   The driver is tightly coupled to the specific chat platform as schemas, policies,  and API change.



#### A little history if you care (ongoing)

It took over three years, but Meteor finally found its killer app.  

It is *the modern chat platform*, not quite your grandpa's IRC - but just as realtime and integrates team collaboration features demanded by users:  linking everything they do, and all that they wish to store, with chat in the center of the ecosystem.

To be absolutely fair, this couldn't have happen three years ago, but only now.  Thank largely to Slack, after multiple hairy 'pivots', finding its place in startup history.  Ironically, Slack is not (yet) and may never be Meteor based.

Inevitably, if not already, all Meteor based chat apps evolves around a ..

... to be continued ...


