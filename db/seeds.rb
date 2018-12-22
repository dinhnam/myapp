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
    Category.create!(name: data[0], intro: data[1])
end
