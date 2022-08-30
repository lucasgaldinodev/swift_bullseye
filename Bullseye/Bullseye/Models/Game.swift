    //
    //  Game.swift
    //  Bullseye
    //
    //  Created by Lucas on 10/08/22.
    //

import Foundation

struct LeaderboardEntry {
  let score: Int
  let round: Int
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []

  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, round: 1))
      leaderboardEntries.append(LeaderboardEntry(score: 80, round: 2))
      leaderboardEntries.append(LeaderboardEntry(score: 200, round: 3))
      leaderboardEntries.append(LeaderboardEntry(score: 50, round: 4))
      leaderboardEntries.append(LeaderboardEntry(score: 20, round: 5))
    }
  }

  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }

    mutating func addToLeaderboard(point: Int, round: Int) {
      leaderboardEntries.append(LeaderboardEntry(score: point, round: (round - 1)))
    leaderboardEntries.sort { $0.score > $1.score }
  }

  mutating func startNewRound(points: Int) {
    score = points
    round += 1
    target = Int.random(in: 1...100)
      addToLeaderboard(point: points, round: round)
  }

  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }

}
