//
//  OfflineData.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/29/20.
//

import Foundation

let torrents: [Torrent] = {
    
    guard
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json"),
        let jsonData = try? Data(contentsOf: jsonURL, options: .mappedIfSafe)
    else {
        fatalError("Could not load data.json.")
    }
    
    do
    {
        let response = try JSONDecoder().decode(DelugeResponse<[String:Torrent]>.self, from: jsonData)
        return Array(response.result.values)
    }
    catch
    {
        fatalError("\(error)")
    }
}()

let fileStructure: TorrentFileStructure = {
    guard
        let jsonPath = Bundle.main.url(forResource: "dirs", withExtension: "json"),
        let jsonData = try? Data(contentsOf: jsonPath, options: .mappedIfSafe)
    else {
        fatalError("Could not load data.json.")
    }
    do
            {
                let response = try JSONDecoder().decode(DelugeResponse<TorrentFileStructure>.self, from: jsonData)
                return response.result
            }
    catch
    {
        fatalError("\(error)")
    }
}()
