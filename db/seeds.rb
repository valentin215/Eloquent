
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


juanito_teacher = User.new(name: 'Juanito', biography: 'Buzzy destination for Indian street food in Bombay-style vintage decor.',
    email:        'juan@mail.com',
    password:    '123456',
    native_language: 'Basque',
    nationality:   'Spanish'
   )

# juanito_teacher.remote_picture_url = "https//planetary.s3.amazonaws.com/assets/images/people/20170726_FBavataremily-headshot-2017-IsabelLawrence-4_hires.jpg"
# juanito_teacher.save!

carlitos_student = User.create!(name: 'Carlitos',
    biography:  'Living in Urgarit street',
    email:        'carlos@mail.com',
    password:    '123456',
    native_language: 'Colombian',
    nationality:   'British')


valentin_student = User.create!(name: 'Valentin',
    biography:  'French who moved to Spain to make money and code',
    email:        'valentin@mail.com',
    password:    '123456',
    native_language: 'French',
    nationality:   'French')


spanish_language = Language.create!(name:'Spanish')
english_language = Language.create!(name:'English')
catalan_language = Language.create!(name:'Catalan')


curso_spanish = Course.create!(user: juanito_teacher,
    language: spanish_language,
    title:'Spanish Course for beginners',
    description:  'This is a course for beginners of spanish. We will walkthrough how to say fundamentals phrases and verbs to help you in your everyday encounters in barcelona',
    end_date:        Date.new(2019,03,19),
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
    end_date:        Date.new(2019,03,17),
    start_date:     Date.new(2019,03,15),
    level:    'Advance',
    address: "Carrer Ramon y Cajal,50, 08012",
    area: "Joanic",
    city: "Barcelona",
    price: 200,
    video_url: "video_url2",
    capacity: 6
    )

curso_spanish_days = CourseDay.create!(start_time: 19,
  end_time: 21,
  working_day: "Wed",
  course: curso_spanish
  )

carlitos_student_booking = Booking.create!(total_price: 100, course: curso_spanish, user: carlitos_student)
carlitos_student_booking2 = Booking.create!(total_price: 200, course: curso_english, user: carlitos_student)
valentin_student_booking = Booking.create!(total_price: 100, course: curso_spanish, user: valentin_student)

carlitos_student_spanish_review = Review.create!(content: 'Juanito is so bad teacher, I wont come back', rating: 1, booking: carlitos_student_booking)
carlitos_student_english_review = Review.create!(content: 'Juanito is amaaazing!', rating: 5, booking: carlitos_student_booking2)
valentin_student_spanish_review = Review.create!(content: 'Juanito is a good teacher, takes the time explain and correct my grammar', rating: 4, booking: valentin_student_booking)


music_interest_category = InterestCategory.create!(content: 'music')
sport_interest_category = InterestCategory.create!(content: 'sport')
movies_interest_category = InterestCategory.create!(content: 'movies')

rock_interest_tag = InterestTag.create!(content: 'K-pop', interest_category:music_interest_category)
tennis_interest_tag = InterestTag.create!(content: 'tennis', interest_category: sport_interest_category)
movies_interest_tag = InterestTag.create!(content: 'Romantic', interest_category: movies_interest_category)
juan_interest_link1 = UserInterest.create!(interest_tag: rock_interest_tag, user: juanito_teacher)
juan_interest_link2 = UserInterest.create!(interest_tag: tennis_interest_tag, user: juanito_teacher)
juan_interest_link3 = UserInterest.create!(interest_tag: movies_interest_tag, user: juanito_teacher)

puts 'Finished!'

