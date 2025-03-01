class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: "pick your food from our menu\n         More than 35 times",
      image: "assets/images/screen1.png",
      title: "Select from Our Best Now"),
  UnboardingContent(
      description:
          "You can pay cash on delivery and\n        card payment available",
      image: "assets/images/screen2.png",
      title: "Easy and Online Payment"),
  UnboardingContent(
      description: "Deliver your food at your\n              Doorstep ",
      image: "assets/images/screen3.png",
      title: "Quick Delivery at Your Doorstep")
];
