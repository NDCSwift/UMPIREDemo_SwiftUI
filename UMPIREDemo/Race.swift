//
//  Race.swift
//  UMPIREDemo
//
//  Evaluate: both Two Sum answers are correct, so how do they scale?
//  This times each one on the same input and prints the results.
//

import Foundation
import Playgrounds

/// Runs both Two Sum versions on `1...count` and returns their times in seconds.
///
/// The target is the two largest numbers added together, so the matching
/// pair sits at the very end of the list. That's the worst case for both
/// versions: neither can stop early.
func race(_ count: Int) -> String {
    let nums = Array(1...count)
    let target = (count - 1) + count

    // Date().timeIntervalSince(_:) is a simple stopwatch: plenty for a
    // gap this large. Reach for Instruments when you need real profiling.
    var start = Date()
    _ = twoSumBruteForce(nums, target)
    let nested = Date().timeIntervalSince(start)

    start = Date()
    _ = twoSum(nums, target)
    let dictionary = Date().timeIntervalSince(start)

    return "Nested loops: \(nested)\nDictionary: \(dictionary)"
}

// The canvas runs a Debug build. On 5,000 numbers expect roughly a second
// and a half for the nested loops against a couple of milliseconds for the
// dictionary. Your numbers will vary by Mac.
//
// Try doubling the count: the nested loops take about four times as long,
// while the dictionary only takes about twice as long. An optimized
// (Release) build shrinks both times, but the gap still grows with the list.
#Playground("Race") {
    print(race(5_000))
}
