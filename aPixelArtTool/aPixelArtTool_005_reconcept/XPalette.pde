class XPalette {
  String name;
  int    totalPixels;
  ArrayList<XColor> palette;

  XPalette(){
    palette = new ArrayList<XColor>();
    name    = "";
  }
  XPalette(String url) {
    palette = new ArrayList<XColor>();
    name = url;
    makePalette(url);
  }
  void makePalette(String url){
    PImage img = loadImage(url);
    totalPixels = img.pixels.length;
    for (int i=0; i<totalPixels; i++) {
      color tmp = img.pixels[i];
      boolean exist = false;
      for (XColor c : palette) {
        if (c.myColor == tmp) {
          c.addOne();
          exist = true;
        }
      }
      if (!exist)palette.add(new XColor(tmp));
    }
  }
  void inform() {
    println("-------------------------------------------");
    println("Source:  "+name);
    println("Pixeles: "+totalPixels);
    println("Colores: "+palette.size());
    println("-------------------------------------------");
    int i=0;
    for (XColor c : palette) {
      print(nf(i, 2)+" ");
      print("rgb("+nf(int(red(c.myColor)), 3)+","
        +nf(int(green(c.myColor)), 3)+","
        +nf(int(blue(c.myColor)), 3)+")"  ) ;
      println("\t"+c.howMany);
      i++;
    }
    println("-------------------------------------------");
  }
}
