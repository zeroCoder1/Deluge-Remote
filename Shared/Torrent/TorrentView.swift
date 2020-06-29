//
//  TorrentView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct TorrentView: View {
    
    let torrent: Torrent
    
    var body: some View {
        iOScontent
    }
    
    var iOScontent: some View {
        List {
            Section(header:Text("Basic Info"))
            {
                ContentRow(label: "State", detail: torrent.state)
                if torrent.eta != 0,
                   let eta = torrent.eta.timeRemainingString()
                {
                    ContentRow(label: "ETA", detail: eta)
                }
                ContentRow(label: "Completed", detail: "\(torrent.progress.description)%")
                ContentRow(label: "Size", detail: torrent.total_size.sizeString() )
                ContentRow(label: "Ratio", detail: torrent.ratioText)
            }
            
            Section(header: Text("Download Info"))
            {
                ContentRow(label: "Downloaded", detail: torrent.all_time_download.sizeString() )
                ContentRow(label: "Uploaded", detail: torrent.total_uploaded.sizeString() )
                ContentRow(label: "Download Speed", detail: torrent.download_payload_rate.transferRateString())
                ContentRow(label: "Upload Speed", detail: torrent.upload_payload_rate.transferRateString())
                ContentRow(label: "Seeds Connected", detail: "\(torrent.num_seeds)")
                ContentRow(label: "Peers Connected", detail: "\(torrent.num_peers)")
            }
            
            Section(header: Text("Tracker Info"))
            {
                ContentRow(label: "Tracker", detail: torrent.tracker_host)
                ContentRow(label: "Tracker Status", detail: torrent.upload_payload_rate.transferRateString())
                ContentRow(label: "Seeds Connected", detail: "\(torrent.num_seeds)")
                ContentRow(label: "Peers Connected", detail: "\(torrent.num_peers)")
            }
        }
        .navigationTitle("Torrent Details")
        .listStyle(InsetGroupedListStyle())
    }
}


struct TorrentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            TorrentView(torrent: torrents[0])
        }
        
    }
}


