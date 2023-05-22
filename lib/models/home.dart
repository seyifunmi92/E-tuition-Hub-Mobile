import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/hooks/text/customtexts.dart';

class Courses {
  String course;
  Courses(this.course);
}

List allCourses = [
  Courses("All"),
  Courses("JAMB"),
  Courses("NECO"),
  Courses("ICAN"),
  Courses("WAEC"),
  Courses("GSAT"),
  Courses("TOEFL"),
  Courses("IELTS"),
];
