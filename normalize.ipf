#pragma rtGlobals=3		// Use modern global access method and strict wave access.
//This procedure is built for ARPES analysis by SH
//Created at 20180921
function normalize(w)
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