#pragma rtGlobals=3		// Use modern global access method.
menu "YW"
  submenu "Raman"
    "Load Map", RamanMapping()
  end
end
//modified by SH at 20180905 from YW_Raman.ipf
function RamanMapping()

    loadwave/J/M/D/A=temp/L={0,0,0,0,0}
    wave temp0

    variable xofst=temp0[1][0],yofst=temp0[1][1],zofst=temp0[0][2]
    variable ydel=temp0[2][1]-yofst   //,zdel=temp0[0][3]-zofst
    variable ypt=(temp0[dimsize(temp0,0)-1][1]-yofst)/ydel+1
    variable xpt=(dimsize(temp0,0)-1)/ypt
    variable zpt=dimsize(temp0,1)-2
    variable xdel=temp0[xpt+1][0]-xofst
    variable zdel=(temp0[0][dimsize(temp0,1)-1]-zofst)/(zpt-1)
    variable ni,nj,nk
    
    make/o/n=(xpt,ypt,zpt) RamanMap
    setscale/p x, xofst, xdel, RamanMap
    setscale/p y, yofst, ydel, RamanMap
    setscale/p z, zofst, zdel, RamanMap
    // for(ni=0;ni<xpt;ni=ni+1)
    //     for(nj=0;nj<ypt;nj=nj+1)
    //         for(nk=0;nk<zpt;nk=nk+1)
    //             RamanMap[ni][nj][nk]=temp0[ni*ypt+nj+1][nk+2]
    //         endfor
    //     endfor
    // endfor
    RamanMap[][][]=temp0[1+p*ypt+q][2+r]       //modified location
    //killwaves temp0
end