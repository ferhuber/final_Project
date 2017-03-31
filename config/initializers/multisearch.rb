PgSearch.multisearch_options = {
  using: {
    tsearch: { 
      dictionary: 'english',
      prefix: true,
      any_word: true,
      normalization: 2
     }
  }
}
