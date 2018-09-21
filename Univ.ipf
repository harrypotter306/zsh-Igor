#pragma rtGlobals=3		// Use modern global access method and strict wave access.
//This procedure is built for...
function transpose3Dxy(w)
//Transpose the x & y values of a 3D wave
    wave w
    variable nx=dimsize(w,0)
    variable ny=dimsize(w,1)
    variable nz=dimsize(w,2)
    make/n=(ny,nx,nz) wt
    setscale/p x,dimoffset(w,1),dimdelta(w,1),wt
    setscale/p y,dimoffset(w,0),dimdelta(w,0),wt
    setscale/p z,dimoffset(w,2),dimdelta(w,2),wt
    wt[][][]=w[q][p][r]
    duplicate/o wt,$nameofwave(w)
    killwaves wt
end