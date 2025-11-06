//
//  NetworkMonitor.swift
//  InternetChecker
//
//  Created by Tim Akhmetov on 06.11.2025.
//  Мониторинг сетевого подключения

// 2. Улучшенный NetworkMonitor.swift

import Foundation
import Network

extension Notification.Name {
    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
}

final class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor", attributes: .concurrent)
    private let monitor: NWPathMonitor

    private(set) var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?

    private init() {
        monitor = NWPathMonitor()
    }

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            self.updateConnectionStatus(path)
            self.notifyStatusChange()
        }
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }

    private func updateConnectionStatus(_ path: NWPath) {
        isConnected = path.status == .satisfied
        isExpensive = path.isExpensive
        currentConnectionType = resolveConnectionType(path)
    }

    private func resolveConnectionType(_ path: NWPath) -> NWInterface.InterfaceType {
        if path.usesInterfaceType(.wifi) { return .wifi }
        if path.usesInterfaceType(.cellular) { return .cellular }
        if path.usesInterfaceType(.wiredEthernet) { return .wiredEthernet }
        return .other
    }

    private func notifyStatusChange() {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .connectivityStatus, object: nil)
        }
    }
}
