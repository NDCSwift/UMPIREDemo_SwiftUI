//
//  ValidParentheses.swift
//  UMPIREDemo
//
//  Puzzle two: the same six UMPIRE steps, run faster.
//
//  Understand: a string holds only the characters ( ) [ ] { }. It's valid
//  when every opener is closed by the same kind of bracket, in the right
//  order, and nothing is left open at the end.
//
//  Match: "last opened, first closed" is the shape of a stack.
//  In Swift, a plain Array is a stack: append to push, popLast() to pop.
//

import Foundation
import Playgrounds

func isValid(_ s: String) -> Bool {
    // A fixed lookup table: each closer → the opener it must match.
    // Checking `pairs[char]` also tells us whether `char` is a closer at all.
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]

    // Openers waiting to be closed, most recent on top (the end).
    var stack: [Character] = []

    for char in s {
        if let opener = pairs[char] {
            // A closer: it must match the most recent opener.
            // popLast() returns nil on an empty stack, and nil never equals
            // an opener, so a lone ")" is correctly rejected too.
            if stack.popLast() != opener {
                return false
            }
        } else {
            // An opener: push it and wait for its partner.
            stack.append(char)
        }
    }

    // Review: returning `true` here looks right, but "((" would pass.
    // Anything still on the stack is an opener that was never closed.
    return stack.isEmpty
}

// Expected output: true, false, false, false
#Playground("Valid Parentheses") {
    print(isValid("([])"))  // Nested correctly.
    print(isValid("(]"))    // Wrong kind of closer.
    print(isValid("(("))    // Openers left over at the end.
    print(isValid(")"))     // A closer with nothing to close.
}
