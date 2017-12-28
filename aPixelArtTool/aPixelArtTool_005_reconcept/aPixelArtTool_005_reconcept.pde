XPalette[]        palettes;
ArrayList<XColor> gpalette;
int               totalPixels;

void setup() {
  palettes = new XPalette[3];
  for (int i=0; i<palettes.length; i++) {
    palettes[i] = new XPalette(nf(i+1, 2)+".gif");
    palettes[i].inform();
    totalPixels+= palettes[i].totalPixels;
  }
  
  makeGPalette();
  gInform();
}
void draw(){
}
void makeGPalette() {
  gpalette = new ArrayList<XColor>();
  for (int i=0; i<palettes.length; i++) {
    for (int j=0; j<palettes[i].palette.size(); j++) {
      color tmp  = palettes[i].palette.get(j).myColor;
      int   many = palettes[i].palette.get(j).howMany;
      boolean exist = false;
      for (XColor c : gpalette) {
        if (c.myColor == tmp) {
          c.addMany(palettes[i].palette.get(j).howMany);
          exist = true;
        }
      }
      if (!exist)gpalette.add(new XColor(tmp, many));
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
    for (XColor c : gpalette) {
      print(nf(i, 2)+" ");
      print("rgb("+nf(int(red(c.myColor)), 3)+","
        +nf(int(green(c.myColor)), 3)+","
        +nf(int(blue(c.myColor)), 3)+")"  ) ;
      println("\t"+c.howMany);
      i++;
    }
    println("-------------------------------------------");
  }



