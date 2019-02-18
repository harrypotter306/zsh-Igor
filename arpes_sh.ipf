#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.
//This procedure is built for ARPES analysis by SH
//Created at 20180921
//for DA30 deflection map raw data, x(row)-tilt, y(column)-theta, z(layer)-energy
function normalize(w)   
//normalize each E-tilt cut
    wave w
    variable ix,iy,iz
    variable nx,ny,nz
    nx=dimsize(w,0)
    ny=dimsize(w,1)
    nz=dimsize(w,2)
    if(nz)
        for(iz=0;iz<nz;iz+=1)
            for(iy=0;iy<ny;iy+=1)
                variable s=0
                for(ix=0;ix<nx;ix+=1)
                    s+=w[ix][iy][iz]
                endfor
                for(ix=0;ix<nx;ix+=1)
                    w[ix][iy][iz]=w[ix][iy][iz]/s
                endfor
            endfor
        endfor
    else
    // if(nz)
    //     for(iy=0;iy<ny;iy+=1)
    //         variable s=0
    //             for(ix=0;ix<nx;ix+=1)
    //                 s+=w[ix][iy][iz]
    //             endfor
    //             for(ix=0;ix<nx;ix+=1)
    //                 w[ix][iy][iz]=w[ix][iy][iz]/s
    //             endfor
    //         endfor
    //     endfor
    // else
        for(iy=0;iy<ny;iy+=1)
            variable s2=0
            for(ix=0;ix<nx;ix+=1)
                s2+=w[ix][iy][iz]
            endfor
            for(ix=0;ix<nx;ix+=1)
                w[ix][iy][iz]=w[ix][iy][iz]/s2
            endfor
        endfor
    endif
end



function Angle2KCut(w,Ef,t0)
// transform angle cut to k cut
//w: x tilt; y Kinetic Energy
//Ef: Fermi Energy
//t0: value of centre of tilt
	wave w
	variable Ef
	variable t0
	variable tml=dimoffset(w,0)
	variable tmr=dimright(w,0)
	variable Em=dimright(w,1)
	duplicate/o w,$(nameofwave(w)+"k")    //creat a wave appending "k"
	wave wave2=$(nameofwave(w)+"k")
	setscale x,0.512*sqrt(Em)*sin((tml-t0)/180*pi),0.512*sqrt(Ef)*sin((tmr-t0)/180*pi),wave2   //the maximum k range of wave2
	wave2=Interp2D(w,asin(x/0.512/sqrt(y))/pi*180+t0,y)
	setscale/p y,dimoffset(w,1)-Ef,dimdelta(w,1),wave2
end