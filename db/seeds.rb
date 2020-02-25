
puts 'Cleaning database...'

UserInterest.destroy_all
InterestTag.destroy_all
InterestCategory.destroy_all
Review.destroy_all
Booking.destroy_all
CourseDay.destroy_all
Course.destroy_all
User.destroy_all
Language.destroy_all


puts 'Creating Users...'


juanito_teacher = User.new(name: 'Juan', biography: 'Spanish teacher with 5 years of experience in teaching languages including Spanish and English. I lived 5 years in London where I learnt English and I was born in Spain. I have lots of experience with teaching small gropups of 6 people. ',
    email:        'juan@mail.com',
    password:    '123456',
    native_language: 'Spanish',
    nationality:   'Spanish',
   )

juanito_teacher.remote_photo_url = "http://tedxudeusto.com/wp-content/uploads/2018/12/Juan-Barbed.png"
juanito_teacher.save!


chris_teacher = User.new(name: 'Chris', biography: 'I was born in Chile and have a lot of energy for teaching and with useful grammar tips. I studied Spanish at the Cambridge University. I previously taught Spanish for 5 years at the School of Callum in London',
    email:        'chris@mail.com',
    password:    '123456',
    native_language: 'Spanish',
    nationality:   'Chilean'
   )

chris_teacher.remote_photo_url = "https://res.cloudinary.com/dswrt2l60/image/upload/v1559814691/Cristobal_dl58f1.jpg"
chris_teacher.save!




jenny_teacher = User.new(name: 'Jenny', biography: 'I was born in Spain on and I am very keen to teach adults. I studied Spanish at Oxford University. I previously taught Spanish for 4 years at the School of Callum in London',
    email:        'jenny@mail.com',
    password:    '123456',
    native_language: 'Spanish',
    nationality:   'Spanish'
   )


jenny_teacher.remote_photo_url = "https://www.hardypedoortho.com/wp-content/uploads/StraightSmileKid2-300x300.jpg"
jenny_teacher.save!


carlitos_student = User.new(name: 'Carlos',
    biography:  'I grew up in England and my English is better than my Spanish and I am therefore looking to improve my Spanish with a native speaking teacher, specially my business spanish in order to secure a job',
    email:        'carlos@mail.com',
    password:    '123456',
    native_language: 'English',
    nationality:   'British')

carlitos_student.remote_photo_url = "https://res.cloudinary.com/dswrt2l60/image/upload/v1559815368/Carloslewagon_y2xx33.jpg"
carlitos_student.save!



valentin_student = User.new(name: 'Valentin',
    biography:  'French expat who moved to Spain to learn to code and in love with the spanish language and I am looking to improve my spanish with an experienced teacher with similar interests to me.',
    email:        'valentin@mail.com',
    password:    '123456',
    native_language: 'French',
    nationality:   'French',)

valentin_student.remote_photo_url = "https://res.cloudinary.com/dswrt2l60/image/upload/v1559814957/Valentin_aqsniq.jpg"
valentin_student.save!



leo_student = User.new(name: 'Leo',
    biography:  'German expat who moved to Spain to learn to code and really enjoy learning new languages and I am looking to improve my spanish with an experienced teacher with similar interests to me.',
    email:        'leo@mail.com',
    password:    '123456',
    native_language: 'German',
    nationality:   'German',)

leo_student.remote_photo_url = "https://static1.squarespace.com/static/592738c58419c2fe84fbdb81/t/5a89476ac83025f59a85e212/1518947873584/DwayneBrownStudio_Kevin_LinkedIn_Portrait.jpg"
leo_student.save!



lang1 = Language.create!(name:'English')
lang2 = Language.create!(name:'Spanish')
lang3 = Language.create!(name:'French')
lang5 = Language.create!(name:'Italian')
lang6 = Language.create!(name:'Portuguese')
lang7 = Language.create!(name:'German')
lang8 = Language.create!(name:'Russian')
lang9 = Language.create!(name:'Japanese')
lang10 = Language.create!(name:'Chinese')
lang11 = Language.create!(name:'Korean')
lang12 = Language.create!(name:'Turkish')
lang13 = Language.create!(name:'Dutch')
lang14 = Language.create!(name:'Hindi')
lang15 = Language.create!(name:'Polish')
lang16 = Language.create!(name:'Arabic')


curso_spanish_juanito = Course.create!(user: juanito_teacher,
    language: lang2,
    title:'Spanish course for beginners',
    description:  'This is a course for beginners of spanish. We will walkthrough how to say fundamentals phrases and verbs to help you in your everyday encounters in barcelona',
    end_date:        Date.new(2019,8,19),
    start_date:     Date.new(2019,7,15),
    level:    'Elementary level (A1)',
    address: "Carrer de Torrijos, 26, 08012 Barcelona",
    area: "Gracia",
    city: "Mama's Cafe",
    price: 100,
    video_url: "https://www.youtube.com/embed/hIKJOpQ5CPs",
    capacity: 4
    )


curso_spanish_jenny = Course.create!(user: jenny_teacher,
    language: lang2,
    title:'Spanish course for advanced users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,8,17),
    start_date:     Date.new(2019,7,15),
    level:    'Elementary level (A1)',
    address: "Carrer de Pelai, 11, 08001 Barcelona",
    area: "Joanic",
    city: "Joan's large Cafe",
    price: 150,
    video_url: "https://www.youtube.com/embed/_WZoYmWzBBg",
    capacity: 4
    )


curso_spanish_london_jaunito = Course.create!(user: juanito_teacher,
    language: lang1,
    title:'English course for advanced users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,8,17),
    start_date:     Date.new(2019,7,15),
    level:    'Advanced level (C1)',
    address: "London Bridge, City of London",
    area: "Whitechapel",
    city: "Costa Coffee",
    price: 100,
    video_url: "https://www.youtube.com/embed/_WZoYmWzBBg",
    capacity: 4
    )


curso_spanish_in_eixample_chris = Course.create!(user: chris_teacher,
    language: lang2,
    title:'Spanish course for advanced users',
    description:  'This course is aimed at intermediate users of Spanish who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,8,17),
    start_date:     Date.new(2019,7,15),
    level:    'Advanced level (C1)',
    address: "Carrer de la Diputació, 231",
    area: "Eixample",
    city: "Starbucks",
    price: 150,
    video_url: "https://www.youtube.com/embed/_WZoYmWzBBg",
    capacity: 4
    )


curso_spanish_days = CourseDay.create!(start_time: "19:00:00",
  end_time: "21:00:00",
  working_day: "Tues, Wed, Thurs",
  course: curso_spanish_juanito
  )


curso_spanish_jenny_days = CourseDay.create!(start_time: "19:00:00",
  end_time: "21:00:00",
  working_day: "Tues, Wed, Thurs",
  course: curso_spanish_jenny
  )


curso_english_london_days = CourseDay.create!(start_time: "19:00:00",
  end_time: "21:00:00",
  working_day: "Tues, Wed, Thurs",
  course: curso_spanish_london_jaunito
  )

curso_spanish_in_london_days = CourseDay.create!(start_time: "20:00:00",
  end_time: "21:00:00",
  working_day: "Tues, Wed, Thurs",
  course: curso_spanish_in_eixample_chris
  )



leo_student_booking_juan = Booking.create!(total_price: 100, course: curso_spanish_juanito, user: leo_student)
carlitos_student_booking2 = Booking.create!(total_price: 200, course: curso_spanish_jenny, user: carlitos_student)

valentin_student_booking = Booking.create!(total_price: 100, course: curso_spanish_juanito, user: valentin_student)
valentin_student_booking2 = Booking.create!(total_price: 200, course: curso_spanish_in_eixample_chris, user: valentin_student)

leo_student_booking = Booking.create!(total_price: 150, course: curso_spanish_jenny, user: leo_student)
# leo_student_booking2 = Booking.create!(total_price: 160, course: curso_spanish_in_eixample_chris, user: leo_student)




leo_student_spanish_review_juanito = Review.create!(content: 'Juanito is a great teacher. Highly recommended', rating: 4, booking: leo_student_booking_juan)

carlitos_student_spanish_review_jenny = Review.create!(content: 'Jenny is amaaazing!', rating: 4, booking: carlitos_student_booking2)

valentin_student_spanish_review_juanito = Review.create!(content: 'Juanito is a good teacher, takes the time explain and correct my grammar', rating: 4, booking: valentin_student_booking)
valentin_student_spanish_review_chris = Review.create!(content: 'Chris is a good teacher, with excellent grammar', rating: 4, booking: valentin_student_booking2)


leo_student_spanish_review_jenny = Review.create!(content: 'Enjoyed my spanish course in Barcelona', rating: 4, booking: leo_student_booking)


personality = InterestCategory.create!(content: 'Personality')
lifestyle = InterestCategory.create!(content: 'Lifestyle')
music = InterestCategory.create!(content: 'Music')
sports = InterestCategory.create!(content: 'Sports')
movies = InterestCategory.create!(content: 'Movies')




puts 'creating interest tags!'
puts 'creating interest tags! <<< PERSONALITY'

p1 = InterestTag.create!(content: 'active', interest_category:personality)
p2 = InterestTag.create!(content: 'calm', interest_category:personality)
p3 = InterestTag.create!(content: 'attentive', interest_category:personality)
p4 = InterestTag.create!(content: 'happy', interest_category:personality)
p5 = InterestTag.create!(content: 'collaborative', interest_category:personality)
p6 = InterestTag.create!(content: 'creative', interest_category:personality)
p7 = InterestTag.create!(content: 'decisive', interest_category:personality)
p8 = InterestTag.create!(content: 'easy going', interest_category:personality)
p9 = InterestTag.create!(content: 'emphatic', interest_category:personality)
p10 = InterestTag.create!(content: 'enthusiastic', interest_category:personality)
p11 = InterestTag.create!(content: 'flexible', interest_category:personality)
p12 = InterestTag.create!(content: 'helpful', interest_category:personality)
p13 = InterestTag.create!(content: 'fun', interest_category:personality)
p14 = InterestTag.create!(content: 'honest', interest_category:personality)
p15 = InterestTag.create!(content: 'funny', interest_category:personality)
p16 = InterestTag.create!(content: 'optimist', interest_category:personality)
p17 = InterestTag.create!(content: 'tidy', interest_category:personality)
p18 = InterestTag.create!(content: 'pasionate', interest_category:personality)
p19 = InterestTag.create!(content: 'practical', interest_category:personality)
p20 = InterestTag.create!(content: 'proactive', interest_category:personality)
p21 = InterestTag.create!(content: 'sensitive', interest_category:personality)
p22 = InterestTag.create!(content: 'relaxed', interest_category:personality)
p23 = InterestTag.create!(content: 'sociable', interest_category:personality)
p24 = InterestTag.create!(content: 'tolerant', interest_category:personality)

puts 'creating interest tags! <<< LIFESTYLE'

l1 = InterestTag.create!(content: 'aventurer', interest_category:lifestyle)
l2 = InterestTag.create!(content: 'art lover', interest_category:lifestyle)
l3 = InterestTag.create!(content: 'sporty', interest_category:lifestyle)
l4 = InterestTag.create!(content: 'cook', interest_category:lifestyle)
l5 = InterestTag.create!(content: 'movie lover', interest_category:lifestyle)
l6 = InterestTag.create!(content: 'culture lover', interest_category:lifestyle)
l7 = InterestTag.create!(content: 'dancer', interest_category:lifestyle)
l8 = InterestTag.create!(content: 'early bird', interest_category:lifestyle)
l9 = InterestTag.create!(content: 'entrepreneur', interest_category:lifestyle)
l10 = InterestTag.create!(content: 'fashionista', interest_category:lifestyle)
l11 = InterestTag.create!(content: 'foodie', interest_category:lifestyle)
l12 = InterestTag.create!(content: 'gamer', interest_category:lifestyle)
l13 = InterestTag.create!(content: 'health concious', interest_category:lifestyle)
l14 = InterestTag.create!(content: 'homely', interest_category:lifestyle)
l16 = InterestTag.create!(content: 'music lover', interest_category:lifestyle)
l17 = InterestTag.create!(content: 'night bird', interest_category:lifestyle)
l18 = InterestTag.create!(content: 'party animal', interest_category:lifestyle)
l19 = InterestTag.create!(content: 'animal lover', interest_category:lifestyle)
l20 = InterestTag.create!(content: 'photograher', interest_category:lifestyle)
l21 = InterestTag.create!(content: 'singer', interest_category:lifestyle)
l22 = InterestTag.create!(content: 'tech enthusiast', interest_category:lifestyle)
l23 = InterestTag.create!(content: 'theathre lover', interest_category:lifestyle)
l24 = InterestTag.create!(content: 'travel addict', interest_category:lifestyle)
l25 = InterestTag.create!(content: 'vegan', interest_category:lifestyle)
l26 = InterestTag.create!(content: 'vegetarian', interest_category:lifestyle)
l27 = InterestTag.create!(content: 'day trip lover', interest_category:lifestyle)
l28 = InterestTag.create!(content: 'workaholic', interest_category:lifestyle)
puts 'creating interest tags! <<< MUSIC'

m1 = InterestTag.create!(content: 'alternative Music', interest_category:music)
m2 = InterestTag.create!(content: 'asian Pop ', interest_category:music)
m3 = InterestTag.create!(content: 'blues', interest_category:music)
m4 = InterestTag.create!(content: 'clasical', interest_category:music)
m5 = InterestTag.create!(content: 'country', interest_category:music)
m6 = InterestTag.create!(content: 'dance', interest_category:music)
m7 = InterestTag.create!(content: 'electrónic', interest_category:music)
m8 = InterestTag.create!(content: 'folk', interest_category:music)
m9 = InterestTag.create!(content: 'funk', interest_category:music)
m10 = InterestTag.create!(content: 'gospel', interest_category:music)
m11 = InterestTag.create!(content: 'hip-Hop', interest_category:music)
m12 = InterestTag.create!(content: 'indie', interest_category:music)
m13 = InterestTag.create!(content: 'instrumental', interest_category:music)
m14 = InterestTag.create!(content: 'jazz', interest_category:music)
m15 = InterestTag.create!(content: 'latino', interest_category:music)
m16 = InterestTag.create!(content: 'lounge', interest_category:music)
m17 = InterestTag.create!(content: 'metal', interest_category:music)
m18 = InterestTag.create!(content: 'new age', interest_category:music)
m19 = InterestTag.create!(content: 'opera', interest_category:music)
m20 = InterestTag.create!(content: 'pop', interest_category:music)
m21 = InterestTag.create!(content: 'punk', interest_category:music)
m22 = InterestTag.create!(content: 'R&B', interest_category:music)
m23 = InterestTag.create!(content: 'reggae', interest_category:music)
m24 = InterestTag.create!(content: 'rock', interest_category:music)
m25 = InterestTag.create!(content: 'ska', interest_category:music)
m26 = InterestTag.create!(content: 'soul', interest_category:music)

puts 'creating interest tags! <<< SPORTS'
s1 = InterestTag.create!(content: 'american football', interest_category:sports)
s2 = InterestTag.create!(content: 'atletic', interest_category:sports)
s3 = InterestTag.create!(content: 'bádminton', interest_category:sports)
s4 = InterestTag.create!(content: 'baseball', interest_category:sports)
s5 = InterestTag.create!(content: 'basketball', interest_category:sports)
s6 = InterestTag.create!(content: 'bodyboarding', interest_category:sports)
s7 = InterestTag.create!(content: 'bowling', interest_category:sports)
s8 = InterestTag.create!(content: 'boxing', interest_category:sports)
s9 = InterestTag.create!(content: 'canoeing', interest_category:sports)
s10 = InterestTag.create!(content: 'climbing', interest_category:sports)
s11 = InterestTag.create!(content: 'cricket', interest_category:sports)
s12 = InterestTag.create!(content: 'scuba diving', interest_category:sports)
s13 = InterestTag.create!(content: 'football', interest_category:sports)
s14 = InterestTag.create!(content: 'golf', interest_category:sports)
s16 = InterestTag.create!(content: 'gymn lover', interest_category:sports)
s17 = InterestTag.create!(content: 'hockey', interest_category:sports)
s18 = InterestTag.create!(content: 'horse riding', interest_category:sports)
s19 = InterestTag.create!(content: 'go Karting', interest_category:sports)
s20 = InterestTag.create!(content: 'martial arts', interest_category:sports)
s21 = InterestTag.create!(content: 'motorcycling', interest_category:sports)
s22 = InterestTag.create!(content: 'padel', interest_category:sports)
s23 = InterestTag.create!(content: 'pole dancing', interest_category:sports)
s24 = InterestTag.create!(content: 'rowing', interest_category:sports)
s25 = InterestTag.create!(content: 'rugby', interest_category:sports)
s26 = InterestTag.create!(content: 'running', interest_category:sports)
s27 = InterestTag.create!(content: 'skateboarding', interest_category:sports)
s28 = InterestTag.create!(content: 'skating', interest_category:sports)
s29 = InterestTag.create!(content: 'skiing', interest_category:sports)
s30 = InterestTag.create!(content: 'snowboarding', interest_category:sports)
s31 = InterestTag.create!(content: 'squash', interest_category:sports)
s32 = InterestTag.create!(content: 'table tennis', interest_category:sports)
s33 = InterestTag.create!(content: 'tennis', interest_category:sports)
s34 = InterestTag.create!(content: 'beach volleyball', interest_category:sports)
s35 = InterestTag.create!(content: 'waterpolo', interest_category:sports)
s36 = InterestTag.create!(content: 'windsurfing', interest_category:sports)
s37 = InterestTag.create!(content: 'yoga', interest_category:sports)
puts 'creating interest tags! <<< MOVIES'

as1 = InterestTag.create!(content: 'action', interest_category:movies)
as2 = InterestTag.create!(content: 'aventure', interest_category:movies)
as3 = InterestTag.create!(content: 'animation ', interest_category:movies)
as4 = InterestTag.create!(content: 'comedy', interest_category:movies)
as5 = InterestTag.create!(content: 'crime', interest_category:movies)
as6 = InterestTag.create!(content: 'documentaries', interest_category:movies)
as7 = InterestTag.create!(content: 'drama', interest_category:movies)
as8 = InterestTag.create!(content: 'fantasy', interest_category:movies)
as9 = InterestTag.create!(content: 'historial', interest_category:movies)
as10 = InterestTag.create!(content: 'horror', interest_category:movies)
as11 = InterestTag.create!(content: 'mistery', interest_category:movies)
as12 = InterestTag.create!(content: 'politics', interest_category:movies)
as13 = InterestTag.create!(content: 'romantic', interest_category:movies)
as14 = InterestTag.create!(content: 'sagas', interest_category:movies)
as16 = InterestTag.create!(content: 'satirical', interest_category:movies)
as17 = InterestTag.create!(content: 'science fiction', interest_category:movies)
as18 = InterestTag.create!(content: 'western', interest_category:movies)



# interest_tag1 = InterestTag.create!(content: p8, interest_category:personality)
# interest_tag2 = InterestTag.create!(content: l7, interest_category: lifestyle)
# interest_tag3 = InterestTag.create!(content: m14, interest_category: music)
# interest_tag4 = InterestTag.create!(content: s33, interest_category: sports)
# interest_tag5 = InterestTag.create!(content: as1, interest_category: movies)


juan_interest_link1 = UserInterest.create!(interest_tag: p8, user: juanito_teacher)
juan_interest_link2 = UserInterest.create!(interest_tag: l25, user: juanito_teacher)
juan_interest_link3 = UserInterest.create!(interest_tag: m14, user: juanito_teacher)
juan_interest_link4 = UserInterest.create!(interest_tag: s33, user: juanito_teacher)
juan_interest_link5 = UserInterest.create!(interest_tag: as1, user: juanito_teacher)



# interest_tag6 = InterestTag.create!(content: p9, interest_category:personality)
# interest_tag7 = InterestTag.create!(content: l8, interest_category: lifestyle)
# interest_tag8 = InterestTag.create!(content: m15, interest_category: music)
# interest_tag9 = InterestTag.create!(content: s34, interest_category: sports)
# interest_tag10 = InterestTag.create!(content: as2, interest_category: movies)


chris_interest_link1 = UserInterest.create!(interest_tag: p4, user: chris_teacher)
chris_interest_link2 = UserInterest.create!(interest_tag: l22, user: chris_teacher)
chris_interest_link3 = UserInterest.create!(interest_tag: m15, user: chris_teacher)
chris_interest_link4 = UserInterest.create!(interest_tag: s13, user: chris_teacher)
chris_interest_link5 = UserInterest.create!(interest_tag: as10, user: chris_teacher)




# interest_tag11 = InterestTag.create!(content: p10, interest_category:personality)
# interest_tag12 = InterestTag.create!(content: l9, interest_category: lifestyle)
# interest_tag13 = InterestTag.create!(content: m16, interest_category: music)
# interest_tag14 = InterestTag.create!(content: s35, interest_category: sports)
# interest_tag15 = InterestTag.create!(content: as3, interest_category: movies)


jenny_interest_link1 = UserInterest.create!(interest_tag: p3, user: jenny_teacher)
jenny_interest_link2 = UserInterest.create!(interest_tag: l12, user: jenny_teacher)
jenny_interest_link3 = UserInterest.create!(interest_tag: m22, user: jenny_teacher)
jenny_interest_link4 = UserInterest.create!(interest_tag: s37, user: jenny_teacher)
jenny_interest_link5 = UserInterest.create!(interest_tag: as3, user: jenny_teacher)




# interest_tag16 = InterestTag.create!(content: p11, interest_category:personality)
# interest_tag17 = InterestTag.create!(content: l10, interest_category: lifestyle)
# interest_tag18 = InterestTag.create!(content: m17, interest_category: music)
# interest_tag19 = InterestTag.create!(content: s36, interest_category: sports)
# interest_tag20 = InterestTag.create!(content: as4, interest_category: movies)


carlitos_interest_link1 = UserInterest.create!(interest_tag: p23, user: carlitos_student)
carlitos_interest_link2 = UserInterest.create!(interest_tag: l3, user: carlitos_student)
carlitos_interest_link3 = UserInterest.create!(interest_tag: m15, user: carlitos_student)
carlitos_interest_link4 = UserInterest.create!(interest_tag: s13, user: carlitos_student)
carlitos_interest_link5 = UserInterest.create!(interest_tag: as4, user: carlitos_student)



# interest_tag21 = InterestTag.create!(content: p12, interest_category:personality)
# interest_tag22 = InterestTag.create!(content: l11, interest_category: lifestyle)
# interest_tag23 = InterestTag.create!(content: m18, interest_category: music)
# interest_tag24 = InterestTag.create!(content: s1, interest_category: sports)
# interest_tag25 = InterestTag.create!(content: as5, interest_category: movies)


valentin_interest_link1 = UserInterest.create!(interest_tag: p8, user: valentin_student)
valentin_interest_link2 = UserInterest.create!(interest_tag: l16, user: valentin_student)
valentin_interest_link3 = UserInterest.create!(interest_tag: m7, user: valentin_student)
valentin_interest_link4 = UserInterest.create!(interest_tag: s13, user: valentin_student)
valentin_interest_link5 = UserInterest.create!(interest_tag: as13, user: valentin_student)




leo_interest_link1 = UserInterest.create!(interest_tag: p8, user: leo_student)
leo_interest_link2 = UserInterest.create!(interest_tag: l3, user: leo_student)
leo_interest_link3 = UserInterest.create!(interest_tag: m11, user: leo_student)
leo_interest_link4 = UserInterest.create!(interest_tag: s17, user: leo_student)
leo_interest_link5 = UserInterest.create!(interest_tag: as13, user: leo_student)


puts 'Finished!'












