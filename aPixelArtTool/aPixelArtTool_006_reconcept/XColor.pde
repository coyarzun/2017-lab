class XColor {
  color myColor;
  int   howMany;

  XColor(color c) {
    myColor = c;
    howMany = 1;
  }
  XColor(color c, int n) {
    myColor = c;
    howMany = n;
  }
  void addOne() {
    howMany++;
  }
  void addMany(int n) {
    howMany+=n;
  }
}
