/* The Computer Language Benchmarks Game
   http://shootout.alioth.debian.org/
   contributed by Isaac Gouy 
   Optimized by Roy Williams*/

/**
 * @type {number}
 */
var PI = 3.141592653589793;

/**
 * @type {number}
 */
var SOLAR_MASS = 4 * PI * PI;

/**
 * @type {number}
 */
var DAYS_PER_YEAR = 365.24;

/**
 * @param {number} x
 * @param {number} y
 * @param {number} z
 * @param {number} vx
 * @param {number} vy
 * @param {number} vz
 * @param {number} mass
 * @constructor
 */
function Body(x,y,z,vx,vy,vz,mass,buffer,bodyIndex) {
   this.storage_ = new Float64Array(
      buffer, bodyIndex * Body.BYTES_SIZE, Body.NUM_FIELDS);
   this.storage_[Body.X] = x;
   this.storage_[Body.Y] = y;
   this.storage_[Body.Z] = z;
   this.storage_[Body.VX] = vx; 
   this.storage_[Body.VY] = vy;
   this.storage_[Body.VZ] = vz;
   this.storage_[Body.MASS] = mass;
}

/**
 * @type {number}
 * @const
 */
Body.NUM_FIELDS = 7;

/**
 * @type {number}
 * @const
 */
Body.BYTES_SIZE = Body.NUM_FIELDS * 8;

/**
 * @type {number}
 * @const
 */
Body.X = 0;

/**
 * @type {number}
 * @const
 */
Body.Y = 1;

/**
 * @type {number}
 * @const
 */
Body.Z = 2;

/**
 * @type {number}
 * @const
 */
Body.VX = 3;

/**
 * @type {number}
 * @const
 */
Body.VY = 4;

/**
 * @type {number}
 * @const
 */
Body.VZ = 5;

/**
 * @type {number}
 * @const
 */
Body.MASS = 6;


/**
 * @param {number} px
 * @param {number} py
 * @param {number} pz
 */
Body.prototype.offsetMomentum = function(px,py,pz) {
   this.storage_[Body.VX] = -px / SOLAR_MASS;
   this.storage_[Body.VY] = -py / SOLAR_MASS;
   this.storage_[Body.VZ] = -pz / SOLAR_MASS;
}

/**
 * @return {Body}
 */
function Jupiter(buffer, bodyIndex){
   return new Body(
      4.84143144246472090e+00,
      -1.16032004402742839e+00,
      -1.03622044471123109e-01,
      1.66007664274403694e-03 * DAYS_PER_YEAR,
      7.69901118419740425e-03 * DAYS_PER_YEAR,
      -6.90460016972063023e-05 * DAYS_PER_YEAR,
      9.54791938424326609e-04 * SOLAR_MASS,
      buffer, bodyIndex
   );
}

/**
 * @return {Body}
 */
function Saturn(buffer, bodyIndex){
   return new Body(
      8.34336671824457987e+00,
      4.12479856412430479e+00,
      -4.03523417114321381e-01,
      -2.76742510726862411e-03 * DAYS_PER_YEAR,
      4.99852801234917238e-03 * DAYS_PER_YEAR,
      2.30417297573763929e-05 * DAYS_PER_YEAR,
      2.85885980666130812e-04 * SOLAR_MASS,
      buffer, bodyIndex
   );
}

/**
 * @return {Body}
 */
function Uranus(buffer, bodyIndex){
   return new Body(
      1.28943695621391310e+01,
      -1.51111514016986312e+01,
      -2.23307578892655734e-01,
      2.96460137564761618e-03 * DAYS_PER_YEAR,
      2.37847173959480950e-03 * DAYS_PER_YEAR,
      -2.96589568540237556e-05 * DAYS_PER_YEAR,
      4.36624404335156298e-05 * SOLAR_MASS,
      buffer, bodyIndex
   );
}

/**
 * @return {Body}
 */
function Neptune(buffer, bodyIndex){
   return new Body(
      1.53796971148509165e+01,
      -2.59193146099879641e+01,
      1.79258772950371181e-01,
      2.68067772490389322e-03 * DAYS_PER_YEAR,
      1.62824170038242295e-03 * DAYS_PER_YEAR,
      -9.51592254519715870e-05 * DAYS_PER_YEAR,
      5.15138902046611451e-05 * SOLAR_MASS,
      buffer, bodyIndex
   );
}

/**
 * @return {Body}
 */
function Sun(buffer, bodyIndex){
   return new Body(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SOLAR_MASS, buffer, bodyIndex);
}

/**
 * @param {Array.<Body>} bodies
 * @constructor
 */
function NBodySystem(bodies){
   /**
    * @type {Array.<Body>}
    */
   this.bodies = bodies;
   var px = 0.0;
   var py = 0.0;
   var pz = 0.0;
   var size = this.bodies.length;
   for (var i=0; i<size; i++){
      var b = this.bodies[i];
      var m = b.storage_[Body.MASS];
      px += b.storage_[Body.VX] * m;
      py += b.storage_[Body.VY] * m;
      pz += b.storage_[Body.VZ] * m;
   }
   this.bodies[0].offsetMomentum(px,py,pz);
}

/**
 * @param {number} dt
 */
NBodySystem.prototype.advance = function(dt){
   var dx, dy, dz, distance, mag;
   var size = this.bodies.length;

   for (var i=0; i<size; i++) {
      var bodyi = this.bodies[i];
      var imass = bodyi.storage_[Body.MASS]
      for (var j=i+1; j<size; j++) {
         var bodyj = this.bodies[j];
         var jmass = bodyj.storage_[Body.MASS];
         dx = bodyi.storage_[Body.X] - bodyj.storage_[Body.X];
         dy = bodyi.storage_[Body.Y] - bodyj.storage_[Body.Y];
         dz = bodyi.storage_[Body.Z] - bodyj.storage_[Body.Z];

         distance = Math.sqrt(dx*dx + dy*dy + dz*dz);
         mag = dt / (distance * distance * distance);

         bodyi.storage_[Body.VX] -= dx * jmass * mag;
         bodyi.storage_[Body.VY] -= dy * jmass * mag;
         bodyi.storage_[Body.VZ] -= dz * jmass * mag;

         bodyj.storage_[Body.VX] += dx * imass * mag;
         bodyj.storage_[Body.VY] += dy * imass * mag;
         bodyj.storage_[Body.VZ] += dz * imass * mag;
      }
      bodyi.storage_[Body.X] += dt * bodyi.storage_[Body.VX];
      bodyi.storage_[Body.Y] += dt * bodyi.storage_[Body.VY];
      bodyi.storage_[Body.Z] += dt * bodyi.storage_[Body.VZ];
   }
}

/**
 * @return {number}
 */
NBodySystem.prototype.energy = function(){
   var dx, dy, dz, distance;
   var e = 0.0;
   var size = this.bodies.length;

   for (var i=0; i<size; i++) {
      var bodyi = this.bodies[i];

      e += 0.5 * bodyi.storage_[Body.MASS] *
         ( bodyi.storage_[Body.VX] * bodyi.storage_[Body.VX]
         + bodyi.storage_[Body.VY] * bodyi.storage_[Body.VY]
         + bodyi.storage_[Body.VZ] * bodyi.storage_[Body.VZ] );

      for (var j=i+1; j<size; j++) {
         var bodyj = this.bodies[j];
         dx = bodyi.storage_[Body.X] - bodyj.storage_[Body.X];
         dy = bodyi.storage_[Body.Y] - bodyj.storage_[Body.Y];
         dz = bodyi.storage_[Body.Z] - bodyj.storage_[Body.Z];

         distance = Math.sqrt(dx*dx + dy*dy + dz*dz);
         e -= (bodyi.storage_[Body.MASS] * 
               bodyj.storage_[Body.MASS]) / distance;
      }
   }
   return e;
}

/**
 * @type {number}
 */
n = arguments[0];

/**
 * @param {number} n
 */
runTest = function(n) {
  var bodyBuffer = new ArrayBuffer(Body.BYTES_SIZE * 5);
  var bodies = new NBodySystem( Array( 
     Sun(bodyBuffer, 0),Jupiter(bodyBuffer, 1),
     Saturn(bodyBuffer, 2),Uranus(bodyBuffer, 3),Neptune(bodyBuffer, 4) 
  ));
  print(bodies.energy().toFixed(9));
  for (var i=0; i<n; i++){ bodies.advance(0.01); }
  print(bodies.energy().toFixed(9));
}

runTest(n);
