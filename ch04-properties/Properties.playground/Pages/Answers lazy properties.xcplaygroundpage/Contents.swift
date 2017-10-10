//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Answers lazy properties

import Foundation

//: In this exercise we're modelling a music library. Think Apple Music or Spotify.

struct Song {
    let id: String
    let name: String
    let durationInSeconds: Int
    let rating: Float
    let date: Date
    let playCount: Int
}

class Artist {
    
    var name: String
    var birthDate: Date
    var songs: [Song]
    
    init(name: String, birthDate: Date, songs: [Song]) {
        self.name = name
        self.birthDate = birthDate
        self.songs = songs
    }
    
    func getAge() -> Int? {
        let years = Calendar.current
            .dateComponents([.year], from: Date(), to: birthDate)
            .day
        
        return years
    }
    
    func summary() -> (mostPlayed: Song, leastPlayed: Song) {
        let sortedSongs = songs.sorted { (lhs: Song, rhs: Song) -> Bool in
            lhs.playCount > rhs.playCount
        }
        sleep(2)
        return (mostPlayed: sortedSongs[0], leastPlayed: sortedSongs[sortedSongs.count-1])
    }
    
    func songsReleasedAfter(date: Date) -> [Song] {
        return songs.filter { (song: Song) -> Bool in
            return song.date > date
        }
        
    }
    
}

//: 1. Summary is now slow (a sleep has been added). Is it a candidate for a lazy property, why or why not?
//: No. Although it is beneficial to turn an expensive property into a lazy property. Summary however depends on a mutable variable such as song. If summary were to be lazy and songs to be added after, we'd silently introduce a bug.
//: A lazy property would be beneficial if we'd make songs an immutable let property.

//: 2. If you think it is, can you turn summary into a lazy property?
//: No, see 1

//: 3. What technique can you use to prevent outside code from mutating a lazy property?
//: By adding private(set) to a property.

let aintNoSunshine = Song(id: "1", name: "Ain't no shunshine", durationInSeconds: 125, rating: 3.6, date: Date(), playCount: 3_000_203)
let lovelyday = Song(id: "2", name: "Lovely day", durationInSeconds: 255, rating: 2.8, date: Date(), playCount: 1_212_298)
let songs = [aintNoSunshine, lovelyday]

var components = DateComponents()
components.day = 4
components.month = 7
components.year = 1938
let billWithers = Artist(name: "Bill Withers", birthDate: Calendar.current.date(from: components)!, songs: [aintNoSunshine, lovelyday])




//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)


