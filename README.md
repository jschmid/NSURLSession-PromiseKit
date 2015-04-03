# NSURLSession-PromiseKit

[![CI Status](http://img.shields.io/travis/jschmid/NSURLSession-PromiseKit.svg?style=flat)](https://travis-ci.org/jschmid/NSURLSession-PromiseKit)
[![Version](https://img.shields.io/cocoapods/v/NSURLSession-PromiseKit.svg?style=flat)](http://cocoadocs.org/docsets/NSURLSession-PromiseKit)
[![License](https://img.shields.io/cocoapods/l/NSURLSession-PromiseKit.svg?style=flat)](http://cocoadocs.org/docsets/NSURLSession-PromiseKit)
[![Platform](https://img.shields.io/cocoapods/p/NSURLSession-PromiseKit.svg?style=flat)](http://cocoadocs.org/docsets/NSURLSession-PromiseKit)

## Usage

Import the category

    #import "NSURLSession+PromiseKit.h"

Create a `NSURLSession` like you are used to:

	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

Then use the category messages to get a `PMKPromise` instead of a `NSURLSessionTask`.

    NSURL *url = [NSURL URLWithString:@"http://pastebin.com/raw.php?i=1gdNuVSh"];
	[self.session promiseDataTaskWithURL:url].then( ^(NSData *data, NSURLResponse *response) {
		NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		NSLog(@"Result: %@", result);
	}).catch( ^(NSError *e) {
		NSLog(@"Error: %@", e);
	});

### Example project

To try the example project, run:

    pod try 'NSURLSession-PromiseKit'

You can also clone the repo, run `pod install` from the Example directory, and open *NSURLSession-PromiseKit.xcworkspace*. 

## Requirements

## Installation

NSURLSession-PromiseKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'NSURLSession-PromiseKit'

## Author

Jonas Schmid, jonas.schmid@gmail.com

## License

NSURLSession-PromiseKit is available under the MIT license. See the LICENSE file for more info.

