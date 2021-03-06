//
//  ClientsTableViewController.swift
//  Deluge Remote
//
//  Created by Rudy Bermudez on 12/18/16.
//  Copyright © 2016 Rudy Bermudez. All rights reserved.
//

import Houston
import UIKit
import Valet

protocol ClientsTableViewControllerDelegate: AnyObject {
    func showAddClientVC(with config: ClientConfig?, onConfigAdded: @escaping (ClientConfig)->())
}

class ClientsTableViewController: UITableViewController, Storyboarded {

    // MARK: - IBActions & Outlets
    @IBAction func AddClientAction(_ sender: UIBarButtonItem) {
        showAddClientVC()
    }
    
    // MARK: - Properties
    weak var delegate: ClientsTableViewControllerDelegate?
    
    var configs = [ClientConfig]()

    private let keychain = Valet.valet(with: Identifier(nonEmpty: "io.rudybermudez.Deluge-Remote")!,
                                       accessibility: .whenUnlocked)
    
    // MARK: - View Related Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if let configData = try? keychain.object(forKey: "ClientConfigs") {
            let decoder = JSONDecoder()
            if let configs = try? decoder.decode([ClientConfig].self, from: configData) {
                self.configs = configs
                tableView.reloadData()
            }
        }

        if configs.isEmpty {
           showAddClientVC()
        }
    }

    deinit {
        Logger.debug("Destroyed")
    }

    override func viewWillDisappear(_ animated: Bool) {
        if configs.isEmpty {
            try? keychain.removeObject(forKey: "ClientConfigs")
        } else {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(configs) {
                try? keychain.setObject(encoded, forKey: "ClientConfigs")
            }
        }
    }

    func showAddClientVC() {
 
        guard let delegate = delegate else { return }
        
        delegate.showAddClientVC(with: nil) { [weak self] config in
            if self?.configs.isEmpty ?? false {
                self?.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.accessoryType = .checkmark
                ClientManager.shared.activeClient = DelugeClient(config: config)
            }
            self?.configs.append(config)
            self?.navigationController?.popViewController(animated: true)
            self?.tableView.reloadData()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = configs[indexPath.row].nickname
        cell.selectionStyle = .none
        cell.accessoryType = .none
        if let client = ClientManager.shared.activeClient {
            if  client.clientConfig == configs[indexPath.row] {
                cell.accessoryType = .checkmark
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        ClientManager.shared.activeClient = DelugeClient(config: configs[indexPath.row])
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // swiftlint:disable:next line_length
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { [weak self] _, index in
            guard let self = self else { return }
            
            self.delegate?.showAddClientVC(with: self.configs[index.row]) { [weak self] config in
                guard let self = self else { return }
                if config == ClientManager.shared.activeClient?.clientConfig {
                    self.configs[index.row] = config
                    ClientManager.shared.activeClient = DelugeClient(config: config)
                    self.navigationController?.popViewController(animated: true)
                    self.tableView.reloadData()
                } else
                {
                    self.configs[index.row] = config
                    self.navigationController?.popViewController(animated: true)
                    self.tableView.reloadData()
                }
            }
        }
        edit.backgroundColor = .orange

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { _, index in
            print("Delete button tapped")

            ClientManager.shared.activeClient = nil
            self.configs.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .automatic)
        }
        delete.backgroundColor = .red

        return [delete, edit]
    }
}
