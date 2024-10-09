//
//  MediaCache.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import Foundation

class MediaCache {
    
    // Singleton instance
    static let shared = MediaCache()
    
    // FileManager instance to handle file system operations
    private let fileManager = FileManager.default
    
    // Cache directory for storing video files
    private let cacheDirectory: URL
    
    // Initializer to set up cache directory
    init() {
        // Create the path for the cache directory
        cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("VideoCache")
        createCacheDirectory()
    }
    
    // Create the cache directory if it doesn't exist
    private func createCacheDirectory() {
        do {
            // Create the directory for cached videos
            try fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Failed to create cache directory: \(error)")
        }
    }
    
    // Generate a file URL for the given video URL in the cache directory
    func cacheUrl(for url: URL) -> URL {
        return cacheDirectory.appendingPathComponent(url.lastPathComponent)
    }
    
    // Save video data to the cache for a given URL
    func save(data: Data, for url: URL) {
        let fileUrl = cacheUrl(for: url)
        do {
            // Write the data to the cache directory
            try data.write(to: fileUrl)
        } catch {
            print("Failed to write file to cache: \(error)")
        }
    }
    
    // Retrieve cached data for a given URL, if it exists
    func data(for url: URL) -> Data? {
        let fileUrl = cacheUrl(for: url)
        return try? Data(contentsOf: fileUrl)
    }
    
    // Clear all cached videos
    func clearCache() {
        do {
            // Get the list of files in the cache directory
            let files = try fileManager.contentsOfDirectory(atPath: cacheDirectory.path)
            for file in files {
                let filePath = cacheDirectory.appendingPathComponent(file).path
                // Remove each file
                try fileManager.removeItem(atPath: filePath)
            }
        } catch {
            print("Failed to clear cache directory: \(error)")
        }
    }
}

