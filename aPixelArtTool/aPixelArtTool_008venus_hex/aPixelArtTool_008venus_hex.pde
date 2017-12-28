XPalette          globalPalette;
XPalette[]        palettes;

void setup() {
  globalPalette = new XPalette();
  palettes      = new XPalette[1];
  for (int i=0; i<palettes.length; i++) {
    palettes[i] = new XPalette("venus milo.gif");//nf(i+1, 2)+".gif");
    palettes[i].inform();
    globalPalette.add(palettes[i]);
  }
  globalPalette.inform();
  globalPalette.sortByColor();
  globalPalette.inform();
  globalPalette.sortByQuantity();
  globalPalette.inform();
  noLoop();
}


