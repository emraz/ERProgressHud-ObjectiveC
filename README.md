# ERProgressHud-ObjectiveC

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
2. Drag ERPogressHud/ERPogressHud folder to Xcode project.Make sure to select Copy items if needed.
3. In the source files where you need to use the library, import the header file.
#import "ERProgressHud.h"

## How To Use

// Simple ProgressHud without Title<br />
    ```
    [[ERProgressHud sharedInstance] show];
    ```

// Blur Background View ProgressHud without Title<br />
        ```
    [[ERProgressHud sharedInstance] showWithBlurView];
    ```

// Simple ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showWithTitle:@"Loading..."];
    ```

// Simple ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showBlurViewWithTitle:@"Loading..."];
    ```
    
// Simple ProgressHud with Title<br />
        ```
    [[ERProgressHud sharedInstance] showDarkBackgroundViewWithTitle:@"Loading..."];
    ```
    
// Hide ProgressHud<br />
        ```
    [[ERProgressHud sharedInstance] hide];
    ```
