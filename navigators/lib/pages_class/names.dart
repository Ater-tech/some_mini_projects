import 'package:navigators/screens/fourth_page.dart';
import 'package:navigators/screens/third.dart';
import 'class_for_pages.dart';
import 'package:navigators/screens/second_page.dart';

final aPage = MyPages(name: 'A page', page: APage());
final cPage = MyPages(name: 'C page', page: CPage());
final bPage = MyPages(name:'B page', page: BPage(next: "B page", info: "third page",));
final List<MyPages> pages = [aPage, bPage, cPage];