ImgAnalisys[]     analisys;
ArrayList<Xcolor> gpalette;
int               totalPixels;

void setup() {
  analisys = new ImgAnalisys[3];
  for (int i=0; i<analisys.length; i++) {
    analisys[i] = new ImgAnalisys(nf(i+1, 2)+".gif");
    totalPixels+= analisys[i].img.pixels.length;
  }
  
  makeGPalette();
  gInform();
}
void draw() {
}
void makeGPalette() {
  gpalette = new ArrayList<Xcolor>();
  for (int i=0; i<analisys.length; i++) {
    for (int j=0; j<analisys[i].palette.size(); j++) {
      color tmp  = analisys[i].palette.get(j).myColor;
      int   many = analisys[i].palette.get(j).howMany;
      boolean exist = false;
      for (Xcolor c : gpalette) {
        if (c.myColor == tmp) {
          c.addMany(analisys[i].palette.get(j).howMany);
          exist = true;
        }
      }
      if (!exist)gpalette.add(new Xcolor(tmp, many));
    }
  }
}
void gInform() {
    println("-------------------------------------------");
    println("Total:  ");
    println("Pixeles: "+totalPixels);
    println("Colores: "+gpalette.size());
    println("-------------------------------------------");
    int i=0;
    for (Xcolor c : gpalette) {
      print(nf(i, 2)+" ");
      print("rgb("+nf(int(red(c.myColor)), 3)+","
        +nf(int(green(c.myColor)), 3)+","
        +nf(int(blue(c.myColor)), 3)+")"  ) ;
      println("\t"+c.howMany);
      i++;
    }
    println("-------------------------------------------");
  }
class ImgAnalisys {
  String name;
  PImage img;
  ArrayList<Xcolor> palette;

  ImgAnalisys(String url) {
    palette = new ArrayList<Xcolor>();
    name = url;
    analize(url);
  }
  void analize(String url) {
    img = loadImage(url);
    makePalette();
    inform();
  }
  void makePalette() {
    for (int i=0; i<img.pixels.length; i++) {
      color tmp = img.pixels[i];
      boolean exist = false;
      for (Xcolor c : palette) {
        if (c.myColor == tmp) {
          c.addOne();
          exist = true;
        }
      }
      if (!exist)palette.add(new Xcolor(tmp));
    }
  }
  void inform() {
    println("-------------------------------------------");
    println("Source:  "+name);
    println("Pixeles: "+img.pixels.length);
    println("Colores: "+palette.size());
    println("-------------------------------------------");
    int i=0;
    for (Xcolor c : palette) {
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
class Xcolor {
  color myColor;
  int   howMany;

  Xcolor(color c) {
    myColor = c;
    howMany = 1;
  }
  Xcolor(color c, int n) {
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

