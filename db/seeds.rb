
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

chris_teacher.remote_photo_url = "https://static1.squarespace.com/static/592738c58419c2fe84fbdb81/t/5a89476ac83025f59a85e212/1518947873584/DwayneBrownStudio_Kevin_LinkedIn_Portrait.jpg"
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

carlitos_student.remote_photo_url = "https://i.pinimg.com/474x/f5/5d/66/f55d6628eb1aeb93adb86fec22c13400--puerto-rican-men-adam-rodriguez.jpg"
carlitos_student.save!




valentin_student = User.new(name: 'Valentin',
    biography:  'French expat who moved to Spain to learn to code and in love with the spanish language and I am looking to improve my spanish with an experienced teacher with similar interests to me.',
    email:        'valentin@mail.com',
    password:    '123456',
    native_language: 'French',
    nationality:   'French',)

valentin_student.remote_photo_url = "https://i.pinimg.com/564x/cf/f2/e6/cff2e6ad6b5d6b0f57a6b66bbfe3babe.jpg"
valentin_student.save!



leo_student = User.new(name: 'Leo',
    biography:  'German expat who moved to Spain to learn to code and really enjoy learning new languages and I am looking to improve my spanish with an experienced teacher with similar interests to me.',
    email:        'leo@mail.com',
    password:    '123456',
    native_language: 'German',
    nationality:   'German',)

leo_student.remote_photo_url = "https://ashwrightphotography.com/wp-content/uploads/2016/01/nashville-actor-actress-headshot-best-4.jpg"
leo_student.save!




spanish_language = Language.create!(name:'Spanish')
english_language = Language.create!(name:'English')
catalan_language = Language.create!(name:'Catalan')


curso_spanish_juanito = Course.create!(user: juanito_teacher,
    language: spanish_language,
    title:'Spanish Course for beginners',
    description:  'This is a course for beginners of spanish. We will walkthrough how to say fundamentals phrases and verbs to help you in your everyday encounters in barcelona',
    end_date:        Date.new(2019,04,19),
    start_date:     Date.new(2019,03,15),
    level:    'Beginner',
    address: "Carrer de Torrijos, 26, 08012 Barcelona",
    area: "Gracia",
    city: "Barcelona",
    price: 100,
    video_url: "video_url",
    capacity: 4
    )


curso_spanish_jenny = Course.create!(user: jenny_teacher,
    language: spanish_language,
    title:'Spanish Course for advance users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,06,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "Carrer de Pelai, 11, 08001 Barcelona",
    area: "Joanic",
    city: "Barcelona",
    price: 200,
    video_url: "video_url2",
    capacity: 4
    )


curso_spanish_london_jaunito = Course.create!(user: juanito_teacher,
    language: spanish_language,
    title:'English Course for advance users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,04,17),
    start_date:     Date.new(2019,05,15),
    level:    'Advance',
    address: "London Bridge, City of London",
    area: "Whitechapel",
    city: "London",
    price: 200,
    video_url: "video_url2",
    capacity: 6
    )


curso_spanish_in_eixample_chris = Course.create!(user: chris_teacher,
    language: spanish_language,
    title:'Spanish Course for advance users',
    description:  'This course is aimed at intermediate users of Spanish who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,05,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "Carrer de la Diputació, 231",
    area: "Eixample",
    city: "",
    price: 150,
    video_url: "video_url2",
    capacity: 6
    )


curso_spanish_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Wed",
  course: curso_spanish_juanito
  )


curso_spanish_jenny_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Mon",
  course: curso_spanish_jenny
  )


curso_english_london_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Mon",
  course: curso_spanish_london_jaunito
  )

curso_spanish_in_london_days = CourseDay.create!(start_time: 20,
  end_time: 21,
  working_day: "Tues",
  course: curso_spanish_in_eixample_chris
  )



carlitos_student_booking = Booking.create!(total_price: 100, course: curso_spanish_juanito, user: carlitos_student)
carlitos_student_booking2 = Booking.create!(total_price: 200, course: curso_spanish_jenny, user: carlitos_student)

valentin_student_booking = Booking.create!(total_price: 100, course: curso_spanish_london_jaunito, user: valentin_student)
valentin_student_booking2 = Booking.create!(total_price: 200, course: curso_spanish_in_eixample_chris, user: valentin_student)

leo_student_booking = Booking.create!(total_price: 150, course: curso_spanish_jenny, user: leo_student)
leo_student_booking2 = Booking.create!(total_price: 160, course: curso_spanish_in_eixample_chris, user: leo_student)




carlitos_student_spanish_review_juanito = Review.create!(content: 'Juanito is a great teacher. Highly recommended', rating: 4, booking: carlitos_student_booking)

carlitos_student_spanish_review_jenny = Review.create!(content: 'Jenny is amaaazing!', rating: 5, booking: carlitos_student_booking2)

valentin_student_spanish_review_juanito = Review.create!(content: 'Juanito is a good teacher, takes the time explain and correct my grammar', rating: 3, booking: valentin_student_booking)
valentin_student_spanish_review_chris = Review.create!(content: 'Chris is a good teacher, with excellent grammar', rating: 4, booking: valentin_student_booking2)


leo_student_spanish_review_jenny = Review.create!(content: 'Enjoyed my spanish course in Barcelona', rating: 4, booking: leo_student_booking)
leo_student_spanish_review_juanito = Review.create!(content: 'Enjoyed my spanish - it was good value for money', rating: 5, booking: leo_student_booking2)



personality = InterestCategory.create!(content: 'Personality')
lifestyle = InterestCategory.create!(content: 'Lifestyle')
music = InterestCategory.create!(content: 'Music')
sports = InterestCategory.create!(content: 'Sports')
movies = InterestCategory.create!(content: 'Movies')



rock_interest_tag = InterestTag.create!(content: 'K-pop', interest_category:music)
tennis_interest_tag = InterestTag.create!(content: 'tennis', interest_category: sports)
movies_interest_tag = InterestTag.create!(content: 'Romantic', interest_category: movies)


juan_interest_link1 = UserInterest.create!(interest_tag: rock_interest_tag, user: juanito_teacher)
juan_interest_link2 = UserInterest.create!(interest_tag: tennis_interest_tag, user: juanito_teacher)
juan_interest_link3 = UserInterest.create!(interest_tag: movies_interest_tag, user: juanito_teacher)


puts 'creating interest tags!'
puts 'creating interest tags! <<< PERSONALITY'

p1 = InterestTag.create!(content: 'Active', interest_category:personality)
p2 = InterestTag.create!(content: 'Calm', interest_category:personality)
p3 = InterestTag.create!(content: 'Atentive', interest_category:personality)
p4 = InterestTag.create!(content: 'happy', interest_category:personality)
p5 = InterestTag.create!(content: 'Colaborative', interest_category:personality)
p6 = InterestTag.create!(content: 'Creative', interest_category:personality)
p7 = InterestTag.create!(content: 'Decisive', interest_category:personality)
p8 = InterestTag.create!(content: 'easy going', interest_category:personality)
p9 = InterestTag.create!(content: 'Emphatic', interest_category:personality)
p10 = InterestTag.create!(content: 'Entusiastic', interest_category:personality)
p11 = InterestTag.create!(content: 'Flexible', interest_category:personality)
p12 = InterestTag.create!(content: 'helpful', interest_category:personality)
p13 = InterestTag.create!(content: 'fun', interest_category:personality)
p14 = InterestTag.create!(content: 'Honest', interest_category:personality)
p15 = InterestTag.create!(content: 'funny', interest_category:personality)
p16 = InterestTag.create!(content: 'Optimist', interest_category:personality)
p17 = InterestTag.create!(content: 'tidy', interest_category:personality)
p18 = InterestTag.create!(content: 'pasionate', interest_category:personality)
p19 = InterestTag.create!(content: 'Práctical', interest_category:personality)
p20 = InterestTag.create!(content: 'Proactive', interest_category:personality)
p21 = InterestTag.create!(content: 'Sensitive', interest_category:personality)
p22 = InterestTag.create!(content: 'Relaxed', interest_category:personality)
p23 = InterestTag.create!(content: 'Sociable', interest_category:personality)
p24 = InterestTag.create!(content: 'Tolerant', interest_category:personality)

puts 'creating interest tags! <<< LIFESTYLE'

l1 = InterestTag.create!(content: 'Aventurer', interest_category:lifestyle)
l2 = InterestTag.create!(content: 'Art lover', interest_category:lifestyle)
l3 = InterestTag.create!(content: 'Sporty', interest_category:lifestyle)
l4 = InterestTag.create!(content: 'Cook', interest_category:lifestyle)
l5 = InterestTag.create!(content: 'Cinéfilo/a', interest_category:lifestyle)
l6 = InterestTag.create!(content: 'Aficionado/a a la cultura', interest_category:lifestyle)
l7 = InterestTag.create!(content: 'Bailarín/ina', interest_category:lifestyle)
l8 = InterestTag.create!(content: 'Madrugador/a', interest_category:lifestyle)
l9 = InterestTag.create!(content: 'Emprendedor/a', interest_category:lifestyle)
l10 = InterestTag.create!(content: 'Experto/a en moda', interest_category:lifestyle)
l11 = InterestTag.create!(content: 'Foodie', interest_category:lifestyle)
l12 = InterestTag.create!(content: 'Gamer', interest_category:lifestyle)
l13 = InterestTag.create!(content: 'Saludable', interest_category:lifestyle)
l14 = InterestTag.create!(content: 'Hogareño/a', interest_category:lifestyle)
l16 = InterestTag.create!(content: 'Amante de la música', interest_category:lifestyle)
l17 = InterestTag.create!(content: 'Nocturno/a', interest_category:lifestyle)
l18 = InterestTag.create!(content: 'Fiestero/a', interest_category:lifestyle)
l19 = InterestTag.create!(content: 'Amante de los animales', interest_category:lifestyle)
l20 = InterestTag.create!(content: 'Fotógrafo/a', interest_category:lifestyle)
l21 = InterestTag.create!(content: 'Cantante', interest_category:lifestyle)
l22 = InterestTag.create!(content: 'Amante de la tecnología', interest_category:lifestyle)
l23 = InterestTag.create!(content: 'Aficionado/a al teatro', interest_category:lifestyle)
l24 = InterestTag.create!(content: 'Viajero/a', interest_category:lifestyle)
l25 = InterestTag.create!(content: 'Vegano/a', interest_category:lifestyle)
l26 = InterestTag.create!(content: 'Vegetariano/a', interest_category:lifestyle)
l27 = InterestTag.create!(content: 'Excursionista', interest_category:lifestyle)
l28 = InterestTag.create!(content: 'Adicto/a al trabajo', interest_category:lifestyle)
puts 'creating interest tags! <<< MUSIC'

m1 = InterestTag.create!(content: 'alternative Music', interest_category:music)
m2 = InterestTag.create!(content: 'Asian Pop ', interest_category:music)
m3 = InterestTag.create!(content: 'Blues', interest_category:music)
m4 = InterestTag.create!(content: 'Clásical', interest_category:music)
m5 = InterestTag.create!(content: 'Country', interest_category:music)
m6 = InterestTag.create!(content: 'Dance', interest_category:music)
m7 = InterestTag.create!(content: 'Electrónica', interest_category:music)
m8 = InterestTag.create!(content: 'Folk', interest_category:music)
m9 = InterestTag.create!(content: 'Funk', interest_category:music)
m10 = InterestTag.create!(content: 'Gospel', interest_category:music)
m11 = InterestTag.create!(content: 'Hip-Hop', interest_category:music)
m12 = InterestTag.create!(content: 'Indie', interest_category:music)
m13 = InterestTag.create!(content: 'Instrumental', interest_category:music)
m14 = InterestTag.create!(content: 'Jazz', interest_category:music)
m16 = InterestTag.create!(content: 'Latino', interest_category:music)
m17 = InterestTag.create!(content: 'Lounge', interest_category:music)
m18 = InterestTag.create!(content: 'Metal', interest_category:music)
m19 = InterestTag.create!(content: 'New age', interest_category:music)
m20 = InterestTag.create!(content: 'Ópera', interest_category:music)
m21 = InterestTag.create!(content: 'Pop', interest_category:music)
m22 = InterestTag.create!(content: 'Punk', interest_category:music)
m23 = InterestTag.create!(content: 'R&B', interest_category:music)
m24 = InterestTag.create!(content: 'Reggae', interest_category:music)
m25 = InterestTag.create!(content: 'Rock', interest_category:music)
m26 = InterestTag.create!(content: 'Ska', interest_category:music)
m27 = InterestTag.create!(content: 'Soul', interest_category:music)

puts 'creating interest tags! <<< SPORTS'
s1 = InterestTag.create!(content: 'Fútbol americano', interest_category:sports)
s2 = InterestTag.create!(content: 'Atletismo', interest_category:sports)
s3 = InterestTag.create!(content: 'Bádminton', interest_category:sports)
s4 = InterestTag.create!(content: 'Béisbol', interest_category:sports)
s5 = InterestTag.create!(content: 'Baloncesto', interest_category:sports)
s6 = InterestTag.create!(content: 'Bodyboarding', interest_category:sports)
s7 = InterestTag.create!(content: 'Jugar a los bolos', interest_category:sports)
s8 = InterestTag.create!(content: 'Boxeo', interest_category:sports)
s9 = InterestTag.create!(content: 'Piragüismo', interest_category:sports)
s10 = InterestTag.create!(content: 'Escalada', interest_category:sports)
s11 = InterestTag.create!(content: 'Críquet', interest_category:sports)
s12 = InterestTag.create!(content: 'Scuba diving', interest_category:sports)
s13 = InterestTag.create!(content: 'Fútbol', interest_category:sports)
s14 = InterestTag.create!(content: 'Golf', interest_category:sports)
s16 = InterestTag.create!(content: 'Gimnasio', interest_category:sports)
s17 = InterestTag.create!(content: 'Excursionismo', interest_category:sports)
s18 = InterestTag.create!(content: 'Fiestero/a', interest_category:sports)
s19 = InterestTag.create!(content: 'Hockey', interest_category:sports)
s20 = InterestTag.create!(content: 'Montar a caballo', interest_category:sports)
s21 = InterestTag.create!(content: 'Karting', interest_category:sports)
s22 = InterestTag.create!(content: 'Artes marciales', interest_category:sports)
s23 = InterestTag.create!(content: 'Motociclismo', interest_category:sports)
s24 = InterestTag.create!(content: 'Pádel', interest_category:sports)
s25 = InterestTag.create!(content: 'Pole dancing', interest_category:sports)
s26 = InterestTag.create!(content: 'Remo', interest_category:sports)
s27 = InterestTag.create!(content: 'Rugby', interest_category:sports)
s28 = InterestTag.create!(content: 'Correr', interest_category:sports)
s29 = InterestTag.create!(content: 'Skateboarding', interest_category:sports)
s30 = InterestTag.create!(content: 'Patinaje', interest_category:sports)
s32 = InterestTag.create!(content: 'Esquí', interest_category:sports)
s33 = InterestTag.create!(content: 'Snowboarding', interest_category:sports)
s34 = InterestTag.create!(content: 'Squash', interest_category:sports)
s35 = InterestTag.create!(content: 'Tenis de mesa', interest_category:sports)
s36 = InterestTag.create!(content: 'Tenis', interest_category:sports)
s37 = InterestTag.create!(content: 'Voleibol', interest_category:sports)
s38 = InterestTag.create!(content: 'Waterpolo', interest_category:sports)
s39 = InterestTag.create!(content: 'Windsurfing', interest_category:sports)
puts 'creating interest tags! <<< MOVIES'

as1 = InterestTag.create!(content: 'Acción', interest_category:movies)
as2 = InterestTag.create!(content: 'Aventura', interest_category:movies)
as3 = InterestTag.create!(content: 'Animación', interest_category:movies)
as4 = InterestTag.create!(content: 'Comedia', interest_category:movies)
as5 = InterestTag.create!(content: 'Cine policíaco', interest_category:movies)
as6 = InterestTag.create!(content: 'Documental', interest_category:movies)
as7 = InterestTag.create!(content: 'Drama', interest_category:movies)
as8 = InterestTag.create!(content: 'Fantasía', interest_category:movies)
as9 = InterestTag.create!(content: 'Histórica', interest_category:movies)
as10 = InterestTag.create!(content: 'Terror', interest_category:movies)
as11 = InterestTag.create!(content: 'Misterio', interest_category:movies)
as12 = InterestTag.create!(content: 'Política', interest_category:movies)
as13 = InterestTag.create!(content: 'Romántica', interest_category:movies)
as14 = InterestTag.create!(content: 'Saga', interest_category:movies)
as16 = InterestTag.create!(content: 'Sátira', interest_category:movies)
as17 = InterestTag.create!(content: 'Ciencia ficción', interest_category:movies)
as18 = InterestTag.create!(content: 'Western', interest_category:movies)

juan_interest_link1 = UserInterest.create!(interest_tag: p1, user: juanito_teacher)
juan_interest_link2 = UserInterest.create!(interest_tag: s38, user: juanito_teacher)
juan_interest_link3 = UserInterest.create!(interest_tag: as4, user: juanito_teacher)


jenny_teacher = UserInterest.create!(interest_tag: p24, user: juanito_teacher)
jenny_teacher = UserInterest.create!(interest_tag: l12, user: juanito_teacher)
jenny_teacher = UserInterest.create!(interest_tag: m16, user: juanito_teacher)


carlos_interest_link1 = UserInterest.create!(interest_tag: rock_interest_tag, user: carlitos_student)
carlos_interest_link2 = UserInterest.create!(interest_tag: tennis_interest_tag, user: carlitos_student)
carlos_interest_link3 = UserInterest.create!(interest_tag: movies_interest_tag, user: carlitos_student)



puts 'Finished!'














