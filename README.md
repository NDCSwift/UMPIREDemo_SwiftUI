# 🧩 Coding Puzzles in Swift: The UMPIRE Method

Work through a coding puzzle you've never seen before, step by step, in Swift. Two classic puzzles, Two Sum and Valid Parentheses, solved start to finish with `#Playground` in Xcode's canvas.

---

## 🤔 What this is

UMPIRE is a six-step method for solving a puzzle you don't already know the answer to:

| Step | What you do |
|---|---|
| **U**nderstand | Say the problem back in your own words. Write the inputs, outputs and edge cases. |
| **M**atch | Ask what it reminds you of, and pick a tool from the toolkit. |
| **P**lan | Write the steps in plain English before any code. |
| **I**mplement | Turn each plan step into code. |
| **R**eview | Run it by hand, like the compiler would. Try to break it. |
| **E**valuate | Ask how it scales as the input grows. |

This project runs both puzzles through all six steps:

1. **Two Sum.** Brute-force nested loops first, then a one-pass `Dictionary` lookup.
2. **The race.** Both Two Sum versions timed on 5,000 numbers, so you can see why the dictionary matters.
3. **Valid Parentheses.** The same six steps, faster, where Match picks a different tool: an `Array` used as a stack.

## 🧰 The Match-step toolkit

| The puzzle says… | Reach for… |
|---|---|
| Every pair | Nested loops. Always works, rarely fast. |
| Have I seen it? | `Dictionary` or `Set`: a lookup that doesn't loop. |
| Sorted, find a pair | Two pointers, one from each end. |
| A run in a row | Sliding window. |
| Last opened, first closed | Stack: an `Array` with `append` and `popLast()`. |
| Levels, shortest path | Breadth-first search with a queue. |

## ✅ Why you'd use it

- **A process, not memorized answers.** The second puzzle proves the method transfers to a problem with a different shape.
- **No app to run.** Every answer appears in Xcode's canvas through `#Playground`, so you can edit and see results immediately.
- **Commented for learning.** Each file explains the *why* behind each step, including the bugs worth making on purpose.

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/@NoahDoesCoding)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding).

---

## 🗂️ Project tour

| File | What it teaches |
|---|---|
| `TwoSum.swift` | Brute force with nested loops, then a `Dictionary` + `enumerated()` + `if let` one-pass solution, with the plan written out step by step |
| `Race.swift` | Evaluate: timing both versions with `Date().timeIntervalSince(_:)` to see how each one scales |
| `ValidParentheses.swift` | An `Array` as a stack (`append`, `popLast()`, `isEmpty`) and a `Dictionary` as a fixed lookup table |
| `ContentView.swift`, `UMPIREDemoApp.swift` | Unchanged App template files. The app itself is never run |

## 🚀 Getting Started

### 1. Clone

```bash
git clone https://github.com/NDCSwift/UMPIREDemo_SwiftUI.git
```

### 2. Open

Open `UMPIREDemo.xcodeproj` in Xcode.

### 3. Run a playground

Open `TwoSum.swift`, `Race.swift` or `ValidParentheses.swift`. If the canvas isn't showing, choose **Editor ▸ Canvas**, then click **Resume**. When a file has more than one playground, switch between them with the tabs at the top of the canvas.

No signing or simulator launch is needed to see the results.

## 🎯 Expected output

| Playground | Output |
|---|---|
| Two Sum | `[0, 1]`, `[1, 2]`, `[0, 1]` |
| Race | Nested loops: about 1.5 s · Dictionary: a couple of milliseconds (varies by Mac) |
| Valid Parentheses | `true`, `false`, `false`, `false` |

## 🧪 Try breaking it

- **Two Sum:** move `seen[num] = index` above the `if let`. Predict the output first, then check: `[3, 2, 4]` now returns `[0, 0]` because 3 finds itself.
- **Valid Parentheses:** change `return stack.isEmpty` to `return true`. Now `"(("` passes, because nothing checks for openers left on the stack.
- **Race:** double the count to `10_000`. The nested loops take about four times as long. The dictionary takes about twice as long.

## 🏋️ Keep practicing

Same puzzles, more puzzles, and places to check your answers:

- **Two Sum** on [LeetCode](https://leetcode.com/problems/two-sum/)
- **Valid Parentheses** on [LeetCode](https://leetcode.com/problems/valid-parentheses/)
- [NeetCode](https://neetcode.io/roadmap): a roadmap of puzzles grouped by pattern, a good next step after the toolkit above
- [HackerRank](https://www.hackerrank.com/domains/algorithms): algorithm practice with Swift as a supported language
- [Exercism Swift track](https://exercism.org/tracks/swift): free exercises with optional human mentoring
- [Codewars](https://www.codewars.com/): short puzzles ranked by difficulty, with Swift support
- [Advent of Code](https://adventofcode.com/): a yearly set of holiday-themed puzzles, solvable in any language

## 📚 References

- [Running code snippets using the playground macro](https://developer.apple.com/documentation/xcode/running-code-snippets-using-the-playground-macro)
- [`Dictionary`](https://developer.apple.com/documentation/swift/dictionary)
- [`Array.enumerated()`](https://developer.apple.com/documentation/swift/array/enumerated())
- [`Array.popLast()`](https://developer.apple.com/documentation/swift/array/poplast())
- [The Swift Programming Language: Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/)

## 🛠️ Notes

- **Canvas paused or blank?** Choose **Editor ▸ Canvas**, then click **Resume**. Press ⌥⌘P to refresh it.
- **Timings are from a Debug build**, which is what the canvas runs. An optimized build is much faster for both versions, but the gap still grows as the list grows.
- **`import Foundation` is required** for `Date()`. `import Playgrounds` alone won't find it.

## 📦 Requirements

- Xcode 26+ (`#Playground` and the Playgrounds framework)
- iOS 17+ deployment target
- Swift 5.9+ (builds clean in Swift 6 language mode with complete concurrency checking)

---

📺 [Watch the guide on YouTube](https://www.youtube.com/@NoahDoesCoding)
