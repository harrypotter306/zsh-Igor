#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.
function extractband(w,s1,s2)
//w: name of the wave
//s1: number of gamma-M
//S2: number of gamma-K
    wave w
    variable s1
    variable s2
    variable sp1=s1+1
    variable sp2=s2+1
    variable s=s1+s2+1         //period
    variable nt=dimsize(w,0)   //total number
    variable nb=(nt+1)/s       //number of bands
    variable ni
    make/o/n=(sp1*nb) $(nameofwave(w)+"gm")
    make/o/n=(sp2*nb) $(nameofwave(w)+"gk")
    wave gm=$(nameofwave(w)+"gm")
    wave gk=$(nameofwave(w)+"gk")
    for(ni=0;ni<nb;ni+=1)
        if (mod(ni,2)==0)
            gm[sp1*ni,sp1*ni+s1-1]=w[(s+sp1)*ni+s1-1-p]
            gk[sp2*ni,sp2*ni+s2-1]=w[p+(ni+1)*s1]
        else
            gm[sp1*ni,sp1*ni+s1-1]=w[p+(ni+1)*s2]
            gk[sp2*ni,sp2*ni+s2-1]=w[(s+sp2)*ni+s2-1-p]
        endif
        if (ni>0)
            gm[sp1*ni-1]=NaN
            gk[sp2*ni-1]=NaN
        endif
        gm[sp1*nb-1]=NaN
        gk[sp2*nb-1]=NaN
    endfor
end