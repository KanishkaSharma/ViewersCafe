$(document).on('turbolinks:load', function(){
  var video = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/videos/autocomplete?search=%SEARCH',
      wildcard: '%SEARCH'
    }
  });
  $('#search').typeahead(null, {
    source: video
  });  
})