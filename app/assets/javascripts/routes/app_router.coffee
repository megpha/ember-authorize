AuthorizeNet.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.
          get('applicationController').
          connectOutlet 'creditCard', AuthorizeNet.CreditCard.create() 
