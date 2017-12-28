class XPalette {
  String name;
  int    totalPixels;
  ArrayList<XColor> palette;
  String sortBy = "None";

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
  void add(XPalette p){
    name += "+"+p.name;
    totalPixels += p.totalPixels;
    for (int i=0; i<p.palette.size(); i++) {
      color tmp  = p.palette.get(i).myColor;
      int   many = p.palette.get(i).howMany;
      boolean exist = false;
      for (XColor c : palette) {
        if (c.myColor == tmp) {
          c.addMany(p.palette.get(i).howMany);
          exist = true;
        }
      }
      if (!exist)palette.add(new XColor(tmp, many));
    }
  }
  void sortByColor(){//bubble sort
    sortBy = "Color";
    for(int i=palette.size()-1; i>0; i--){
      for(int j=0; j<i; j++){
        XColor c = (XColor)palette.get(j);
        XColor d = (XColor)palette.get(j+1);
        if(c.myColor>d.myColor){
           palette.set(j, d);
           palette.set(j+1,c);
        }
      }
    }
  }
  void sortByQuantity(){//bubble sort
    sortBy = "Quantity";
    for(int i=palette.size()-1; i>0; i--){
      for(int j=0; j<i; j++){
        XColor c = (XColor)palette.get(j);
        XColor d = (XColor)palette.get(j+1);
        if(c.howMany>d.howMany){
           palette.set(j, d);
           palette.set(j+1,c);
        }
      }
    }
  }
  
  void inform() {
    println("-------------------------------------------");
    println("Source :  "+name);
    println("Pixels : "+totalPixels);
    println("Colors : "+palette.size());
    println("Sort by: "+sortBy);
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
