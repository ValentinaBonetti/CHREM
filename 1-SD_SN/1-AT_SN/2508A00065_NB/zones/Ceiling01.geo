# geometry of Ceiling01 defined in: user/2508A00065_NB/zones/Ceiling01.geo
GEN  Ceiling01  describes the roof or attic zone  # type, name, descr
       6        5 0.000    # vertices, surfaces, rotation angle
#  X co-ord, Y co-ord, Z co-ord
    6.84600  9.54600  5.11000   # vert 1  
    6.84600  0.00000  5.11000   # vert 2  
    0.00000  0.00000  5.11000   # vert 3  
    0.00000  9.54600  5.11000   # vert 4  
    3.42300  9.54600  6.25089   # vert 5  
    3.42300  0.00000  6.25089   # vert 6  
# no of vertices followed by list of associated vert
   4,   1,   2,   3,   4,
   4,   1,   5,   6,   2,
   3,   2,   6,   3,
   4,   3,   6,   5,   4,
   3,   4,   5,   1,
# unused index
 0   0   0   0   0  
# surfaces indentation (m)
0.000 0.000 0.000 0.000 0.000 
    3    0    0    0  # default insolation distribution
# surface attributes follow: 
# id surface       geom  loc/   mlc db      environment
# no name          type  posn   name        other side
  1, to_main       OPAQ  FLOR  ceiling_r    Main           
  2, RightSlope    OPAQ  SLOP  asphalt      EXTERIOR       
  3, FrontGable    OPAQ  VERT  cladding     EXTERIOR       
  4, LeftSlope     OPAQ  SLOP  asphalt      EXTERIOR       
  5, BackGable     OPAQ  VERT  cladding     EXTERIOR       
# base
1   0   0   0   0   0   65.35    
