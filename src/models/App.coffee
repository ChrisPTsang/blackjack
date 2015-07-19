# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  newDeal: ->
    if @get('deck').length < 15
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      alert 'new deck'
    console.log @get('deck').length
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()

  compareScores: ->
    if @get('playerHand').getScore() <= 21 and @get('dealerHand').getScore() > 21
     'YOU WIN!'
    else if @get('playerHand').getScore() <= 21 and @get('playerHand').getScore() > @get('dealerHand').getScore() 
     'YOU WIN!'
    else if @get('playerHand').getScore() == @get('dealerHand').getScore()
     'PUSH'
    else
     'YOU LOSE.....'