DateTime parseDatime(String date) {
  if (date.isEmpty || date.trim() == '') {
    return DateTime.now();
  }
  return DateTime.parse(date);
}
