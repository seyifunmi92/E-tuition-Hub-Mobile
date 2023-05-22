import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/hooks/text/customtexts.dart';

class obSlides {
  String image;
  String title;
  String subTitle;

  obSlides(this.image, this.title, this.subTitle);
}

List onboardingSlides = [
  obSlides(ImageBloc.slider1, title1, lorem),
  obSlides(ImageBloc.slider2, title2, lorem),
  obSlides(ImageBloc.slider3, title3, lorem)
];
