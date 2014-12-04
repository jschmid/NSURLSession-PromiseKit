//
//  NSURLSession+PromiseKit.h
//  salesamp
//
//  Created by Jonas Schmid on 04/12/14.
//  Copyright (c) 2014 utribo SA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PromiseKit.h"

@interface NSURLSession (PromiseKit)

- (PMKPromise *)promiseDataTaskWithURL:(NSURL *)url;
- (PMKPromise *)promiseDataTaskWithRequest:(NSURLRequest *)request;
- (PMKPromise *)promiseDownloadTaskWithURL:(NSURL *)url;
- (PMKPromise *)promiseDownloadTaskWithRequest:(NSURLRequest *)request;
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData;
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL;

@end
