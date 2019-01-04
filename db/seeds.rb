def average_rate data
  rate = JSON.parse(data)
  sum = rate['star_5'] + rate['star_4'] + rate['star_3'] + rate['star_2']
    + rate['star_1']
  sum_value = 5*rate['star_5'] + 4*rate['star_4'] + 3*rate['star_3'] 
    + 2*rate['star_2'] + rate['star_1']

  return (1.0*sum_value/sum).round(1)
end
categories_text = "Adventure: Anime này sẽ là một hành trình phiêu lưu của nhân vật chính
Fantasy: Những loại phim hoạt hình giả tưởng về những chủ đề thần thoại hoặc phép thuật
Harem: Phim thường nói về nhân vật nam được nhiều nhân vật nữ xunh quanh hâm mộ
Yaoi: Anime nói về tình yêu của nam và nam
Yuri: Anime sẽ có nội dung về tình yêu của nữ và nữ
Scifi: Phim sẽ có nội dung về chủ đề tương lai, viễn tưởng
Kodomo: Những nội dung dành cho trẻ em nhẹ nhàng, tươi sáng
Horror: Thể loại phim kinh dị
Romance: Anime nói về chủ đề tình yêu, lãng mạn và cảm động
Sports: Phim về đề tài thể thao
Comedy: Phim mang yếu tố hài hước
Detective: Anime mang nội dung thám tử và điều tra vụ án
Vampire: Phim có nội dung về ma cà rồng
Shojo anime: Đây là những anime dành cho nữ giới, thường có chủ đề là tình cảm
Shonen anime: Ngược lại với shojo đây là thể loại dành cho nam, thiên về hành động, thể thao, hoặc khoa học viễn tưởng, những anime này thường mang tính bạo lực
Ecchi: Anime thường có những cảnh hở hang nhằm mục đích gây cười, thu hút khán giả nhưng không có cảnh trên 18+ và nhẹ hơn so với hentai
Hentai: Những anime mang yếu tố về tình dục
School: Thể loại phim học đường
Demetia: Những phim dạng này thường có nội dung khá kì lạ và khác biệt thường không dự đoán trước được và khá rùng rợn
Bishojo/Moe: Phim với các nhân vật nữ chính xinh đẹp, và thu hút người xem
Parody: Tương tự như phim truyền hình anime thể loại này sẽ làm theo một bộ phim khác và mang yếu tố gây cười cho người xem
Shonen ai: Phim anime về tình yêu của nam giới và nam giới, thường nhẹ nhàng hơn so với yaoi
Mecha: Anime có đề tài về máy móc hoặc robot
Drama: Anime thuộc thể loại kịch"
categories_text.each_line do |line|
  data = line.split(":")
  Category.create!(name: data[0], description: data[1])
end

50.times do
  Artist.create!(
      name: Faker::Artist.name
  )
end
20.times do
  Studio.create(
      name: Faker::Company.name
  )
end
20.times do
  Director.create(
      name: Faker::Artist.name
  )
end
country = Country.create!(
  name: "Nhật bản"
)
Country.create!(
  name: "Mỹ"
)
Country.create!(
  name: "Việt Nam"
)
Country.create!(
  name: "Canada"
)
Country.create!(
  name: "Trung quốc"
)
Country.create!(
  name: "Ấn độ"
)
Country.create!(
  name: "Hàn quốc"
)
Country.create!(
  name: "Nga"
)
Country.create!(
  name: "Anh"
)
Country.create!(
  name: "Pháp"
)
Country.create!(
  name: "Quốc gia khác"
)
artists = Artist.all
studios = Studio.all
genres = Category.all
directors = Director.all
31.times do
  User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      avatar: Faker::Avatar.image,
      password: "123456",
      password_confirmation: "123456"
  )
end
users = User.all
15.times do |n|
  name = Faker::Movie.quote
  release = Faker::Date.between(15.years.ago, Date.today)
  year = release.year.to_s
  rate_json = JSON.generate({star_5: rand(0..1000), star_4: rand(0..1000), star_3: rand(0..100), star_2: rand(0..1000), star_1: rand(0..1000)})
  film = Film.create!(
      name: name,
      rate: rate_json,
      average_rate: average_rate(rate_json),
      cover: 'cover.jpg',
      all_views: rand(10000..1000000),
      month_views: rand(5000..50000),
      week_views: rand(1000..10000),
      day_views: rand(100..5000),
      release:  release,
      intro: Faker::Lorem.paragraph(rand(50..200)),
      pretty: name.gsub(/[, .]/,'-')+"-"+year
  )
  rand(1..10).times do
    comment =  film.comments.create!(
      user_id: users[rand(1..30)].id, 
      content: Faker::Lorem.paragraph(rand(5..30))
    )
    rand(0..7).times do
      comment.replies.create(
        user_id: users[rand(1..30)].id, 
        content: Faker::Lorem.paragraph(rand(2..10))
      )
    end
  end
  5.times do |n|
    episode = film.episodes.create!(
    name: "tập #{n+1}",
    number: n+1, 
    link: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"
    )
    rand(1..10).times do
      comment =  episode.comments.create!(
        user_id: users[rand(1..30)].id, 
        content: Faker::Lorem.paragraph(rand(5..30))
      )
      rand(0..7).times do
        comment.replies.create(
          user_id: users[rand(1..30)].id, 
          content: Faker::Lorem.paragraph(rand(2..10))
        )
      end
    end
  end
  film.studios << studios[rand(0...20)]
  film.directors << directors[rand(0...20)]
  film.countries << country
  rand(10..20).times do
    artist = artists[rand(0...50)]
    unless film.artists.include? artist
      film.artists << artist
    end
  end
  rand(3..8).times do
      genre = genres[rand(0...24)]
      unless film.categories.include? genre
          film.categories << genre
      end
  end
end

@top_views = Film.order(all_views: :desc).limit(5)
@top_views.each_with_index do |film, index|
film.cover = "#{index+1}.jpg"
film.save
end
