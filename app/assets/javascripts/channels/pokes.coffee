App.pokes = App.cable.subscriptions.create "PokeChannel",
  connected: ->
    $(document).on 'click', '[data-poke]', (event) =>
      @perform('poke', username: event.target.dataset.poke)

  received: (data) ->
    alert("Vous avez été poké par #{data.username}")