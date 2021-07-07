team_list = [
  { name: '読売ジャイアンツ', founded_year: 1934, league: 0 },
  { name: '横浜DeNAベイスターズ', founded_year: 1949, league: 0 },
  { name: '阪神タイガース', founded_year: 1935, league: 0 },
  { name: '広島東洋カープ', founded_year: 1949, league: 0 },
  { name: '中日ドラゴンズ', founded_year: 1936, league: 0 },
  { name: '東京ヤクルトスワローズ', founded_year: 1950, league: 0 },
  { name: '埼玉西武ライオンズ', founded_year: 1949, league: 1 },
  { name: '福岡ソフトバンクホークス', founded_year: 1938, league: 1 },
  { name: '東北楽天ゴールデンイーグルス', founded_year: 2004, league: 1 },
  { name: '千葉ロッテマリーンズ', founded_year: 1949, league: 1 },
  { name: '北海道日本ハムファイターズ', founded_year: 1945, league: 1 },
  { name: 'オリックス・バファローズ', founded_year: 1936, league: 1 },
]

year = 2020

team_list.map do |team|
  Team.seed(
    :name,
    {
      name: team[:name],
      founded_year: team[:founded_year],
      league: team[:league],
    }
  )

  name = team[:name]
  case name
  when '読売ジャイアンツ'
    rank, wins_count, loses_count = 1, 67, 45
  when '阪神タイガース'
    rank, wins_count, loses_count = 2, 60, 53
  when '中日ドラゴンズ'
    rank, wins_count, loses_count = 3, 60, 55
  when '横浜DeNAベイスターズ'
    rank, wins_count, loses_count = 4, 56, 58
  when '広島東洋カープ'
    rank, wins_count, loses_count = 5, 52, 56
  when '東京ヤクルトスワローズ'
    rank, wins_count, loses_count = 6, 41, 69
  when '福岡ソフトバンクホークス'
    rank, wins_count, loses_count = 1, 73, 42
  when '千葉ロッテマリーンズ'
    rank, wins_count, loses_count = 2, 60, 57
  when '埼玉西武ライオンズ'
    rank, wins_count, loses_count = 3, 58, 58
  when '東北楽天ゴールデンイーグルス'
    rank, wins_count, loses_count = 4, 55, 57
  when '北海道日本ハムファイターズ'
    rank, wins_count, loses_count = 5, 53, 62
  when 'オリックス・バファローズ'
    rank, wins_count, loses_count = 6, 45, 68
  end

  TeamResult.seed(
    :team_id, :year,
    {
      team_id: Team.find_by!(name: name).id,
      year: year,
      rank: rank,
      wins_count: wins_count,
      loses_count: loses_count,
    }
  )
end
