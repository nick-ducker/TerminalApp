# frozen_string_literal: true

require 'faker'

# This module holds the phrases and prompts used for the game class whenever it is instantiated
module DataModule
  PHRASES = [
    [Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote,
     Faker::TvShows::TheITCrowd.quote],

    [Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote,
     Faker::TvShows::RickAndMorty.quote],

    [Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
     Faker::Movies::HitchhikersGuideToTheGalaxy.quote]
  ].freeze

  PROMPTS = {
    d1: [
      'Oi! Go and empty the [BIN] over there! NOW!',
      'You need to [PUT] those boxes away, STAT!',
      "Far out, the customers are complaining it's too [HOT] , turn on the AC!",
      "HEY! Get the swatter and kill that [FLY] , it's annoying everyone!",
      'THROW OUT THAT [OLD] WINE!',
      'You want to keep your [JOB] ? MOVE IT!',
      'Would you recommend the [RED] or the white?',
      'Oi, what can I [BUY] in this joint CHAMP?!',
      'Excuse me could you put my [BAG] behind the bar please?',
      'WE NEED MORE [ICE] RIGHT NOW!'
    ],
    d2: [
      "Man, I'v been here for 9 hours, what a [GRIND] !",
      "Who tipped the potplant over? There's [SOIL] everywhere!",
      "This is, without a [DOUBT] , the worst bar I've ever been to",
      "[SCAN] the room for glasses would you? We're running low",
      'Oh we heard this bar is all the latest [RAGE] recently!',
      'Could you [TELL] me more about where this wine is from?',
      'Mate, could I grab a [BEER] ?',
      'Just a glass of red [WINE] please',
      'Could you get a [SPARE] carton from downstairs?',
      'The amount of cockcroaches in this bar is not [IDEAL]'
    ],
    d3: [
      'Do you do [SENIOR] discounts here?? WHAT?',
      "Please sir, it's my job to make sure you don't drink to [EXCESS]",
      "I just come here every Friday because I'm [LONELY] ...",
      "Hi, we booked for 20 people in an hour but we're gonna have to [CANCEL] :)",
      'Look here, CHAMP, let me give you some [ADVICE] on life',
      "It's going to be a mild [MIRACLE] if nothing goes wrong tonight",
      "JUST [ABANDON] WHAT YOU'RE DOING AND HELP ME DANG IT!",
      'Erm, I think we might have a bit of a [PROBLEM] here..',
      "We don't have enough staff to [SUSTAIN] this level of service!",
      'I think the boss is stressed because of the [AUDITOR] coming in :S'
    ],
    d4: [
      'Can you grab that beer, thing, what, [CYLINDER] , metal keg thing?',
      "My my aren't you a [TALENTED] young bartender ;)",
      'Drink order [COMPLETE] ! oh wait theres another docket...',
      'There is no other word to describe this place at 1am better than [FRAGRANT]',
      'What you will [DISCOVER] , is that people simply see you as a drink pouring robot',
      "Don't chat with the weird dude! You'll just [ENCOURAGE] him!",
      'I have a [SUSPICION] that tonight will get harder before it gets easier',
      "Don't worry, our staff shortage is only [TEMPORARY] , promise ;)",
      'Tonight can be likened to an [ORCHESTRA] of CHAOS!',
      "You think you're the [EXCEPTION] here? WORK HARDER!"
    ]
  }.freeze
  # Returns a random set of phrases for the game class
  def phrase_select
    PHRASES.sample
  end

  # Returns 5 random prompts based on the key passed
  def prompt_select(key)
    PROMPTS[key].sample(5)
  end
end

# This module holds all the difficulty variables for the game class instance
module DifficultyModule
  # [0] difficulty symbol
  # [1] seconds given to type answer
  # [2] score penalty if timeout or wrong answer
  # [3] amount of phrases that will be displayed
  # [4] array of random sleep ranges to be chosen from each time a character is typed with the round_typer method
  # [5] number of times the phrases/prompt are flashed
  # [6] time between flashes
  # [7] string name of the difficulty
  DIFFICULTY = {
    d1: [
      :d1,
      3,
      1000,
      rand(4..6),
      [rand(0.005..0.009), rand(0.03..0.06), rand(0.03..0.06)],
      rand(3..5),
      rand(0.4..0.6),
      'EASY'
    ],
    d2: [
      :d2,
      2.5,
      2000,
      rand(3..6),
      [rand(0.005..0.009), rand(0.005..0.009), rand(0.03..0.06)],
      rand(4..6),
      rand(0.35..0.55),
      'MEDIUM'
    ],
    d3: [
      :d3,
      1.5,
      3000,
      rand(2..7),
      [rand(0.003..0.005), rand(0.005..0.009), rand(0.01..0.03)],
      rand(3..5),
      rand(0.35..0.45),
      'HARD'
    ],
    d4: [
      :d4,
      1.5,
      4000,
      rand(1..5),
      [rand(0.003..0.005), rand(0.005..0.009), rand(0.005..0.009)],
      rand(2..4),
      rand(0.35..0.35),
      'INSANE'
    ]
  }.freeze
end
