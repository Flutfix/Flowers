String splitName(String name) {
  List<String> nameList = name.split(', ');
  if (nameList.length != 1) {
    name = nameList[0] + ",\n" + nameList[1];
  }
  return name;
}
