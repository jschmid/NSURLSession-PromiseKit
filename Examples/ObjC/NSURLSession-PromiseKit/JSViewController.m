//
//  JSViewController.m
//  NSURLSession-PromiseKit
//
//  Created by Jonas Schmid on 12/04/2014.
//  Copyright (c) 2014 Jonas Schmid. All rights reserved.
//

#import "JSViewController.h"

#import <PromiseKit/PromiseKit.h>
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

- (IBAction)downloadDataClick:(id)sender {
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

- (IBAction)downloadFileClick:(id)sender {
	NSURL *fileURL = [self localFileURL];

	NSURL *originURL = [NSURL URLWithString:@"http://pastebin.com/raw.php?i=1gdNuVSh"];
	[self.session promiseDownloadTaskWithURL:originURL toURL:fileURL].then( ^{
		NSLog(@"File downloaded to: %@", fileURL);
	}).catch( ^(NSError *e) {
		NSLog(@"Error: %@", e);
	});
}

- (IBAction)uploadClick:(id)sender {
	NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/post"];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
	request.HTTPMethod = @"POST";

	NSURL *fileURL = [self localFileURL];

	[self.session promiseUploadTaskWithRequest:request fromFile:fileURL].then( ^(NSData *data, NSURLResponse *response) {
		NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		NSLog(@"Result: %@", result);
	}).catch( ^(NSError *e) {
		NSLog(@"Error: %@", e);
	});
}

- (NSURL *)localFileURL {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = paths[0];
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"pastebinData.txt"];
	NSURL *fileURL = [NSURL fileURLWithPath:filePath];
	return fileURL;
}

@end
