class AbsolutChapter{
  final List<Chapters> physicChapters;
  final String imagePath;
  final String name;
  const AbsolutChapter({
    required this.name, 
    required this.physicChapters, 
    required this.imagePath});
}

class Chapters{
  final String chaptersName;
  final List<String> sectionsName;

  Chapters({
    required this.chaptersName, 
    required this.sectionsName});
}

