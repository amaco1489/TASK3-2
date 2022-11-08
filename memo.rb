require "csv"

until
  puts "１.新規メモの作成/２.既存メモの更新（追加）/０.終了（半角入力）"
  memo_type = gets.chomp.to_s
  if memo_type == "1"
    puts "新規メモのファイル名（拡張子除く）"
    new_file = gets.chomp
    puts "入力後Ctrl+Dで保存"
    memo = STDIN.read
    CSV.open("#{new_file}","w") do |csv|
      csv << ["#{memo}"]
      puts "完了しました"
    end
  elsif memo_type == "2"
    puts "更新したいメモのファイル名（拡張子除く）"
    update_file = gets.chomp
    begin
     puts "既存メモの内容"
     puts CSV.open("#{update_file}").read
    rescue 
      puts "既存メモ該当なし → 新規作成します"
    end
    puts "更新（追加）内容入力後Ctrl+Dで保存"
    memo = STDIN.read
    CSV.open("#{update_file}","a+") do |csv|
    csv << ["#{memo}"]
    puts "完了しました"
    end
  elsif memo_type == "0"
    puts "終了します"
    break
  else 
   puts "再入力して下さい"
  end
end