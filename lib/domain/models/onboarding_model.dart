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
    desc: "Your dream vacation is waiting for you.",
  ),
  OnboardingModel(
    title: "Your dream vacation is waiting for you",
    image: "assets/images/ob1.png",
    desc: "Your dream vacation is waiting for you.",
  ),
  OnboardingModel(
    title: "Your dream vacation is waiting for you",
    image: "assets/images/ob3.png",
    desc: "Your dream vacation is waiting for you.",
  ),
];
