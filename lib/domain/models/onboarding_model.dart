class OnboardingModel {
  final String title;
  final String image;
  final String desc;

  OnboardingModel({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingModel> contents = [
  OnboardingModel(
    title: "Your dream vacation is waiting for you",
    image: "assets/images/image1.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingModel(
    title: "Your dream vacation is waiting for you",
    image: "assets/images/ob1.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingModel(
    title: "Your dream vacation is waiting for you",
    image: "assets/images/ob3.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
