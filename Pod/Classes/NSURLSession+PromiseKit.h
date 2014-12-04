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

/**
   Creates an HTTP GET request promise for the specified URL.

   @param url The `http` or `https` URL to be retrieved.
   @return NSData *data, NSURLResponse *
 */
- (PMKPromise *)promiseDataTaskWithURL:(NSURL *)url;

/**
   Creates an HTTP request promise based on the specified URL request object.

   @param request An object that provides request-specific information such as the URL, cache policy, request type, and body data or body stream.
   @return NSData *data, NSURLResponse *
 */
- (PMKPromise *)promiseDataTaskWithRequest:(NSURLRequest *)request;


- (PMKPromise *)promiseDownloadTaskWithURL:(NSURL *)url;
- (PMKPromise *)promiseDownloadTaskWithRequest:(NSURLRequest *)request;
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData;
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL;

@end
