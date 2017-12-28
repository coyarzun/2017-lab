#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

#define PI 3.14159265358979323846

uniform sampler2D texture;
uniform sampler2D textureMap;

#define sq3         1.73205080757


uniform float time;
uniform vec2 resolution;
uniform sampler2D ppixels;

/////////////////////////////////////
// uniform float leftGlitch, rightGlitch;
// uniform float interlaceF;
// uniform float hueCyclingF;
// uniform float hShearAmp, vShearAmp;
// uniform float micLevel;
// uniform float doH;
/////////////////////////////////////

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
float map(float x, float in_min, float in_max, float out_min, float out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
float rand(float n){return fract(sin(n) * 43758.5453123);}


/////////////////////////////////////

float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}
float noise(float p){
    float fl = floor(p);
    float fc = fract(p);
    return mix(rand(fl), rand(fl + 1.0), fc);
}
float noise(vec2 n) {
    const vec2 d = vec2(0.0, 1.0);
    vec2 b = floor(n), f = smoothstep(vec2(0.0), vec2(1.0), fract(n));
    return mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}


float mod289(float x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 mod289(vec4 x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 perm(vec4 x){return mod289(((x * 34.0) + 1.0) * x);}

float noise(vec3 p){
    vec3 a = floor(p);
    vec3 d = p - a;
    d = d * d * (3.0 - 2.0 * d);

    vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww);

    vec4 c = k2 + a.zzzz;
    vec4 k3 = perm(c);
    vec4 k4 = perm(c + 1.0);

    vec4 o1 = fract(k3 * (1.0 / 41.0));
    vec4 o2 = fract(k4 * (1.0 / 41.0));

    vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
    vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

    return o4.y * d.y + o4.x * (1.0 - d.y);
}

#define NUM_OCTAVES 5

float fbm(float x) {
    float v = 0.0;
    float a = 0.5;
    float shift = float(100);
    for (int i = 0; i < NUM_OCTAVES; ++i) {
        v += a * noise(x);
        x = x * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}


float fbm(vec2 x) {
    float v = 0.0;
    float a = 0.5;
    vec2 shift = vec2(100);
    // Rotate to reduce axial bias
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.50));
    for (int i = 0; i < NUM_OCTAVES; ++i) {
        v += a * noise(x);
        x = rot * x * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}


float fbm(vec3 x) {
    float v = 0.0;
    float a = 0.5;
    vec3 shift = vec3(100);
    for (int i = 0; i < NUM_OCTAVES; ++i) {
        v += a * noise(x);
        x = x * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}

float pattern( in vec2 p ){
      vec2 q = vec2( fbm( p + vec2(0.0,0.0) ),
                     fbm( p + vec2(5.2,1.3) ) );

      return fbm( p + 4.0*q );
}
float pattern2( in vec2 p ){
      vec2 q = vec2( fbm( p + vec2(0.0,0.0) ),
                     fbm( p + vec2(5.2,1.3) ) );

      vec2 r = vec2( fbm( p + 4.0*q + vec2(1.7,9.2) ),
                     fbm( p + 4.0*q + vec2(8.3,2.8) ) );

      return fbm( p + 4.0*r );
}

/////////////////////////////

void main(void) {
    
    vec2 p = gl_FragCoord.xy/ resolution.xy;
    //p.x +=0.5;
    //p.y *= -1.0;

    vec2 pp = p;//*fb;//*fb+vec2(-1.0,-1.0)*fb/3.0;
    vec2 rm = 0.5-1.0*p;

    float aspectRatio = resolution.x/resolution.y;
    rm.x *= aspectRatio;
    rm*=1.0;
    float r = length(rm);
    float a = atan(rm.y,rm.x);
    //float n = noise(time*1.1+rm*1.0);
    //float stime = n*100.0;//*(1.0+cos(a+time*0.01));
    a = sin(a)*PI;
    //vec2 rmx = vec2(a,a);

    float rr    = noise(time*200.0+a*5.0);
    float bb    = 1.0;//noise(time*25.0+r*10.0);
    float gg    = noise(-time*20.1-a*1.0);


    float fb = 0.9;//0.99;//1.0+0.5*sin(time);
    
    //
    float offset = 0.5;
    pp += offset/fb;
    pp *= fb;
    pp -= offset*fb;
   
    vec4 color = texture2D(texture, p);//0.5+0.5 * 

    vec4 color2      = texture2D(ppixels, pp);

    // color2.r*=rr;
    // color2.g+=gg;
    // color2.b+=bb;
    // //
    color2.r *= 2.2;
    //color2.g *= 3.0;
    color2.b *= -1.2;
    color /= color2;
    color /= 1.2;

    // //vec4 texcolor      = texture2D(textureMap, p);//curves
    
    color.r         = texture2D(textureMap, vec2(color.r, 0)).r;
    color.g         = texture2D(textureMap, vec2(color.g, 0)).g;
    color.b         = texture2D(textureMap, vec2(color.b, 0)).b;

    gl_FragColor    = color;//*color2;//*2.2;
}
