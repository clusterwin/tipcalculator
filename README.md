# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Alex Lester

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [X] Dynamic Tip rate selection. 0% through to 50% in 1% increments
* [X] Group splitting, divides the total bill between 2, 3, and 4 people.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/clusterwin/tipcalculator/d1941b47936d2f0af6280b6aca67c8e6310b9765/TipCalculator/TipCalculator/demo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
* Demo video and required version of xcode being in different versions. Very difficult to follow.
* Work laptop prevented the simulator running correctly due to constraints on threads monitoring other threads. 
* Rounding issues with float. Use NSDecimal instead.

## License

    Copyright 2015 Alex Lester

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
