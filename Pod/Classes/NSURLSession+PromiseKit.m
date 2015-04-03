#import "NSURLSession+PromiseKit.h"
#import <PromiseKit/PromiseKit.h>

@implementation NSURLSession (PromiseKit)

- (PMKPromise *)promiseDataTaskWithURL:(NSURL *)url {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            fulfill(PMKManifold(data, response));
			}
		}];
	    [task resume];
	}];
}

- (PMKPromise *)promiseDataTaskWithRequest:(NSURLRequest *)request {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            fulfill(PMKManifold(data, response));
			}
		}];
	    [task resume];
	}];
}

- (PMKPromise *)promiseDownloadTaskWithURL:(NSURL *)URL toURL:(NSURL *)toURL {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self downloadTaskWithURL:URL completionHandler: ^(NSURL *location, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            NSError *e = nil;
	            [[NSFileManager defaultManager] moveItemAtURL:location toURL:toURL error:&e];
	            fulfill(e);
			}
		}];
	    [task resume];
	}];
}

- (PMKPromise *)promiseDownloadTaskWithRequest:(NSURLRequest *)request toURL:(NSURL *)toURL {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self downloadTaskWithRequest:request completionHandler: ^(NSURL *location, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            NSError *e = nil;
	            [[NSFileManager defaultManager] moveItemAtURL:location toURL:toURL error:&e];
	            fulfill(e);
			}
		}];
	    [task resume];
	}];
}

- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self uploadTaskWithRequest:request fromData:bodyData completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            fulfill(PMKManifold(data, response));
			}
		}];
	    [task resume];
	}];
}

- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL {
	return [PMKPromise new: ^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
	    NSURLSessionTask *task = [self uploadTaskWithRequest:request fromFile:fileURL completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
	        if (error) {
	            reject(error);
			}
	        else {
	            fulfill(PMKManifold(data, response));
			}
		}];
	    [task resume];
	}];
}

@end
