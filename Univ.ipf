#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.
//This procedure is built for universal use of Igor.

//----------Part 1 Transpose----------
//1.1 transpose3Dxy
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
//1.2 transpose3Dxz
function transpose3Dxz(w)
//Transpose the x & z values of a 3D wave, especially used in ARPES Helium thetamap
    wave w
    variable nx=dimsize(w,0)
    variable ny=dimsize(w,1)
    variable nz=dimsize(w,2)
    make/n=(nz,ny,nx) wt
    setscale/p x,dimoffset(w,2),dimdelta(w,2),wt
    setscale/p y,dimoffset(w,1),dimdelta(w,1),wt
    setscale/p z,dimoffset(w,0),dimdelta(w,0),wt
    wt[][][]=w[r][q][p]
    duplicate/o wt,$nameofwave(w)
    killwaves wt
end


//----------Part 2 Scale----------
//2.1 dimright
function dimright(w,d)
    wave w
    variable d
    variable dm
    dm=dimoffset(w,d)+(dimsize(w,d)-1)*dimdelta(w,d)
    return dm
end
