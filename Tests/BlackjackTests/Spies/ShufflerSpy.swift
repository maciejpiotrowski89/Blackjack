//
//  File.swift
//  BlackjackTests
//
//  Created by Maciej Piotrowski on 4/3/19.
//

import Shuffling

final class ShufflerSpy: Shuffling {
    var shuffleCalled = false
    var collectionForShuffling: Any?
    var shuffledCollection: Any?
    func shuffle<T: Collection>(_ collection: T) -> [T.Iterator.Element] {
        shuffleCalled = true
        collectionForShuffling = collection
        let shuffled = Array(collection).shuffled()
        shuffledCollection = shuffled
        return shuffled
    }
}
