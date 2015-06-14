![](./images/Banner.png)

# DKNightVersion  ![language](https://img.shields.io/badge/Langauge-%20Objective--C%20-orange.svg) [![Version](http://img.shields.io/cocoapods/v/DKNightVersion.svg?style=flat)](http://cocoadocs.org/docsets/DKNightVersion) [![Build Status](https://travis-ci.org/Draveness/DKNightVersion.png)](https://travis-ci.org/Draveness/DKNightVersion) ![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg) ![Platform](https://img.shields.io/badge/platform-%20iOS%20-lightgrey.svg) 

DKNightVersion is a light weight framework. It's mainly built through `objc/runtime` library and reflection, providing a neat approach  adding night mode to your iOS app. A great many codes of this framework is automatically generated by Ruby script.

The most delightful feature of DKNightVersion is that it appends one more property `nightColor` to frequently-used UIKit components. It is easily-used and well-designed. Hope you have a great joy to use DKNightVersion to integrate night mode in your Apps.

# Demo

![](./images/DKNightVersion.gif)

# Installation with CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like DKNightVersion in your projects. See the [Get Started section](https://cocoapods.org/#get_started) for more details.

## Podfile

```
pod "DKNightVersion", "~> 0.8.1"
```

## Usage

Just add one line of code in your precompiled header, or import it where you need.

```
#import "DKNightVersion.h"
```

----

# How to use

## Using night color

DKNightVersion is based on property `nightColor`, such as `nightBackgroundColor` `nightTextColor` and etc.

Assign the night mode color you want to the `UIKit` component like this:

```
self.view.nightBackgroundColor = [UIColor blackColor];
self.label.nightTextColor = [UIColor whiteColor];
```

## Using DKNightVersionManager change theme

Use `DKNightVersionManager` sets the theme.

```
[DKNightVersionManager nightFalling];
```

If you'd like to switch back to normal mode:

```
[DKNightVersionManager dawnComing];
```

It's pretty easy to swich theme between night and normal mode.

## Make your own customize

### Notification

`nightFalling` method will post `DKNightVersionNightFallingNotification` when it is called. Similarly, `dawnComing` will post `DKNightVersionDawnComingNotification`. You can observe these notification in proper place, and make your own customize easily.

## RespondClasses

If you want your own class changing color while switch theme.

**You must add it to `respondClasseses` set**. In the new version, in order to prevent subclass inheritance superclass's night color, I add `respondClasseses` set.

Use `addClassToSet:` or `removeClassToSet:` method to deal with it.

```
[DKNightVersionManager addClassToSet:self.class];
[DKNightVersionManager removeClassToSet:self.class];
```

If you don't add your own classes to this set, `DKNightVersionManager` will prevent it from changing color when switch theme.

Use `respondClasseses` to get all respond classes which will change color when `nightFalling` or `dawnComing`.

```
NSSet *set = [DKNightVersionManager respondClasseses];
```

### JSON

There is a json file in `Generator` folder named `property.json`, you can add more color property, which will add night color to the corresponding property you want.

```
{
    "UIView": 
    [
        "backgroundColor"
    ],
    "UILabel":
    [ 
        "textColor"
    ],
    "UINavigationBar":
    [ 
        "barTintColor",
        "tintColor"
    ],
    "UITabBar":
    [ 
        "barTintColor"
    ],
    "UIButton":
    [ 
        "titleColor"
    ],
    "UIBarButtonItem":
    [ 
        "tintColor"
    ],
    "UITableView":
    [ 
        "separatorColor"
    ]
}
```

And run `rake` in terminal under folder `Pods/DKNightVersion` if you are using Cocoapods.

> This ruby script is based on the Cocoapods components [`Xcodeproj`](https://github.com/CocoaPods/Xcodeproj). If there is a  NoMethodError, you should install it first or run `bundle install` in `DKNightVersion` folder.

This command will automatically do everything for you.

## Picking Color

DKNightVersionManager will pick the proper color following this rule.

```
nightColor > normalColor
```

But I suggest to assign every UIKit component a night color to prevent errors.

# Contribute

Feel free to open an issue or pull request, if you need help or there is a bug.

# More

DKNightVersion doesn't support xib now. I am working on it.

# Contact

- Powered by [Draveness](http://github.com/draveness)
- Personal website [DeltaX](http://draveness.me)

# License

DKNightVersion is available under the MIT license. See the LICENSE file for more info.

# Todo

- Documentation
