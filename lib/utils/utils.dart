class Utils{
  String formatDate(String unformattedDate){
    String day = unformattedDate.substring(0, 2);
    String month = unformattedDate.substring(3, 5);
    String time = unformattedDate.substring(11);
    const months = {
      '01': 'Jan',
      '02': 'Feb',
      '03': 'Mar',
      '04': 'Apr',
      '05': 'May',
      '06': 'Jun',
      '07': 'Jul',
      '08': 'Aug',
      '09': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
    };
    return "Newest updated $day ${months[month]}, ${time.substring(0, 5)} IST";
  }
  DateTime reformatDate(String unformattedDate){
    return DateTime.parse(unformattedDate);
  }
}
