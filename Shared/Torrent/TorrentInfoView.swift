//
//  TorrentInfoView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/29/20.
//

import SwiftUI

struct TorrentInfoView: View {
    let torrent: Torrent
    @State private var showPeers = false
    
    var body: some View {
        List {
            Section(header:Text("Basic Info"))
            {
                ContentRow(label: "Name", detail: torrent.name)
                ContentRow(label: "State", detail: torrent.state)
                if torrent.eta != 0,
                   let eta = torrent.eta.timeRemainingString()
                {
                    ContentRow(label: "ETA", detail: eta)
                }
                ContentRow(label: "Completed", detail: "\(torrent.progress.description)%")
                ContentRow(label: "Size", detail: torrent.total_size.sizeString() )
                ContentRow(label: "Ratio", detail: torrent.ratioText)
                ContentRow(label: "Status", detail: torrent.message)
            }
            
            Section(header: Text("Download Info"))
            {
                ContentRow(label: "Downloaded", detail: torrent.all_time_download.sizeString() )
                ContentRow(label: "Uploaded", detail: torrent.total_uploaded.sizeString() )
                ContentRow(label: "Download Speed", detail: torrent.download_payload_rate.transferRateString())
                ContentRow(label: "Upload Speed", detail: torrent.upload_payload_rate.transferRateString())
            }
            
            Section(header: Text("Tracker Info"))
            {
                ContentRow(label: "Tracker", detail: torrent.tracker_host)
                ContentRow(label: "Tracker Status", detail: torrent.tracker_status)
                ContentRow(label: "Next Announce", detail: torrent.next_announce.timeRemainingString(unitStyle: .abbreviated)!)
                ContentRow(label: "Seeds Connected", detail: "\(torrent.num_seeds) (\(torrent.total_seeds))")
                
    
                DisclosureGroup( isExpanded: $showPeers,
                    content: {
                            ForEach(torrent.peers) { peer in
                                TorrentPeerRow(peerData: peer)
                            }
                        },
                    label: { ContentRow(label: "Peers Connected", detail: "\(torrent.num_peers) (\(torrent.total_peers))")
                })
            }
            
            Section(header:Text("Additional Data"))
            {
                if let activeTime = torrent.active_time?.toTimeString() {
                    ContentRow(label: "Active Time", detail:  activeTime)
                }
                if let seedTime = torrent.seeding_time.toTimeString()
                {
                    ContentRow(label: "Seeding Time", detail: seedTime)
                }
                
                ContentRow(label: "Auto Managed", detail: torrent.is_auto_managed ? "True" : "False")
                ContentRow(label: "Pieces", detail: "\(torrent.num_pieces) (\(Int(torrent.piece_length).sizeString()))")
                ContentRow(label: "Hash", detail: torrent.hash)
                if !torrent.comment.isEmpty
                {
                    ContentRow(label: "Comments", detail: torrent.comment)
                }
                
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct TorrentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            TorrentInfoView(torrent: torrents[0])
        }
        
    }
}
