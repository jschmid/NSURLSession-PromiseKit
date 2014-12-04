//
//  JSViewController.m
//  NSURLSession-PromiseKit
//
//  Created by Jonas Schmid on 12/04/2014.
//  Copyright (c) 2014 Jonas Schmid. All rights reserved.
//

#import "JSViewController.h"

#import "NSURLSession+PromiseKit.h"

@interface JSViewController ()

@property NSURLSession *session;

@end

@implementation JSViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	self.session = [NSURLSession sessionWithConfiguration:configuration];
}

- (IBAction)downloadClick:(id)sender {
	NSURL *url = [NSURL URLWithString:@"http://pastebin.com/raw.php?i=1gdNuVSh"];
	[self.session promiseDataTaskWithURL:url].then( ^(NSData *data, NSURLResponse *response) {
		NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		NSLog(@"Result: %@", result);
	}).catch( ^(NSError *e) {
		NSLog(@"Error: %@", e);
	});
}

- (IBAction)errorClick:(id)sender {
	NSURL *url = [NSURL URLWithString:@"http://fakeurl"];
	[self.session promiseDataTaskWithURL:url].then( ^(NSData *data, NSURLResponse *response) {
		NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		NSLog(@"Result: %@", result);
	}).catch( ^(NSError *e) {
		NSLog(@"Error: %@", e);
	});
}

@end
