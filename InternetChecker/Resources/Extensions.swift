//
//  Extensions.swift
//  InternetChecker
//
//  Created by Tim Akhmetov on 06.11.2025.
//
import Foundation
import Network
//
//extension Notification.Name {
//    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
//}
//
extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet
    ]
}
