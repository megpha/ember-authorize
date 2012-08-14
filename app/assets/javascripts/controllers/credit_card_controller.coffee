AuthorizeNet.CreditCardController = Ember.ObjectController.extend

  isInValid: (->
    @.get('cardNumberError') || @.get('csvError') || @.get('nameError')
  ).property('cardNumberError', 'csvError', 'nameError')

  hasValue: (prop) ->
    error = false
    unless result = !!@.get(prop)
      error = "Required"

    @.set("#{prop}Error", error)

    result

  validateName: ->
    @.set('validatedName', true)

  validateCardNumber: ->
    @.set('validatedCardNumber', true)

  validateCsv: ->
    @.set('validatedCsv', true)

  validName: ->
    @.hasValue('name')

  validCardNumber: ->
    @.hasValue('cardNumber') && @.isNumber('cardNumber')

  validCsv: ->
    @.hasValue('csv') && @.isNumber('csv')

  isNumber: (prop) ->
    o = @.get(prop)
    error = false
    unless result = ! isNaN (o-0) && o != null
      error = "Not a number"

    @.set("#{prop}Error", error)

    result
