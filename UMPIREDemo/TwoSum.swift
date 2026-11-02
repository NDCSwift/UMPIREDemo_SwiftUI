//
//  TwoSum.swift
//  UMPIREDemo
//
//  Puzzle one, worked through every UMPIRE step.
//
//  Understand: given a list of numbers and a target, return the positions
//  of the two numbers that add up to the target. Each input has exactly one
//  answer, and you can't use the same number twice.
//

import Foundation   // Needed for Date() in Race.swift's timing code.
import Playgrounds  // Provides the #Playground macro, which runs in Xcode's canvas.

// MARK: - Match: brute force

/// The first tool in the kit: check every pair.
///
/// It always works, which makes it a great baseline, but it compares
/// every number against every later number, so the work grows with the
/// square of the list's length.
func twoSumBruteForce(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        // Start at i + 1 so a number is never paired with itself,
        // and each pair is only checked once. On the last index this
        // range is empty, so a one-number list simply returns [].
        for j in (i + 1)..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

// MARK: - Plan + Implement: one pass with a Dictionary

/// The faster answer: "have I already seen this number's partner?"
///
/// The plan, in plain English:
/// 1. Make an empty dictionary: number → its position.
/// 2. Walk the list, with each number and its position.
/// 3. Work out the partner: target minus this number.
/// 4. Is the partner already in the dictionary?
/// 5. Yes: return its position and this one.
/// 6. No: remember this number and its position. Keep going.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // Step 1: a lookup that answers "where was this number?" without looping.
    var seen: [Int: Int] = [:]

    // Step 2: enumerated() hands back each position and value together.
    for (index, num) in nums.enumerated() {
        // Step 3: the number that would complete the pair.
        let complement = target - num

        // Steps 4–5: a dictionary lookup can miss, so it returns an
        // optional. `if let` only runs the body when the partner exists.
        if let complementIndex = seen[complement] {
            return [complementIndex, index]
        }

        // Step 6: remember this number *after* the lookup.
        // Review: move this line above the `if let` and [3, 2, 4] breaks,
        // because 3 finds itself as its own partner and returns [0, 0].
        seen[num] = index
    }
    return []
}

// MARK: - Review

// Open the canvas (Editor ▸ Canvas) and click Resume to run this.
// Expected output: [0, 1], [1, 2], [0, 1]
#Playground("Two Sum") {
    print(twoSum([2, 7, 11, 15], 9))
    print(twoSum([3, 2, 4], 6))
    print(twoSum([3, 3], 6))
}
