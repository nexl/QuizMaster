# QuizMaster 

QuizMaster is a simple quiz-app, that allows you to:
* Create quizzes
* Create, update, and delete questions
* Assign students, and system will show the score based on their answers

### Specs
* Ruby 2.3.3
* Rails 5.0.1
* React v15.3.0
* Psql 9.5
* [Mecab](https://taku910.github.io/mecab/)

### Installation

```sh
$ git clone git@github.com:nexl/QuizMaster.git
$ bundle install
$ rake db:create
$ rake db:migrate
```

### Optional (If you want to use Kanji - Hiragana converter, on Mac OS with Homebrew)
```sh
$ brew install mecab
$ brew install mecab-ipadic
```

### Optional (If you want to use Kanji - Hiragana converter, on Linux)
```sh
$ sudo apt-get install mecab libmecab-dev mecab-ipadic
$ sudo aptitude install mecab-ipadic-utf8
$ sudo apt-get install python-mecab
```
