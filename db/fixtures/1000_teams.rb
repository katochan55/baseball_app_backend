team_list = [
  { name: '読売ジャイアンツ', founded_year: 1934 },
  { name: '横浜DeNAベイスターズ', founded_year: 1949 },
  { name: '阪神タイガース', founded_year: 1935 },
  { name: '広島東洋カープ', founded_year: 1949 },
  { name: '中日ドラゴンズ', founded_year: 1936 },
  { name: '東京ヤクルトスワローズ', founded_year: 1950 },
  { name: '埼玉西武ライオンズ', founded_year: 1949 },
  { name: '福岡ソフトバンクホークス', founded_year: 1938 },
  { name: '東北楽天ゴールデンイーグルス', founded_year: 2004 },
  { name: '千葉ロッテマリーンズ', founded_year: 1949 },
  { name: '北海道日本ハムファイターズ', founded_year: 1945 },
  { name: 'オリックス・バファローズ', founded_year: 1936 },
]

team_list.map do |team|
  Team.seed(
    :name,
    {
      name: team[:name],
      founded_year: team[:founded_year],
    }
  )
end
