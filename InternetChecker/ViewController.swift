//
//  ViewController.swift
//  InternetChecker
//
//  Created by Tim Akhmetov on 06.11.2025.
//

import UIKit
import Network

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private let mainCheckLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("MainMessage", comment: "")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("MainCheckMessage", comment: "")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("checking_status", comment: "")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView = UIStackView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNotification()
        updateInitialStatus()
        setupConstraint()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .systemGreen
        
        stackView = UIStackView(arrangedSubviews: [mainCheckLabel, checkLabel, statusLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleConnectivityChange),
                                               name: .connectivityStatus,
                                               object: nil)
    }
    
    private func updateInitialStatus() {
        handleConnectivityChange()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - Actions
    @objc private func handleConnectivityChange() {
        let monitor = NetworkMonitor.shared
        
        DispatchQueue.main.async {
            self.updateUIForConnectionStatus(isConnected: monitor.isConnected,
                                             connectionType: monitor.currentConnectionType)
        }
    }
    
    // Обновление UI при изменении сети
    private func updateUIForConnectionStatus(isConnected: Bool, connectionType: NWInterface.InterfaceType?) {
        if isConnected {
            view.backgroundColor = .systemGreen
            statusLabel.text = String(format: NSLocalizedString("connected_via", comment: ""),
                                      connectionTypeName(connectionType))
            print("Connected via \(connectionTypeName(connectionType))")
        } else {
            view.backgroundColor = .systemRed
            statusLabel.text = NSLocalizedString("not_connected", comment: "")
            print("Not connected")
        }
        
        // Обновляем status bar style
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func connectionTypeName(_ type: NWInterface.InterfaceType?) -> String {
        guard let type = type else { return NSLocalizedString("unknown", comment: "") }
        
        switch type {
        case .wifi: return NSLocalizedString("wifi", comment: "")
        case .cellular: return NSLocalizedString("cellular", comment: "")
        case .wiredEthernet: return NSLocalizedString("ethernet", comment: "")
        default: return NSLocalizedString("unknown", comment: "")
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return view.backgroundColor == .systemRed ? .lightContent : .darkContent
    }
}
