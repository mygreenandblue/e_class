extension VietnameseDayOfWeekExtension on String {
  String get vietnameseFormattedDate {
    // Parse the string to a DateTime object
    DateTime date;
    try {
      date = DateTime.parse(this);
    } catch (e) {
      return 'Invalid date format';
    }

    // Get the day of the week in Vietnamese
    String dayOfWeek;
    switch (date.weekday) {
      case DateTime.monday:
        dayOfWeek = 'Thứ hai';
        break;
      case DateTime.tuesday:
        dayOfWeek = 'Thứ ba';
        break;
      case DateTime.wednesday:
        dayOfWeek = 'Thứ tư';
        break;
      case DateTime.thursday:
        dayOfWeek = 'Thứ năm';
        break;
      case DateTime.friday:
        dayOfWeek = 'Thứ sáu';
        break;
      case DateTime.saturday:
        dayOfWeek = 'Thứ bảy';
        break;
      case DateTime.sunday:
        dayOfWeek = 'Chủ nhật';
        break;
      default:
        dayOfWeek = '';
    }

    // Format the date as "ngày dd-MM-yyyy"
    String formattedDate =
        'ngày ${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';

    // Combine the day of the week with the formatted date
    return '$dayOfWeek, $formattedDate';
  }
}
