users = User.create([
  { email: 'aamnesia@mail.ru'},
  { email: 'amnesia@mail.ru'}
])

categories = Category.create([
  { title: 'Biology' },
  { title: 'Music' },
  { title: 'Literature' }
])

tests = Test.create([
  { title: 'Butterflies', level: 1, category: categories[0], author: users[1] },
  { title: 'Rachmaninoff', level: 2, category: categories[1] },
  { title: 'Nabokov', level: 3, category: categories[2], author: users[0] }
])

questions = Question.create([
  { body: 'How long does a butterfly live?', test: tests[0] },
  { body: 'Which genre does he represent?', test: tests[1] },
  { body: 'His favorite insect is ...', test: tests[2] }
])

Answer.create([
  { body: '15-30 days', question: questions[0], correct: true },
  { body: 'Romantic', question: questions[1], correct: true },
  { body: 'Jazz', question: questions[1] },
  { body: 'Butterfly', question: questions[2], correct: true },
  { body: 'Spider', question: questions[2] },
  { body: 'Bumblebee', question: questions[2] }
])
