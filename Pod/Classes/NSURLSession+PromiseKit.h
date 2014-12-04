#import <Foundation/Foundation.h>

#import "PromiseKit.h"

@interface NSURLSession (PromiseKit)

/**
   Creates an HTTP GET request promise for the specified URL.

   @param url The `http` or `https` URL to be retrieved.
   @return NSData *, NSURLResponse *
 */
- (PMKPromise *)promiseDataTaskWithURL:(NSURL *)url;

/**
   Creates an HTTP request promise based on the specified URL request object.

   @param request An object that provides request-specific information such as the URL, cache policy, request type, and body data or body stream.
   @return NSData *, NSURLResponse *
 */
- (PMKPromise *)promiseDataTaskWithRequest:(NSURLRequest *)request;

/**
   Creates a download task promise for the specified URL and saves the results to a file.

   @param url An NSURL object that provides the URL to download.
   @return NSURL *, NSURLResponse *
 */
- (PMKPromise *)promiseDownloadTaskWithURL:(NSURL *)url;

/**
   Creates a download task promise for the specified URL request and saves the results to a file.

   @param request An NSURLRequest object that provides the URL, cache policy, request type, body data or body stream, and so on.
   @return NSURL *, NSURLResponse *
 */
- (PMKPromise *)promiseDownloadTaskWithRequest:(NSURLRequest *)request;

/**
   Creates an HTTP request promise for the specified URL request object and uploads the provided data object.

   @param request An NSURLRequest object that provides the URL, cache policy, request type, and so on. The body stream and body data in this request object are ignored.
   @param bodyData The body data for the request.
   @return NSData *, NSURLResponse *
 */
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData;

/**
   Creates an HTTP request promise for uploading the specified file URL.

   @param request An NSURLRequest object that provides the URL, cache policy, request type, and so on. The body stream and body data in this request object are ignored.
   @param fileURL The URL of the file to upload.
   @return NSData *, NSURLResponse *
 */
- (PMKPromise *)promiseUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL;

@end
