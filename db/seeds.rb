
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


juanito_teacher = User.new(name: 'Juan', biography: 'Buzzy destination for Indian street food in Bombay-style vintage decor.',
    email:        'juan@mail.com',
    password:    '123456',
    native_language: 'Basque',
    nationality:   'Spanish',
   )

juanito_teacher.remote_photo_url = "http://tedxudeusto.com/wp-content/uploads/2018/12/Juan-Barbed.png"
juanito_teacher.save!


chris_teacher = User.new(name: 'Chris', biography: 'Chilean born Spanish teacher with a lot of energy for teaching and with useful grammar tips',
    email:        'chris@mail.com',
    password:    '123456',
    native_language: 'Spanish',
    nationality:   'Chilean'
   )

chris_teacher.remote_photo_url = "https://cdn.countryflags.com/thumbs/chile/flag-400.png"
chris_teacher.save!


carlitos_student = User.new(name: 'Carlitos',
    biography:  'Living in Urgarit street',
    email:        'carlos@mail.com',
    password:    '123456',
    native_language: 'Colombian',
    nationality:   'British')

carlitos_student.remote_photo_url = "https://i.pinimg.com/originals/28/2c/3d/282c3dd1fcc5ac1a659fa4cfb34c10b2.jpg"
carlitos_student.save!




valentin_student = User.new(name: 'Valentin',
    biography:  'French who moved to Spain to make money and code. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi quasi minus cumque, illo repudiandae tempore voluptatibus debitis. Beatae eveniet magni fugiat obcaecati quaerat, nam assumenda hic, cumque vel, quo sed.',
    email:        'valentin@mail.com',
    password:    '123456',
    native_language: 'French',
    nationality:   'French',)

valentin_student.remote_photo_url = "https://i.mdel.net/mdx/i/2019/01/2019_01_16_Models.com_15.jpg"
valentin_student.save!


spanish_language = Language.create!(name:'Spanish')
english_language = Language.create!(name:'English')
catalan_language = Language.create!(name:'Catalan')


curso_spanish = Course.create!(user: juanito_teacher,
    language: spanish_language,
    title:'Spanish Course for beginners',
    description:  'This is a course for beginners of spanish. We will walkthrough how to say fundamentals phrases and verbs to help you in your everyday encounters in barcelona',
    end_date:        Date.new(2019,04,19),
    start_date:     Date.new(2019,03,15),
    level:    'Beginner',
    address: "Carrer d'en Grassot, 101, 08025",
    area: "Gracia",
    city: "Barcelona",
    price: 100,
    video_url: "video_url",
    capacity: 6
    )


curso_english = Course.create!(user: juanito_teacher,
    language: english_language,
    title:'English Course for advance users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,04,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "Carrer Ramon y Cajal,50, 08012",
    area: "Joanic",
    city: "Barcelona",
    price: 200,
    video_url: "video_url2",
    capacity: 6
    )


curso_english_in_london = Course.create!(user: juanito_teacher,
    language: english_language,
    title:'English Course for advance users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,04,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "London Bridge, City of London",
    area: "City",
    city: "London",
    price: 200,
    video_url: "video_url2",
    capacity: 6
    )


curso_spanish_in_london = Course.create!(user: chris_teacher,
    language: spanish_language,
    title:'Spanish Course for advance users',
    description:  'This course is aimed at more advanced users who want to talk and be corrected in their use of spanish along with correction of their grammar',
    end_date:        Date.new(2019,05,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "Richmond, London",
    area: "Richmond",
    city: "London",
    price: 150,
    video_url: "video_url2",
    capacity: 6
    )


curso_spanish_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Wed",
  course: curso_spanish
  )

curso_english_london_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Wed",
  course: curso_english_in_london
  )

curso_spanish_in_london_days = CourseDay.create!(start_time: 20,
  end_time: 21,
  working_day: "Tues",
  course: curso_spanish_in_london
  )





carlitos_student_booking = Booking.create!(total_price: 100, course: curso_spanish, user: carlitos_student)
carlitos_student_booking2 = Booking.create!(total_price: 200, course: curso_english, user: carlitos_student)
valentin_student_booking = Booking.create!(total_price: 100, course: curso_spanish, user: valentin_student)
carlitos_student_booking2_in_london = Booking.create!(total_price: 200, course: curso_english_in_london, user: carlitos_student)
valentin_student_booking_london = Booking.create!(total_price: 150, course: curso_spanish_in_london, user: valentin_student)
valentin_student_booking_londonon2 = Booking.create!(total_price: 160, course: curso_english_in_london, user: valentin_student)


carlitos_student_spanish_review = Review.create!(content: 'Juanito is so bad teacher, I wont come back', rating: 1, booking: carlitos_student_booking)
carlitos_student_english_review = Review.create!(content: 'Juanito is amaaazing!', rating: 5, booking: carlitos_student_booking2)
valentin_student_spanish_review = Review.create!(content: 'Juanito is a good teacher, takes the time explain and correct my grammar', rating: 4, booking: valentin_student_booking)
carlitos_student_spanish_review = Review.create!(content: 'Enjoyed my english course in London', rating: 3, booking: carlitos_student_booking2_in_london)
valentin_student_english_review_london = Review.create!(content: 'Chris is a good teacher, with excellent grammar', rating: 4, booking: valentin_student_booking_london)


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
p3 = InterestTag.create!(content: 'Atento/a', interest_category:personality)
p4 = InterestTag.create!(content: 'Alegre', interest_category:personality)
p5 = InterestTag.create!(content: 'Colaborador/a', interest_category:personality)
p6 = InterestTag.create!(content: 'Creativo/a', interest_category:personality)
p7 = InterestTag.create!(content: 'Decidido/a', interest_category:personality)
p8 = InterestTag.create!(content: 'De trato fácil', interest_category:personality)
p9 = InterestTag.create!(content: 'Empático/a', interest_category:personality)
p10 = InterestTag.create!(content: 'Entusiasta', interest_category:personality)
p11 = InterestTag.create!(content: 'Flexible', interest_category:personality)
p12 = InterestTag.create!(content: 'Amable', interest_category:personality)
p13 = InterestTag.create!(content: 'Divertido/a', interest_category:personality)
p14 = InterestTag.create!(content: 'Honesto/a', interest_category:personality)
p15 = InterestTag.create!(content: 'Gracioso/a', interest_category:personality)
p16 = InterestTag.create!(content: 'Optimista', interest_category:personality)
p17 = InterestTag.create!(content: 'Ordenado/a', interest_category:personality)
p18 = InterestTag.create!(content: 'Apasionado/a', interest_category:personality)
p19 = InterestTag.create!(content: 'Práctico/a', interest_category:personality)
p20 = InterestTag.create!(content: 'Proactivo/a', interest_category:personality)
p21 = InterestTag.create!(content: 'Sensato/a', interest_category:personality)
p22 = InterestTag.create!(content: 'Relajado/a', interest_category:personality)
p23 = InterestTag.create!(content: 'Sociable', interest_category:personality)
p24 = InterestTag.create!(content: 'Tolerante', interest_category:personality)

puts 'creating interest tags! <<< LIFESTYLE'

l1 = InterestTag.create!(content: 'Aventurero/a', interest_category:lifestyle)
l2 = InterestTag.create!(content: 'Aficionado/a al arte', interest_category:lifestyle)
l3 = InterestTag.create!(content: 'Deportista', interest_category:lifestyle)
l4 = InterestTag.create!(content: 'Cocinillas', interest_category:lifestyle)
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
s12 = InterestTag.create!(content: 'Buceo', interest_category:sports)
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
juan_interest_link2 = UserInterest.create!(interest_tag: p3, user: juanito_teacher)
juan_interest_link3 = UserInterest.create!(interest_tag: p2, user: juanito_teacher)


carlos_interest_link1 = UserInterest.create!(interest_tag: rock_interest_tag, user: carlitos_student)
carlos_interest_link2 = UserInterest.create!(interest_tag: tennis_interest_tag, user: carlitos_student)
carlos_interest_link3 = UserInterest.create!(interest_tag: movies_interest_tag, user: carlitos_student)

puts 'Finished!'














