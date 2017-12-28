ImgAnalisys analisys;

void setup(){
  analisys = new ImgAnalisys("03.gif");
}
void draw(){
}
class ImgAnalisys{
  String name;
  PImage img;
  ArrayList<Xcolor> palette;
  
  ImgAnalisys(String url){
    palette = new ArrayList<Xcolor>();
    name = url;
    analize(url);
  }
  void analize(String url){
    img = loadImage(url);
    makePalette();
    inform();
  }
  void makePalette(){
    for(int i=0; i<img.pixels.length; i++){
      color tmp = img.pixels[i];
      boolean exist = false;
      for(Xcolor c:palette){
        if(c.myColor == tmp){
          c.addOne();
          exist = true;
        }
      }
      if(!exist)palette.add(new Xcolor(tmp));
    }
  }
  void inform(){
    println("Source:  "+name);
    println("Pixeles: "+img.pixels.length);
    println("Colores: "+palette.size());
    int i=0;
    for(Xcolor c:palette){
      print(nf(i,2)+" ");
      print("rgb("+nf(int(red(c.myColor)),3)+","
                  +nf(int(green(c.myColor)),3)+","
                  +nf(int(blue(c.myColor)),3)+")"  ) ;
      println("\t"+c.howMany);
      i++;
    }
  }
}
class Xcolor{
  color myColor;
  int   howMany;
  
  Xcolor(color c){
    myColor = c;
    howMany = 1;
  }
  void addOne(){
    howMany++;
  }
}
