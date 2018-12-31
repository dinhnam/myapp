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
episode = Episode.new name: "tap 1", number: 1, link: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4" 
100.times do
    film = Film.create!(
        name: Faker::Movie.quote,
        rate: rand(0..10),
        cover: 'test.jpg',
        all_views: rand(10000..1000000),
        month_views: rand(5000..50000),
        week_views: rand(1000..10000),
        day_views: rand(100..5000),
        release:  Faker::Date.between(15.years.ago, Date.today),
        intro: "Bối cảnh câu chuyện diễn ra tại thành phố Nagasaki, nơi mà một
         lượng ma thuật nhỏ vẫn còn tồn tại trong cuộc sống hàng ngày. Hitomi 
         Tsukishiro là một hậu duệ 17 tuổi của một gia đình phù thủy. Cô lớn
          lên với những cảm xúc hoài niệm, khi cô mất đi cảm giác về màu sắc
          từ khi còn rất nhỏ. Cảm thấy nuối tiếc cho tương lai của cháu gái
            mình, Kohaku, một phù thủy vĩ đại, đã gửi Hitomi về quá khứ vào
            năm 2018. Qua cuộc trao đổi với bà ngoại lúc 17 tuổi của mình
            và các thành viên câu lạc bộ, Hitomi đã dần trưởng thành hơn."
    )
    episode1 = Episode.new name: "tap 1", number: 1, link: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"
    episode2 = Episode.new name: "tap 2", number: 2, link: "https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1984388578313646_5797569159353073664_n.mp4?_nc_cat=1&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&rl=1500&vabr=543&_nc_ht=video.xx&oh=56cecf9b030453e8daec483d1f36ec0d&oe=5C2B0114"
    episode3 = Episode.new name: "tap 3", number: 3, link: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"
    episode4 = Episode.new name: "tap 4", number: 4, link: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"
    film.add_studio studios[rand(0...20)]
    film.add_director directors[rand(0...20)]
    film.add_country country
    film.add_episode  episode1
    film.add_episode  episode2
    film.add_episode  episode3
    film.add_episode  episode4
    rand(10..20).times do
      artist = artists[rand(0...50)]
      unless film.artist_exist? artist
        film.add_artist artist
      end
    end
    rand(3..7).times do
        genre = genres[rand(0...24)]
        unless film.category_exist? genre
            film.add_category genre
        end
    end
end

@top_views = Film.order(all_views: :desc).limit(10)
@top_views.each_with_index do |film, index|
  film.cover = "#{index+1}.jpg"
  film.save
end
