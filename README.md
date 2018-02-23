# ERProgressHud-ObjectiveC
*Made with love and passion*

## Introduction
* A simple Progresshud written in ObjectiveC.
* Five different kinds of ProgressHud is implemented to use.
* Easy to customize.
* ProgressHud With various options.
* Easy to add title.
* Blur Background View.
* Dark Background View.

## Demo
![Demo Video](/../master/demo.gif?raw=true)
## Requirements 
* iOS 9.0+
* Xcode 8.0 +
* Objective C

## Installation
1. Download the least source files.
2. Drag ERPogressHud/ERPogressHud folder to Xcode project. Make sure to select Copy items if needed.
3. In the source files where you need to use the library, import the header file.

#import "ERProgressHud.h"

## How To Use

// Show Simple ProgressHud without Title<br />
    ```
    [[ERProgressHud sharedInstance] show];
    ```

// Show Blur Background View ProgressHud without Title<br />
        ```
    [[ERProgressHud sharedInstance] showWithBlurView];
    ```

// Show Transparent Background View ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showWithTitle:@"Loading..."];
    ```

// Show Blur Background View ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showBlurViewWithTitle:@"Loading..."];
    ```
    
// Show Dark Background View ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showDarkBackgroundViewWithTitle:@"Loading..."];
    ```
    
// Dismiss ProgressHud<br />
        ```
    [[ERProgressHud sharedInstance] hide];
    ```
    
## License
ERProgressHud is released under the MIT license. See LICENSE for details.


