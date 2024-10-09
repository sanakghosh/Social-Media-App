//
//  CustomResourceLoaderDelegate.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import AVFoundation

class CustomResourceLoaderDelegate: NSObject, AVAssetResourceLoaderDelegate {
    private var cache: MediaCache  // MediaCache is a custom class to manage your cached data
    
    init(cache: MediaCache) {
        self.cache = cache
        super.init()
    }
    
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader, shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest) -> Bool {
        guard let requestedURL = loadingRequest.request.url else {
            loadingRequest.finishLoading(with: NSError(domain: "com.iosdevdose.KothaApp", code: -1, userInfo: nil))
            return false
        }
        
        guard let url = loadingRequest.request.url, let scheme = url.scheme, scheme == "customscheme" else {
            loadingRequest.finishLoading(with: NSError(domain: "com.yourapp.error", code: -2, userInfo: nil))
            return false
        }
        
        // Replace custom scheme with https
        let originalURLString = url.absoluteString.replacingOccurrences(of: "customscheme://", with: "https://")
        
        if let originalURL = URL(string: originalURLString), let data = MediaCache.shared.data(for: originalURL) {
            // If data is available in the cache, respond with the cached data
            loadingRequest.dataRequest?.respond(with: data)
            loadingRequest.finishLoading()
        } else {
            // Download data if not available in the cache
            if let originalURL = URL(string: originalURLString) {
                downloadData(for: originalURL, loadingRequest: loadingRequest)
            }
        }
        
        
        // Check if data is already cached
        if let cachedData = cache.data(for: requestedURL) {
            // If data exists in cache, use it to fulfill the request
            loadingRequest.contentInformationRequest?.contentType = AVFileType.mp4.rawValue
            loadingRequest.contentInformationRequest?.isByteRangeAccessSupported = true
            loadingRequest.contentInformationRequest?.contentLength = Int64(cachedData.count)
            
            loadingRequest.dataRequest?.respond(with: cachedData)
            loadingRequest.finishLoading()
            return true
        } else {
            // Download the data, cache it, then respond
            downloadData(for: requestedURL) { data in
                self.cache.save(data: data, for: requestedURL)
                loadingRequest.dataRequest?.respond(with: data)
                loadingRequest.finishLoading()
            }
            return true
        }
//        return true
    }
    
    private func downloadData(for url: URL, completion: @escaping (Data) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                completion(data)
            } else {
                // Handle errors or provide fallback data
                print("Failed to download data: \(String(describing: error))")
            }
        }
        task.resume()
    }
    
    private func downloadData(for url: URL, loadingRequest: AVAssetResourceLoadingRequest) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                loadingRequest.finishLoading(with: error)
                return
            }
            
            // Save data to cache and respond to the request
            MediaCache.shared.save(data: data, for: url)
            loadingRequest.dataRequest?.respond(with: data)
            loadingRequest.finishLoading()
        }
        
        task.resume()
    }
    
}
