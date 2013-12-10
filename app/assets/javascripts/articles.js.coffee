jQuery ->
  $("form select#article_per_page").change ->
    $(this).closest("form").submit();
