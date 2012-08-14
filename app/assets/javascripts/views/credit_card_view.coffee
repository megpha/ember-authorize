AuthorizeNet.CreditCardView = Ember.View.extend
  templateName: 'credit_card'

AuthorizeNet.CardTextField = Ember.TextField.extend
  focusOut: (event) ->
    controller = @.get('parentView.controller')
    controller["validate#{Em.String.classify(@.get('viewName'))}"]()
    controller["valid#{Em.String.classify(@.get('viewName'))}"]()
