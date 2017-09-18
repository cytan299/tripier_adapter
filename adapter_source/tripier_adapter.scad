/*
    tripier_adapter.scad is the code to generate an Ioptron tripier column adapter.
    Copyright (C) 2017  C.Y. Tan
    Contact: cytan299@yahoo.com

    This file is part of 3D case power distribution

    tripier_adapter.scad is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    tripier_adapter.scad is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with tripier_adapter.scad.  If not, see <http://www.gnu.org/licenses/>.

*/

$fn=100;

// all dimensions in inches

// constants
Base_w = 1.4188;
R_outer = 3.5;
R_inner = 3.0;

module make_base()
{
  difference(){
    /* 
      draw a truncated cylinder wall with a flat pedestal
    */
    union(){
      linear_extrude(height=Base_w){
        difference(){
          circle(r=R_outer);
	  // take away the inside
          circle(r=R_inner);
	  // take away the front face
	  polygon([[-1.1562, -3.3035],
	           [1.1562,-3.3035],
	           [1.1562,-4.3035],
		   [-1.1562, -4.3035],
		   [-1.1562, -3.3035]]);
	  // take away the back
	  polygon([[-5, -2.5014], [5, -2.5014],
	           [5,5], [-5, 5],
		   [-5, -2.5014]]);
          // take away the left side wall
	  polygon([[-1.6562, -2.5014], [-1.6562, -5],
	           [-5, -5], [-5, -2.5014],
		   [-1.6562, -2.5014]]);
	  // take away the right side wall
	  polygon([[1.6562, -2.5014], [1.6562, -5],
	           [5, -5], [5, -2.5014],
		   [1.6562, -2.5014]]);
        }
      } // linear extrude
      // put on a pedestal
      translate([0,-3.4035,0.7094]){
        cube([2.3125, 0.2, 1.4188], center=true);
      }
    }
    
    // make the hole for mounting the adapter to the tri-pier
    translate([0, 1, 1.0938]){
      rotate([90,0,0]){
        cylinder(h=10, d=0.25, center=true);
      }
    }
    // and countersink it
    translate([0, -3.5035, 1.0938]){
      rotate([90,0,0]){
        cylinder(h=0.5, d=0.4, center=true);
      }
    }    
    

   // make the slot for the front
   translate([0,-1,0.0]){
     rotate([90,0,0]){
       
       union(){
         translate([0, 0.375,0]){
           cylinder(h=3.5035, r=0.125, center=false);
         }
         translate([0, 0.625,0]){
           cylinder(h=3.5035, r=0.125, center=false);       
         }
         linear_extrude(height=3.5035){
           polygon([[-0.125, 0.375], [0.125, 0.375],
                    [0.125, 0.625], [-0.125, 0.625],
		    [-0.125, 0.375]]);
         } 
       }
     }  

   } // translate

   // make the slot for the back
   translate([0,0,0.0,0]){
     rotate([90,0,0]){
       union(){
         translate([0, 0.375,0]){
           cylinder(h=3.25, r=0.25, center=false);
          }
          translate([0, 0.625,0]){
            cylinder(h=3.25, r=0.25, center=false);       
          }
          linear_extrude(height=3.25){
            polygon([[-0.25, 0.375], [0.25, 0.375],
                     [0.25, 0.625], [-0.25, 0.625],
		     [-0.25, 0.375]]);
          } 
        }
      }  
    } // translate
  } // difference  
}

module make_saddle()
{
  difference(){
    translate([0,0, Base_w/4]){
      linear_extrude(height=Base_w){
        difference(){
          // create the front face
          circle(r=2.9);
	  polygon([[-5, -2.55],
	           [5,-2.55],
		   [5, 5],
		   [-5, 5],
		   [-5,-2.55]]);

          // take away the left side wall
	  polygon([[-0.75, -2.8013], [-5, -2.8013],
	           [-5, 5], [-0.75, 5],
		   [-0.75, -2.8013]]);
		   
	  // take away the right side wall
	  polygon([[0.75, -2.8013], [5, -2.8013],
	           [5, 5], [0.75, 5],
		   [0.75, -2.8013]]);
	  

        }
      }	
    }

    // make a screw hole
    translate([0, 1, 1.0938]){
      rotate([90,0,0]){
        cylinder(h=10, d=0.25, center=true);
      }
    }
    // and countersink it
    translate([0, -2.475, 1.0938]){
      rotate([90,0,0]){
        cylinder(h=0.5, d=0.5, center=true);
      }
    }
  }
}


// make it
make_base();
make_saddle();


 