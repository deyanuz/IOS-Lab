import SwiftUI

struct ContentView: View {
    var moves: [String] = ["rock", "paper", "scissors"]
    @State private var player_1 = 0
    @State private var player_2 = 2
    @State private var player_1_points = 0
    @State private var player_2_points = 0
    @State private var count = 0
    @State private var winner = ""
    @State private var showWinner = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack {
                        Text("Player- 1")
                        Image(moves[player_1])
                            .resizable().frame(width: 150, height: 150)
                            .foregroundStyle(.tint)
                            .cornerRadius(20)
                        Text("Score")
                        Text("\(player_1_points)")
                    }
                    .padding()
                    
                    VStack {
                        Text("Player- 2")
                        Image(moves[player_2])
                            .resizable().frame(width: 150, height: 150)
                            .foregroundStyle(.tint)
                            .cornerRadius(20)
                        Text("Score")
                        Text("\(player_2_points)")
                    }
                    .padding()
                }
                
                Button("Run") {
                    count += 1
                    play()
                }
                
                if showWinner {
                    VStack {
                        Text("\(winner) wins!")
                            .fontWeight(.bold)
                            .padding()
                        Button("Close") {
                            resetGame()
                        }
                        .padding()
                    }
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                }
            }
        }
    }
    
    func play() {
        player_1 = Int.random(in: 0...2)
        player_2 = Int.random(in: 0...2)
        score()
        endGame()
    }
    
    func score() {
        if player_1 == 0 && player_2 == 1 {
            player_2_points += 1
        } else if player_1 == 0 && player_2 == 2 {
            player_1_points += 1
        } else if player_1 == 1 && player_2 == 2 {
            player_2_points += 1
        } else if player_2 == 0 && player_1 == 1 {
            player_1_points += 1
        } else if player_2 == 0 && player_1 == 2 {
            player_2_points += 1
        } else if player_2 == 1 && player_1 == 2 {
            player_1_points += 1
        }
    }
    
    func endGame() {
        if count >= 10 {
            count = 0
            if player_1_points > player_2_points {
                winner = "Player-1"
            } else if player_1_points < player_2_points {
                winner = "Player-2"
            } else {
                winner = "It's a tie!"
            }
            showWinner = true
        }
    }
    
    func resetGame() {
        player_1_points = 0
        player_2_points = 0
        count = 0
        showWinner = false
    }
}

#Preview {
    ContentView()
}
