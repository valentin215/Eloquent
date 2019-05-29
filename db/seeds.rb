
puts 'Cleaning database...'

InterestTag.destroy_all
InterestCategory.destroy_all
Booking.destroy_all
Review.destroy_all
CourseDay.destroy_all
Course.destroy_all
User.destroy_all
Language.destroy_all


puts 'Creating Users...'

juanito_teacher = User.new(name: 'Juanito', biography: 'Buzzy destination for Indian street food in Bombay-style vintage decor.',
    email:        'juan@mail.com',
    password:    '123456',
    native_language: 'Basque',
    nationality:   'Spanish')

# juanito_teacher.remote_picture_url = "https//planetary.s3.amazonaws.com/assets/images/people/20170726_FBavataremily-headshot-2017-IsabelLawrence-4_hires.jpg"
# juanito_teacher.save!

carlitos_student = User.create!(name: 'Carlitos',
    biography:  'Living in Urgarit street',
    email:        'carlos@mail.com',
    password:    '123456',
    native_language: 'Colombian',
    nationality:   'British')


spanish_language = Language.create!(name:'Spanish')
english_language = Language.create!(name:'English')
catalan_language = Language.create!(name:'Catalan')


curso_spanish = Course.create!(user: juanito_teacher,
    language: spanish_language,
    title:'El curso de Juanito',
    description:  'Vamos a aprender de lo lindo espanol',
    end_date:        Date.new(2019,03,19),
    start_date:     Date.new(2019,03,15),
    level:    'buenaso level',
    address: "a la vuelta de la esquina",
    area: "Acasito",
    city: "Barcelona",
    price: 100,
    video_url: "video_url",
    )


curso_english = Course.create!(user: juanito_teacher,
    language: english_language,
    title:'El curso de Juanito a la inglesa',
    description:  'Vamos a aprender de lo lindo ingles',
    end_date:        Date.new(2019,03,17),
    start_date:     Date.new(2019,03,15),
    level:    'high level',
    address: "in the corner",
    area: "Here",
    city: "Barcelona",
    price: 200,
    video_url: "video_url2",
    )
curso_spanish_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Wed",
  course: curso_spanish
  )


carlitos_student_spanish_review = Review.create!(content: 'Juanito is so bad, I wont come back', rating: 1)
carlitos_student_english_review = Review.create!(content: 'Juanito is amaaazing!', rating: 5)


carlitos_student_booking = Booking.create!(total_price: 100, course: curso_spanish, review: carlitos_student_spanish_review, user: carlitos_student)
carlitos_student_booking2 = Booking.create!(total_price: 200, course: curso_english, review: carlitos_student_english_review, user: carlitos_student)

music_interest_category = InterestCategory.create!(content: 'music')
sport_interest_category = InterestCategory.create!(content: 'sport')

rock_interest_tag = InterestTag.create!(content: 'rock', interest_category:music_interest_category)
tennis_interest_tag = InterestTag.create!(content: 'tennis', interest_category: sport_interest_category)

puts 'Finished!'

