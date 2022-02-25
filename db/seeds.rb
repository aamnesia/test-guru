categories = Category.create([
  { title: 'Biology' },
  { title: 'Music' },
  { title: 'Literature' }
])

tests = Test.create([
  { title: 'Butterflies', level: 1, category: categories[0], author: admin },
  { title: 'Rachmaninoff', level: 2, category: categories[1] },
  { title: 'Nabokov', level: 3, category: categories[2], author: admin }
])

questions = Question.create([
  { body: 'How long does a butterfly live?', test: tests[0] },
  { body: 'How many stages does life cycle of butterfly include?', test: tests[0] },
  { body: 'Which genre does he represent?', test: tests[1] },
  { body: 'He wrote .. symphonies', test: tests[1] },
  { body: 'He is famous as virtuous .. player', test: tests[1] },
  { body: 'His favorite insect was a ..', test: tests[2] }
])

Answer.create([
  { body: '15-30 days', question: questions[0], correct: true },
  { body: '1', question: questions[1] },
  { body: '2', question: questions[1] },
  { body: '3', question: questions[1] },
  { body: '4', question: questions[1], correct: true },
  { body: 'Romantic', question: questions[2], correct: true },
  { body: 'Jazz', question: questions[2] },
  { body: '3', question: questions[3], correct: true },
  { body: '5', question: questions[3] },
  { body: '0', question: questions[3] },
  { body: 'Violin', question: questions[4] },
  { body: 'Piano', question: questions[4], correct: true },
  { body: 'Butterfly', question: questions[5], correct: true },
  { body: 'Spider', question: questions[5] },
  { body: 'Bumblebee', question: questions[5] }
])
