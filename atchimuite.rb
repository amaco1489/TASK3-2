require "csv"

# class AtchimuiteGame
  
  def janken
    puts "じゃんけん・・・"
    puts "1.グー / 2.チョキ / 3.パー / 0.終了"
    hands = ["終了","グー","チョキ","パー"]
    my_hand = gets.to_i
    your_hand = rand(1..3)
    @case_patturn = ""
    if my_hand == 0
      puts "-------------"
      puts "また今度！"
      puts "-------------"
      exit
    elsif my_hand <= 3
      puts "-------------"
      puts "ぽん！"
      puts "あなた : #{hands[my_hand]}"
      puts "相　手 : #{hands[your_hand]}"
      puts "-------------"
      if  my_hand == your_hand
        puts "もう一度！"
        return janken
      elsif (my_hand == 1 && your_hand == 2) || (my_hand == 2 && your_hand == 3) || (my_hand == 3 && your_hand == 1) 
        puts "あなたの勝ち！"
        @case_patturn = "win"
        return atchimuite
      else (my_hand == 1 && your_hand == 3) || (my_hand == 2 && your_hand == 1) || (my_hand == 3 && your_hand == 2) 
        puts "あなたの負け！"
        @case_patturn = "lose"
        return atchimuite
      end
    else
      puts "0〜3を入力してね"
      return janken
    end
  end
  
  def atchimuite
    puts "あっち向いて・・・"
    puts "1.左 / 2.上 / 3.右 / 4.下 / 0.終了"
    my_face = gets.to_i
    your_face = rand(1..4)
    faces = ["終了","左","上","右","下"]
    if my_face == 0
      puts "-------------"
      puts "中途歯半端過ぎる！笑"
      puts "1.続ける / 0.終了"
      puts "-------------"
      my_select = gets.to_i
      if my_select == 1
        return atchimuite
      else
        puts "-------------"
        puts "また今度！"
        puts "-------------"
        exit
      end
    elsif my_face <= 4
      puts "-------------"
      puts "ほい！"
      puts "あなた : #{faces[my_face]}"
      puts "相 手 : #{faces[your_face]}"
      puts "-------------"
      if my_face != your_face 
        puts "最初から！"
        return janken
      elsif my_face == your_face && @case_patturn == "win"
        puts "おめでとう！あなたの勝利！"
      else my_face == your_face && @case_patturn == "lose"
        puts "残念！あなたの負け！"
      end
    else
      puts "0〜4を入力してね"
      return atchimuite
    end
  end
# end

# Game = AtchimuiteGame.new()
# Game.janken

janken