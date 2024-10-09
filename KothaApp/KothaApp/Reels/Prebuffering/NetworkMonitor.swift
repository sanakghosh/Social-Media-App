//
//  NetworkMonitor.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import Network

class NetworkMonitor {
    private let monitor: NWPathMonitor // Monitors network path changes
    private let queue = DispatchQueue(label: "NetworkMonitor") // Queue for handling network updates
    
    // Closure to handle network status changes
    var networkStatusChange: ((NWPath.Status) -> Void)?
    
    // Initializer to set up the network monitor
    init() {
        monitor = NWPathMonitor()
        
        // Set the path update handler to respond to network changes
        monitor.pathUpdateHandler = { [weak self] path in
            self?.networkStatusChange?(path.status) // Notify about network status changes
        }
        
        // Start monitoring on the specified queue
        monitor.start(queue: queue)
    }
    
    // Deinitializer to stop monitoring when the instance is deallocated
    deinit {
        monitor.cancel() // Stop monitoring
    }
}

