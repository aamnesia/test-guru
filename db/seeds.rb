categories = Category.create!([
  { title: 'Biology' },
  { title: 'Math' },
  { title: 'Literature' },
])

tests = Test.create!([
  { title: 'Nabokov', level: 3, category_id: categories[2].id },
  { title: 'Volume', level: 2, category_id: categories[1].id },
  { title: 'Butterflies', level: 1, category_id: categories[0].id }
])

questions = Question.create([
  { body: 'Formula of sphere volume:', test_id: tests[1].id },
  { body: 'His favorite insect is ...', test_id: tests[0].id },
  { body: 'How long does a butterfly live?', test_id: tests[2].id },
])

Answer.create!([
  { body: 'Butterfly', correct: true, question_id: questions[0].id },
  { body: 'Spider', question_id: questions[0].id },
  { body: 'Bumblebee', question_id: questions[0].id },
])

users = User.create([
  {login: 'aamnesia', password: 'qwerty'}
  {login: 'Aamnesia', password: 'qwerty'}
])

user_tests = UserTest.create([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[0].id, test_id: tests[1].id},
  {user_id: users[0].id, test_id: tests[2].id}
])
