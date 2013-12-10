jQuery ->
  $("form select#user_per_page").change ->
    $(this).closest("form").submit();
