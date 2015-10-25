import Foundation
import PromiseKit

public extension NSURLSession {
    public func promiseDataTask(url: NSURL) -> Promise<(NSData, NSURLResponse)> {
        return Promise { fulfill, reject in
            let task = self.dataTaskWithURL(url) { data, response, error in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(data!, response!)
                }
            }
            task.resume()
        }
    }

    public func promiseDataTask(request: NSURLRequest) -> Promise<(NSData, NSURLResponse)> {
        return Promise { fulfill, reject in
            let task = self.dataTaskWithRequest(request) { data, response, error in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(data!, response!)
                }
            }
            task.resume()
        }
    }

    public func promiseDownloadTask(url: NSURL, toURL: NSURL) -> Promise<Void> {
        return Promise { fulfill, reject in
            let task = self.downloadTaskWithURL(url) { fileURL, response, error in
                if let error = error {
                    reject(error)
                } else {
                    do {
                        try NSFileManager.defaultManager().moveItemAtURL(fileURL!, toURL: toURL)
                        fulfill()
                    } catch {
                        reject(error)
                    }
                }
            }
            task.resume()
        }
    }

    public func promiseDownloadTask(request: NSURLRequest, toURL: NSURL) -> Promise<Void> {
        return Promise { fulfill, reject in
            let task = self.downloadTaskWithRequest(request) { fileURL, response, error in
                if let error = error {
                    reject(error)
                } else {
                    do {
                        try NSFileManager.defaultManager().moveItemAtURL(fileURL!, toURL: toURL)
                        fulfill()
                    } catch {
                        reject(error)
                    }
                }
            }
            task.resume()
        }
    }

    public func promiseUploadTask(request: NSURLRequest, fromData data: NSData) -> Promise<(NSData, NSURLResponse)> {
        return Promise { fulfill, reject in
            let task = self.uploadTaskWithRequest(request, fromData: data) { data, response, error in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(data!, response!)
                }
            }
            task.resume()
        }
    }

    public func promiseUploadTask(request: NSURLRequest, fromFile file: NSURL) -> Promise<(NSData, NSURLResponse)> {
        return Promise { fulfill, reject in
            let task = self.uploadTaskWithRequest(request, fromFile: file) { data, response, error in
                if let error = error {
                    reject(error)
                } else {
                    fulfill(data!, response!)
                }
            }
            task.resume()
        }
    }
}