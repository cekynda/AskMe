30.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
  Question.create title: title, body: body, status: 'public'
end