class Course {
  String name;
  String dateDuration;
  String time;
  String regNumber;
  String image;
  int numberOfDays;
  int currentDay;
  String nextClassOn;
  Course(
      {this.name,
      this.dateDuration,
      this.nextClassOn,
      this.time,
      this.regNumber,
      this.image,
      this.currentDay = 1,
      this.numberOfDays = 4});
}
