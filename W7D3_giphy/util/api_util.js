export const fetchSearchGiphys = searchTerm =>
  $.ajax({
    method: "GET",
    url:
      "http://api.giphy.com/v1/gifs/search?q=${search+term}&api_key=dc6zaTOxFJmzC&limit=2"
  });
