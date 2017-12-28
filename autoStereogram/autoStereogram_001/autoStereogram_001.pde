/*
based on
Charles Comstock / dgtized
https://github.com/dgtized/autostereogram
that was based on
http://www.techmind.org/stereo/stech.html

Originally written: 1995 
Last modified: 12 June 2002 
Source: http://www.techmind.org/stereo/stech.html
©1995-2001 William Andrew Steer
andrew@techmind.org
*/
PImage depthmask, pattern;
boolean invert;
float xdpi;
float sepfactor;
float eyeSep, obsDist, mindepth, maxdepth;
int maxsep;

void setup(){
  xdpi      = 72;//72;
  sepfactor = 0.55;
  
  eyeSep   = xdpi * 2.5;
  obsDist  = xdpi * 12;
  maxdepth = xdpi * 12;
  maxsep   = int(floor((eyeSep*maxdepth)/(maxdepth+obsDist)));
  mindepth=(sepfactor*this.maxdepth*this.obsDist)/
        ((1-sepfactor)*this.maxdepth+this.obsDist);

  pattern = createImage(100,100,RGB);//loadImage("cracked_ground.jpg");
  pattern.loadPixels();
  for(int i=0; i<pattern.pixels.length; i++)pattern.pixels[i] = color(random(255),random(255),random(255));
  pattern.updatePixels();
  //depthmask = loadImage("a24682382961_37a8b17731_o.jpg");
  depthmask = loadImage("KAZUKI-TAKAMATSU_‘Please-Come-In’-acrylic-acrylic-gouache-medium-chalk-giclee-on-tarpoulin-39-x-39-detail.jpg");
  
  size(depthmask.width, depthmask.height);
 generate(pattern, depthmask);
}
float getSeparation(int i, PImage depthData){
    float z = brightness(depthData.pixels[i]);
    if(invert)z = 256 - z; 
    float zdepth = maxdepth-z*(maxdepth-mindepth)/256;
    return round((eyeSep*zdepth)/(zdepth+obsDist));
}
int[][] calculateLinksForRow(int dwidth, int y, PImage depthData) {
    // Initialize linked pixels for row
    int[] lookL = new int[dwidth];
    int[] lookR = new int[dwidth];

    for(int x = 0; x < dwidth; x++) {
        lookL[x] = x;
        lookR[x] = x;
    }

    for(int x = 0; x < dwidth; x++) {
        float separation = getSeparation(x+y*dwidth, depthData);
        int left = floor(x - separation/2);
        int right = int(left + separation);
        boolean visible = true;
        if((left >= 0) && (right <dwidth)) {
            if (lookL[right]!=right) { // right pt already linked
                if (lookL[right]<left) { // deeper than current
                    lookR[lookL[right]]=lookL[right]; // break old links
                    lookL[right]=right;
                } else { visible = false; }
            }

            if (lookR[left]!=left) { // left pt already linked
                if (lookR[left]>right) { // deeper than current
                    lookL[lookR[left]]=lookR[left]; // break old links
                    lookR[left]=left;
                } else { visible = false; }
            }
            if (visible) { // make link
                lookL[right]=left;
                lookR[left]=right;
            }
        }
    }
    int[][] aux = new int[2][dwidth];
    aux[0] = lookL;
    aux[1] = lookR;
    return (  aux );
}
void generate(PImage pattern, PImage depthmap) {
    int dwidth = depthmap.width;
    for(int y = 0; y < depthmap.height; y++) {
        int[][] links = calculateLinksForRow(dwidth, y, depthmap);
        int[] lookL = links[0];
        int[] lookR = links[1];

        int lastlinked = 0;
        int[] kolor = new int[dwidth];
        for(int x = 0; x < dwidth; x++) {
            if(lookL[x] == x) {
                if(lastlinked == x-1) {
                    kolor[x] = kolor[x-1];
                } else {
                    kolor[x] = x % maxsep;
                }
            } else {
                kolor[x] = kolor[lookL[x]];
                lastlinked = x;
            }
            //copy_idx(kolor[x]+y % pattern.height*pattern.width, pattern,
              //       x+ y*canvas.width), dest);
            set(x, y, pattern.pixels[kolor[x]+y%pattern.height*pattern.width]);
        }
    }   
}
int getIndex(int x, int y, int w){
  return (x+y*w);
}




