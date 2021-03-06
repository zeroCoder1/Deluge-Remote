//: Playground - noun: a place where people can play

import UIKit

typealias JSON = [String: Any]

extension Int {
    func transferRateString() -> String {
        return sizeString() + "/s"
    }

    func sizeString() -> String {
        return ByteCountFormatter.string(fromByteCount: Int64(self), countStyle: ByteCountFormatter.CountStyle.memory)
    }
}

let jsonData1 =
"""
{
    "id": "1135417108",
    "result": {
        "files_tree": {
            "type": "dir",
            "contents": {
                "Catch-22 (147)": {
                    "download": true,
                    "length": 742296,
                    "type": "dir",
                    "contents": {
                        "metadata.opf": {
                            "download": true,
                            "path": "Catch-22 (147)/metadata.opf",
                            "length": 3504,
                            "type": "file",
                            "index": 2
                        },
                        "cover.jpg": {
                            "download": true,
                            "path": "Catch-22 (147)/cover.jpg",
                            "length": 26213,
                            "type": "file",
                            "index": 1
                        },
                        "Catch-22 - Joseph Heller.mobi": {
                            "download": true,
                            "path": "Catch-22 (147)/Catch-22 - Joseph Heller.mobi",
                            "length": 712579,
                            "type": "file",
                            "index": 0
                        }
                    }
                }
            }
        },
        "name": "Catch-22 (147)",
        "info_hash": "bc5dfc6b86e4ce4f635d3036a79100bcfe9a1ec3"
    },
    "error": null
}
""".data(using: .utf8)!

let jsonData2 = """
{
"id": "1",
"result": {
"files_tree": {
"type": "dir",
"contents": {
"In.A.Lonely.Place.1950.DVDRip.XviD-MDX": {
"download": true,
"length": 751744065,
"type": "dir",
"contents": {
"Sample": {
"download": true,
"length": 7960576,
"type": "dir",
"contents": {
"lonely.place.sample-mdx.avi": {
"download": true,
"path": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX/Sample/lonely.place.sample-mdx.avi",
"length": 7960576,
"type": "file",
"index": 0
}
}
},
"In.A.Lonely.Place.1950.DVDRip.XviD-MDX.avi": {
"download": true,
"path": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX/In.A.Lonely.Place.1950.DVDRip.XviD-MDX.avi",
"length": 734631936,
"type": "file",
"index": 3
},
"Subs": {
"download": true,
"length": 9140765,
"type": "dir",
"contents": {
"lonely.place.subs-mdx.rar": {
"download": true,
"path": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX/Subs/lonely.place.subs-mdx.rar",
"length": 9140411,
"type": "file",
"index": 1
},
"lonely.place.subs-mdx.sfv": {
"download": true,
"path": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX/Subs/lonely.place.subs-mdx.sfv",
"length": 354,
"type": "file",
"index": 2
}
}
},
"lonely.place-mdx.nfo": {
"download": true,
"path": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX/lonely.place-mdx.nfo",
"length": 10788,
"type": "file",
"index": 4
}
}
}
}
},
"name": "In.A.Lonely.Place.1950.DVDRip.XviD-MDX",
"info_hash": "4d2352a604c7cb416c12ce85bee3b0d925563b7a"
},
"error": null
}
""".data(using: .utf8)!

let jsonData3 = """
{
"id": "1",
"result": {
"files_tree": {
"contents": {
"The New Confessions of An Economic Hit Man.epub": {
"download": true,
"index": 0,
"length": 4166871,
"type": "file"
}
}
},
"name": "The New Confessions of An Economic Hit Man.epub",
"info_hash": "ef74545675a02b8babc91f71ea744c94592fdea3"
},
"error": null
}
""".data(using: .utf8)!


let newTorrentJSON = """
{
  "id": "123",
  "result": {
    "files_tree": {
      "type": "dir",
      "contents": {
        "MSFC-9410863": {
          "download": true,
          "length": 101325,
          "type": "dir",
          "contents": {
            "MSFC-9410863_meta.xml": {
              "index": 2,
              "sha1": "d688c7c2570fe9a6da56de8d2a8cb54eaa81575b",
              "download": true,
              "length": 1569,
              "mtime": "1465494694",
              "crc32": "a6bf22ac",
              "path": "MSFC-9410863/MSFC-9410863_meta.xml",
              "type": "file",
              "md5": "fda5d980d7d4322e0f53591fbf272601"
            },
            "9410863_thumb.jpg": {
              "index": 1,
              "sha1": "5cf2c16abd8944bc2dd4d0a9b6d556781124fc51",
              "download": true,
              "length": 2202,
              "mtime": "1258671232",
              "crc32": "eb04704e",
              "path": "MSFC-9410863/9410863_thumb.jpg",
              "type": "file",
              "md5": "de0904a00673fc14806080e4ab37aff2"
            },
            "9410863.jpg": {
              "index": 0,
              "sha1": "11113b26c1eeb787dc89b03ded10db89c2c36548",
              "download": true,
              "length": 97554,
              "mtime": "1209330710",
              "crc32": "5b572fa3",
              "path": "MSFC-9410863/9410863.jpg",
              "type": "file",
              "md5": "bee3401be360acf37b12856d27ebaea9"
            }
          }
        }
      }
    },
    "name": "MSFC-9410863",
    "info_hash": "5a530fed125df99951c4ba3f811636d9c5aa1306"
  },
  "error": null
}
""".data(using: .utf8)!


struct UploadedTorrentInfo {
    let name: String
    let hash: String
    let files: UploadedTorrentFileNode
    
    init?(json: JSON) {
        guard let name = json["name"] as? String,
              let info_hash = json["info_hash"] as? String,
              let fileTree = json["files_tree"] as? JSON,
              let fileTreeContents = fileTree["contents"] as? JSON,
              let fileTreeRootKey = fileTreeContents.keys.first,
              let fileTreeRootJSON = fileTreeContents[fileTreeRootKey] as? JSON,
              let files = UploadedTorrentFileNode(fileName: name, json: fileTreeRootJSON)
        else { return nil }
        
        self.name = name
        self.hash = info_hash
        self.files = files
    }
}

struct UploadedTorrentFileNode {
    let download: Bool?
    let fileName: String
    let path: String?
    let length: Int?
    let isDirectory: Bool
    let index: Int?
    var children: [UploadedTorrentFileNode] = []

    init?(fileName: String, json: [String: Any]) {
        self.fileName = fileName
        self.download = json["download"] as? Bool
        self.path = json["path"] as? String
        self.length = json["length"] as? Int
        self.isDirectory = json["type"] as? String == "dir" ? true : false
        self.index = json["index"] as? Int

        if let children  = json["contents"] as? [String: Any] {
            for key in children.keys {
                if let innerContent = children[key] as? [String: Any],
                   let child = UploadedTorrentFileNode(fileName: key, json: innerContent) {
                    self.children.append(child)
                }
            }
        }
    }
}

extension UploadedTorrentFileNode {

    func prettyPrint() {
        print(self.fileName)

        for child in self.children where !child.isDirectory {
            print("\t\(child.fileName) - \(child.length?.sizeString() ?? "")")
        }
        for child in self.children where child.isDirectory {
            printChildrenHelper(node: child)
        }
    }

    private func printChildrenHelper(node: UploadedTorrentFileNode) {

        if !node.isDirectory {
            print("\t\t\(node.fileName) - \(node.length?.sizeString() ?? "") ")
        } else {
            print("\t/\(node.fileName)")
            for child in node.children {
                printChildrenHelper(node: child)
            }
        }

    }
}


func testParseNewTorrentInfo()
{
    guard
        let json = try? JSONSerialization.jsonObject(with: jsonData2) as? JSON,
        let result = json["result"] as? JSON,
        let info = UploadedTorrentInfo(json: result)
        else { return }
    
    info.files.prettyPrint()
}


testParseNewTorrentInfo()


"""
{
"077cd5bdbd381bfd7892bfcf85c0ffda02407d16": {
  "comment": "",
  "active_time": 1136741,
  "is_seed": true,
  "hash": "077cd5bdbd381bfd7892bfcf85c0ffda02407d16",
  "upload_payload_rate": 0,
  "move_completed_path": "/home/plexserver/files/Plex Media/TV/Plebs",
  "private": true,
  "total_payload_upload": 0,
  "paused": false,
  "seed_rank": 805306369,
  "seeding_time": 1150478,
  "max_upload_slots": -1,
  "prioritize_first_last": false,
  "distributed_copies": 0.0,
  "download_payload_rate": 0,
  "message": "OK",
  "num_peers": 0,
  "max_download_speed": -1.0,
  "max_connections": -1,
  "compact": false,
  "ratio": 1.5574924945831299,
  "total_peers": -1,
  "total_size": 7359464191,
  "total_wanted": 7359464191,
  "state": "Seeding",
  "file_priorities": [
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4
  ],
  "label": "tv",
  "max_upload_speed": -1.0,
  "remove_at_ratio": false,
  "tracker": "",
  "save_path": "/home/plexserver/files/TV/Plebs",
  "progress": 100.0,
  "time_added": 1484852992.0,
  "tracker_host": "freshon.tv",
  "total_uploaded": 11462310375,
  "files": [
    {
      "index": 0,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E01 The Beasts 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 0,
      "size": 917373391
    },
    {
      "index": 1,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E02 Justin Junior 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 917373391,
      "size": 929784171
    },
    {
      "index": 2,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E03 The Vestal 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 1847157562,
      "size": 935827566
    },
    {
      "index": 3,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E04 The Cupid 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 2782985128,
      "size": 921236173
    },
    {
      "index": 4,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E05 The Crimewave 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 3704221301,
      "size": 906376347
    },
    {
      "index": 5,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E06 Jugball 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 4610597648,
      "size": 906451890
    },
    {
      "index": 6,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E07 The New Master 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 5517049538,
      "size": 907247083
    },
    {
      "index": 7,
      "path": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT/Plebs S03E08 The Weatherist 1080p WEB-DL AAC2.0 H.264-SFT.mkv",
      "offset": 6424296621,
      "size": 935167570
    }
  ],
  "total_done": 7359464191,
  "num_pieces": 1755,
  "tracker_status": "freshon.tv: Error: expected value (list, dict, int or string) in bencoded string",
  "total_seeds": -1,
  "move_on_completed": false,
  "next_announce": 1746,
  "stop_at_ratio": false,
  "file_progress": [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0
  ],
  "move_completed": false,
  "piece_length": 4194304,
  "all_time_download": 7359869058,
  "move_on_completed_path": "/home/plexserver/files/Plex Media/TV/Plebs",
  "num_seeds": 0,
  "peers": [],
  "name": "Plebs.S03.1080p.WEB-DL.AAC2.0.H.264-SFT",
  "trackers": [
    {
      "send_stats": true,
      "fails": 0,
      "verified": false,
      "min_announce": null,
      "url": "http://tracker.freshon.tv/b267e50ac34cad655a80c21bf7d95d39/announce",
      "fail_limit": 0,
      "next_announce": null,
      "complete_sent": false,
      "source": 1,
      "start_sent": false,
      "tier": 0,
      "updating": false
    }
  ],
  "total_payload_download": 0,
  "is_auto_managed": true,
  "seeds_peers_ratio": 1.0,
  "queue": -1,
  "num_files": 8,
  "eta": 0,
  "stop_ratio": 2.0,
  "is_finished": true
}
""".data(using: .utf8)
