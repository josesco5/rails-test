
newsUrls = []

$ ->
  $('#url-form').on 'submit', (e) ->
    url = $('#web_url').val()
    url = url.replace 'http://', ''
    url = url.replace 'https://', ''
    url = url.replace 'www.', ''
    index = url.indexOf('/')
    if index != -1
      url = url.substring(0, index)
    $('#url-list').prepend('<li>'+url+'</li>')
    $('#web_url').val('')
    newsUrls.push url
    e.preventDefault();

  syncTimer = ->
    console.log('Syncing urls')
    if (newsUrls.length != 0)
      $.post '/sync', { data: newsUrls }, (result) ->
        console.log "Urls synced successfully"
        newsUrls = []

  setInterval(syncTimer, 15000)
