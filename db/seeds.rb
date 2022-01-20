users = User.create([
  { username: 'aamnesia', password: 'qwerty' },
  { username: 'Aamnesia', password: 'qwerty' }
])

categories = Category.create!([
  { title: 'Biology' },
  { title: 'Math' },
  { title: 'Literature' },
])

tests = Test.create!([
  { title: 'Nabokov', level: 3, category: categories[2], author: users[0] },
  { title: 'Volume', level: 2, category: categories[1] },
  { title: 'Butterflies', level: 1, category: categories[0], author: users[1] }
])

questions = Question.create([
  { body: 'Formula of sphere volume:', test: tests[1] },
  { body: 'His favorite insect is ...', test: tests[0] },
  { body: 'How long does a butterfly live?', test: tests[2] },
])

Answer.create!([
  { body: 'Butterfly', correct: true, question: questions[0] },
  { body: 'Spider', question: questions[0] },
  { body: 'Bumblebee', question: questions[0] },
])
