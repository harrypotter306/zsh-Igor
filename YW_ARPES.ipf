///////////////////////////////////////////////////////////////////////
///Yao Wei's procedure for ARPES data /// 
///     Last update: 2019.03.18             ///
//////////////////////////////////////////////////////////////////////
#pragma rtGlobals=1		// Use modern global access method.
menu "YW"
   "ARPES", main()
end

function main()
   setdatafolder root:
   variable V_flag
   if(!(datafolderexists("root:Load")))
      newdatafolder/o  root:Load
      if(V_flag)
         return -1
      endif
   endif
   if(!(datafolderexists("root:Normalized")))
      newdatafolder/o  root:Normalized
      if(V_flag)
         return -1
      endif
   endif
   if(!(datafolderexists("root:Map3D")))
      newdatafolder/o  root:Map3D
      if(V_flag==1)
         return -1
      endif
   endif
   if(!(datafolderexists("root:FermiEnergyFit")))
      newdatafolder/o  root:FermiEnergyFit
      if(V_flag==1)
         return -1
      endif
   endif
   if(!(datafolderexists("root:EDC_MDC")))
      newdatafolder/o  root:EDC_MDC
      if(V_flag==1)
         return -1
      endif
   endif
   if(!(datafolderexists("root:Toolsimg")))
      newdatafolder/o  root:Toolsimg
      if(V_flag==1)
         return -1
      endif
   endif
   if(!(datafolderexists("root:GlobalVar")))
      newdatafolder/o  root:GlobalVar
      if(V_flag==1)
         return -1
      endif
   endif
   wave arguwave=root:globalvar:arguwave
   wave/t currwave=root:globalvar:currwave
   if(!(waveexists(arguwave)))
      make/o/n=500  root:globalvar:arguwave=0
      wave arguwave=root:globalvar:arguwave
      arguwave[2]=-inf
      arguwave[3]=inf
      arguwave[4]=-inf
      arguwave[5]=inf
      arguwave[100]=1
      arguwave[101]=1
      arguwave[102]=1
      arguwave[119]=1
      arguwave[120]=1
      arguwave[121]=-inf
      arguwave[122]=inf
      arguwave[152]=50
      arguwave[153]=5
      arguwave[112]=1
      if(V_flag)
         return -1
      endif
   endif
   if(!(waveexists(currwave)))
      make/t/o  root:globalvar:currwave
      if(V_flag)
         return -1
      endif
   endif
   
   //arguw[0]=norm_startx                               //currwave[0]=EDC/MC
   //arguw[1]=norm_endx                                 //currwave[1]=fitFD
   //arguw[2]=norm_E1                                   //currwave[2]=kspace
   //arguw[3]=norm_E2                                   //currwave[3]=tool
   //arguw[4]=norm_A1                                   //currwave[4]=3D
   //arguw[5]=norm_A2                                   //currwave[5]=Normal
   //arguw[6]=Ef                                        //currwave[6]=curveshow
   //arguw[7]=norm_tilt                                 //currwave[7]=CT
   //arguw[8]=ks_thetai                                 //currwave[8]=tr
   //arguw[9]=ks_dtheta
   //arguw[10]=ks_Eini
   //arguw[11]=MDC_iniE
   //arguw[12]=MDC_endE
   //arguw[13]=MDC_num
   //arguw[14]=MDC_average-range
   //arguw[15]=
   //arguw[16]=EDC_iniP
   //arguw[17]=EDC_endP
   //arguw[18]=EDC_num
   //arguw[19]=EDC_average-range
   //arguw[20]=
   //arguw[21]=shift_x_step
   //arguw[22]=shift_y_step
   //arguw[23]=shift_v_step
   //arguw[24]=s&c_x_step
   //arguw[25]=s&c_y_step
   //arguw[26]=s&c_v_step
   //arguw[27]=tool_cut_x1
   //arguw[28]=tool_cut_x2
   //arguw[29]=tool_cut_y1
   //arguw[30]=tool_cut_y2
   //arguw[31]=kspace_deltaE
   //arguw[32]=kspace_Eaverage
   //arguw[33]=kspace_num
   //arguw[34]=CS_offset
   //arguw[35]=Norm_smoothconfirm
   //arguw[36]=Norm_smoothnum
   //arguw[37]=fep_peakposition1_gau
   //arguw[38]=fep_peakwidth1_gau
   //arguw[39]=fep_peakamp1_gau
   //arguw[40]=fep_linearslope
   //arguw[41]=fep_const
   //arguw[42]=fep_sx
   //arguw[43]=fep_ex
   //arguw[44]=fep_peakposition2_gau
   //arguw[45]=fep_peakwidth2_gau
   //arguw[46]=fep_peakamp2_gau
   //arguw[47]=
   //arguw[48]=3d_theta_alphabias
   //arguw[49]=tool_centerx
   //arguw[50]=tool_centery
   //arguw[51]=tool_rotateangle
   //arguw[52]=tool_deltay
   //arguw[53]=tool_deltax
   //arguw[54]=3d_Azimuthi
   //arguw[55]=3d_dAzimuth
   //arguw[56]=3d_Azi_bias
   //arguw[57]=3d_theta_tilt
   //arguw[58]=FDF_Ef
   //arguw[59]=FDF_kT
   //arguw[60]=FDF_amp
   //arguw[61]=FDF_slope
   //arguw[62]=FDF_bg
   //arguw[63]=FDF_cursorA
   //arguw[64]=FDF_cursorB
   //arguw[65]=tool_shift_z_step
   //arguw[66]=tool_s&c_z_step
   //arguw[67]=fep_peakposition3_gau
   //arguw[68]=fep_peakwidth3_gau
   //arguw[69]=fep_peakamp3_gau
   //arguw[70]=fep_peakposition4_gau
   //arguw[71]=fep_peakwidth4_gau
   //arguw[72]=fep_peakamp4_gau
   //arguw[73]=
   //arguw[74]=
   //arguw[75]=fep_peakposition5_gau
   //arguw[76]=fep_peakwidth5_gau
   //arguw[77]=fep_peakamp5_gau
   //arguw[78]=fep_peakposition6_lor
   //arguw[79]=fep_peakwidth6_lor
   //arguw[80]=fep_peakamp6_lor
   //arguw[81]=
   //arguw[82]=
   //arguw[83]=fep_peakposition7_lor
   //arguw[84]=fep_peakwidth7_lor
   //arguw[85]=fep_peakamp7_lor
   //arguw[86]=fep_peakposition8_lor
   //arguw[87]=fep_peakwidth8_lor
   //arguw[88]=fep_peakamp8_lor
   //arguw[89]=
   //arguw[90]=
   //arguw[91]=fep_peakposition9_lor
   //arguw[92]=fep_peakwidth9_lor
   //arguw[93]=fep_peakamp9_lor
   //arguw[94]=fep_peakposition10_lor
   //arguw[95]=fep_peakwidth10_lor
   //arguw[96]=fep_peakamp10_lor
   //arguw[97]=3d_Delayi
   //arguw[98]=3d_Delayoffset
   //arguw[99]=3d_dDelay
   //arguw[100]=tool_mosaicX
   //arguw[101]=tool_mosaicY
   //arguw[102]=tool_mosaicZ
   //arguw[103]=
   //arguw[104]=
   //arguw[105]=
   //arguw[106]=
   //arguw[107]=
   //arguw[108]=
   //arguw[109]=
   //arguw[110]=
   //arguw[111]=
   //arguw[112]=tool_curvature_a1
   //arguw[113]=kspace_pointAx
   //arguw[114]=kspace_pointBx
   //arguw[115]=kspace_pointAy
   //arguw[116]=kspace_pointBy
   //arguw[117]=tool_smooth1num
   //arguw[118]=tool_smooth2num
   //arguw[119]=tool_curvature_a0
   //arguw[120]=map3d_size
   //arguw[121]=tool_average_start
   //arguw[122]=tool_average_end
   //arguw[123]=kspace_ycut_xpos
   //arguw[124]=kspace_ycut_ave
   //arguw[125]=kspace_xcut_ypos
   //arguw[126]=kspace_xcut_ave
   //arguw[127]=
   //arguw[128]=
   //arguw[129]=
   //arguw[130]=
   //arguw[131]=
   //arguw[132]=
   //arguw[133]=
   //arguw[134]=
   //arguw[135]=
   //arguw[136]=
   //arguw[137]=
   //arguw[138]=tool_enx1
   //arguw[139]=tool_enx2
   //arguw[140]=tool_eny1
   //arguw[141]=tool_eny2
   //arguw[142]=tool_enfactor
   //arguw[143]=tool_RCX
   //arguw[144]=tool_RCY
   //arguw[145]=tool_Dang
   //arguw[146]=ffd_Ef2
   //arguw[147]=ffd_temperature
   //arguw[148]=ffd_amp2
   //arguw[149]=ffd_slope2
   //arguw[150]=ffd_bg2
   //arguw[151]=ffd_gausswidth
   //arguw[152]=ffd_resolutionfactor
   //arguw[153]=ffd_extendfactor
  
   
  dowindow mainmenu
  if(V_flag==1)
    dowindow/f mainmenu
    return 0
  endif
  newpanel/k=1/w=(320,0,850,65)/n=MainMenu
  modifypanel fixedsize=1
  setwindow mainmenu, hook(killpanel)=killpanel
  button nor,font="Times New Roman",fcolor=(65280,65280,0),pos={5,5},size={70,25},title="Normalize"
  button nor, proc=normalizepanel
  button ks,font="Times New Roman",fcolor=(65280,43520,0),pos={80,5},size={70,25},title="kspace"
  button ks, proc=kspace_BC
  button emdc,font="Times New Roman",fcolor=(26112,52224,0),pos={155,5},size={70,25},title="EDC/MDC"
  button emdc, proc=EDCMDC_BC
  button fdf,font="Times New Roman",fcolor=(0,43520,65280),pos={230,5},size={70,25},title="F-D fit"
  button fdf,proc=FDfit_BC
  button tool,font="Times New Roman",fcolor=(65280,0,0),pos={305,5},size={70,25},title="Tools"
  button tool,proc=opentoolpanel
  button graph, font="Times New Roman", fcolor=(0,0,65280), pos={380, 5}, size={70,25}, title="Graph"
  button graph, proc=opengraphpanel
  button loadf, font="Times New Roman",fcolor=(26368,0,52224),pos={5,35},size={70,25},title="Load"
  button loadf, proc=loadfiles
  button ac, font="Times New Roman",fcolor=(0,52224,52224),pos={455,5},size={70,25},title="Analog Cut"
  button ac, proc=AnalogCut_panel
  button CT, font="Times New Roman",fcolor=(65280,0,26112),pos={80,35},size={70,25},title="Color Table"
  button CT, proc=CT_panel
  button tr, font="Times New Roman",fcolor=(0,52224,26368),pos={155,35},size={70,25},title="Ultrafast"
  button tr, proc=tr_panel
  button infor,font="Times New Roman",pos={455,35},size={70,25},title="Info"
  button infor, proc=information
end   
   
function loadfiles(ctrlname): buttoncontrol
   string ctrlname
   dowindow Loadfile
   if(V_flag==1)
    dowindow/f Loadfile
   else
    variable wavnum=0 
    setdatafolder root:Load
    make/o/n=(100,100) data2D
    make/o/n=100 data1D
    make/o/t/n=(wavnum) wavnamelist
    make/o/n=(wavnum) selwave=0
    make/o/t/n=(8,4) infolist
    string/g root:load:path
    SVAR path=root:load:path
    infolist[0][0]="Pass Energy:"
    infolist[1][0]="Lens Mode:"
    infolist[2][0]="Acqui Mode:"
    infolist[3][0]="Slice Number:"
    infolist[4][0]="Sweep Number:"
    infolist[5][0]="Energy Scale:"
    infolist[6][0]="Version:"
    infolist[7][0]="Date:"
    infolist[0][2]="Photon Energy:"
    infolist[1][2]="Low Energy:"
    infolist[2][2]="High Energy:"
    infolist[3][2]="Energy Step:"
    infolist[4][2]="Step Time:"
    infolist[5][2]="Region Name:"
    infolist[6][2]="Instrument:"
    infolist[7][2]="Time:"
    pathinfo datafolder
    if(V_flag==1)
       path=S_path
    else
       path="Folder"
    endif
    newpanel/k=1/n=Loadfile/W=(950,5,1350,455)
    modifypanel fixedsize=1
    popupmenu path_lf, pos={5,5}, size={100,25},font="Times New Roman",title=path, mode=0, value=loadfolderlist(), proc=entersubfolder
    button update_lf, pos={5,30},size={60,20},fcolor=(26368,0,52224),font="Times New Roman",title="Update",proc=update
    popupmenu ver_lf, bodywidth=80,mode=1, pos={70,30},size={80,25},value="SES1.2.5"
    popupmenu ext_lf, bodywidth=50, mode=1, pos={155,30}, size={50,25}, value=".pxt;.fits;.txt;.bin",proc=changeext
    listbox lb_lf, pos={5,60}, size={140,195},mode=9,listwave=root:load:wavnamelist,selwave=root:load:selwave,proc=loadpreview
    checkbox dis_lf, pos={15,263}, font="Times New Roman",title="Display"
    button load_lf, pos={85,260},size={60,20},font="Times New Roman",title="Load",proc=loadfiledata
    display/n=preview/host=loadfile/w=(150,60,395,255)
    appendimage/w=loadfile#preview $"root:load:data2D"
    ModifyGraph margin(left)=30,margin(bottom)=25,margin(top)=10,margin(right)=10, tick=2,mirror=1
    ModifyImage data2D ctab= {*,*,VioletOrangeYellow,1}
    checkbox dos_lf, pos={240,263},font="Times New Roman",title="Show DOS",proc=showdos
    listbox info_lf, pos={5,285},size={390, 155},frame=4,editstyle=1,mode=0,font="Times New Roman", listwave=root:load:infolist
   endif
end

function/s loadfolderlist()
   SVAR path=root:load:path
   string subfolderlist
   if(cmpstr(path,"Folder")==0)
      subfolderlist="New Path;"
   else
      if(itemsinlist(path,":")==1)
         subfolderlist="<-- Change disk;"
      else
         subfolderlist="<-- Up;<-- Change disk;"
      endif
      subfolderlist+=indexeddir(datafolder, -1, 0)
   endif
   return subfolderlist
end

function update(ctrlname): buttoncontrol
   string ctrlname
   wave/t wavnamelist=root:load:wavnamelist
   wave selwave=root:load:selwave
   SVAR path=root:load:path
   string filelist
   controlinfo ext_lf
   filelist=indexedfile(datafolder,-1,S_value)
   redimension/n=(itemsinlist(filelist)) wavnamelist
   redimension/n=(itemsinlist(filelist)) selwave
   variable i
   for(i=0;i<itemsinlist(filelist);i+=1)
     wavnamelist[i]=stringfromlist(i,filelist)
   endfor
end

function changeext(ctrlName,popNum,popStr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   SVAR path=root:load:path
   wave/t infolist=root:load:infolist
   if(cmpstr(path, "Folder")!=0)
    update("")
    if(popnum==2)
        infolist[6][0]="Depth:"
    else
        infolist[6][0]="Version:"
    endif
   endif
end

function loadpreview(ctrlname, row, col, event): listboxcontrol
   string ctrlname
   variable row
   variable col
   variable event
   wave/t wavnamelist=root:load:wavnamelist
   wave/t infolist=root:load:infolist
   string tempname
   variable i,j
   string info
   SVAR path=root:load:path
   if((event==4)||(event==3))
   newdatafolder/o/s root:load:loadtemp
   controlinfo ext_lf
   switch(V_Value)
    case 1:
     loaddata/q/o/p=datafolder  wavnamelist[row]
    break
    case 2:
     loadfitsfile(path, wavnamelist[row],0)
    break
    case 3:
     if(loadsestxtfile(wavnamelist[row])==-1)
        return -1
     endif
    break
    case 4:
     loadDA30Map(path, wavnamelist[row], 1)
    break
   endswitch
   tempname=GetIndexedObjName("", 1, 0)
   if(strlen(tempname)==0)
      return -1
   endif
   duplicate/o $("root:load:loadtemp:"+tempname), root:load:data2D
   killdatafolder root:load:loadtemp
   setdatafolder root:load
   wave temp=root:load:data1D
   wave wavname=root:load:data2D
   redimension/n=(dimsize(wavname,0)) temp
   setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), temp
   temp=0
   for(i=0;i<dimsize(wavname,0);i+=1)
    for(j=0;j<dimsize(wavname,1);j+=1)
      temp[i]+=wavname[i][j]
    endfor
    temp[i]/=dimsize(wavname,1)
   endfor
   info=note(wavname)
   infolist[0][1]=stringbykey("Pass Energy",info,"=","\r")
   infolist[1][1]=stringbykey("Lens Mode",info,"=","\r")
   infolist[2][1]=stringbykey("Acquisition Mode",info,"=","\r")
   infolist[3][1]=stringbykey("Number of Slices",info,"=","\r")
   infolist[4][1]=stringbykey("Number of Sweeps",info,"=","\r")
   infolist[5][1]=stringbykey("Energy Scale",info,"=","\r")
   infolist[6][1]=stringbykey("Version",info,"=","\r")
   infolist[7][1]=stringbykey("Date",info,"=","\r")
   infolist[0][3]=stringbykey("Excitation Energy",info,"=","\r")
   infolist[1][3]=stringbykey("Low Energy",info,"=","\r")
   infolist[2][3]=stringbykey("High Energy",info,"=","\r")
   infolist[3][3]=stringbykey("Energy Step",info,"=","\r")
   infolist[4][3]=stringbykey("Step Time",info,"=","\r")
   infolist[5][3]=stringbykey("Region Name",info,"=","\r")
   infolist[6][3]=stringbykey("Instrument",info,"=","\r")
   infolist[7][3]=stringbykey("Time",info,"=","\r")
   if(event==3)
     loadfiledata("")
   endif
   endif
   setdatafolder root:
end

function loadfiledata(ctrlname): buttoncontrol
   string ctrlname
   wave selwave=root:load:selwave
   wave/t wavnamelist=root:load:wavnamelist
   SVAR path=root:load:path
   variable i
   for(i=0;i<dimsize(wavnamelist,0);i+=1)
     if(selwave[i]!=0)
       newdatafolder/s/o root:tempfolder
       controlinfo/w=loadfile ext_lf
       switch(V_Value)
        case 1:
         loaddata/q/o/p=datafolder  wavnamelist[i]
        break
        case 2:
         loadfitsfile(path, wavnamelist[i],1)
        break
        case 3:
         if(loadsestxtfile(wavnamelist[i])==-1)
             killdatafolder root:tempfolder
             return -1
         endif
        break
        case 4:
           loadDA30Map(path, wavnamelist[i], 0)
        break
       endswitch
       string oldname=GetIndexedObjName("", 1, 0)
       string newname
       controlinfo/w=loadfile ext_lf
       if(V_Value!=4)
           newname=removeending(wavnamelist[i],S_value)
       else
           newname=stringfromlist(itemsinlist(path, ":")-1, path, ":")
       endif
       if(char2num(newname)>=48 && char2num(newname)<=57)
	     newname="N"+newname
       endif
       duplicate/o $("root:tempfolder:"+oldname), $("root:"+newname)
       controlinfo/w=loadfile dis_lf
       if(V_value==1)
         wave destwave=$("root:"+newname)
         display; appendimage destwave
         ModifyImage $newname ctab= {*,*,PlanetEarth256,0}
       endif
       killdatafolder root:tempfolder
     endif
   endfor
   setdatafolder root:
end

function loadDA30Map(path, filename, preview)
    string path, filename
    variable preview
    variable refnum, i
    string infostr="", infolists="", header=""
    string infofile
    variable flag=1
    open/r refnum as path+"viewer.ini"
    for(i=0;i<25;i+=1)
       freadline refnum, infostr
       if(i==1)
           infofile=stringbykey("ini_path", infostr, "=", "\r")
       endif
       if(i>=10)
           infolists+=infostr
       endif
     endfor
     variable xsize, ysize, zsize
     xsize=str2num(stringbykey("width", infolists, "=", "\r"))
     ysize=str2num(stringbykey("height", infolists, "=", "\r"))
     zsize=str2num(stringbykey("depth", infolists, "=", "\r"))
     variable xoffset, xdelta, yoffset, ydelta, zoffset, zdelta
     xoffset=str2num(stringbykey("width_offset", infolists, "=", "\r"))
     yoffset=str2num(stringbykey("height_offset", infolists, "=", "\r"))
     zoffset=str2num(stringbykey("depth_offset", infolists, "=", "\r"))
     xdelta=str2num(stringbykey("width_delta", infolists, "=", "\r"))
     ydelta=str2num(stringbykey("height_delta", infolists, "=", "\r"))
     zdelta=str2num(stringbykey("depth_delta", infolists, "=", "\r"))
     close refnum
     infostr=""
     open/r refnum as path+infofile
     freadline refnum, infostr
     do
       freadline refnum, infostr
       if(cmpstr(infostr,"[Run Mode Information]\r"))
         header+=infostr
       else
         flag=0
       endif
    while(flag)
    header=replacestringbykey("Low Energy", header, num2str(xoffset), "=", "\r")
    header=replacestringbykey("High Energy", header, num2str(xoffset+xdelta*(xsize-1)), "=", "\r")
    GBLoadWave/B/Q/T={2,2}/W=1/p=datafolder/n=N filename
    wave N0
    if(preview==1)
       make/n=(xsize, ysize) temp
       setscale/p x, xoffset, xdelta, temp
       setscale/p y, yoffset, ydelta, temp
       temp[][]=N0[q*xsize+p]
    else
       make/n=(ysize, zsize, xsize) temp
       setscale/p x, yoffset, ydelta, temp
       setscale/p y, zoffset, zdelta, temp
       setscale/p z, xoffset, xdelta, temp
       temp[][][]=N0[xsize*ysize*q+xsize*p+r]
    endif
    killwaves N0
    note temp, header
end

function loadfitsfile(path, filename, check)
   string path, filename
   variable check
   variable startpos=8640, infostrlen=80
   variable angperpixel30=0.04631, angperpixel14=0.0216, midpixel=500
   variable refnum
   variable j
   open/r refnum as path+filename
   string infostr, totalinfo="", flag
   infostr=padstring("",infostrlen,0)
   for(j=0; j<startpos/infostrlen; j+=1)
      fbinread refnum, infostr
      totalinfo+=infostr+"\r"
   endfor
   variable tempa
   string tempb, tempc, tempd, head=""
   variable bits
   variable dimx, dimy, offsetx, delta_x, offsety, delta_y, hv, angle
   sscanf stringbykey("BITPIX  ", totalinfo, "=", "\r"), "                    %d", bits
   sscanf stringbykey("TDIM3   ", totalinfo, "=", "\r"), " '(%d,%d)'", dimx, dimy
   sscanf stringbykey("TRVAL3  ", totalinfo, "=", "\r"), " '(%f,%f)'", offsetx, offsety
   sscanf stringbykey("TDELT3  ", totalinfo, "=", "\r"), " '(%f,%f)'", delta_x, delta_y
   sscanf stringbykey("SSPE_0  ", totalinfo, "=", "\r"), "                   %f /pass energy", tempa
   head+="Pass Energy="+num2str(tempa)+"\r"
   sscanf stringbykey("SSLNM0  ", totalinfo, "=", "\r"), " '%7s%f /lens mode name", tempb, angle
   head+="Lens Mode="+tempb+num2str(angle)+"\r"
   sscanf stringbykey("SSSW0   ", totalinfo, "=", "\r"), "                    %d /# Sweeps", tempa
   head+="Number of Sweeps="+num2str(tempa)+"\r"
   sscanf stringbykey("SS_HV   ", totalinfo, "=", "\r"), "          %f /#SES hv", hv
   head+="Excitation Energy="+num2str(hv)+"\r"
   sscanf stringbykey("SSE0_0  ", totalinfo, "=", "\r"), "          %f /Min Energy",tempa
   head+="High Energy="+num2str(-tempa)+"\r"
   sscanf stringbykey("SSE1_0  ", totalinfo, "=", "\r"), "          %f /Max Energy",tempa
   head+="Low Energy="+num2str(-tempa)+"\r"
   sscanf stringbykey("SSRGN0  ", totalinfo, "=", "\r"), " %s /SS Region name",tempb
   tempa=strlen(tempb)
   head+="region name="+tempb[1, tempa-2]+"\r"
   sscanf stringbykey("SF_MODEL", totalinfo, "=", "\r"), " %s /Electron Spectrometer  Model",tempb
   tempa=strlen(tempb)
   head+="Instrument="+tempb[1,tempa-2]+"\r"
   sscanf stringbykey("SSDE_0  ", totalinfo, "=", "\r"), "          %f /EnergyStep", tempa
   head+="Energy Step="+num2str(tempa)+"\r"
   sscanf stringbykey("WRITE_T ", totalinfo, "=", "\r"), " '%s %s %s'", tempb, tempc, tempd
   head+="Date="+tempb+"\r"+"Time="+tempc+" "+tempd[0, strlen(tempd)-2]+"\r"
   head+="Number of Slices="+num2str(dimx)+"\r"
   sscanf stringbykey("SSKE_0  ", totalinfo, "=", "\r"), "                    %s /Kinetic?", tempb
   if(cmpstr(tempb, "T")==0)
      head+="Energy Scale="+"Kinetic"+"\r"
   else
      head+="Energy Scale="+"Binding"+"\r"
   endif
   sscanf stringbykey("SSFR_0  ", totalinfo, "=", "\r"), "                    %d /# Frames", tempa
   head+="Step Time="+num2str(tempa)+" frames"+"\r"
   sscanf stringbykey("TTYPE3  ", totalinfo, "=", "\r"), " '%s'", tempb
   head+="Acquisition Mode="+tempb[0, 4]+"\r"
   make/o/n=(dimx,dimy) fitsdata
   redimension/d fitsdata
   fsetpos refnum, startpos+2*bits
   fbinread/B=2 refnum,fitsdata
   if(angle==30)
     setscale/p x, (offsetx-midpixel)*angperpixel30, delta_x*angperpixel30, fitsdata
   elseif(angle==14)
     setscale/p x, (offsetx-midpixel)*angperpixel14, delta_x*angperpixel14, fitsdata
   endif
   setscale/p y, offsety+hv, delta_y, "eV", fitsdata
   matrixtranspose fitsdata
   fstatus refnum
   variable wavelen=bits*dimx*dimy
   variable wavnum=floor((V_logEOF-startpos)/wavelen)
   head+="Version="+num2str(wavnum)+"\r"
   note/k fitsdata, head
   if(check)
      if(wavnum>1)
        variable i=0
        make/o/n=(dimx,wavnum,dimy) fitsdata
        make/o/n=(dimx,dimy) tempwave
        redimension/d tempwave
        variable/g root:load:progress=0
        NVAR progress=root:load:progress
        string/g root:load:progressstr="0 frame"
        SVAR progressstr=root:load:progressstr
        NewPanel/k=2/N=Complete/W=(285,111,739,193)
        ValDisplay valdisp0,pos={18,25},size={342,20}, mode=3, limits={0,100,0},barmisc={0,0}, value=#"root:load:progress"
        setvariable val, pos={365, 25}, size={65, 20}, noedit=1, title=" ", value=progressstr
        Button bStop,pos={170,55},size={50,20},title="Abort"
        DoUpdate /W=Complete/E=1
        fsetpos refnum, startpos
        for(i=0;i<wavnum;i+=1)
          fstatus refnum
          fsetpos refnum, V_filepos+2*bits
          fbinread/B=2 refnum,tempwave 
          fitsdata[][i][]=tempwave[p][r]
          progress=(i+1)/wavnum*100
          progressstr=num2str(i+1)+" frame"
          DoUpdate /W=Complete
        endfor
        KillWindow complete
        killvariables root:load:progress
        killstrings root:load:progressstr
        if(angle==30)
           setscale/p x, (offsetx-midpixel)*angperpixel30, delta_x*angperpixel30, fitsdata
        elseif(angle==14)
           setscale/p x, (offsetx-midpixel)*angperpixel14, delta_x*angperpixel14, fitsdata
        endif
        setscale/p z, offsety+hv, delta_y, "eV", fitsdata
        note/k fitsdata, head
      endif
     endif
    close/a
end

function loadSEStxtfile(filename)
   string filename
   variable refnum, flag=1,i=0
   string infostr, header=""
   variable xoffset, xdelta, yoffset, ydelta
   SVAR path=root:load:path
   open/r/p=datafolder refnum as filename
   freadline refnum, infostr
   if(cmpstr(infostr, "[Info]\r"))
      print "This is not a SES text file!"
      return -1
   endif
   do
      freadline refnum, infostr
      if(cmpstr(infostr,"[Data 1]\r"))
       header+=infostr
       i+=1
      else
       flag=0
      endif
   while(flag)
   string xscale=stringbykey("Dimension 1 scale", header, "=", "\r")
   xoffset=str2num(stringfromlist(0, xscale, " "))
   xdelta=str2num(stringfromlist(1, xscale, " "))-str2num(stringfromlist(0, xscale, " "))
   string yscale=stringbykey("Dimension 2 scale", header, "=", "\r")
   yoffset=str2num(stringfromlist(0, yscale, " "))
   ydelta=str2num(stringfromlist(1, yscale, " "))-str2num(stringfromlist(0, yscale, " "))
   fstatus refnum
   LoadWave/Q/G/M/D/A=temp/L={0,i+1,0,1,0}/p=datafolder filename
   setscale/p x, xoffset, xdelta, "eV", temp0
   setscale/p y, yoffset, ydelta, temp0
   note temp0, header
   close/a
   return 0
end

function showdos(ctrlname, flag): checkboxcontrol
   string ctrlname
   variable flag
   wave data1d=root:load:data1d
   if(flag==1)
     AppendToGraph/R/w=loadfile#preview data1D
     ModifyGraph/w=loadfile#preview noLabel(right)=2,rgb=(0,15872,65280),tick=2
   else
     removefromgraph/w=loadfile#preview data1D
     ModifyGraph/w=loadfile#preview mirror=1
   endif
end

function Normalizewavey(wavname, newname, startx, endx, energy1, energy2, angle1, angle2, tilt, sms, snum, mode)
   wave wavname
   string newname
   variable startx, endx, energy1, energy2, angle1, angle2, tilt, sms, snum, mode
   redimension/D wavname
   duplicate/o/R=(energy1,energy2)(angle1, angle2) wavname, $("root:Normalized:"+newname)
   setdatafolder root:Normalized:
   wave tempwave=$newname
   make/o/n=(dimsize(tempwave,1)) factor
   setscale/p x, dimoffset(tempwave,1), dimdelta(tempwave,1), factor
   make/o/n=(dimsize($newname,0)) temp
   setscale/p x, dimoffset(tempwave,0), dimdelta(tempwave,0), temp
   variable i
   for(i=0;i<dimsize(tempwave,1);i+=1)
      temp[]=tempwave[p][i]
      factor[i]=faverage(temp,startx,endx)
   endfor
   if(sms==1)
    smooth snum, factor
   endif
   if(mode==1)
     tempwave/=factor[q]
   else
     variable ave=faverage(factor)
     tempwave/=ave
   endif
   setscale/p x, dimoffset(tempwave,0), dimdelta(tempwave,0), tempwave
   setscale/p y, dimoffset(tempwave,1)+tilt, dimdelta(tempwave,1), tempwave
   killwaves factor, temp
end

function angtok(wavname, Ef, path)
   wave wavname
   variable Ef
   string path
   setdatafolder $path
   variable maxE=dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)
   variable minE=dimoffset(wavname,0)
   variable maxphi=dimoffset(wavname,1)+(dimsize(wavname,1)-1)*dimdelta(wavname,1)
   variable minphi=dimoffset(wavname,1)
   duplicate/o wavname, temp
   if(minphi<0)
    setscale/i y, 0.512*sqrt(maxE)*sin(minphi*pi/180), 0.512*sqrt(maxE)*sin(maxphi*pi/180), temp
   else
    setscale/i y, 0.512*sqrt(minE)*sin(minphi*pi/180), 0.512*sqrt(maxE)*sin(maxphi*pi/180), temp
   endif
   temp=interp2d(wavname, x, 180/pi*asin(y/0.512/sqrt(x)))
   setscale/p x, dimoffset(temp, 0)-Ef, dimdelta(temp, 0), temp
   duplicate/o temp, $(nameofwave(wavname)+"_k")
   killwaves temp
end

function Thetamap(namelist, thetai, dtheta, tilt, alphabias, mark)
   string namelist
   variable thetai, dtheta, tilt, alphabias
   string mark
   setdatafolder root:Map3D:
   variable dimz,dimx
   dimz=dimsize($stringfromlist(0,namelist), 0)
   dimx=dimsize($stringfromlist(0,namelist), 1)
   make/o/n=(dimx,itemsinlist(namelist),dimz) $("thetamap_"+mark)
   wave mapa=$("thetamap_"+mark)
   controlinfo/w=kspacepanel accurate_3d
   if(V_value==0)
    setscale/p x, dimoffset($stringfromlist(0,namelist),1)+tilt+alphabias, dimdelta($stringfromlist(0,namelist),1), mapa
   else
    setscale/p x, dimoffset($stringfromlist(0,namelist),1)+alphabias, dimdelta($stringfromlist(0,namelist),1), mapa
   endif
   setscale/p y, thetai, dtheta, mapa
   setscale/p z, dimoffset($stringfromlist(0,namelist),0), dimdelta($stringfromlist(0,namelist),0), mapa
   variable i
   for(i=0;i<itemsinlist(namelist);i+=1)
     wave temp=$stringfromlist(i,namelist)
     mapa[][i][]=temp[r][p]
   endfor
//   else
//    variable thetas=thetai, thetae=thetai+dtheta*(itemsinlist(namelist)-1)
//    variable bias_shift=abs(bias)-atan(tan(abs(bias)*pi/180)*min(cos(thetas*pi/180),cos(thetae*pi/180)))*180/pi   //the max difference between experimental phi and the calculation phi (tilt)
//    dimz=dimsize($stringfromlist(0,namelist), 0)
//    dimx=dimsize($stringfromlist(0,namelist), 1)+round(bias_shift/dimdelta($stringfromlist(0,namelist),1))
//    make/o/n=(dimx,itemsinlist(namelist),dimz) $("thetamap_"+mark)
//    wave mapa=$("thetamap_"+mark)
//    if(bias>=0)
//    setscale/p x, dimoffset($stringfromlist(0,namelist),1)+bias-bias_shift, dimdelta($stringfromlist(0,namelist),1), mapa  // the min x = dimoffset(*)+bias-bias_shift
//    else
//    setscale/p x, dimoffset($stringfromlist(0,namelist),1)+bias, dimdelta($stringfromlist(0,namelist),1), mapa                //  the min x = dimoffset(*)+bias
//    endif
//    setscale/p y, thetai, dtheta, mapa
//    setscale/p z, dimoffset($stringfromlist(0,namelist),0), dimdelta($stringfromlist(0,namelist),0), mapa
//    for(i=0;i<itemsinlist(namelist);i+=1)
//      wave temp=$stringfromlist(i,namelist)
//      variable biastemp=atan(tan(bias*pi/180)*cos((thetai+dtheta*i)*pi/180))*180/pi
//      mapa[][i][]=interp2d(temp, dimoffset(mapa,2)+dimdelta(mapa,2)*r, dimoffset(mapa,0)+dimdelta(mapa,0)*p-biastemp)
//    endfor
end

function Azimuthmap(namelist, azimuthi, dazimuth, bias, mark)
   string namelist
   variable azimuthi, dazimuth, bias
   string mark
   setdatafolder root:Map3D:
   variable dimz,dimx
   dimz=dimsize($stringfromlist(0,namelist), 0)
   dimx=dimsize($stringfromlist(0,namelist), 1)
   make/o/n=(dimx,itemsinlist(namelist),dimz) $("azimuthmap_"+mark)
   wave mapa=$("azimuthmap_"+mark)
   setscale/p x, dimoffset($stringfromlist(0,namelist),1)+bias, dimdelta($stringfromlist(0,namelist),1), mapa
   setscale/p y, azimuthi, dazimuth, mapa
   setscale/p z, dimoffset($stringfromlist(0,namelist),0), dimdelta($stringfromlist(0,namelist),0), mapa
   variable i
   for(i=0;i<itemsinlist(namelist);i+=1)
      wave temp=$stringfromlist(i,namelist)
      mapa[][i][]=temp[r][p]
   endfor
end

function trMap(namelist, Delayi, offset, dDelay, mark)
   string namelist
   variable Delayi, offset, dDelay
   string mark
   setdatafolder root:Map3D:
   variable dimx, dimy
   dimx=dimsize($stringfromlist(0,namelist), 0)
   dimy=dimsize($stringfromlist(0,namelist), 1)
   make/o/n=(dimx,dimy,itemsinlist(namelist)) $("trMap_"+mark)
   wave mapa=$("trMap_"+mark)
   setscale/p x, dimoffset($stringfromlist(0,namelist),0), dimdelta($stringfromlist(0,namelist),0), mapa
   setscale/p y, dimoffset($stringfromlist(0,namelist),1), dimdelta($stringfromlist(0,namelist),1), mapa
   setscale/p z, (Delayi+offset)*2/0.299792458, dDelay*2/0.299792458, "ps", mapa
   variable i
   for(i=0;i<itemsinlist(namelist);i+=1)
      wave temp=$stringfromlist(i,namelist)
      mapa[][][i]=temp[p][q]
   endfor
end

function Azimuthmap2(namelist, azimuthi, dazimuth, bias, slop, mark) //can calibrate tilt offset dependent on azimuth
   string namelist
   variable azimuthi, dazimuth, bias, slop  //slope=delta(tilt offset)/delta(wave number)
   string mark
   setdatafolder root:Map3D:
   variable dimz,dimx
   dimz=dimsize($stringfromlist(0,namelist), 0)
   dimx=dimsize($stringfromlist(0,namelist), 1)+round(slop*itemsinlist(namelist)/dimdelta($stringfromlist(0,namelist), 1))
   make/o/n=(dimx,itemsinlist(namelist),dimz) $("azimuthmap_"+mark)
   wave mapa=$("azimuthmap_"+mark)
   setscale/p x, dimoffset($stringfromlist(0,namelist),1)+bias-slop*itemsinlist(namelist), dimdelta($stringfromlist(0,namelist),1), mapa
   setscale/p y, azimuthi, dazimuth, mapa
   setscale/p z, dimoffset($stringfromlist(0,namelist),0), dimdelta($stringfromlist(0,namelist),0), mapa
   variable i
   for(i=0;i<itemsinlist(namelist);i+=1)
      wave temp=$stringfromlist(i,namelist)
      mapa[][i][]=interp2d(temp, dimoffset(mapa,2)+dimdelta(mapa,2)*r, dimoffset(mapa,0)-bias+slop*i+dimdelta(mapa,0)*p)
   endfor
end
   
function Thetakspace(mapa, size, Ef)  
    wave mapa
    variable size
    variable Ef
    variable dimz,dimx
    dimz=dimsize(mapa, 2)
    dimx=dimsize(mapa, 0)
    variable temp
    variable maxE=dimoffset(mapa,2)+(dimsize(mapa,2)-1)*dimdelta(mapa,2)
    variable minE=dimoffset(mapa,2)
    variable maxphi=max(dimoffset(mapa,0)+(dimsize(mapa,0)-1)*dimdelta(mapa,0),dimoffset(mapa,0))
    variable minphi=min(dimoffset(mapa,0)+(dimsize(mapa,0)-1)*dimdelta(mapa,0),dimoffset(mapa,0))
    variable maxtheta=max(dimoffset(mapa,1)+(dimsize(mapa,1)-1)*dimdelta(mapa,1),dimoffset(mapa,1))
    variable mintheta=min(dimoffset(mapa,1)+(dimsize(mapa,1)-1)*dimdelta(mapa,1),dimoffset(mapa,1))
    variable maxkx
    variable minkx
    variable maxky
    variable minky
    if(maxphi>0)
      maxkx=0.512*sqrt(maxE)*sin(maxphi*pi/180)
    else
      maxkx=0.512*sqrt(minE)*sin(maxphi*pi/180)
    endif
    if(minphi<0)
      minkx=0.512*sqrt(maxE)*sin(minphi*pi/180)
    else
      minkx=0.512*sqrt(minE)*sin(minphi*pi/180)
    endif
    if(maxtheta>0)
      maxky=0.512*sqrt(maxE)*sin(maxtheta*pi/180)
    else
      maxky=0.512*sqrt(minE)*sin(maxtheta*pi/180)*cos(max(abs(maxphi), abs(minphi))*pi/180)
    endif
    if(mintheta<0)
      minky=0.512*sqrt(maxE)*sin(mintheta*pi/180)
    else
      minky=0.512*sqrt(minE)*sin(mintheta*pi/180)*cos(max(abs(maxphi), abs(minphi))*pi/180)
    endif
    variable kxwidth=abs(maxkx-minkx)
    variable kywidth=abs(maxky-minky)
    string name=nameofwave(mapa)
    name+="_k"
    make/o/n=(dimx*size,dimx*size*kywidth/kxwidth,dimz) $name
    wave mapk=$name
    setscale/i x, minkx, maxkx, mapk
    setscale/i y, minky, maxky, mapk
    setscale/p z, dimoffset(mapa,2), dimdelta(mapa,2), mapk
    variable/g root:globalvar:progress=0
    NVAR progress=root:globalvar:progress
    string/g root:globalvar:progressstr="0%"
    SVAR progressstr=root:globalvar:progressstr
    NewPanel/k=2/N=Complete/W=(285,111,739,193)
    ValDisplay valdisp0,pos={18,25},size={342,20}, mode=3,limits={0,100,0},barmisc={0,0}, value=#"root:globalvar:progress"
    setvariable val, pos={365, 25}, size={80, 20}, noedit=1, title=" ", value=progressstr
    Button bStop,pos={170,55},size={50,20},title="Abort"
    DoUpdate /W=Complete/E=1
    variable i,j,k
    for(k=0;k<dimsize(mapk, 2);k+=1)
    progress=k/dimsize(mapk, 2)*100
    progressstr=num2str(progress)+"%"
    DoUpdate /W=Complete
    if( V_Flag == 2 )
       break
    endif
    variable z=dimoffset(mapk, 2)+k*dimdelta(mapk, 2)
    for(j=0;j<dimsize(mapk,1);j+=1)
      variable y=dimoffset(mapk, 1)+j*dimdelta(mapk, 1)
      for(i=0;i<dimsize(mapk,0);i+=1)
        variable x=dimoffset(mapk,0)+i*dimdelta(mapk,0)
        mapk[i][j][k]=interp3d(mapa, 180/pi*asin(x/0.512/sqrt(z)), 180/pi*asin(y/0.512/sqrt(z)/cos(asin(x/0.512/sqrt(z)))), z)
      endfor
     endfor
    endfor
    KillWindow complete
    killvariables root:globalvar:progress
    killstrings root:globalvar:progressstr
    setscale/p z, dimoffset(mapk,2)-Ef, dimdelta(mapk,2), mapk
end   

function Thetakspace_accurate(mapa, size, Ef, tilt)  
    wave mapa
    variable size
    variable Ef
    variable tilt
    //variable alphabias
    variable dimz,dimx
    dimz=dimsize(mapa, 2)
    dimx=dimsize(mapa, 0)
    variable temp
    variable maxE=dimoffset(mapa,2)+(dimsize(mapa,2)-1)*dimdelta(mapa,2)
    variable minE=dimoffset(mapa,2)
    variable maxalpha=max(dimoffset(mapa,0)+(dimsize(mapa,0)-1)*dimdelta(mapa,0),dimoffset(mapa,0))
    variable minalpha=min(dimoffset(mapa,0)+(dimsize(mapa,0)-1)*dimdelta(mapa,0),dimoffset(mapa,0))
    variable maxtheta=max(dimoffset(mapa,1)+(dimsize(mapa,1)-1)*dimdelta(mapa,1),dimoffset(mapa,1))
    variable mintheta=min(dimoffset(mapa,1)+(dimsize(mapa,1)-1)*dimdelta(mapa,1),dimoffset(mapa,1))
    variable absmaxtheta=max(abs(maxtheta), abs(mintheta))
    variable maxkx
    variable minkx
    variable maxky
    variable minky
    if(tilt>=0)
      if(maxalpha+tilt>=0)
         maxkx=0.512*sqrt(maxE)*sin((maxalpha+tilt)*pi/180)
      else
         maxkx=0.512*sqrt(minE)*sin((maxalpha+tilt)*pi/180)
      endif
      if(tan(minalpha*pi/180)>=-tan(tilt*pi/180)*cos(absmaxtheta*pi/180))
         minkx=0.512*sqrt(minE)*(cos(minalpha*pi/180)*cos(absmaxtheta*pi/180)*sin(tilt*pi/180)+sin(minalpha*pi/180)*cos(tilt*pi/180))
      else
         minkx=0.512*sqrt(maxE)*(cos(minalpha*pi/180)*cos(absmaxtheta*pi/180)*sin(tilt*pi/180)+sin(minalpha*pi/180)*cos(tilt*pi/180))
      endif
    else
      if(tan(maxalpha*pi/180)>=-tan(tilt*pi/180)*cos(absmaxtheta*pi/180))
         maxkx=0.512*sqrt(maxE)*(cos(maxalpha*pi/180)*cos(absmaxtheta*pi/180)*sin(tilt*pi/180)+sin(maxalpha*pi/180)*cos(tilt*pi/180))
      else
         maxkx=0.512*sqrt(minE)*(cos(maxalpha*pi/180)*cos(absmaxtheta*pi/180)*sin(tilt*pi/180)+sin(maxalpha*pi/180)*cos(tilt*pi/180))
      endif
      if(minalpha+tilt>=0)
         minkx=0.512*sqrt(minE)*sin((minalpha+tilt)*pi/180)
      else
         minkx=0.512*sqrt(maxE)*sin((minalpha+tilt)*pi/180)
      endif
    endif
    if(maxtheta>=0)
      maxky=0.512*sqrt(maxE)*sin(maxtheta*pi/180)
    else
      maxky=0.512*sqrt(minE)*sin(maxtheta*pi/180)
    endif
    if(mintheta<0)
      minky=0.512*sqrt(maxE)*sin(mintheta*pi/180)
    else
      minky=0.512*sqrt(minE)*sin(mintheta*pi/180)
    endif
    variable kxwidth=abs(maxkx-minkx)
    variable kywidth=abs(maxky-minky)
    string name=nameofwave(mapa)
    name+="_k"
    make/o/n=(dimx*size,dimx*size*kywidth/kxwidth,dimz) $name
    wave mapk=$name
    setscale/i x, minkx, maxkx, mapk
    setscale/i y, minky, maxky, mapk
    setscale/p z, dimoffset(mapa,2), dimdelta(mapa,2), mapk
    variable/g root:globalvar:progress=0
    NVAR progress=root:globalvar:progress
    string/g root:globalvar:progressstr="0%"
    SVAR progressstr=root:globalvar:progressstr
    NewPanel/k=2/N=Complete/W=(285,111,739,193)
    ValDisplay valdisp0,pos={18,25},size={342,20}, mode=3,limits={0,100,0},barmisc={0,0}, value=#"root:globalvar:progress"
    setvariable val, pos={365, 25}, size={80, 20}, noedit=1, title=" ", value=progressstr
    Button bStop,pos={170,55},size={50,20},title="Abort"
    DoUpdate /W=Complete/E=1
    variable i,j,k
    for(k=0;k<dimsize(mapk, 2);k+=1)
    progress=k/dimsize(mapk, 2)*100
    progressstr=num2str(progress)+"%"
    DoUpdate /W=Complete
    if( V_Flag == 2 )
       break
    endif
    variable z=dimoffset(mapk, 2)+k*dimdelta(mapk, 2)
    for(j=0;j<dimsize(mapk,1);j+=1)
      variable y=dimoffset(mapk, 1)+j*dimdelta(mapk, 1)
      for(i=0;i<dimsize(mapk,0);i+=1)
        variable x=dimoffset(mapk,0)+i*dimdelta(mapk,0)
        make/n=2/o root={(minalpha+maxalpha)/2, (mintheta+maxtheta)/2}
        make/n=2/o pw1
        pw1[0]=x/0.512/sqrt(z)
        pw1[1]=tilt
        make/n=1/o pw2
        pw2[0]=y/0.512/sqrt(z)
        FindRoots/X=root/I=100/q pxFunc, pw1, pyFunc, pw2
        if(V_flag==0)
           mapk[i][j][k]=interp3d(mapa, root[0], root[1], z)
        //else
           //print i,j,k, V_flag
        endif
      endfor
     endfor
    endfor
    KillWindow complete
    killvariables root:globalvar:progress
    killstrings root:globalvar:progressstr
    killwaves pw1, pw2, root, W_YatRoot
    setscale/p z, dimoffset(mapk,2)-Ef, dimdelta(mapk,2), mapk
end  

function pxFunc(w, alpha, theta)
	wave w  // w[0]=px, w[1]=phi
	variable alpha, theta
	return w[0]-sin(w[1]*pi/180)*cos(alpha*pi/180)*cos(theta*pi/180)-sin(alpha*pi/180)*cos(w[1]*pi/180)
end 

function pyFunc(w, alpha, theta)
	wave w  // w[0]=py
	variable alpha, theta
	return w[0]-cos(alpha*pi/180)*sin(theta*pi/180)
end

function Azimuthkspace(mapa, size, Ef)
   wave mapa
   variable size
   variable Ef
   variable dimx=dimsize(mapa, 0)
   variable dimz=dimsize(mapa, 2)
   variable maxE=dimoffset(mapa, 2)+dimdelta(mapa, 2)*(dimsize(mapa,2)-1)
   variable maxphi=max(dimoffset(mapa, 0), dimoffset(mapa, 0)+dimdelta(mapa, 0)*(dimsize(mapa,0)-1))
   variable minphi=min(dimoffset(mapa, 0), dimoffset(mapa, 0)+dimdelta(mapa, 0)*(dimsize(mapa,0)-1))
   variable maxazimuth=max(dimoffset(mapa, 1), dimoffset(mapa, 1)+dimdelta(mapa, 1)*(dimsize(mapa,1)-1))
   variable minazimuth=min(dimoffset(mapa, 1), dimoffset(mapa, 1)+dimdelta(mapa, 1)*(dimsize(mapa,1)-1))
   variable radiusa=max(abs(maxphi), abs(minphi))
   variable radiusk=0.512*sqrt(maxE)*sin(radiusa*pi/180)
   variable kwidth=radiusk-0.512*sqrt(maxE)*sin(min(abs(maxphi), abs(minphi))*pi/180)
   string name=nameofwave(mapa)+"_k"
   if(maxazimuth>-90&&maxazimuth<90&&minazimuth>-90&&minazimuth<90)
     make/o/n=(dimx*size*radiusk/kwidth, 2*dimx*size*radiusk/kwidth, dimz) $name
     wave mapk=$name
     setscale/i x, 0, radiusk, mapk
     setscale/i y, -radiusk, radiusk, mapk
     setscale/p z, dimoffset(mapa, 2), dimdelta(mapa, 2), mapk
   else
     make/o/n=(2*dimx*size*radiusk/kwidth, 2*dimx*size*radiusk/kwidth, dimz) $name
     wave mapk=$name
     setscale/i x, -radiusk, radiusk, mapk
     setscale/i y, -radiusk, radiusk, mapk
     setscale/p z, dimoffset(mapa, 2), dimdelta(mapa, 2), mapk
   endif
   variable/g root:globalvar:progress=0
   NVAR progress=root:globalvar:progress
   string/g root:globalvar:progressstr="0%"
   SVAR progressstr=root:globalvar:progressstr
   NewPanel/k=2/N=Complete/W=(285,111,739,193)
   ValDisplay valdisp0,pos={18,25},size={342,20}, mode=3, limits={0,100,0},barmisc={0,0}, value=#"root:globalvar:progress"
   setvariable val, pos={365, 25}, size={80, 20}, noedit=1, title=" ", value=progressstr
   Button bStop,pos={170,55},size={50,20},title="Abort"
   DoUpdate /W=Complete/E=1
   variable i,j,k
   for(k=0;k<dimsize(mapk, 2);k+=1)
     progress=k/dimsize(mapk, 2)*100
     progressstr=num2str(progress)+"%"
     DoUpdate /W=Complete
     if( V_Flag == 2 )
        break
     endif
     variable z=dimoffset(mapk, 2)+k*dimdelta(mapk, 2)
     for(j=0;j<dimsize(mapk,1);j+=1)
       variable y=dimoffset(mapk, 1)+j*dimdelta(mapk, 1)
       for(i=0;i<dimsize(mapk,0);i+=1)
         variable x=dimoffset(mapk,0)+i*dimdelta(mapk,0)
         mapk[i][j][k]=interp3d(mapa, asin(sqrt((x^2+y^2)/z)/0.512)*180/pi, phiAngle(x,y)*180/pi, z)
       endfor
     endfor
   endfor
   KillWindow complete
   killvariables root:globalvar:progress
   killstrings root:globalvar:progressstr
   setscale/p z, dimoffset(mapa, 2)-Ef, dimdelta(mapa, 2), mapk
end

function phiAngle(x,y)
   variable x, y
   if(x>=0)
     return atan(y/x)
   else
     return atan(y/x)+pi*y/abs(y)
   endif
end

function kspace(mapk, Eref, Ea, disp, index, mark)
   wave mapk
   variable Eref, Ea, disp,index
   string mark
   Ea/=1000
   setdatafolder root:Map3D:
   make/o/n=(dimsize(mapk,0),dimsize(mapk,1))  old
   copyscales mapk, old
   setscale/p x, dimoffset(old,0),dimdelta(old,0), old
   make/o/n=(dimsize(mapk,2)) temp
   setscale/p x, dimoffset(mapk,2), dimdelta(mapk,2), temp
   variable i,j
   for(i=0;i<dimsize(old,0);i+=1)
    for(j=0;j<dimsize(old,1);j+=1)
     temp[]=mapk[i][j][p]
     old[i][j]=faverage(temp, Eref-Ea, Eref+Ea)
    endfor
   endfor
   string name="kspace"+num2str(index)+"_"+mark
   duplicate/o old, $name
   killwaves old, temp
   if(disp==1)
     NewImage/f/k=1  $name
     ModifyImage $name ctab= {*,*,PlanetEarth256,0}
     ModifyGraph tickUnit(bottom)=1
     Label bottom "\\F'Times New Roman'\\Z10"+num2str(eref)+"eV"
   endif
end

function EDCMDC(wavname, iniV, endV, num, arange, offset, mode)
   wave wavname
   variable iniV, endV, num, arange, offset,mode
   wave/t currwave=root:globalvar:currwave
   wave fname=$currwave[0]
   arange/=1000
   setdatafolder root:EDC_MDC
   newdatafolder/o $(nameofwave(fname))
   setdatafolder $(nameofwave(fname))
   variable dV,V,i
   if(num>1)
     dV=(endV-iniV)/(num-1)
   else
     dV=0
   endif
   V=iniV
   make/o/n=(dimsize(wavname,0)) temp
   setscale/p x,dimoffset(wavname,0),dimdelta(wavname,0), temp
   make/o/n=(dimsize(wavname,1),num) $(eorm(mode)+"ongraph")
   setscale/p x,dimoffset(wavname,1),dimdelta(wavname,1), $(eorm(mode)+"ongraph")
    make/o/n=(dimsize(wavname,1)) dctemp
     setscale/p x,dimoffset(wavname,1),dimdelta(wavname,1), dctemp
   wave ogref=$(eorm(mode)+"ongraph")
   for(i=0;i<num;i+=1)
     V=iniV+i*dV
     dctemp=0
     variable j
     for(j=0;j<dimsize(wavname,1);j+=1)
       temp[]=wavname[p][j]
       dctemp[j]=faverage(temp,V-arange,V+arange)
     endfor
     ogref[][i]=dctemp[p] 
   endfor
   setscale/p y, iniV, dV, $(eorm(mode)+"ongraph")
   showcurve($(eorm(mode)+"ongraph"), offset, "EDCMDCdisplay")
   Label bottom "\\F'Times New Roman'\\Z12"+eorm(mode)+"-"+nameofwave($currwave[0])
   killwaves dctemp
   killwaves temp
end

function Normalizepanel(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   variable/g root:globalvar:normdis=0
   variable/g root:globalvar:norma2k=0
   variable/g root:globalvar:smoothconfirm=arguwave[35]
   string/g root:globalvar:namelistnorm=currwave[5]
   NVAR disflag=root:globalvar:normdis
   NVAR a2kflag=root:globalvar:norma2k
   NVAR smc=root:globalvar:smoothconfirm
   dowindow/f Normalpanel
   if(V_flag==0)
    newpanel/k=1/n=Normalpanel/W=(450,250,750,550)
    modifypanel fixedsize=1
    setwindow normalpanel, hook(normhook)=normalhook
    titlebox tb_norm, pos={10,10},size={220,20},fixedsize=1,frame=2,title=currwave[5]
    button load_norm, pos={240,10},size={50,20},font="Times New Roman",title="Load",proc=load
    setvariable ei_norm, pos={180,40},size={100,20},title="E_ini",value=arguwave[2]
    setvariable ee_norm, pos={180,70},size={100,20},title="E_end",value=arguwave[3]
    setvariable ai_norm, pos={180,100},size={100,20},title="Ang_ini",value=arguwave[4]
    setvariable ae_norm, pos={180,130},size={100,20},title="Ang_end", value=arguwave[5]
    setvariable ef_norm, pos={180,160},size={100,20},title="Ef", value=arguwave[6]
    setvariable tilt_norm, pos={180,190},size={100,20},title="tilt", value=arguwave[7]
    setvariable xi_norm, pos={30,95},size={100,20},title="Startx", value=arguwave[0]
    setvariable xe_norm, pos={30,120},size={100,20},title="Endx", value=arguwave[1]
    button selectrange_norm, pos={50,145},size={70,25},title="select range",font="Times New Roman",proc=selectrange
    groupbox gb_norm, pos={25,72},size={110,105},title="normalize range",font="Times New Roman"
    checkbox a2k_norm, pos={180,220},title="A2k?",variable=a2kflag
    checkbox cb_norm, pos={180,240},title="Display?",variable=disflag
    popupmenu pum_norm, pos={30,40},size={80,20},value=#"root:globalvar:namelistnorm",proc=showimgnorm
    button bu_norm, pos={180,265},size={60,25},title="Normalize",font="Times New Roman",fcolor=(65280,65280,0),proc=normalize_BC
    checkbox sm_norm, pos={25, 200},title="Smooth factor?", variable=smc,proc=smooths
    setvariable smn_norm, pos={25, 220},size={100,20},title="Times:", value=arguwave[36],disable=2-2*smc
    popupmenu mode_norm, pos={25,267}, size={80,20}, value="Angle mode;Single value;", mode=1
   endif
   if(waveexists($stringfromlist(0,currwave[5]))==0)
     titlebox tb_norm, title="Please load wave."
     button selectrange_norm, disable=2
     button bu_norm, disable=2
   else
     string first=stringfromlist(0,currwave[5])
     string last=stringfromlist(itemsinlist(currwave[5])-1,currwave[5])
     string title=nameofwave($first)+" -> "+nameofwave($last)
     titlebox tb_norm,title=title
     DoWindow/K normalimg
     preferences 0
     display/k=2/n=normalimg/w=(600, 100, 850, 320);appendimage $stringfromlist(0,currwave[5])
     Modifyimage  $nameofwave($stringfromlist(0,currwave[5])) ctab= {*,*,PlanetEarth256,0}
     autopositionwindow/e/m=0/r=normalpanel
     dowindow/f normalpanel
   endif
end

function kspace_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   dowindow kspacepanel
   if(V_flag==1)
    dowindow/f kspacepanel
   else
   setdatafolder root:map3d:
   newdatafolder/o root:map3d:ThreeD
   string/g root:globalvar:namelist3d
   variable/g root:globalvar:kspacedis=0
   variable/g root:map3d:threed:xposition=0
   variable/g root:map3d:threed:yposition=0
   variable/g root:map3d:threed:zposition=0
   NVAR xp=root:map3d:threed:xposition
   NVAR yp=root:map3d:threed:yposition
   NVAR zp=root:map3d:threed:zposition
   make/o/n=(100,100) root:globalvar:temp3d=0
   wave temp=root:globalvar:temp3d
   NVAR disflag=root:globalvar:kspacedis
   SVAR namelist=root:globalvar:namelist3d
   make/o/n=(2,2) root:map3d:threed:tempx=0
   make/o/n=(2,2) root:map3d:threed:tempy=0
   make/o/n=(2,2) root:map3d:threed:tempz=0
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave tempz=root:map3d:threed:tempz
   make/o/n=2 root:map3d:threed:x_EP=0
   wave x_EP=root:map3d:threed:x_EP
   make/o/n=2 root:map3d:threed:y_EP=0
   wave y_EP=root:map3d:threed:y_EP
   make/o/n=2 root:map3d:threed:z_EP=0
   wave z_EP=root:map3d:threed:z_EP
   make/o/n=2 root:map3d:threed:x_V:=#"root:map3d:threed:xposition"
   make/o/n=2 root:map3d:threed:y_V:=#"root:map3d:threed:yposition"
   make/o/n=2 root:map3d:threed:z_V:=#"root:map3d:threed:zposition"
   make/o root:map3d:threed:xprofile=0
   make/o root:map3d:threed:yprofile=0
   make/o root:map3d:threed:zprofile=0
   wave xpro=root:map3d:threed:xprofile
   wave ypro=root:map3d:threed:yprofile
   wave zpro=root:map3d:threed:zprofile
   make/o/n=6 root:map3d:threed:pro_EP=0
   newpanel/k=1/w=(300,250,900,550)/n=kspacepanel
   modifypanel fixedsize=1
   setwindow kspacepanel, hook(killpanel)=killpanel
   Drawline/w=kspacepanel 300,5,300,295
   tabcontrol tab1_3d, pos={5,0},size={290,26},font="Times New Roman",value=0, labelback=(65280,43520,0), tablabel(0)="kx-ky",tablabel(1)="kx-kz", tablabel(2)="Azimuth", tablabel(3)="tr", proc=tab3d_TAB
   popupmenu namelist_3d, pos={5,30},size={190,20},bodywidth=190,mode=1,value=#"root:globalvar:namelist3d",proc=imgcheck3d_PUM
   button add_3d, pos={200,30},size={45,20},font="Times New Roman",title="Add",proc=aandd
   button delete_3d, pos={250,30},size={45,20},font="Times New Roman",title="Delete",proc=aandd
   button clear_3d, pos={250,55},size={45,20},font="Times New Roman",title="Clear",proc=aandd
   button revert_3d, pos={200, 55},size={45,20},font="Times New Roman",title="Reverse",proc=listreverse_BC
   button map_3d,pos={221,265},size={60,25},fcolor=(65280,43520,0),font="Times New Roman",title="3DMap", proc=map3d_BC
   setvariable sv3_3d,pos={208,205},size={83,20},title="Ef", value=arguwave[6]
   display/n=littleimg3d/host=kspacepanel/w=(5,60,190,260)
   appendimage/w=kspacepanel#littleimg3d $"root:globalvar:temp3d"  
   Modifyimage/w=kspacepanel#littleimg3d  temp3d ctab= {*,*,PlanetEarth256,0}
   ModifyGraph/w=kspacepanel#littleimg3d margin(left)=18,margin(right)=5,margin(top)=5,margin(bottom)=20,tick(left)=3,tick(bottom)=2,tkLblRot(left)=90,tickUnit(left)=1,gFont="Times New Roman"
   Label left " "
   titlebox tb_ks, pos={310,10},size={220,20},fixedsize=1,frame=2,title=currwave[2]
   button load_ks, pos={540,10},size={50,20},font="Times New Roman",title="Load",proc=load
   setvariable ei_ks, pos={330,40},size={100,20},title="E_ini",value=arguwave[10]
   setvariable de_ks, pos={330,60},size={100,20},title="deltaE",value=arguwave[31]
   setvariable ea_ks, pos={330,80},size={100,20},title="Ea/meV",value=arguwave[32]
   setvariable num_ks, pos={330,100},size={100,20},title="Number", value=arguwave[33]
   checkbox cb_ks, pos={330,120},title="Display?",variable=disflag
   button bu_ks, pos={350,135},size={60,25},title="kspace",font="Times New Roman",fcolor=(65280,43520,0),proc=mapkspace
   setvariable ycutxpos_ks, pos={305,170}, size={70,20}, title="Xpos", value=arguwave[123]
   setvariable ycutave_ks, pos={380, 170}, size={60,20}, title="Ave", value=arguwave[124]
   button ycut_ks, pos={350, 195}, size={60,20}, title="Cut Y",font="Times New Roman", proc=kspace_cut
   setvariable xcutypos_ks, pos={305,220}, size={70,20}, title="Ypos", value=arguwave[125]
   setvariable xcutave_ks, pos={380, 220}, size={60,20}, title="Ave", value=arguwave[126]
   button xcut_ks, pos={350, 245}, size={60,20}, title="Cut X",font="Times New Roman", proc=kspace_cut
   groupbox gbcut_ks, pos={445,145},size={145,100},title="Cut",font="Times New Roman"
   setvariable cutstartx_ks, pos={455,170}, size={60,20},title="Ax",value=arguwave[113]
   setvariable cutendx_ks, pos={455,190}, size={60,20}, title="Bx", value=arguwave[114]
   setvariable cutstarty_ks, pos={525,170}, size={60,20}, title="Ay", value=arguwave[115]
   setvariable cutendy_ks, pos={525,190}, size={60,20}, title="By", value=arguwave[116]
   button cutrange_ks, pos={455,215},size={63,20},title="Select", font="Times New Roman",proc=selectrange
   button cut_ks, pos={522,215},size={63,20},title="Cut",font="Times New Roman",fcolor=(65280,43520,0),proc=kspace_cut
   groupbox gb_ks, pos={445,33},size={145,110},title="3D View",font="Times New Roman"
   button z_ks, pos={547,55},size={30,20},title="Z",font="Times New Roman",proc=view3d
   button y_ks, pos={504,55},size={30,20},title="Y",font="Times New Roman",proc=view3d
   button x_ks, pos={460,55},size={30,20},title="X",font="Times New Roman",proc=view3d
   button stop_ks, pos={492, 80}, size={60,25}, title="Stop", font="Times New Roman"
   button refresh_ks, pos={460, 110},size={25, 25}, title="Re", font="Times New Roman", proc=refresh3dview
   button  graph3dview_ks, pos={490, 110}, size={65, 25}, title="3D graph", font="Times New Roman", fcolor=(65280,43520,0), proc=graph3dview
   if(waveexists($stringfromlist(0,currwave[4]))==0)
      button map_3d, disable=2
      button delete_3d, disable=2
      button clear_3d, disable=2
      button revert_3d, disable=2
      popupmenu namelist_3d, disable=2
   else
      namelist=currwave[4]
      popupmenu namelist_3d, mode=1
      duplicate/o $stringfromlist(0,namelist), temp
   endif  
   tab3d_TAB("", 0)
   if(waveexists($currwave[2])==0)
     titlebox tb_ks, title="Please load wave."
     button bu_ks, disable=2
     button x_ks, disable=2
     button y_ks, disable=2
     button z_ks, disable=2
     button graph3dview_ks, disable=2
     button cutrange_ks, disable=2
     button cut_ks, disable=2
   else
     setdatafolder root:globalvar:
     wave mapk=$currwave[2]
     redimension/n=(dimsize(mapk,0),dimsize(mapk,1)) tempz
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempz
     setscale/p y, dimoffset(mapk,1), dimdelta(mapk,1), tempz
     redimension/n=(dimsize(mapk,1),dimsize(mapk,2)) tempx
     setscale/p x, dimoffset(mapk,1), dimdelta(mapk,1), tempx
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempx
     redimension/n=(dimsize(mapk,0),dimsize(mapk,2)) tempy
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempy
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempy
     x_EP[0]=dimoffset(mapk, 0)
     x_EP[1]=dimoffset(mapk, 0)+(dimsize(mapk, 0)-1)*dimdelta(mapk, 0)
     y_EP[0]=dimoffset(mapk, 1)
     y_EP[1]=dimoffset(mapk, 1)+(dimsize(mapk, 1)-1)*dimdelta(mapk, 1)
     z_EP[0]=dimoffset(mapk, 2)
     z_EP[1]=dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)
     xp=dimoffset(mapk, 0)
     yp=dimoffset(mapk, 1)
     zp=dimoffset(mapk, 2)
     redimension/n=(dimsize(mapk,0)) xpro
     redimension/n=(dimsize(mapk,1)) ypro
     redimension/n=(dimsize(mapk,2)) zpro
     setscale/p x, dimoffset(mapk, 0), dimdelta(mapk, 0), xpro
     setscale/p x, dimoffset(mapk, 1), dimdelta(mapk, 1), ypro
     setscale/p x, dimoffset(mapk, 2), dimdelta(mapk, 2), zpro
     setdatafolder root:map3d:
   endif
   endif
end

function refresh3dview(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   NVAR xp=root:map3d:threed:xposition
   NVAR yp=root:map3d:threed:yposition
   NVAR zp=root:map3d:threed:zposition
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave tempz=root:map3d:threed:tempz
   wave x_EP=root:map3d:threed:x_EP
   wave y_EP=root:map3d:threed:y_EP
   wave z_EP=root:map3d:threed:z_EP
   wave xpro=root:map3d:threed:xprofile
   wave ypro=root:map3d:threed:yprofile
   wave zpro=root:map3d:threed:zprofile
   if(waveexists($currwave[2])==1)
     setdatafolder root:globalvar:
     wave mapk=$currwave[2]
     redimension/n=(dimsize(mapk,0),dimsize(mapk,1)) tempz
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempz
     setscale/p y, dimoffset(mapk,1), dimdelta(mapk,1), tempz
     redimension/n=(dimsize(mapk,1),dimsize(mapk,2)) tempx
     setscale/p x, dimoffset(mapk,1), dimdelta(mapk,1), tempx
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempx
     redimension/n=(dimsize(mapk,0),dimsize(mapk,2)) tempy
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempy
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempy
     x_EP[0]=dimoffset(mapk, 0)
     x_EP[1]=dimoffset(mapk, 0)+(dimsize(mapk, 0)-1)*dimdelta(mapk, 0)
     y_EP[0]=dimoffset(mapk, 1)
     y_EP[1]=dimoffset(mapk, 1)+(dimsize(mapk, 1)-1)*dimdelta(mapk, 1)
     z_EP[0]=dimoffset(mapk, 2)
     z_EP[1]=dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)
     xp=dimoffset(mapk, 0)
     yp=dimoffset(mapk, 1)
     zp=dimoffset(mapk, 2)
     redimension/n=(dimsize(mapk,0)) xpro
     redimension/n=(dimsize(mapk,1)) ypro
     redimension/n=(dimsize(mapk,2)) zpro
     setscale/p x, dimoffset(mapk, 0), dimdelta(mapk, 0), xpro
     setscale/p x, dimoffset(mapk, 1), dimdelta(mapk, 1), ypro
     setscale/p x, dimoffset(mapk, 2), dimdelta(mapk, 2), zpro
     setdatafolder root:map3d:
   endif
end

function kspace_cut(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   if(strlen(currwave[2])!=0)
     wave wavname=$currwave[2]
     variable length=sqrt((arguwave[114]-arguwave[113])^2+(arguwave[116]-arguwave[115])^2)
     variable pnum=round(length/dimdelta(wavname,0))
     string mark="new"
     prompt mark,"Enter a mark for this wave:"
     doprompt "",mark
     if(V_flag==1)
       return -1
     endif
     strswitch(ctrlname)
     case "cut_ks":
       string name="root:map3d:"+nameofwave($currwave[2])+"_cut_"+mark
       make/o/n=(pnum,dimsize(wavname,2)) $name
       wave cutwave=$name
       setscale/i x, 0, length, cutwave
       setscale/p y, dimoffset(wavname,2), dimdelta(wavname,2), cutwave
       cutwave=interp3d(wavname, arguwave[113]+x*(arguwave[114]-arguwave[113])/length, arguwave[115]+x*(arguwave[116]-arguwave[115])/length, y)
     break
     case "ycut_ks":
       name="root:map3d:"+nameofwave($currwave[2])+"_cuty_"+mark
       kspace_cuty(wavname, arguwave[123], arguwave[124], name)
     break
     case "xcut_ks":
       name="root:map3d:"+nameofwave($currwave[2])+"_cutx_"+mark
       kspace_cutx(wavname, arguwave[125], arguwave[126], name)
     break
     endswitch
   endif
end

function map3d_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   string mark="new"
   prompt mark,"Enter a mark for this wave:"
   doprompt "",mark
   if(V_flag==1)
     return -1
   endif
   controlinfo/w=kspacepanel tab1_3d
   switch(V_Value)
   case 0:
     Thetamap(currwave[4], arguwave[8], arguwave[9], arguwave[57],arguwave[48], mark)
     controlinfo/w=kspacepanel ks_3d
     if(V_Value==1)
       controlinfo/w=kspacepanel accurate_3d
       if(V_value==0)
         Thetakspace($("thetamap_"+mark), arguwave[120], arguwave[6])
       else
         Thetakspace_accurate($("thetamap_"+mark), arguwave[120], arguwave[6], arguwave[57])
       endif
       currwave[2]="root:map3d:thetamap_"+mark+"_k"
     endif
     break
   case 1:
     break
   case 2:
     Azimuthmap(currwave[4], arguwave[54], arguwave[55], arguwave[56], mark)
     controlinfo/w=kspacepanel ks_3d
     if(V_Value==1)
     Azimuthkspace($("root:map3d:azimuthmap_"+mark), arguwave[120], arguwave[6])
     currwave[2]="root:map3d:azimuthmap_"+mark+"_k"
     endif
     break
   case 3:
     trMap(currwave[4], arguwave[97], arguwave[98], arguwave[99], mark)
     break
   endswitch
   controlinfo/w=kspacepanel ks_3d
   if(V_Value==1)
     wave mapk=$currwave[2]
     wave tempz=root:map3d:threed:tempz
     wave tempx=root:map3d:threed:tempx
     wave tempy=root:map3d:threed:tempy
     wave x_EP=root:map3d:threed:x_EP
     wave y_EP=root:map3d:threed:y_EP
     wave z_EP=root:map3d:threed:z_EP
     wave pro_EP=root:map3d:threed:pro_EP
     wave xprofile=root:map3d:threed:xprofile
     wave yprofile=root:map3d:threed:yprofile 
     wave zprofile=root:map3d:threed:zprofile
     redimension/n=(dimsize(mapk,0),dimsize(mapk,1)) tempz
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempz
     setscale/p y, dimoffset(mapk,1), dimdelta(mapk,1), tempz
     redimension/n=(dimsize(mapk,1),dimsize(mapk,2)) tempx
     setscale/p x, dimoffset(mapk,1), dimdelta(mapk,1), tempx
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempx
     redimension/n=(dimsize(mapk,0),dimsize(mapk,2)) tempy
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempy
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempy
     x_EP[0]=dimoffset(mapk, 0)
     x_EP[1]=dimoffset(mapk, 0)+(dimsize(mapk, 0)-1)*dimdelta(mapk, 0)
     y_EP[0]=dimoffset(mapk, 1)
     y_EP[1]=dimoffset(mapk, 1)+(dimsize(mapk, 1)-1)*dimdelta(mapk, 1)
     z_EP[0]=dimoffset(mapk, 2)
     z_EP[1]=dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)
     redimension/n=(dimsize(mapk,0)) xprofile
     redimension/n=(dimsize(mapk,1)) yprofile
     redimension/n=(dimsize(mapk,2)) zprofile
     setscale/p x, dimoffset(mapk, 0), dimdelta(mapk, 0), xprofile
     setscale/p x, dimoffset(mapk, 1), dimdelta(mapk, 1), yprofile
     setscale/p x, dimoffset(mapk, 2), dimdelta(mapk, 2), zprofile
     dowindow/f kspacepanel
     titlebox tb_ks,title=currwave[2]
     button bu_ks, disable=0
     button x_ks, disable=0
     button y_ks, disable=0
     button z_ks, disable=0
     button  graph3dview_ks, disable=0
   endif
end

function tab3d_TAB(ctrlname, tab): tabcontrol
  string ctrlname
  variable tab
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  setvariable sv1_3d, disable=(tab!=0),pos={201,90},size={90,20},title="thetai",value=arguwave[8]
  setvariable sv2_3d, disable=(tab!=0),pos={196,115},size={95,20},title="dtheta", value=arguwave[9]
  setvariable tilt_3d, disable=(tab!=0), pos={201, 140},size={90,20},title="Tilt", value=arguwave[57]
  setvariable alpbias_3d, disable=(tab!=0), pos={201, 165},size={90,20},title="aBias", value=arguwave[48]
  checkbox accurate_3d, disable=(tab!=0), pos={205,187}, title="Accurate", value=0, help={"Use this for vertical slit. Horizonal slit needn't this."}
  checkbox ks_3d, disable=(tab!=0&&tab!=1&&tab!=2),pos={205,225},size={50,10},title="2kspace?",value=(tab!=3), proc=Toks_CB
  setvariable size_3d, disable=(tab!=0&&tab!=1&&tab!=2),pos={205,243},size={85,20},title="Size", value=arguwave[120],limits={0,inf,0.1}
  setvariable azi_3d, disable=(tab!=2),pos={201,90},size={90,20},title="Azimuthi",value=arguwave[54]
  setvariable dazi_3d, disable=(tab!=2),pos={196,120},size={95,20},title="dAzimuth", value=arguwave[55]
  setvariable bias_3d, disable=(tab!=2),pos={196,150},size={95,20},title="Bias", value=arguwave[56]
  setvariable tr_3d, disable=(tab!=3),pos={201,90},size={90,20},title="Delayi",value=arguwave[97]
  setvariable troffset_3d, disable=(tab!=3),pos={196,120},size={95,20},title="offset", value=arguwave[98]
  setvariable dtr_3d, disable=(tab!=3),pos={196,150},size={95,20},title="dDelay", value=arguwave[99]
end
  
function Toks_CB(ctrlname, checked): checkboxcontrol
  string ctrlname
  variable checked
  if(checked==1)
    setvariable size_3d, disable=0, win=kspacepanel
  else
    setvariable size_3d, disable=2, win=kspacepanel
  endif
end  

function EDCMDC_BC(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  make/o/n=(100,100) root:EDC_MDC:fliptemp=0
  make/o root:globalvar:emdctemp=0
  variable/g root:globalvar:tabvalue
  string/g root:globalvar:namelistcs
  string/g root:globalvar:currvalue
  string/g root:globalvar:inivalue
  string/g root:globalvar:endvalue
  variable/g root:globalvar:popupnum
  SVAR curvelist=root:globalvar:namelistcs
  SVAR iniv=root:globalvar:inivalue
  SVAR endv=root:globalvar:endvalue
  SVAR currvalue=root:globalvar:currvalue
  NVAR popupnum=root:globalvar:popupnum
  make/o root:globalvar:singlecurve=0
  dowindow EDCMDCPanel
  if((V_flag==1)||(V_flag==2))
   dowindow/f EDCMDCPanel
  else
    newpanel/k=1/w=(300,100,900,400)/n=EDCMDCPanel
    modifypanel fixedsize=1
    setwindow edcmdcpanel, hook(killpanel)=killpanel
    Drawline/w=edcmdcpanel 300,5,300,295
    tabcontrol tab1, pos={10,0},size={280,26},font="Times New Roman",value=0, labelback=(26112,52224,0), tablabel(0)="EDC",tablabel(1)="MDC"
    tabcontrol tab1, proc=edcmdctab
    titlebox tb1, pos={10,30},size={220,20},fixedsize=1,frame=2,title=currwave[0]
    button save_emdc,pos={155,267},size={70,25},font="Times New Roman",fcolor=(26112,52224,0),title="Save",proc=saveop
    button dyn_emdc, pos={20,215},size={70,25},font="Times New Roman",fcolor=(26112,52224,0),title="Dynamic",proc=emdcshow
    titlebox tb_cs, pos={310,10},size={220,20},fixedsize=1,frame=2,title=currwave[6]
    button load_cs, pos={535,10},size={60,20},title="Load",font="Times New Roman",proc=load
    setvariable iniv_cs, pos={310,50},size={110,20},title="From",noedit=1, value=root:globalvar:inivalue
    setvariable endv_cs, pos={310,80},size={110,20},title="to  ",noedit=1, value=root:globalvar:endvalue
    setvariable offset_cs, pos={310,110},size={110,20}, title="Offset:", value=arguwave[34], limits={-inf,inf,0.1}, proc=showcurve_SV
    button show_cs, pos={307,133},size={70,25},title="Show Curve",font="Times New Roman",fcolor=(26112,52224,0),proc=showcurve_BC
    button app_cs, pos={307,161},size={70,25},title="Append",font="Times New Roman",fcolor=(26112,52224,0),proc=showcurve_BC
    button exmc_cs, pos={380,133},size={40,25},title="Export", font="Times New Roman",fcolor=(26112,52224,0),proc=showcurve_BC
    button lastc_cs, pos={435,50},size={20,20},title="<<",font="Times New Roman",proc=showsinglecurve_BC
    button nextc_cs, pos={570,50},size={20,20},title=">>",font="Times New Roman", proc=showsinglecurve_BC
    popupmenu pum_cs, pos={460,50},size={105,20},bodywidth=105,value=#"root:globalvar:namelistcs",proc=showsinglecurve_PUM
    setvariable value_cs, pos={440,80},size={125,20},title="Value=",noedit=1,value=currvalue
    button ex_cs, pos={475,103},size={75,25},title="Export Curve",font="Times New Roman",fcolor=(26112,52224,0),proc=exportcurve_BC
    groupbox fitgb_cs, pos={430,130},size={160, 161}, title="Fit Curve",font="Times New Roman"
    popupmenu startcurve_cs, pos={430,150},size={150,20},bodywidth=110,title="From", value=#"root:globalvar:namelistcs"
    popupmenu endcurve_cs, pos={430,175},size={150,20},bodywidth=110,title="to", value=#"root:globalvar:namelistcs", proc=curvelimit_pum
    button fitp_cs, pos={440,200},size={140,25},title="Fit Panel",font="Times New Roman",fcolor=(26112,52224,0), proc=fitemdcpanel_BC
    button fit_cs, pos={435,230},size={73,25},title="Fit",font="Times New Roman",fcolor=(26112,52224,0),proc=fitemdc_BC
    checkbox fitdir_cs, pos={513, 235}, title="Reverse", font="Times New Roman"
    button showresult_fep, pos={435,260},size={73,25},title="Show result", font="Times New Roman",fcolor=(26112,52224,0), proc=showfitresult
    display/n=littleimg/host=edcmdcpanel/w=(111,57,299,260)
    appendimage/w=edcmdcpanel#littleimg $"root:EDC_MDC:fliptemp"  
    Modifyimage/w=edcmdcpanel#littleimg  fliptemp ctab= {*,*,PlanetEarth256,0}
    ModifyGraph/w=edcmdcpanel#littleimg margin(left)=16,margin(right)=5,margin(top)=5,margin(bottom)=20,tick(left)=3,tick(bottom)=2,tkLblRot(left)=90,tickUnit(left)=1,gFont="Times New Roman"
  endif
  if(waveexists($currwave[0])==0)
    titlebox tb1, pos={10,30},size={200,20},fixedsize=1,frame=2,title="Please load wave."
    button dyn_emdc, disable=2
    button save_emdc, disable=2
  else
    wave source=$currwave[0]
    setdatafolder root:EDC_MDC:
    duplicate/o source, fliptemp
    tabcontrol tab1, value=0
    dowindow/f EDCMDCPanel   
  endif
  edcmdctab("tab1",0)
  if(waveexists($currwave[6])==0)
     titlebox tb_cs,title="Please load wave."
     setvariable offset_cs, disable=2
     button show_cs, disable=2
     button lastc_cs, disable=2
     button nextc_cs, disable=2
     popupmenu pum_cs, disable=2
     button ex_cs, disable=2
     button fit_cs, disable=2
     button fitp_cs, disable=2
     popupmenu startcurve_cs, disable=2
     popupmenu endcurve_cs, disable=2
     button exmc_cs, disable=2
   else
     setdatafolder $getwavesdatafolder($currwave[6],1)
     iniv=num2str(dimoffset($currwave[6],1))
     endv=num2str(dimoffset($currwave[6],1)+(dimsize($currwave[6],1)-1)*dimdelta($currwave[6],1))
     currvalue=iniv
     curvelist=""
     variable i
     for(i=0;i<dimsize($currwave[6],1);i+=1)
       curvelist+="Curve "+num2str(i)+";"
     endfor
     popupmenu pum_cs,mode=1
     popupmenu startcurve_cs, mode=1
     popupmenu endcurve_cs, mode=1
     wave wavname=$currwave[6]
     wave tempwave=root:globalvar:singlecurve
     redimension/n=(dimsize($currwave[6],0)) tempwave
     setscale/p x, dimoffset(wavname,0),dimdelta(wavname,0),tempwave
     tempwave[]=wavname[p][0]
     popupnum=1
   endif
end

function edcmdctab(name, tab): tabcontrol
  string name
  variable tab
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  wave wavname=root:EDC_MDC:fliptemp
  NVAR tabvalue=root:globalvar:tabvalue
  tabvalue=tab
  variable loadflag
  if(waveexists($currwave[0])==0)
     loadflag=1
  else
     loadflag=-1
  endif
  dowindow/f EDCMDCPanel
  if(tab==0)
   if(strlen(currwave[0])!=0)
   setdatafolder root:EDC_MDC:
   flipimg(wavname)
   dowindow/f EDCMDCPanel
   endif
  endif
  if(tab==1) 
    if(strlen(currwave[0])!=0)
    setdatafolder root:EDC_MDC:
    flipimg(wavname)
    dowindow/f EDCMDCPanel
    endif
  endif
  dowindow/f EDCMDCPanel
  setvariable sv1, disable=(tab!=1),pos={10,57},size={100,20} ,title="Ei(A)", value=arguwave[11], limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}, proc=curvenum
  setvariable sv2, disable=(tab!=1),pos={10,82},size={100,20} ,title="En(B)", value=arguwave[12], limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}, proc=curvenum
  button selectrangemdc, disable=1+(1-(tab!=1))*loadflag,pos={20,105},size={80,25},font="Times New Roman",title="select range",proc=selectrange
  button loadmdc, disable=(tab!=1),pos={240,30},size={50,20},font="Times New Roman",title="Load",proc=load
  button generatemdc, disable=1+(1-(tab!=1))*loadflag,pos={75,267},size={70,25},font="Times New Roman",fcolor=(26112,52224,0),title="Generate",proc=generateemdc
  setvariable sv3, disable=(tab!=1),pos={10,140},size={100,20},title="wNum", value=arguwave[13], limits={1,inf,1}
  setvariable sv4, disable=(tab!=1),pos={10,165},size={100,20},title="dE/meV",value=arguwave[14], limits={0,inf,1}
  setvariable sv5, disable=(tab!=1),pos={10,190},size={100,20},title="offset",value=arguwave[34], limits={0,inf,0.1}
  setvariable sv6, disable=(tab!=0),pos={10,57},size={100,20} ,title="Pi(A)", value=arguwave[16], limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}, proc=curvenum
  setvariable sv7, disable=(tab!=0),pos={10,82},size={100,20} ,title="Pn(B)", value=arguwave[17], limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}, proc=curvenum
  button selectrangeedc, disable=1+(1-(tab!=0))*loadflag, pos={20,105},size={80,25},font="Times New Roman",title="select range",proc=selectrange
  button loadedc, disable=(tab!=0),pos={240,30},size={50,20},font="Times New Roman",title="Load",proc=load
  button generateedc, disable=1+(1-(tab!=0))*loadflag,pos={75,267},size={70,25},font="Times New Roman",fcolor=(26112,52224,0),title="Generate",proc=generateemdc
  setvariable sv8, disable=(tab!=0),pos={10,140},size={100,20},title="wNum", value=arguwave[18], limits={1,inf,1}
  setvariable sv9, disable=(tab!=0),pos={10,165},size={100,20},title="dP    ",value=arguwave[19], limits={0,inf,1}
  setvariable sv10, disable=(tab!=0),pos={10,190},size={100,20},title="offset",value=arguwave[34], limits={0,inf,0.1}
end 

function curvenum(ctrlname, varnum, varstr, varname): setvariablecontrol
    string ctrlname
    variable varnum
    string varstr
    string varname
    wave arguwave=root:globalvar:arguwave
    wave/t currwave=root:globalvar:currwave
    wave wavname=$currwave[0]
    strswitch(ctrlname)
    case "sv1":
       arguwave[13]=floor((arguwave[12]-arguwave[11])/dimdelta(wavname, 0))
       break
    case "sv2":
       arguwave[13]=floor((arguwave[12]-arguwave[11])/dimdelta(wavname, 0))
       break
    case "sv6":
       arguwave[18]=floor((arguwave[17]-arguwave[16])/dimdelta(wavname, 1))
       break
    case "sv7":
       arguwave[18]=floor((arguwave[17]-arguwave[16])/dimdelta(wavname, 1))
       break
    endswitch
end

function opentoolpanel(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   dowindow ToolPanel
   if(V_flag==1)
    dowindow/f ToolPanel
   else
   string/g root:globalvar:namelisttool=currwave[3]
   make/o root:globalvar:tempwave
   make/o root:globalvar:ytemp
   make/o root:globalvar:xtemp
   wave tempwave=root:globalvar:tempwave
   SVAR namelisttool=root:globalvar:namelisttool
   variable/g root:globalvar:shiftx=0
   variable/g root:globalvar:shifty=0
   variable/g root:globalvar:shiftv=0
   variable/g root:globalvar:shiftz=0
   variable/g root:globalvar:sandcx=1
   variable/g root:globalvar:sandcy=1
   variable/g root:globalvar:sandcv=1
   variable/g root:globalvar:sandcz=1
   variable/g root:globalvar:Imgrotate=0
   variable/g root:globalvar:grotate=0
   variable/g root:globalvar:movey=0
   variable/g root:globalvar:movex=0
   string/g root:globalvar:yname="ywave"
   string/g root:globalvar:xname="xwave"
   variable/g root:globalvar:tabflag
   variable/g root:globalvar:dimflag
   NVAR dimflag=root:globalvar:dimflag
   newpanel/k=1/w=(400,150,800,550)/n=ToolPanel
   modifypanel fixedsize=1
   setwindow toolpanel, hook(toolhook)=toolhook
   tabcontrol tab1_tool, pos={10,0},size={380,26},font="Times New Roman",value=0, labelback=(65280,0,0), tablabel(0)="Transform",tablabel(1)="Image",tablabel(2)="Drawing"
   tabcontrol tab1_tool, proc=tooltab
   string title=stringfromlist(0,currwave[3])+" -> "+nameofwave($stringfromlist(itemsinlist(currwave[3])-1,currwave[3]))
   titlebox tb_tool,pos={10,30},size={310,20},fixedsize=1,frame=2,title=title
   popupmenu pum_tool, pos={15,57},size={100,20},value=#"root:globalvar:namelisttool",proc=showimgtool
   button load_tool,pos={330,30},size={60,20},font="Times New Roman",title="Load", proc=load
   tooltab("tab1_tool",0)
   if(waveexists($stringfromlist(0,currwave[3]))==0)
     titlebox tb_tool,title="Please load wave."
     namelisttool=""
   else
     dowindow/k toolgraph
     wave wavname=$stringfromlist(0,currwave[3])
     duplicate/o wavname, tempwave
     if(itemsinlist(currwave[3])>1)
       duplicate/o $stringfromlist(0,currwave[3]), root:globalvar:ytemp
       duplicate/o $stringfromlist(1,currwave[3]), root:globalvar:xtemp
     endif
     if(wavedims(wavname)==1)
       display/k=2/n=toolgraph/w=(600, 100, 850, 320) tempwave
     else
       preferences 0
       display/k=2/n=toolgraph/w=(600, 100, 850, 320); Appendimage tempwave
       Modifyimage  tempwave ctab= {*,*,PlanetEarth256,0}
     endif
     autopositionwindow/e/m=0/r=toolpanel
     dowindow/f toolpanel
   endif 
  endif
end

function tooltab(name,tab): tabcontrol
   string name
   variable tab
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   NVAR dim_flag=root:globalvar:dimflag
   dim_flag=wavedims(tempwave)
   NVAR tabflag=root:globalvar:tabflag
   tabflag=tab
   variable dimflag=1,loadflag=0
   if(waveexists($stringfromlist(0,currwave[3]))==0)
     loadflag=1
     dimflag=1
   else
     dimflag=wavedims($stringfromlist(0,currwave[3]))
   endif 
   checkbox  appall_tool, disable=((tab!=0)&&(tab!=1))+2*loadflag, pos={250, 60}, font="Times New Roman",title="Apply to all",proc=app2all
   button left_tool, disable=(tab!=0)+2*loadflag, pos={15,100},size={20,20},font="Times New Roman",title="<<",proc=translate_button
   button right_tool, disable=(tab!=0)+2*loadflag,pos={100,100},size={20,20},font="Times New Roman",title=">>",proc=translate_button
   button down_tool, disable=(tab!=0)+2*loadflag,pos={15,140},size={20,20},font="Times New Roman",title="<<",proc=translate_button
   button up_tool, disable=(tab!=0)+2*loadflag, pos={100,140},size={20,20},font="Times New Roman",title=">>",proc=translate_button
   button zdown_tool, disable=(tab!=0)+2*loadflag, pos={15,180},size={20,20},font="Times New Roman",title="<<",proc=translate_button
   button zup_tool, disable=(tab!=0)+2*loadflag, pos={100,180},size={20,20},font="Times New Roman",title=">>",proc=translate_button
   button small_tool, disable=(tab!=0)+2*loadflag, pos={15,220},size={20,20},font="Times New Roman",title="<<",proc=translate_button
   button big_tool, disable=(tab!=0)+2*loadflag, pos={100,220},size={20,20},font="Times New Roman",title=">>",proc=translate_button
   valdisplay vd1_tool, disable=(tab!=0),pos={40,103},size={56,40},frame=2,value=#"root:globalvar:shiftx",title="X"
   valdisplay vd2_tool, disable=(tab!=0),pos={40,143},size={56,25}, frame=2,value=#"root:globalvar:shifty",title="Y"
   valdisplay transz_tool, disable=(tab!=0),pos={40,183},size={56,25}, frame=2,value=#"root:globalvar:shiftz",title="Z"
   valdisplay vd3_tool, disable=(tab!=0),pos={40,223},size={56,25}, frame=2,value=#"root:globalvar:shiftv",title="V"
   setvariable sv1_tool, disable=(tab!=0),pos={16,120},size={80,20}, value=arguwave[21],title="Xstep"
   setvariable sv2_tool, disable=(tab!=0),pos={16,160},size={80,40}, value=arguwave[22],title="Ystep"
   setvariable zstep_tool, disable=(tab!=0),pos={16,200},size={80,40}, value=arguwave[65],title="Zstep"
   setvariable sv3_tool, disable=(tab!=0),pos={16,240},size={80,40}, value=arguwave[23],title="Vstep"
   groupbox gb1_tool, disable=(tab!=0),pos={10,83},size={115,180},title="Translate",fcolor=(65280,21760,0),font="Times New Roman"
   groupbox gb2_tool, disable=(tab!=0),pos={130,83},size={115,180},title="Stret.&Compr.",fcolor=(65280,21760,0),font="Times New Roman"
   button xleft_tool, disable=(tab!=0)+2*loadflag, pos={135,100},size={20,20},font="Times New Roman",title="<<",proc=sandc_button
   button xright_tool, disable=(tab!=0)+2*loadflag, pos={220,100},size={20,20},font="Times New Roman",title=">>",proc=sandc_button
   button xdown_tool, disable=(tab!=0)+2*loadflag, pos={135,140},size={20,20},font="Times New Roman",title="<<",proc=sandc_button
   button xup_tool, disable=(tab!=0)+2*loadflag, pos={220,140},size={20,20},font="Times New Roman",title=">>",proc=sandc_button
   button xzdown_tool, disable=(tab!=0)+2*loadflag, pos={135,180},size={20,20},font="Times New Roman",title="<<",proc=sandc_button
   button xzup_tool, disable=(tab!=0)+2*loadflag, pos={220,180},size={20,20},font="Times New Roman",title=">>",proc=sandc_button
   button xsmall_tool, disable=(tab!=0)+2*loadflag, pos={135,220},size={20,20},font="Times New Roman",title="<<",proc=sandc_button
   button xbig_tool, disable=(tab!=0)+2*loadflag, pos={220,220},size={20,20},font="Times New Roman",title=">>",proc=sandc_button
   valdisplay vd4_tool, disable=(tab!=0),pos={160,103},size={56,40},frame=2,value=#"root:globalvar:sandcx",title="X"
   valdisplay vd5_tool, disable=(tab!=0),pos={160,143},size={56,25}, frame=2,value=#"root:globalvar:sandcy",title="Y"
   valdisplay sandcz_tool, disable=(tab!=0),pos={160,183},size={56,25}, frame=2,value=#"root:globalvar:sandcz",title="Z"
   valdisplay vd6_tool, disable=(tab!=0),pos={160,223},size={56,25}, frame=2,value=#"root:globalvar:sandcv",title="V"
   setvariable sv4_tool, disable=(tab!=0),pos={136,120},size={80,20}, value=arguwave[24],title="Xstep"
   setvariable sv5_tool, disable=(tab!=0),pos={136,160},size={80,20}, value=arguwave[25],title="Ystep"
   setvariable xzstep_tool, disable=(tab!=0),pos={136,200},size={80,2}, value=arguwave[66],title="Zstep"
   setvariable sv6_tool, disable=(tab!=0),pos={136,240},size={80,20}, value=arguwave[26],title="Vstep"
   groupbox gbmosaic_tool, disable=(tab!=0),pos={250,83},size={115,130},title="Mosaic",fcolor=(65280,21760,0),font="Times New Roman"
   setvariable mosaicX_tool, disable=(tab!=0), pos={258, 103}, size={100,20}, value=arguwave[100], title="Xnum", limits={1,inf,1}
   setvariable mosaicY_tool, disable=(tab!=0), pos={258, 128}, size={100,20}, value=arguwave[101], title="Ynum", limits={1,inf,1}
   setvariable mosaicZ_tool, disable=(tab!=0), pos={258, 153}, size={100,20}, value=arguwave[102], title="Znum", limits={1,inf,1}
   button merge_tool, disable=(tab!=0)+2*loadflag, pos={267, 178}, size={80, 25}, font="Times New Roman",title="Merge", proc=mosaic_button
   groupbox gb3_tool, disable=(tab!=0),pos={10,268},size={132,85},title="Cut Wave",fcolor=(65280,21760,0),font="Times New Roman"
   setvariable sv7_tool, disable=(tab!=0),pos={15,287},size={60,20},value=arguwave[27],title="x1"
   setvariable sv8_tool, disable=(tab!=0),pos={78,287},size={60,20},value=arguwave[28],title="x2"
   setvariable sv9_tool, disable=(tab!=0),pos={15,307},size={60,20},value=arguwave[29],title="y1"
   setvariable sv10_tool, disable=(tab!=0),pos={78,307},size={60,20},value=arguwave[30],title="y2"
   button select_cut, disable=(tab!=0)+2*loadflag, pos={15,327},size={60,20},title="Select",font="Times New Roman",proc=selectrange
   button cut_tool, disable=(tab!=0)+2*loadflag, pos={77,327},size={60,20},title="Cut",font="Times New Roman",proc=cutwave_button
   groupbox gbrot_tool, disable=(tab!=0), pos={150, 268}, size={132,85}, title="Rotate",fcolor=(65280,21760,0),font="Times New Roman"
   setvariable rcx_tool, disable=(tab!=0),pos={155,287},size={60,20},value=arguwave[143],title="CX"
   setvariable rcy_tool, disable=(tab!=0),pos={218,287},size={60,20},value=arguwave[144],title="CY"
   setvariable dang_tool, disable=(tab!=0),pos={155,307},size={60,20},value=arguwave[145],title="Ang"
   valdisplay rang_tool, disable=(tab!=0),pos={218,307},size={60,20}, frame=2, value=#"root:globalvar:Imgrotate",title="R"
   button CCW_tool, disable=(tab!=0)+2*loadflag, pos={155,327},size={60,20},title="CCW",font="Times New Roman",proc=rotateimage_BC
   button CW_tool, disable=(tab!=0)+2*loadflag, pos={217,327},size={60,20},title="CW",font="Times New Roman",proc=rotateimage_BC
   button flip_tool, disable=((tab!=0)+2*(2-dimflag)),pos={370,94},size={100,25},title="Transpose",font="Times New Roman",proc=flipimg_BC
   button normal_tool, disable=(tab!=0)+2*loadflag,pos={370, 175},size={100,25},title="Normalize",font="Times New Roman",proc=valuenormalize
   button flipx_tool, disable=(tab!=0)+2*loadflag, pos={370,121},size={47,25}, title="L< >R",font="Times New Roman",proc=flipxy_button
   button flipy_tool, disable=(tab!=0)+2*loadflag, pos={423,121},size={47,25}, title="T< >B",font="Times New Roman",proc=flipxy_button
   button oppositex_tool, disable=(tab!=0)+2*loadflag, pos={370,148},size={47,25}, title="X+< >-",font="Times New Roman",proc=oppositexy_button
   button oppositey_tool, disable=(tab!=0)+2*loadflag, pos={423,148},size={47,25}, title="Y+< >-",font="Times New Roman",proc=oppositexy_button
   button normalmdc_tool, disable=(tab!=0)+2*loadflag, pos={370, 202}, size={100, 25}, title="NormalMDC", font="Times New Roman", proc=valuenormalize
   button normaledc_tool, disable=(tab!=0)+2*loadflag, pos={370, 229}, size={100, 25}, title="NormalEDC", font="Times New Roman", proc=valuenormalize
   button flip3dx_tool, disable=(tab!=0)+2*loadflag, pos={370, 256}, size={47, 25}, title="X > Z", font="Times New Roman", proc=flip3d_button
   button flip3dy_tool, disable=(tab!=0)+2*loadflag, pos={423, 256}, size={47, 25}, title="Y > Z", font="Times New Roman", proc=flip3d_button
   button save_tool, disable=2*loadflag,pos={330,370},size={60,25}, font="Times New Roman",title="Save", fcolor=(65280,0,0), proc=saveop
   button copy_tool, disable=2*loadflag,pos={260,370},size={60,25}, font="Times New Roman",title="Copy", fcolor=(65280,0,0), proc=copyop
   button reset_tool, disable=2*loadflag,pos={190,370}, size={60,25},font="Times New Roman",title="Reset", fcolor=(65280,0,0), proc=reset
   //display/n=littleimg/host=toolpanel/w=(60,100,340,340);appendimage abs0024
   groupbox avegroup_tool, disable=(tab!=1),pos={10,85},size={110,80}
   popupmenu ave_tool, disable=((tab!=1)+2*(2-dimflag)), pos={15,90},size={100,20},title="Average wave",font="Times New Roman", mode=0,value="average y;average x;",proc=averageimg_pum
   setvariable aves_tool, disable=((tab!=1)+2*(2-dimflag)), pos={15,115},size={100,20},title="Start:",font="Times New Roman",value=arguwave[121]
   setvariable avee_tool, disable=((tab!=1)+2*(2-dimflag)), pos={15,140},size={100,20},title="End:",font="Times New Roman",value=arguwave[122]
   groupbox dispergb_tool, disable=(tab!=1), pos={125,85}, size={100,125}
   popupmenu disper_tool, disable=(tab!=1), pos={130,90}, size={90,20},title="Dispersion",mode=0,value="2nd Diff-EDC;2nd Diff-MDC;Curvature-EDC;Curvature-MDC;2D Curvature-map;2D Curvature-spectrum",font="Times New Roman",proc=dispersion_pum
   setvariable smooth1_tool, disable=(tab!=1),pos={130,115},size={90,20},title="1stSm#:",value=arguwave[117]
   setvariable smooth2_tool, disable=(tab!=1),pos={130,140},size={90,20},title="2ndSm#:",value=arguwave[118]
   setvariable a0_tool, disable=(tab!=1), pos={130,165}, size={90,20},title="a0:", value=arguwave[119]
   setvariable a1_tool, disable=(tab!=1), pos={130,187}, size={90,20},title="a1:", value=arguwave[112]
   groupbox a2kgb_tool, disable=(tab!=1), pos={10,169},size={110,167}
   setvariable ef_tool, disable=(tab!=1), pos={15,175},size={100,20},title="Ef:",value=arguwave[6]
   button atok_tool,disable=((tab!=1)+2*(2-dimflag)), pos={15,195}, size={100,25},title="Ang2kspace",font="Times New Roman",proc=angtok_BC
   setvariable size_tool, disable=(tab!=1), pos={15, 224}, size={100,20},title="Size", value=arguwave[120],limits={0,inf,0.1}
   setvariable tilt_tool, disable=(tab!=1), pos={15, 244}, size={100,20},title="Tilt", value=arguwave[57],limits={-inf,inf,0.01} 
   checkbox accurate_tool, disable=(tab!=1), pos={35, 263}, font="Times New Roman",title="accurate"
   button thetak3d_tool,disable=(tab!=1), pos={15,280}, size={100,25},title="Thetakspace3D",font="Times New Roman",proc=angtok3d_BC
   button azik3d_tool, disable=(tab!=1), pos={15, 306}, size={100, 25},title="Azimuthkspace3D",font="Times New Roman", proc=angtok3d_BC
   groupbox gb7_tool,disable=(tab!=1), pos={10,338}, size={110,57},font="Times New Roman",fcolor=(65280,21760,0)
   popupmenu jigsaw2d_tool, disable=(tab!=1), pos={15,343},size={100,25},bodywidth=100,font="Times New Roman",title="Jigsaw2D",mode=0,value="Connect Y;Connect X;",proc=Jigsaw2d_pum
   popupmenu jigsaw3d_tool, disable=(tab!=1), pos={15,368},size={100,25},bodywidth=100,font="Times New Roman",title="Jigsaw3D",mode=0,value="Connect X;Connect Y;Connect Z;",proc=Jigsaw3d_pum
   groupbox gb8_tool, disable=(tab!=1), pos={230, 85}, size={160,120}, title="Enhance", font="Times New Roman",fcolor=(65280,21760,0)
   setvariable enx1_tool, disable=(tab!=1), pos={238, 105}, size={70, 20}, title="x1", value=arguwave[138]
   setvariable eny1_tool, disable=(tab!=1), pos={238, 130}, size={70, 20}, title="y1", value=arguwave[140]
   setvariable enx2_tool, disable=(tab!=1), pos={313, 105}, size={70, 20}, title="x2", value=arguwave[139]
   setvariable eny2_tool, disable=(tab!=1), pos={313, 130}, size={70, 20}, title="y2", value=arguwave[141]
   setvariable enfactor_tool, disable=(tab!=1), pos={238, 155}, size={120, 20}, title="factor", limits={-inf, inf, 0.01}, value=arguwave[142]
   button enselect_tool, disable=(tab!=1)+2*loadflag, pos={238,180},size={70,20},title="Select",font="Times New Roman",proc=selectrange
   button enhance_tool, disable=(tab!=1)+2*loadflag, pos={313,180},size={70,20},title="Enhance",font="Times New Roman",proc=Enhance
   groupbox gb4_tool, disable=(tab!=2),pos={10,83},size={132,128},title="Graph Translate",font="Times New Roman",fcolor=(65280,21760,0)
   setvariable dx_tool, disable=(tab!=2),pos={63,100},size={75,20},title="DeltaY",bodywidth=75, value=arguwave[52]
   setvariable dy_tool, disable=(tab!=2),pos={63,123},size={75,20},title="DeltaX",bodywidth=75, value=arguwave[53]
   valdisplay movex_tool, disable=(tab!=2),pos={63,146},size={64,20},title="Ymotion",bodywidth=64, frame=2,value=#"root:globalvar:movey"
   valdisplay movey_tool, disable=(tab!=2),pos={63,169},size={64,20},title="Xmotion",bodywidth=64, frame=2,value=#"root:globalvar:movex"
   button yp_tool, disable=(tab!=2)+2*loadflag,pos={21,186},size={25,20},title="Y+",  font="Times New Roman",proc=movegraph
   button ym_tool, disable=(tab!=2)+2*loadflag,pos={49,186},size={25,20},title="Y-",  font="Times New Roman",proc=movegraph
   button xp_tool, disable=(tab!=2)+2*loadflag,pos={77,186},size={25,20},title="X+",  font="Times New Roman",proc=movegraph
   button xm_tool, disable=(tab!=2)+2*loadflag,pos={105,186},size={25,20},title="X-",  font="Times New Roman",proc=movegraph
   groupbox gb5_tool, disable=(tab!=2),pos={147,83},size={132,128},title="Graph Rotate",font="Times New Roman",fcolor=(65280,21760,0)
   setvariable cx_tool, disable=(tab!=2),pos={200,100},size={75,20},title="CenterX",bodywidth=75,value=arguwave[49]
   setvariable cy_tool, disable=(tab!=2),pos={200,123},size={75,20},title="CenterY",bodywidth=75,value=arguwave[50]
   setvariable ang_tool, disable=(tab!=2),pos={200,146},size={75,20},title="R_Angle",bodywidth=75,value=arguwave[51]
   valdisplay grot_tool, disable=(tab!=2),pos={200,169},size={64,20},title="T_Angle",bodywidth=64,frame=2,value=#"root:globalvar:grotate"
   button rotation_tool, disable=(tab!=2)+2*loadflag,pos={175,186},size={75,20},title="Rotate",  font="Times New Roman",proc=rotategraph
   groupbox gb6_tool, disable=(tab!=2), pos={284,83},size={110,128},title="Draw",font="Times New Roman",fcolor=(65280,21760,0),fstyle=1
   setvariable yname_tool, disable=(tab!=2), pos={291,100}, size={90,20},title="Yname",value=root:globalvar:yname
   setvariable xname_tool, disable=(tab!=2), pos={291,123}, size={90,20},title="Xname",value=root:globalvar:xname
   popupmenu drawwin_tool, disable=(tab!=2), pos={313,146}, size={75,20},bodywidth=75,title="Win", value=winlist("*",";","WIN:1")
   button draw_tool, disable=(tab!=2), pos={305,175},size={70,25},title="Draw",font="Times New Roman",fcolor=(65280,21760,0),proc=draw
   switch(tab)
     case 0:
       getwindow ToolPanel, wsize
       movewindow/w=ToolPanel V_left, V_top, V_left+360, V_bottom
       tabcontrol tab1_tool, size={460,26}, win=ToolPanel
       titlebox tb_tool,size={390,20}
       button load_tool,pos={410,30}
     break
     Default:
       getwindow ToolPanel, wsize
       movewindow/w=ToolPanel V_left, V_top, V_left+300, V_bottom
       tabcontrol tab1_tool, size={380,26}, win=ToolPanel
       titlebox tb_tool,size={310,20}
       button load_tool,pos={330,30}
     break
   endswitch
end

function normalize_BC(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   wave/t currwave=root:globalvar:currwave
   variable i
   variable wavenum=itemsinlist(currwave[5])
   NVAR disflag=root:globalvar:normdis
   NVAR a2kflag=root:globalvar:norma2k
   string mark="new"
   prompt mark, "Enter one mark for normalized wave"
   doprompt "Normalize", mark
   if(V_flag==1)
     return -1
   endif
   for(i=0;i<wavenum;i+=1)
     setdatafolder root:
     string newname=nameofwave($stringfromlist(i, currwave[5]))+"_N"+num2str(i)+"_"+mark
     controlinfo mode_norm
     Normalizewavey($stringfromlist(i, currwave[5]), newname, arguwave[0], arguwave[1], arguwave[2],arguwave[3], arguwave[4], arguwave[5], arguwave[7], arguwave[35], arguwave[36],V_Value)
   endfor
   setdatafolder root:Normalized:
   if(a2kflag==1)
    string Evalist=""
    for(i=0;i<wavenum;i+=1)
      Evalist+=nameofwave($stringfromlist(i, currwave[5]))+"_N"+num2str(i)+"_"+mark+";"
    endfor
    for(i=0;i<wavenum;i+=1)
      angtok($stringfromlist(i, Evalist), arguwave[6], "root:Normalized:")
    endfor
   endif
   if(disflag==1 && a2kflag==1)
    string Evklist=""
    for(i=0;i<wavenum;i+=1)
     Evklist+=nameofwave($stringfromlist(i, currwave[5]))+"_N"+num2str(i+1)+"_"+mark+"_k;"
    endfor
    for(i=0;i<wavenum;i+=1)
     Newimage/f/k=1 $stringfromlist(i, Evklist)
     Modifyimage  $stringfromlist(i, Evklist) ctab= {*,*,PlanetEarth256,0}
     ModifyGraph lblRot(left)=180,tkLblRot(left)=-90,tickUnit(left)=1;DelayUpdate
     Label left "\\Z12"+stringfromlist(i, currwave[5])+"_k"+num2str(i+1)
    endfor
   endif
end

function FDfit_BC(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  arguwave[63]=-inf
  arguwave[64]=inf
  setdatafolder root:FermiEnergyFit:
  dowindow/f FermiDiracPanel
  if(V_flag==0)
  newpanel/k=1/w=(450,250,750,550)/n=FermiDiracPanel
  modifypanel fixedsize=1
  setwindow FermiDiracPanel, hook(killpanel)=killpanel
  titlebox tb_ffd, pos={10,10},size={220,20},fixedsize=1,frame=2,title=currwave[1]
  button loadffd, pos={240,10},size={50,20},font="Times New Roman",title="Load",proc=load 
  tabcontrol fitmode_ffd, pos={10, 35}, size={280, 25},font= "times new roman", labelBack=(0,43520,65280 ), tablabel(0)="Original", tablabel(1)="Conv.FT", tablabel(2)="Conv.FW", proc=tabffd
  //popupmenu tracewave, pos={180,150}, size={100,20}, bodywidth=100, title="Target", mode=1, value=tracenamelist("",";",1)     //choose target trace on the top window
  button append_ffd, pos={195,150}, size={60,20}, font="Times New Roman", title="Append", proc=FDfittest
  drawtext 10,165,"Fit range"
  setvariable E1, pos={10,170},size={120,20}, title="E1", value=arguwave[63],limits={dimoffset(wavname,0),dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0),0.01}
  setvariable E2, pos={10,195},size={120,20}, title="E2", value=arguwave[64],limits={dimoffset(wavname,0),dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0),0.01}
  button selectrangeffd, pos={30,220},size={70,25}, title="Select range", font="Times New Roman", proc=selectrange
  button con, pos={120,260}, size={60,25}, font="Times New Roman",fcolor=(0,43520,65280), title="Fit"
  button con, proc=fitffd
  endif
  tabffd("", 0)
  if(waveexists($currwave[1])==0)
    titlebox tb_ffd,title="Please load wave."
    button con, disable=2
    button selectrangeffd, disable=2
    button append_ffd, disable=2
  else
   if(wavedims($currwave[1])==2) 
    wave wavname=$currwave[1]
    string newname=nameofwave(wavname)+"_yave"
    make/o/n=(dimsize(wavname,0)) temp=0
    variable i,j
    for(i=0;i<dimsize(wavname,0);i+=1)
      for(j=0;j<dimsize(wavname,1);j+=1)
        temp[i]+=wavname[i][j]
      endfor
      temp[i]/=dimsize(wavname,1)
    endfor
    duplicate/o temp, $newname
    killwaves temp
    setscale/p x, dimoffset(wavname,0),dimdelta(wavname,0), $newname
   else
    setdatafolder root:FermiEnergyFit:
    newname=nameofwave($currwave[1])+"_yave"
    duplicate/o $currwave[1], $newname
    setscale/p x, dimoffset($currwave[1],0),dimdelta($currwave[1],0), $newname
   endif
   dowindow/k fit_range
   display/k=2/n=fit_range $newname
   showinfo
   autopositionwindow/E/M=0/r=FermiDiracPanel
  endif
end

function tabffd(ctrlname, tab): tabcontrol
    string ctrlname
    variable tab
    wave arguwave=root:globalvar:arguwave
    setvariable ef1_ffd, disable=(tab!=0),pos={10,65},size={120,20}, title="Ef",limits={-inf,inf,0.01},value=arguwave[58]
    setvariable kt, disable=(tab!=0), pos={155,65},size={120,20}, title="kT",limits={-inf,inf,0.001},value=arguwave[59]
    setvariable am1_ffd, disable=(tab!=0),pos={10,95},size={120,20}, title="Amp",limits={-inf,inf,0.1},value=arguwave[60]
    setvariable sl1, disable=(tab!=0),pos={155,95},size={120,20}, title="slope",limits={-inf,inf,0.01},value=arguwave[61]
    checkbox sl1_cb, disable=(tab!=0),pos={277,97},title=""
    setvariable bg1, disable=(tab!=0),pos={10,125},size={120,20}, title="const",limits={-inf,inf,1},value=arguwave[62]
    checkbox bg1_cb, disable=(tab!=0),pos={133,127},title=""
    setvariable ef2_ffd, disable=(tab!=1 && tab!=2),pos={10,65},size={120,20}, title="Ef",limits={-inf,inf,0.01},value=arguwave[146]
    setvariable temperature, disable=(tab!=1 && tab!=2),  pos={155,65},size={120,20}, title="T",limits={-inf,inf,1},value=arguwave[147]
    setvariable am2_ffd, disable=(tab!=1 && tab!=2),pos={10,95},size={120,20}, title="Amp",limits={-inf,inf,0.1},value=arguwave[148]
    setvariable sl2, disable=(tab!=1 && tab!=2),pos={155,95},size={120,20}, title="slope",limits={-inf,inf,0.01},value=arguwave[149]
    checkbox sl2_cb, disable=(tab!=1 && tab!=2),pos={277,97},title=""
    setvariable bg2, disable=(tab!=1 && tab!=2),pos={10,125},size={120,20}, title="const",limits={-inf,inf,1},value=arguwave[150]
    checkbox bg2_cb, disable=(tab!=1 && tab!=2),pos={133,127},title=""
    setvariable gawidth_ffd, disable=(tab!=1 && tab!=2), pos={155, 125}, size={120, 20}, title="Wid(meV)", limits={0, inf, 1}, value=arguwave[151]
    titlebox  resfactitle_ffd, disable=(tab!=1 && tab!=2), pos={155,173}, size={100, 20}, font="arial",title="Resolution Factor", frame=0
    setvariable resfac_ffd, disable=(tab!=1 && tab!=2), pos={155, 190},size={120, 20}, title=" ", value=arguwave[152]
    titlebox  extfactitle_ffd, disable=(tab!=1 && tab!=2), pos={155,213}, size={100, 20}, font="arial",title="Extend Factor", frame=0
    setvariable extfac_ffd, disable=(tab!=1 && tab!=2), pos={155, 230},size={120, 20}, title=" ", value=arguwave[153]
end

function fitffd(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave wavname=$currwave[1]
  wave arguwave=root:globalvar:arguwave
  setdatafolder root:FermiEnergyFit:
  string pname="P_"+nameofwave(wavname)
  string newname=nameofwave(wavname)+"_yave"
  string hold
  variable i
  controlinfo/w=fermidiracpanel  fitmode_ffd
  switch(V_value)
  case 0:
    make/o/n=5  cwave
    make/o/n=(5,2) $pname
    for(i=0;i<5;i+=1)
       cwave[i]=arguwave[58+i]
    endfor
    Make/O/T/N=2 T_Constraints
    T_Constraints = {"K1>0","K2>0"}
    hold="000"
    controlinfo/w=FermiDiracPanel sl1_cb
    hold+=num2str(V_value)
    controlinfo/w=FermiDiracPanel bg1_cb
    hold+=num2str(V_value)
    funcfit/l=(dimsize($newname,0))/h=hold FermiDirac cwave $newname(arguwave[63],arguwave[64]) /d/c=T_constraints
    killwaves T_Constraints
    arguwave[6]=cwave[0]
    for(i=0;i<5;i+=1)
      arguwave[58+i]=cwave[i]
    endfor
    duplicate/o $newname, $("C_"+newname)
    setscale/p x, dimoffset($newname,0)-cwave[0],dimdelta($newname,0),$("C_"+newname)   //set reference to Ef
    //RemoveFromGraph/w=fit_range $("fit_"+newname)
    for(i=0;i<5;i+=1)
     wave temp=$pname
     temp[i][0]=cwave[i]
     wave W_sigma
     temp[i][1]=W_sigma[i]
    endfor
    killwaves cwave, W_sigma
    modifygraph/w=fit_range rgb($("fit_"+newname))=(0,15872,65280)
    string titlemark
    prompt titlemark, "Enter mark for this trace"
    doprompt "", titlemark
    if(V_flag==1)
     return -1
    endif
    display $newname
    appendtograph $("fit_"+newname)
    modifygraph rgb($("fit_"+newname))=(0,15872,65280)
    TextBox/C/N=text0/a=RC "\\F'Arial'"+titlemark+"\rE\BF\M="+num2str(arguwave[58])+" eV\r4kT="+num2str(4*arguwave[59]*1000)+" meV"
    Legend/C/N=text1/J "\\F'Arial'\\s("+newname+") origin data\r\\s(fit_"+newname+") fit data"
    Label bottom "\\F'Times New Roman'\\Z12Energy"
   break
   case 1:
     make/o/n=6  cwave
     make/o/n=(6,2) $pname
     for(i=0;i<5;i+=1)
       cwave[i]=arguwave[146+i]
     endfor
     cwave[5]=arguwave[151]/2000
     Make/O/T/N=3 T_Constraints
     T_Constraints = {"K2>0","K5>0"}
     hold="010"
     controlinfo/w=FermiDiracPanel sl2_cb
     hold+=num2str(V_value)
     controlinfo/w=FermiDiracPanel bg2_cb
     hold+=num2str(V_value)
     hold+="0"
     funcfit/l=(dimsize($newname,0))/h=hold FermiDirac_gauss cwave $newname(arguwave[63],arguwave[64]) /d/c=T_constraints
     killwaves T_Constraints
     arguwave[6]=cwave[0]
     for(i=0;i<5;i+=1)
      arguwave[146+i]=cwave[i]
     endfor
     arguwave[151]=cwave[5]*2000
     duplicate/o $newname, $("C_"+newname)
     setscale/p x, dimoffset($newname,0)-cwave[0],dimdelta($newname,0),$("C_"+newname)   //set reference to Ef
     //RemoveFromGraph/w=fit_range $("fit_"+newname)
     for(i=0;i<6;i+=1)
       wave temp=$pname
       temp[i][0]=cwave[i]
       wave W_sigma
       temp[i][1]=W_sigma[i]
     endfor
     killwaves cwave, W_sigma
     modifygraph/w=fit_range rgb($("fit_"+newname))=(0,15872,65280)
     prompt titlemark, "Enter mark for this trace"
     doprompt "", titlemark
     if(V_flag==1)
       return -1
     endif
     display $newname
     appendtograph $("fit_"+newname)
     modifygraph rgb($("fit_"+newname))=(0,15872,65280)
     TextBox/C/N=text0/a=RC "\\F'Arial'"+titlemark+"\rE\BF\M="+num2str(arguwave[146])+" eV\rExternal Resolution\r="+num2str(arguwave[151])+" meV"
     Legend/C/N=text1/J "\\F'Arial'\\s("+newname+") origin data\r\\s(fit_"+newname+") fit data"
     Label bottom "\\F'Times New Roman'\\Z12Energy"
   break
   case 2:
     make/o/n=6  cwave
     make/o/n=(6,2) $pname
     for(i=0;i<5;i+=1)
       cwave[i]=arguwave[146+i]
     endfor
     cwave[5]=arguwave[151]/2000
     Make/O/T/N=3 T_Constraints
     T_Constraints = {"K2>0","K1>0"}
     hold="000"
     controlinfo/w=FermiDiracPanel sl2_cb
     hold+=num2str(V_value)
     controlinfo/w=FermiDiracPanel bg2_cb
     hold+=num2str(V_value)
     hold+="1"
     funcfit/l=(dimsize($newname,0))/h=hold FermiDirac_gauss cwave $newname(arguwave[63],arguwave[64]) /d/c=T_constraints
     killwaves T_Constraints
     arguwave[6]=cwave[0]
     for(i=0;i<5;i+=1)
      arguwave[146+i]=cwave[i]
     endfor
     arguwave[151]=cwave[5]*2000
     duplicate/o $newname, $("C_"+newname)
     setscale/p x, dimoffset($newname,0)-cwave[0],dimdelta($newname,0),$("C_"+newname)   //set reference to Ef
     //RemoveFromGraph/w=fit_range $("fit_"+newname)
     for(i=0;i<6;i+=1)
       wave temp=$pname
       temp[i][0]=cwave[i]
       wave W_sigma
       temp[i][1]=W_sigma[i]
     endfor
     killwaves cwave, W_sigma
     modifygraph/w=fit_range rgb($("fit_"+newname))=(0,15872,65280)
     prompt titlemark, "Enter mark for this trace"
     doprompt "", titlemark
     if(V_flag==1)
       return -1
     endif
     display $newname
     appendtograph $("fit_"+newname)
     modifygraph rgb($("fit_"+newname))=(0,15872,65280)
     TextBox/C/N=text0/a=RC "\\F'Arial'"+titlemark+"\rE\BF\M="+num2str(arguwave[146])+" eV\rElectron Temperature\r="+num2str(arguwave[147])+" K"
     Legend/C/N=text1/J "\\F'Arial'\\s("+newname+") origin data\r\\s(fit_"+newname+") fit data"
     Label bottom "\\F'Times New Roman'\\Z12Energy"
   break
  endswitch
end

function Toolhook(s)
   STRUCT WMWinHookStruct &s
   wave/t currwave=root:globalvar:currwave
   Variable hookResult = 0
   if(s.eventcode==6 || s.eventcode==12)
      dowindow toolgraph
      if(V_flag==1)
       autopositionwindow/e/m=0/r=toolpanel toolgraph
      endif
      hookResult = 1
   endif
   if(s.eventcode==2)
     reset("")
     dowindow/k toolgraph
     killwaves/z root:globalvar:tempwave
     killwaves/z root:globalvar:ytemp
     killwaves/z root:globalvar:xtemp
     killvariables root:globalvar:shiftx
     killvariables root:globalvar:shifty
     killvariables root:globalvar:shiftv
     killvariables root:globalvar:shiftz
     killvariables root:globalvar:sandcx
     killvariables root:globalvar:sandcy
     killvariables root:globalvar:sandcv
     killvariables root:globalvar:sandcz
     killvariables root:globalvar:imgrotate
     killvariables root:globalvar:grotate
     killvariables root:globalvar:movey
     killvariables root:globalvar:movex
     killvariables root:globalvar:tabflag
     killvariables root:globalvar:dimflag 
     killstrings root:globalvar:yname
     killstrings root:globalvar:xname
     variable i
     SVAR namelist=root:globalvar:namelisttool
     for(i=0;i<itemsinlist(namelist);i+=1)
        wave temp=$("root:globalvar:"+nameofwave($stringfromlist(i, namelist)))
        killwaves/z temp
     endfor
     killstrings root:globalvar:namelisttool
     dowindow/k toolpanel
     hookResult = 1
   endif
   return hookresult
end

function Normalhook(s)
   STRUCT WMWinHookStruct &s
   wave/t currwave=root:globalvar:currwave
   Variable hookResult = 0
   if(s.eventcode==6 || s.eventcode==12)
     dowindow normalimg
     if(V_flag==1)
      autopositionwindow/e/m=0/r=normalpanel normalimg
     endif
     hookResult = 1
   endif
   if(s.eventcode==2)
     dowindow/k normalimg
     dowindow/k normalpanel
     killvariables root:globalvar:normdis
     killvariables root:globalvar:norma2k
     killstrings root:globalvar:namelistnorm
     killvariables root:globalvar:smoothconfirm
     hookResult = 1
   endif
   return hookresult
end

function killpanel(s)
   STRUCT WMWinHookStruct &s
   wave/t currwave=root:globalvar:currwave
   Variable hookResult = 0
   if(s.eventcode==2)
   strswitch(s.winname)
   case "MainMenu":
     variable V_flag
     dowindow edcmdcpanel
     //if(V_flag==1)
      //savenotebook/i/s=3/m="Save Notebook" edcmdcpanel#nb1_emdc
      //savenotebook/i/s=3/m="Save Notebook" edcmdcpanel#nb2_emdc
     //endif
     dowindow/k normalpanel
     dowindow/k kspacepanel
     dowindow/k EDCMDCPanel
     dowindow/k Fit_FermiDirac
     dowindow/k ToolPanel
     dowindow/k loadfile
     dowindow/k graphpanel
     dowindow/k CTpanel
     dowindow/k ACpanel
     hookResult = 1
     break
   case "FermiDiracPanel":
     dowindow/k fit_range
     hookResult = 1
     break
   case "EDCMDCPanel":
     dowindow/k EDCMDCdisplay
     dowindow/k dynamicshow
     killwaves root:globalvar:emdctemp
     killvariables root:globalvar:tabvalue
     dowindow/k singlecurvedisplay
     dowindow/k curvedisplay
     killwaves root:globalvar:singlecurve
     killwaves/z root:globalvar:emdcfittestwave
     killstrings root:globalvar:namelistcs
     killstrings root:globalvar:currvalue
     killstrings root:globalvar:inivalue
     killstrings root:globalvar:endvalue
     killvariables root:globalvar:popupnum
     dowindow/k emdcfitpanel
     hookResult = 1
     break
   case "kspacepanel":
     dowindow/k threedview
     dowindow/k kspace_x
     dowindow/k kspace_y
     dowindow/k kspace_z
     dowindow/k kspacepanel
     killvariables root:globalvar:kspacedis
     killstrings root:globalvar:namelist3d
     killwaves root:globalvar:temp3d
     hookResult = 1
     break
   case "ACpanel":
     dowindow/k Brillouinzone
     hookResult = 1
     break
   case "Graphpanel":
     dowindow/k spectrum
     hookResult = 1
     break
   case "Loadfile":
     killpath datafolder
     hookResult = 1
     break
   default:
     break
   endswitch
   endif
   return hookresult
end

function killpanel_button(ctrlname): buttoncontrol
   string ctrlname
   strswitch(ctrlname)
   case "killpause":
     dowindow/k $winname(0, 64)
   break
   endswitch
end

function load(ctrlname): buttoncontrol
   string ctrlname
   setdatafolder root:
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "loadffd":
     execute "Createbrowser prompt=\"Select one normalized Eva wave to fit Ef\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
      return -1
     endif
     currwave[1]=stringfromlist(0, list)
     dowindow/f Fit_FermiDirac
     titlebox tb_ffd,title=currwave[1]
     button con, disable=0
     button selectrangeffd, disable=0
     button append_ffd, disable=0
     if(wavedims($currwave[1])==2)
      wave wavname=$currwave[1]
      string newname=nameofwave(wavname)+"_yave"
      make/o/n=(dimsize(wavname,0)) temp=0
      variable i,j
      for(i=0;i<dimsize(wavname,0);i+=1)
       for(j=0;j<dimsize(wavname,1);j+=1)
        temp[i]+=wavname[i][j]
       endfor
       temp[i]/=dimsize(wavname,1)
      endfor
      movewave temp, root:FermiEnergyFit:
      setdatafolder root:FermiEnergyFit:
      duplicate/o temp, $newname
      killwaves temp
      setscale/p x, dimoffset(wavname,0),dimdelta(wavname,0), $newname
     else
      setdatafolder root:FermiEnergyFit:
      newname=nameofwave($currwave[1])+"_yave"
      duplicate/o $currwave[1], $newname
      setscale/p x, dimoffset($currwave[1],0),dimdelta($currwave[1],0), $newname
     endif
     dowindow/k fit_range
     display/k=2/n=fit_range $newname
     showinfo
     dowindow/f fit_fermidirac
     autopositionwindow/E/M=0/r=Fit_range
     break
   case "loadmdc":
     execute "Createbrowser prompt=\"Select one normalized Evk wave to make EDC/MDC\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
      return -1
     endif
     currwave[0]=stringfromlist(0,list)
     wave wavname=root:EDC_MDC:fliptemp
     setdatafolder root:EDC_MDC:
     duplicate/o $currwave[0], wavname
     dowindow/f EDCMDCPanel
     titlebox tb1, title=currwave[0]
     setvariable sv1, limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}
     setvariable sv2, limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}
     button save_emdc, disable=0
     button selectrangemdc, disable=0
     button generatemdc, disable=0
     button dyn_emdc, disable=0
     break
   case "loadedc":
     execute "Createbrowser prompt=\"Select one normalized Evk wave to make EDC/MDC\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
      return -1
     endif
     currwave[0]=stringfromlist(0,list)
     string tempname=currwave[0]
     setdatafolder root:EDC_MDC:
     wave wavname=root:EDC_MDC:fliptemp
     duplicate/o $currwave[0], wavname
     flipimg(wavname)
     titlebox tb1, title=currwave[0]
     setvariable sv6, limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}
     setvariable sv7, limits={dimoffset(wavname,0),(dimoffset(wavname,0)+(dimsize(wavname,0)-1)*dimdelta(wavname,0)),0.01}
     button save_emdc, disable=0
     button selectrangeedc, disable=0
     button generateedc, disable=0
     button dyn_emdc, disable=0
     break
   case "load_tool":
     execute "Createbrowser prompt=\"Select one wave\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
      return -1
     endif
     if(strlen(currwave[3])!=0)
       reset("")
     endif
     NVAR tabflag=root:globalvar:tabflag
     SVAR namelist=root:globalvar:namelisttool
     wave tempwave=root:globalvar:tempwave
     wave ytemp=root:globalvar:ytemp
     wave xtemp=root:globalvar:xtemp
     currwave[3]=list
     namelist=list
     wave temp0=$stringfromlist(0,currwave[3])
     duplicate/o temp0, tempwave
     if(wavedims(temp0)==1)
        duplicate/o temp0, ytemp
     endif
     if(itemsinlist(namelist)>1)
      wave temp1=$stringfromlist(1, currwave[3])
      if(wavedims(temp1)==1)
        duplicate/o temp1, xtemp
      endif
     endif
     dowindow/k toolgraph
     if(wavedims(tempwave)==1)
       display/k=2/n=toolgraph tempwave
     else
       preferences 0
       display/k=2/n=toolgraph/w=(600, 100, 850, 320);appendimage/w=toolgraph tempwave
       Modifyimage  tempwave ctab= {*,*,PlanetEarth256,0}
     endif
     autopositionwindow/e/m=0/r=toolpanel  toolgraph
     dowindow/f ToolPanel
     string title=stringfromlist(0,currwave[3])+" -> "+nameofwave($stringfromlist(itemsinlist(currwave[3])-1,currwave[3]))
     titlebox tb_tool, title=title
     popupmenu pum_tool, value=#"root:globalvar:namelisttool", mode=1
     tooltab("",tabflag)
     break 
   case "load_ks":
     execute "Createbrowser prompt=\"Select one 3D wave\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
      return -1
     endif
     currwave[2]=stringfromlist(0,list)
     wave mapk=$currwave[2]
     wave tempz=root:map3d:threed:tempz
     wave tempx=root:map3d:threed:tempx
     wave tempy=root:map3d:threed:tempy
     wave x_EP=root:map3d:threed:x_EP
     wave y_EP=root:map3d:threed:y_EP
     wave z_EP=root:map3d:threed:z_EP
     wave pro_EP=root:map3d:threed:pro_EP
     wave xprofile=root:map3d:threed:xprofile
     wave yprofile=root:map3d:threed:yprofile 
     wave zprofile=root:map3d:threed:zprofile
     redimension/n=(dimsize(mapk,0),dimsize(mapk,1)) tempz
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempz
     setscale/p y, dimoffset(mapk,1), dimdelta(mapk,1), tempz
     redimension/n=(dimsize(mapk,1),dimsize(mapk,2)) tempx
     setscale/p x, dimoffset(mapk,1), dimdelta(mapk,1), tempx
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempx
     redimension/n=(dimsize(mapk,0),dimsize(mapk,2)) tempy
     setscale/p x, dimoffset(mapk,0), dimdelta(mapk,0), tempy
     setscale/p y, dimoffset(mapk,2), dimdelta(mapk,2), tempy
     x_EP[0]=dimoffset(mapk, 0)
     x_EP[1]=dimoffset(mapk, 0)+(dimsize(mapk, 0)-1)*dimdelta(mapk, 0)
     y_EP[0]=dimoffset(mapk, 1)
     y_EP[1]=dimoffset(mapk, 1)+(dimsize(mapk, 1)-1)*dimdelta(mapk, 1)
     z_EP[0]=dimoffset(mapk, 2)
     z_EP[1]=dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)
     redimension/n=(dimsize(mapk,0)) xprofile
     redimension/n=(dimsize(mapk,1)) yprofile
     redimension/n=(dimsize(mapk,2)) zprofile
     setscale/p x, dimoffset(mapk, 0), dimdelta(mapk, 0), xprofile
     setscale/p x, dimoffset(mapk, 1), dimdelta(mapk, 1), yprofile
     setscale/p x, dimoffset(mapk, 2), dimdelta(mapk, 2), zprofile
     dowindow/f kspacepanel
     titlebox tb_ks,title=currwave[2]
     button bu_ks, disable=0
     button x_ks, disable=0
     button y_ks, disable=0
     button z_ks, disable=0
     button  graph3dview_ks, disable=0
     button cutrange_ks, disable=0
     button cut_ks, disable=0
     dowindow/k threeDview
     if(V_flag==1)
       graph3dview("")
     endif
     break
   case "load_norm":
     execute "Createbrowser prompt=\"Select waves to normalize\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
       return -1
     endif
     currwave[5]=list
     DoWindow/K normalimg
     preferences 0
     display/k=2/n=normalimg/w=(600, 100, 850, 320);Appendimage $stringfromlist(0,currwave[5])
     Modifyimage  $nameofwave($stringfromlist(0,currwave[5])) ctab= {*,*,PlanetEarth256,0}
     autopositionwindow/e/m=0/r=normalpanel
     dowindow/f normalpanel
     string first, last
     first=stringfromlist(0,list)
     last=stringfromlist(itemsinlist(list)-1,list)
     title=nameofwave($first)+" -> "+nameofwave($last)
     titlebox tb_norm, title=title
     button selectrange_norm, disable=0
     button bu_norm, disable=0
     SVAR namelist=root:globalvar:namelistnorm
     namelist=list
     popupmenu pum_norm, value=#"root:globalvar:namelistnorm"
     break
   case "load_cs":
     execute "Createbrowser prompt=\"Select waves to show EDC/MDC\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
       return -1
     endif
     SVAR namelist=root:globalvar:namelistcs
     SVAR iniv=root:globalvar:inivalue
     SVAR endv=root:globalvar:endvalue
     SVAR currvalue=root:globalvar:currvalue
     NVAR popupnum=root:globalvar:popupnum
     currwave[6]=stringfromlist(0,list)
     titlebox tb_cs, title=currwave[6]
     setvariable offset_cs, disable=0
     button show_cs, disable=0
     button lastc_cs, disable=0
     button nextc_cs, disable=0
     popupmenu pum_cs, disable=0
     button ex_cs, disable=0
     button fit_cs, disable=0
     button fitp_cs, disable=0
     popupmenu startcurve_cs, disable=0
     popupmenu endcurve_cs, disable=0
     button exmc_cs, disable=0
     setdatafolder $getwavesdatafolder($currwave[6],1)
     if(wavedims($currwave[6])==2)
       iniv=num2str(dimoffset($currwave[6],1))
       endv=num2str(dimoffset($currwave[6],1)+(dimsize($currwave[6],1)-1)*dimdelta($currwave[6],1))
       currvalue=iniv
       namelist=""
       for(i=0;i<dimsize($currwave[6],1);i+=1)
         namelist+="Curve "+num2str(i)+";"
       endfor
       popupmenu pum_cs, disable=0, mode=1 
       popupmenu startcurve_cs, disable=0, mode=1
       popupmenu endcurve_cs, disable=0, mode=1
     elseif(wavedims($currwave[6])==1)
       iniv="0"
       endv="0"
       currvalue="0"
       namelist="Curve0"
       popupmenu pum_cs, disable=2, mode=1
       button lastc_cs, disable=2
       button nextc_cs, disable=2
       popupmenu startcurve_cs, disable=2, mode=1
       popupmenu endcurve_cs, disable=2, mode=1
     endif
     wave wavname=$currwave[6]
     wave tempwave=root:globalvar:singlecurve
     redimension/n=(dimsize($currwave[6],0)) tempwave
     setscale/p x, dimoffset(wavname,0),dimdelta(wavname,0),tempwave
     tempwave[]=wavname[p][0]
     popupnum=1
     break
   case "load_CT":
     execute "Createbrowser prompt=\"Select Color Table\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     if(Flag==0)
       return -1
     endif 
     currwave[7]=stringfromlist(0,list)
     titlebox external_CT, title=currwave[7], win=CTPanel
     CT_colortable()
     break
   case "load_tr":
     execute "Createbrowser prompt=\"Select time-resolved map\""
     SVAR List=S_BrowserList
     NVAR Flag=V_Flag
     currwave[8]=stringfromlist(0,list)
     wave XY_plane=root:tr:XY_plane
     wave trMap=$currwave[8]
     NVAR Zvalue=root:tr:Zvalue
     NVAR X1value=root:tr:X1value
     NVAR X2value=root:tr:X2value
     NVAR Y1value=root:tr:Y1value
     NVAR Y2value=root:tr:Y2value
     NVAR Xp=root:tr:Xp
     NVAR Xw=root:tr:Xw
     NVAR Yp=root:tr:Yp
     NVAR Yw=root:tr:Yw
     wave trCEP=root:tr:trCEP
     wave XlineEP=root:tr:XlineEP
     wave YlineEP=root:tr:YlineEP
     if(wavedims(trMap)==3)
       redimension/n=(dimsize(trMap,0),dimsize(trMap,1)) XY_plane
       setscale/p x, dimoffset(trMap,0),dimdelta(trMap,0),XY_plane
       setscale/p y, dimoffset(trMap,1),dimdelta(trMap,1),XY_plane
       XY_plane[][]=trMap[p][q][0]
       titlebox tb_tr, title=currwave[8], win=trSpectrum#trpanel
       Zvalue=dimoffset(trMap,2)
       Xp=dimoffset(trMap,0)+(dimsize(trMap,0)-1)*dimdelta(trMap,0)/2
       Xw=(dimsize(trMap,0)-1)*dimdelta(trMap,0)
       Yp=dimoffset(trmap,1)+(dimsize(trMap,1)-1)*dimdelta(trMap,1)/2
       Yw=(dimsize(trMap,1)-1)*dimdelta(trMap,1)
       XlineEP[0]=Xp-Xw/2
       XlineEP[1]=Xp+Xw/2
       YlineEP[0]=Yp-Yw/2
       YlineEP[1]=Yp+Yw/2
       button gen_tr, disable=0
       button fit1_tr, disable=0
       setvariable Xp_tr, limits={dimoffset(XY_plane,0)+Xw/2,dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xw/2, dimdelta(XY_plane,0)}, proc=tr_sv
       setvariable Yp_tr, limits={dimoffset(XY_plane,1)+Yw/2,dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yw/2, dimdelta(XY_plane,1)}, proc=tr_sv
       setvariable Xw_tr, limits={0, min(2*(dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xp), 2*(Xp-dimoffset(XY_plane,0))), dimdelta(XY_plane,0)}, proc=tr_sv
       setvariable Yw_tr, limits={0, min(2*(dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yp), 2*(Yp-dimoffset(XY_plane,1))), dimdelta(XY_plane,1)}, proc=tr_sv
     endif
     tr_tab("", 0)
     break
   endswitch
end
   
function aandd(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  SVAR namelist=root:GlobalVar:namelist3d
  wave temp3d=root:globalvar:temp3d
  strswitch(ctrlname)
  case "add_3d":
    execute "Createbrowser prompt=\"Select Eva waves to make 3dmap\""
    SVAR List=S_BrowserList
    NVAR Flag=V_Flag
    if(Flag==0)
      return -1
    endif
    namelist+=List
    button map_3d, disable=0
    button delete_3d, disable=0
    button clear_3d, disable=0
    button revert_3d, disable=0
    popupmenu  namelist_3d, mode=1,disable=0,win=kspacepanel
    duplicate/o $stringfromlist(0,namelist), root:globalvar:temp3d
    break
  case "delete_3d":
    controlinfo namelist_3d
    variable num=V_Value-1
    if(num<itemsinlist(namelist)-1)
      namelist=removelistitem(num, namelist)
      popupmenu  namelist_3d, mode=num+1,win=kspacepanel
      duplicate/o $stringfromlist(num,namelist), root:globalvar:temp3d
    else
      if(itemsinlist(namelist)>1)
        popupmenu  namelist_3d, mode=num,win=kspacepanel
        duplicate/o $stringfromlist(num-1,namelist), root:globalvar:temp3d
        namelist=removelistitem(num, namelist)
      else
        namelist=""
        temp3d=0
        popupmenu  namelist_3d, disable=2,mode=1,win=kspacepanel
        button map_3d, disable=2
        button delete_3d, disable=2
        button clear_3d, disable=2
        button revert_3d, disable=2
      endif
    endif
    break
  case "clear_3d":
    namelist=""
    button map_3d, disable=2
    button delete_3d, disable=2
    button clear_3d, disable=2
    button revert_3d, disable=2
    popupmenu  namelist_3d, disable=2,mode=1,win=kspacepanel
    break
  default:
    break
  endswitch
  currwave[4]=namelist
end

function listreverse_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:GlobalVar:namelist3d
   string tempstr
   tempstr=listreverse(namelist)
   namelist=tempstr
   popupmenu  namelist_3d, mode=1,disable=0,win=kspacepanel
   duplicate/o $stringfromlist(0,namelist), root:globalvar:temp3d
   currwave[4]=namelist
end

function/s listreverse(liststr)
   string liststr
   string newlist=""
   variable i
   for(i=itemsinlist(liststr)-1;i>=0;i-=1)
      newlist+=stringfromlist(i, liststr)+";"
   endfor
   return newlist
end

function imgcheck3d_PUM(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave temp=root:globalvar:temp3d
   duplicate/o $popstr, temp
end
   
function selectrange(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "selectrangeffd":
     wave wavname=$currwave[1]
     string newname=nameofwave(wavname)+"_yave"
     if(strlen(csrinfo(A, "fit_range"))==0 || strlen(csrinfo(B, "fit_range"))==0)
        pause("range error.","fit_range")
        break
     else
     arguwave[58]=(xcsr(A)+xcsr(B))/2
     arguwave[59]=0.01
     arguwave[60]=vcsr(A)-vcsr(B)
     arguwave[62]=vcsr(B)
     arguwave[63]=xcsr(A)
     arguwave[64]=xcsr(B)
     arguwave[146]=(xcsr(A)+xcsr(B))/2
     arguwave[148]=vcsr(A)-vcsr(B)
     arguwave[150]=vcsr(B)
     endif
     break
   case "selectrangeedc":
     getmarquee/w=edcmdcpanel#littleimg bottom
     if(V_flag==0)
       pause("range error.","edcmdcpanel")
       break
     else
      arguwave[16]=V_left
      arguwave[17]=V_right
      getmarquee/w=edcmdcpanel#littleimg/k
      arguwave[18]=floor((arguwave[17]-arguwave[16])/dimdelta($currwave[0], 1))
     endif
     break
   case "selectrangemdc":
     getmarquee/w=edcmdcpanel#littleimg bottom
     if(V_flag==0)
       pause("range error.","edcmdcpanel")
       break
     else
      arguwave[11]=V_left
      arguwave[12]=V_right
      getmarquee/w=edcmdcpanel#littleimg/k
      arguwave[13]=floor((arguwave[12]-arguwave[11])/dimdelta($currwave[0], 0))
     endif
     break
   case "select_cut":
     wave tempwave=root:globalvar:tempwave
     variable oneortwo=wavedims(wavname)
     dowindow/f toolgraph
     getmarquee/w=toolgraph bottom, left
     if(V_flag==0)
       pause("range error.","toolpanel")
       break
     else
      arguwave[27]=V_left
      arguwave[28]=V_right
      arguwave[29]=V_bottom
      arguwave[30]=V_top
      getmarquee/w=toolgraph/k
     endif
     break
   case "selectrange_norm":
     dowindow/f normalimg
     getmarquee/w=normalimg bottom
     if(V_flag==0)
       pause("range error.","normalpanel")
       break
     else
      arguwave[0]=V_left
      arguwave[1]=V_right
      getmarquee/w=normalimg/k
     endif
     break
   case "range_fep":
     if(strlen(csrinfo(A,"singlecurvedisplay"))!=0 && strlen(csrinfo(B,"singlecurvedisplay"))!=0)
      arguwave[42]=xcsr(A)
      arguwave[43]=xcsr(B)
     else
      pause("range error.","")
     endif
     break
   case "cutrange_ks":
     if(strlen(csrinfo(A,"ThreeDView"))!=0 && strlen(csrinfo(B,"ThreeDView"))!=0)
      arguwave[113]=xcsr(A, "ThreeDView")
      arguwave[114]=xcsr(B, "ThreeDView")
      arguwave[115]=vcsr(A, "ThreeDView")
      arguwave[116]=vcsr(B, "ThreeDView")
     else
      pause("range error.","")
     endif
     break
   case "enselect_tool":
     wave tempwave=root:globalvar:tempwave
     dowindow/f toolgraph
     getmarquee/w=toolgraph bottom, left
     if(V_flag==0)
       pause("range error.","toolpanel")
       break
     else
      arguwave[138]=V_left
      arguwave[139]=V_right
      arguwave[140]=V_bottom
      arguwave[141]=V_top
      getmarquee/w=toolgraph/k
     endif
     break
   default:
     break
   endswitch
end

function generateemdc(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave wavname=root:EDC_MDC:fliptemp
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "generateedc":
     dowindow/k EDCMDCdisplay
     EDCMDC(wavname, arguwave[16], arguwave[17], arguwave[18], arguwave[19], arguwave[34],0)
     //notebook edcmdcpanel#nb1_emdc, text=("\r"+time()+"\tGENERATE EDC: "+num2str(arguwave[16])+" -> "+num2str(arguwave[17])+", "+num2str(arguwave[18])+", dP="+num2str(arguwave[19])+"     ")
     button save_emdc, disable=0, win=edcmdcpanel
     break
   case "generatemdc":
     dowindow/k EDCMDCdisplay
     EDCMDC(wavname, arguwave[11], arguwave[12], arguwave[13], arguwave[14], arguwave[34],1)
     //notebook edcmdcpanel#nb1_emdc, text=("\r"+time()+"\tGENERATE MDC: "+num2str(arguwave[11])+" -> "+num2str(arguwave[12])+", "+num2str(arguwave[13])+", dE="+num2str(arguwave[14])+"     ")
     button save_emdc, disable=0, win=edcmdcpanel
     break
   default:
     break
   endswitch
end

function mosaic_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   reset("")
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
       mosaic(tempwave, arguwave[100], arguwave[101], arguwave[102])
   else
       variable i
       string newname
       for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          mosaic($newname, arguwave[100], arguwave[101], arguwave[102])
       endfor
       controlinfo/w=toolpanel pum_tool
       newname="root:globalvar:"+nameofwave($S_value)
       duplicate/o $newname, tempwave
    endif
end

function mosaic(wref, xnum, ynum, znum)
   wave wref
   variable xnum,ynum,znum
   variable xdim, ydim, zdim
   variable i,j
   if(wavedims(wref)==2)
     if(xnum>1)
       xdim=ceil(dimsize(wref,0)/xnum)
       make/n=(xdim, dimsize(wref,1))/o  temp_m=0
       for(i=0;i<xdim;i+=1)
         for(j=0;j<xnum && i*xnum+j<dimsize(wref,0);j+=1)
           temp_m[i][]+=wref[i*xnum+j][q]
         endfor
         temp_m[i][]/=j
       endfor
       setscale/p x, dimoffset(wref,0)+(xnum-1)*dimdelta(wref,0)/2, xnum*dimdelta(wref,0), temp_m
       setscale/p y, dimoffset(wref,1), dimdelta(wref,1), temp_m
       duplicate/o temp_m, wref
       killwaves temp_m
     endif
     if(ynum>1)
       ydim=ceil(dimsize(wref,1)/ynum)
       make/n=(dimsize(wref,0), ydim)/o  temp_m=0
       for(i=0;i<ydim;i+=1)
         for(j=0;j<ynum && i*ynum+j<dimsize(wref,1);j+=1)
           temp_m[][i]+=wref[p][i*ynum+j]
         endfor
         temp_m[][i]/=j
       endfor
       setscale/p x, dimoffset(wref,0), dimdelta(wref,0), temp_m
       setscale/p y, dimoffset(wref,1)+(ynum-1)*dimdelta(wref,1)/2, ynum*dimdelta(wref,1), temp_m
       duplicate/o temp_m, wref
       killwaves temp_m
     endif
   endif
   if(wavedims(wref)==3)
     if(xnum>1)
       xdim=ceil(dimsize(wref,0)/xnum)
       make/n=(xdim, dimsize(wref,1), dimsize(wref,2))/o  temp_m=0
       for(i=0;i<xdim;i+=1)
         for(j=0;j<xnum && i*xnum+j<dimsize(wref,0);j+=1)
           temp_m[i][][]+=wref[i*xnum+j][q][r]
         endfor
         temp_m[i][][]/=j
       endfor
       setscale/p x, dimoffset(wref,0)+(xnum-1)*dimdelta(wref,0)/2, xnum*dimdelta(wref,0), temp_m
       setscale/p y, dimoffset(wref,1), dimdelta(wref,1), temp_m
       setscale/p z, dimoffset(wref,2), dimdelta(wref,2), temp_m
       duplicate/o temp_m, wref
       killwaves temp_m
     endif
     if(ynum>1)
       ydim=ceil(dimsize(wref,1)/ynum)
       make/n=(dimsize(wref,0), ydim, dimsize(wref,2))/o  temp_m=0
       for(i=0;i<ydim;i+=1)
         for(j=0;j<ynum && i*ynum+j<dimsize(wref,1);j+=1)
           temp_m[][i][]+=wref[p][i*ynum+j][r]
         endfor
         temp_m[][i][]/=j
       endfor
       setscale/p x, dimoffset(wref,0), dimdelta(wref,0), temp_m
       setscale/p y, dimoffset(wref,1)+(ynum-1)*dimdelta(wref,1)/2, ynum*dimdelta(wref,1), temp_m
       setscale/p z, dimoffset(wref,2), dimdelta(wref,2), temp_m
       duplicate/o temp_m, wref
       killwaves temp_m
     endif
     if(znum>1)
       zdim=ceil(dimsize(wref,2)/znum)
       make/n=(dimsize(wref,0), dimsize(wref,1), zdim)/o  temp_m=0
       for(i=0;i<zdim;i+=1)
         for(j=0;j<znum && i*znum+j<dimsize(wref,2);j+=1)
           temp_m[][][i]+=wref[p][q][i*znum+j]
         endfor
         temp_m[][][i]/=j
       endfor
       setscale/p x, dimoffset(wref,0), dimdelta(wref,0), temp_m
       setscale/p y, dimoffset(wref,1), dimdelta(wref,1), temp_m
       setscale/p z, dimoffset(wref,2)+(znum-1)*dimdelta(wref,2)/2, znum*dimdelta(wref,2), temp_m
       duplicate/o temp_m, wref
       killwaves temp_m
     endif
   endif
end

function translate_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   NVAR nx=root:globalvar:shiftx
   variable xtemp=nx
   NVAR ny=root:globalvar:shifty
   variable ytemp=ny
   NVAR nz=root:globalvar:shiftz
   variable ztemp=nz
   NVAR nv=root:globalvar:shiftv
   variable vtemp=nv
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
       translate(tempwave, ctrlname)
   else
       variable i
       string newname
       for(i=0;i<itemsinlist(namelist);i+=1)
          nx=xtemp
          ny=ytemp
          nz=ztemp
          nv=vtemp
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          translate($newname, ctrlname)
       endfor
       controlinfo/w=toolpanel pum_tool
       newname="root:globalvar:"+nameofwave($S_value)
       duplicate/o $newname, tempwave
    endif
end

function translate(wavname, ctrlname)
   wave wavname
   string ctrlname
   NVAR nx=root:globalvar:shiftx
   NVAR ny=root:globalvar:shifty
   NVAR nz=root:globalvar:shiftz
   NVAR nv=root:globalvar:shiftv
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "left_tool":
     nx-=arguwave[21]
     setscale/p x, dimoffset(wavname,0)-arguwave[21],dimdelta(wavname,0),wavname
     break
   case "right_tool":
     nx+=arguwave[21]
     setscale/p x, dimoffset(wavname,0)+arguwave[21],dimdelta(wavname,0),wavname
     break
   case "up_tool":
     ny+=arguwave[22]
     setscale/p y, dimoffset(wavname,1)+arguwave[22],dimdelta(wavname,1),wavname
     break
   case "down_tool":
     ny-=arguwave[22]
     setscale/p y, dimoffset(wavname,1)-arguwave[22],dimdelta(wavname,1),wavname
     break
   case "zdown_tool":
     nz-=arguwave[65]
     setscale/p z, dimoffset(wavname,2)-arguwave[65],dimdelta(wavname,2),wavname
     break
   case "zup_tool":
     nz+=arguwave[65]
     setscale/p z, dimoffset(wavname,2)+arguwave[65],dimdelta(wavname,2),wavname
     break
   case "big_tool":
     nv+=arguwave[23]
     wavname+=arguwave[23]
     break
   case "small_tool":
     nv-=arguwave[23]
     wavname-=arguwave[23]
     break
   endswitch
end

function showimgnorm(ctrlname,popnum,popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   dowindow/k normalimg
   preferences 0
   display/k=2/n=normalimg/w=(600, 100, 850, 320);appendimage $stringfromlist(popnum-1,currwave[5])
   Modifyimage  $nameofwave($stringfromlist(popnum-1,currwave[5])) ctab= {*,*,PlanetEarth256,0}
   autopositionwindow/e/m=0/r=normalpanel
   dowindow/f normalpanel
end

function showimgtool(ctrlname,popnum, popstr):popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   reset("")
   wave tempwave=root:globalvar:tempwave
   NVAR dim_flag=root:globalvar:dimflag
   wave temp=$popstr
   duplicate/o temp, tempwave
   dim_flag=wavedims(temp)
   dowindow/f ToolPanel
end

function fitemdcpanel_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:singlecurve
   variable popupnum
   dowindow emdcfitpanel
   if(V_flag==1)
     dowindow/f emdcfitpanel
   else
     newpanel/w=(630,50,1250,520)/n=EmdcFitPanel/k=1
     setwindow EmdcFitPanel, hook(fitpanelhook)=killpanel
     modifypanel fixedsize=1
     popupmenu ff_femdc, pos={10,10},size={80,20},title="Fitting Function ",font="Times New Roman", value="1.Single Gauss;2.Single Lorentz;3.Double Gauss;4.Double Lorentz;5.Gauss+Lorentz;6.Three Gauss;7.Three Lorentz;8.One Gauss+Two Lorentz;9.Two Gauss+One Lorentz;10.Four Lorentz;11.Four Gauss;12.Two Gauss+Two Lorentz;", proc=fitemdcparameter_pum
     setvariable sx_fep, pos={30, 390},size={120,20},title="startx:",font="Times New Roman",value=arguwave[42]
     setvariable ex_fep, pos={30, 410},size={120,20},title="endx:  ",font="Times New Roman",value=arguwave[43]
     button range_fep, pos={63,433},size={80,25},title="Select range",font="Times New Roman", proc=selectrange
     button test_fep, pos={160,433}, size={70,25},title="Test", font="Times New Roman", proc=testemdcfit
     checkbox dis_fep, pos={160,393},title="Display?",font="Times New Roman", value=1
     fitemdcparameter_pum("", 1, "")
   endif   
   controlinfo/w=edcmdcpanel startcurve_cs
   popupnum=V_value
   popupmenu pum_cs,mode=popupnum, win=edcmdcpanel 
   wave wavname=$currwave[6]
   tempwave[]=wavname[p][popupnum-1]
   dowindow singlecurvedisplay
   if(V_flag==0)
     display/k=1/n=singlecurvedisplay tempwave
   endif
   dowindow/f emdcfitpanel
end

function fitemdcparameter_pum(ctrlname, popnum, popstr):popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave arguwave=root:globalvar:arguwave
   groupbox gblor_fep, pos={10,35},size={600,120},title="Gauss",font="Times New Roman"
   setvariable pp1_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={20,58}, size={80,20},title="Pos1", bodywidth=50, font="Times New Roman",value=arguwave[37]
   checkbox pp1cb_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={110,60}, title=""
   setvariable pw1_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={20,83}, size={80,20},title="Wid1", bodywidth=50, font="Times New Roman",value=arguwave[38]
   checkbox pw1cb_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={110,85},title=""
   setvariable pa1_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={20,108}, size={80,20},title="Amp1", bodywidth=50, font="Times New Roman",value=arguwave[39]
   checkbox pa1cb_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10),pos={110,110},title=""
   checkbox mp1_fep, disable=2*(popnum==2 || popnum==4 || popnum==7 || popnum==10), pos={60,135}, title=""
   setvariable pp2_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={140,58}, size={80,20},title="Pos2", bodywidth=50, font="Times New Roman",value=arguwave[44]
   checkbox pp2cb_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={230,60}, title=""
   setvariable pw2_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={140,83}, size={80,20},title="Wid2", bodywidth=50, font="Times New Roman",value=arguwave[45]
   checkbox pw2cb_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={230,85},title=""
   setvariable pa2_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={140,108}, size={80,20},title="Amp2", bodywidth=50, font="Times New Roman",value=arguwave[46]
   checkbox pa2cb_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12),pos={230,110},title=""
   checkbox mp2_fep, disable=2*(popnum!=3 && popnum!=6 && popnum!=9 && popnum!=11 && popnum!=12), pos={180,135}, title=""
   setvariable pp3_fep, disable=2*(popnum!=6 && popnum!=11),pos={260,58}, size={80,20},title="Pos3", bodywidth=50, font="Times New Roman",value=arguwave[67]
   checkbox pp3cb_fep, disable=2*(popnum!=6 && popnum!=11),pos={350,60}, title=""    
   setvariable pw3_fep, disable=2*(popnum!=6 && popnum!=11),pos={260,83}, size={80,20},title="Wid3", bodywidth=50, font="Times New Roman",value=arguwave[68]
   checkbox pw3cb_fep, disable=2*(popnum!=6 && popnum!=11),pos={350,85},title=""
   setvariable pa3_fep, disable=2*(popnum!=6 && popnum!=11),pos={260,108}, size={80,20},title="Amp3", bodywidth=50, font="Times New Roman",value=arguwave[69]
   checkbox pa3cb_fep, disable=2*(popnum!=6 && popnum!=11),pos={350,110},title=""
   checkbox mp3_fep, disable=2*(popnum!=6 && popnum!=11), pos={300,135}, title=""
   setvariable pp4_fep, disable=2*(popnum!=11),pos={380,58}, size={80,20},title="Pos4", bodywidth=50, font="Times New Roman",value=arguwave[70]
   checkbox pp4cb_fep, disable=2*(popnum!=11),pos={470,60}, title=""
   setvariable pw4_fep, disable=2*(popnum!=11),pos={380,83}, size={80,20},title="Wid4", bodywidth=50, font="Times New Roman",value=arguwave[71]
   checkbox pw4cb_fep, disable=2*(popnum!=11),pos={470,85},title=""
   setvariable pa4_fep, disable=2*(popnum!=11),pos={380,108}, size={80,20},title="Amp4", bodywidth=50, font="Times New Roman",value=arguwave[72]
   checkbox pa4cb_fep, disable=2*(popnum!=11),pos={470,110},title=""
   checkbox mp4_fep, disable=2*(popnum!=11), pos={420,135}, title=""
   setvariable pp5_fep, disable=2,pos={500,58}, size={80,20},title="Pos5", bodywidth=50, font="Times New Roman",value=arguwave[75]
   checkbox pp5cb_fep, disable=2,pos={590,60}, title=""
   setvariable pw5_fep, disable=2,pos={500,83}, size={80,20},title="Wid5", bodywidth=50, font="Times New Roman",value=arguwave[76]
   checkbox pw5cb_fep, disable=2,pos={590,85},title=""
   setvariable pa5_fep, disable=2,pos={500,108}, size={80,20},title="Amp5", bodywidth=50, font="Times New Roman",value=arguwave[77]
   checkbox pa5cb_fep, disable=2,pos={590,110},title=""
   checkbox mp5_fep, disable=2, pos={540,135}, title=""

   groupbox gbgau_fep, pos={10,165},size={600,120},title="Lorentz",font="Times New Roman"
   setvariable pp6_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={20,188}, size={80,20},title="Pos6", bodywidth=50, font="Times New Roman",value=arguwave[78]
   checkbox pp6cb_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={110,190}, title=""
   setvariable pw6_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={20,213}, size={80,20},title="Wid6", bodywidth=50, font="Times New Roman",value=arguwave[79]
   checkbox pw6cb_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={110,215},title=""
   setvariable pa6_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={20,238}, size={80,20},title="Amp6", bodywidth=50, font="Times New Roman",value=arguwave[80]
   checkbox pa6cb_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11),pos={110,240},title=""
   checkbox mp6_fep, disable=2*(popnum==1 || popnum==3 || popnum==6 || popnum==11), pos={60,265}, title=""
   setvariable pp7_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={140,188}, size={80,20},title="Pos7", bodywidth=50, font="Times New Roman",value=arguwave[83]
   checkbox pp7cb_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={230,190}, title=""
   setvariable pw7_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={140,213}, size={80,20},title="Wid7", bodywidth=50, font="Times New Roman",value=arguwave[84]
   checkbox pw7cb_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={230,215},title=""
   setvariable pa7_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={140,238}, size={80,20},title="Amp7", bodywidth=50, font="Times New Roman",value=arguwave[85]
   checkbox pa7cb_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12),pos={230,240},title=""
   checkbox mp7_fep, disable=2*(popnum!=4 && popnum!=7 && popnum!=8 && popnum!=10 && popnum!=12), pos={180,265}, title=""
   setvariable pp8_fep, disable=2*(popnum!=7 && popnum!=10),pos={260,188}, size={80,20},title="Pos8", bodywidth=50, font="Times New Roman",value=arguwave[86]
   checkbox pp8cb_fep, disable=2*(popnum!=7 && popnum!=10),pos={350,190}, title=""
   setvariable pw8_fep, disable=2*(popnum!=7 && popnum!=10),pos={260,213}, size={80,20},title="Wid8", bodywidth=50, font="Times New Roman",value=arguwave[87]
   checkbox pw8cb_fep, disable=2*(popnum!=7 && popnum!=10),pos={350,215},title=""
   setvariable pa8_fep, disable=2*(popnum!=7 && popnum!=10),pos={260,238}, size={80,20},title="Amp8", bodywidth=50, font="Times New Roman",value=arguwave[88]
   checkbox pa8cb_fep, disable=2*(popnum!=7 && popnum!=10),pos={350,240},title=""
   checkbox mp8_fep, disable=2*(popnum!=7 && popnum!=10), pos={300,265}, title=""
   setvariable pp9_fep, disable=2*(popnum!=10),pos={380,188}, size={80,20},title="Pos9", bodywidth=50, font="Times New Roman",value=arguwave[91]
   checkbox pp9cb_fep, disable=2*(popnum!=10),pos={470,190}, title=""
   setvariable pw9_fep, disable=2*(popnum!=10),pos={380,213}, size={80,20},title="Wid9", bodywidth=50, font="Times New Roman",value=arguwave[92]
   checkbox pw9cb_fep, disable=2*(popnum!=10),pos={470,215},title=""
   setvariable pa9_fep, disable=2*(popnum!=10),pos={380,238}, size={80,20},title="Amp9", bodywidth=50, font="Times New Roman",value=arguwave[93]
   checkbox pa9cb_fep, disable=2*(popnum!=10),pos={470,240},title=""
   checkbox mp9_fep, disable=2*(popnum!=10), pos={420,265}, title=""
   setvariable pp10_fep, disable=2,pos={500,188}, size={80,20},title="Pos10", bodywidth=50, font="Times New Roman",value=arguwave[94]
   checkbox pp10cb_fep, disable=2,pos={590,190}, title=""
   setvariable pw10_fep, disable=2,pos={500,213}, size={80,20},title="Wid10", bodywidth=50, font="Times New Roman",value=arguwave[95]
   checkbox pw10cb_fep, disable=2,pos={590,215},title=""
   setvariable pa10_fep, disable=2,pos={500,238}, size={80,20},title="Amp10", bodywidth=50, font="Times New Roman",value=arguwave[96]
   checkbox pa10cb_fep, disable=2,pos={590,240},title=""
   checkbox mp10_fep, disable=2, pos={540,265}, title=""
   
   groupbox gbbg_fep, pos={10,295},size={600,80},title="Background",font="Times New Roman"
   setvariable const_fep, pos={20,330}, size={80,20},title="Slope", bodywidth=50, font="Times New Roman",value=arguwave[40]
   checkbox constcb_fep, pos={110,332}, title=""
   setvariable slope_fep, pos={140,330}, size={80,20},title="Const", bodywidth=50, font="Times New Roman",value=arguwave[41]
   checkbox slopecb_fep, pos={230,332}, title=""
end   

function fitemdc_BC(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   wave/t currwave=root:globalvar:currwave
   setdatafolder $getwavesdatafolder($currwave[6],1)
   variable snum, lownum, highnum, i, fitstart, fitend, step
   string fittingfunc
   wave wavname=$currwave[6]
   controlinfo/w=edcmdcpanel startcurve_cs
   lownum=V_value
   controlinfo/w=edcmdcpanel endcurve_cs
   highnum=V_value
   controlinfo/w=edcmdcpanel fitdir_cs
   if(V_value==0)
    snum=lownum
    step=1
   else
    snum=highnum
    step=-1
   endif
   fitstart=arguwave[42]
   fitend=arguwave[43]
   variable wavenum
   if(wavedims(wavname)==2)
      wavenum=dimsize(wavname, 1)
   elseif(wavedims(wavname)==1)
      wavenum=1
   endif
   print wavenum
   controlinfo/w=emdcfitpanel ff_femdc
   fittingfunc=S_value
   strswitch(fittingfunc)
   case "1.Single Gauss":
     string foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M1
     make/o/n=(wavenum, 11) Pwave_M1=0
     make/o/n=5 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[40]
     cwave[4]=arguwave[41]
     string Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value) 
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       string sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold singlegauss, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M1[i][1]=cwave[0]
       Pwave_M1[i][3]=cwave[1]
       Pwave_M1[i][5]=cwave[2]
       Pwave_M1[i][7]=cwave[3]
       Pwave_M1[i][9]=cwave[4]
       Pwave_M1[i][2]=W_sigma[0]
       Pwave_M1[i][4]=W_sigma[1]
       Pwave_M1[i][6]=W_sigma[2]
       Pwave_M1[i][8]=W_sigma[3]
       Pwave_M1[i][10]=W_sigma[4]
       Pwave_M1[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M1:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M1:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        variable delta
        controlinfo/w=edcmdcpanel fitdir_cs
        if(V_value==0)
         delta=Pwave_M1[i][1]-Pwave_M1[i-1][1]
        else
         delta=Pwave_M1[i][1]-Pwave_M1[i+1][1]
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     //arguwave[37]=cwave[0]
     //arguwave[38]=cwave[1]
     //arguwave[39]=cwave[2]
     //arguwave[40]=cwave[3]
     //arguwave[41]=cwave[4]
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "2.Single Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M2
     make/o/n=(wavenum, 11) Pwave_M2=0
     make/o/n=5 cwave
     cwave[0]=arguwave[78]
     cwave[1]=arguwave[79]
     cwave[2]=arguwave[80]
     cwave[3]=arguwave[40]
     cwave[4]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","k2>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold SingleLorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M2[i][1]=cwave[0]
       Pwave_M2[i][3]=cwave[1]
       Pwave_M2[i][5]=cwave[2]
       Pwave_M2[i][7]=cwave[3]
       Pwave_M2[i][9]=cwave[4]
       Pwave_M2[i][2]=W_sigma[0]
       Pwave_M2[i][4]=W_sigma[1]
       Pwave_M2[i][6]=W_sigma[2]
       Pwave_M2[i][8]=W_sigma[3]
       Pwave_M2[i][10]=W_sigma[4]
       Pwave_M2[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M2:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
       appendtograph wavname[][i]
       if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
       else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
       endif
       appendtograph $(":fitwaves_M2:fit_"+sname)
       modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=edcmdcpanel fitdir_cs
        if(V_value==0)
         delta=Pwave_M2[i][1]-Pwave_M2[i-1][1]
        else
         delta=Pwave_M2[i][1]-Pwave_M2[i+1][1]
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     //arguwave[44]=cwave[0]
     //arguwave[45]=cwave[1]
     //arguwave[46]=cwave[2]
     //arguwave[47]=cwave[3]
     //arguwave[48]=cwave[4]
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "3.Double Gauss":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M3
     make/o/n=(wavenum, 17) Pwave_M3=0
     make/o/n=8 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[44]
     cwave[4]=arguwave[45]
     cwave[5]=arguwave[46]
     cwave[6]=arguwave[40]
     cwave[7]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold doublegauss, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M3[i][1]=cwave[0]
       Pwave_M3[i][3]=cwave[1]
       Pwave_M3[i][5]=cwave[2]
       Pwave_M3[i][7]=cwave[3]
       Pwave_M3[i][9]=cwave[4]
       Pwave_M3[i][11]=cwave[5]
       Pwave_M3[i][13]=cwave[6]
       Pwave_M3[i][15]=cwave[7]
       Pwave_M3[i][2]=W_sigma[0]
       Pwave_M3[i][4]=W_sigma[1]
       Pwave_M3[i][6]=W_sigma[2]
       Pwave_M3[i][8]=W_sigma[3]
       Pwave_M3[i][10]=W_sigma[4]
       Pwave_M3[i][12]=W_sigma[5]
       Pwave_M3[i][14]=W_sigma[6]
       Pwave_M3[i][16]=W_sigma[7]
       Pwave_M3[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M3:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M3:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        variable flag1, flag2
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp2_fep
        flag2=V_value
        if(flag1+flag2>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M3[i][1]-Pwave_M3[i-1][1])*flag1+(Pwave_M3[i][7]-Pwave_M3[i-1][7])*flag2)/(flag1+flag2)
         else
          delta=((Pwave_M3[i][1]-Pwave_M3[i+1][1])*flag1+(Pwave_M3[i][7]-Pwave_M3[i+1][7])*flag2)/(flag1+flag2)
         endif
        else
          delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "4.Double Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M4
     make/o/n=(wavenum, 17) Pwave_M4=0
     make/o/n=8 cwave
     cwave[0]=arguwave[78]
     cwave[1]=arguwave[79]
     cwave[2]=arguwave[80]
     cwave[3]=arguwave[83]
     cwave[4]=arguwave[84]
     cwave[5]=arguwave[85]
     cwave[6]=arguwave[40]
     cwave[7]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold doublelorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M4[i][1]=cwave[0]
       Pwave_M4[i][3]=cwave[1]
       Pwave_M4[i][5]=cwave[2]
       Pwave_M4[i][7]=cwave[3]
       Pwave_M4[i][9]=cwave[4]
       Pwave_M4[i][11]=cwave[5]
       Pwave_M4[i][13]=cwave[6]
       Pwave_M4[i][15]=cwave[7]
       Pwave_M4[i][2]=W_sigma[0]
       Pwave_M4[i][4]=W_sigma[1]
       Pwave_M4[i][6]=W_sigma[2]
       Pwave_M4[i][8]=W_sigma[3]
       Pwave_M4[i][10]=W_sigma[4]
       Pwave_M4[i][12]=W_sigma[5]
       Pwave_M4[i][14]=W_sigma[6]
       Pwave_M4[i][16]=W_sigma[7]
       Pwave_M4[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M4:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M4:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp6_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp7_fep
        flag2=V_value
        if(flag1+flag2>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M4[i][1]-Pwave_M4[i-1][1])*flag1+(Pwave_M4[i][7]-Pwave_M4[i-1][7])*flag2)/(flag1+flag2)
         else
          delta=((Pwave_M4[i][1]-Pwave_M4[i+1][1])*flag1+(Pwave_M4[i][7]-Pwave_M4[i+1][7])*flag2)/(flag1+flag2)
         endif
        else
          delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "5.Gauss+Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M5
     make/o/n=(wavenum, 17) Pwave_M5=0
     make/o/n=8 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[78]
     cwave[4]=arguwave[79]
     cwave[5]=arguwave[80]
     cwave[6]=arguwave[40]
     cwave[7]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>=0","K4>0","K5>=0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold gausslorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M5[i][1]=cwave[0]
       Pwave_M5[i][3]=cwave[1]
       Pwave_M5[i][5]=cwave[2]
       Pwave_M5[i][7]=cwave[3]
       Pwave_M5[i][9]=cwave[4]
       Pwave_M5[i][11]=cwave[5]
       Pwave_M5[i][13]=cwave[6]
       Pwave_M5[i][15]=cwave[7]
       Pwave_M5[i][2]=W_sigma[0]
       Pwave_M5[i][4]=W_sigma[1]
       Pwave_M5[i][6]=W_sigma[2]
       Pwave_M5[i][8]=W_sigma[3]
       Pwave_M5[i][10]=W_sigma[4]
       Pwave_M5[i][12]=W_sigma[5]
       Pwave_M5[i][14]=W_sigma[6]
       Pwave_M5[i][16]=W_sigma[7]
       Pwave_M5[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M5:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M5:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp6_fep
        flag2=V_value
        if(flag1+flag2>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M5[i][1]-Pwave_M5[i-1][1])*flag1+(Pwave_M5[i][7]-Pwave_M5[i-1][7])*flag2)/(flag1+flag2)
         else
          delta=((Pwave_M5[i][1]-Pwave_M5[i+1][1])*flag1+(Pwave_M5[i][7]-Pwave_M5[i+1][7])*flag2)/(flag1+flag2)
         endif
        else
          delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "6.Three Gauss":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M6
     make/o/n=(wavenum, 23) Pwave_M6=0
     make/o/n=11 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[44]
     cwave[4]=arguwave[45]
     cwave[5]=arguwave[46]
     cwave[6]=arguwave[67]
     cwave[7]=arguwave[68]
     cwave[8]=arguwave[69]
     cwave[9]=arguwave[40]
     cwave[10]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold threegauss, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M6[i][1]=cwave[0]
       Pwave_M6[i][3]=cwave[1]
       Pwave_M6[i][5]=cwave[2]
       Pwave_M6[i][7]=cwave[3]
       Pwave_M6[i][9]=cwave[4]
       Pwave_M6[i][11]=cwave[5]
       Pwave_M6[i][13]=cwave[6]
       Pwave_M6[i][15]=cwave[7]
       Pwave_M6[i][17]=cwave[8]
       Pwave_M6[i][19]=cwave[9]
       Pwave_M6[i][21]=cwave[10]
       Pwave_M6[i][2]=W_sigma[0]
       Pwave_M6[i][4]=W_sigma[1]
       Pwave_M6[i][6]=W_sigma[2]
       Pwave_M6[i][8]=W_sigma[3]
       Pwave_M6[i][10]=W_sigma[4]
       Pwave_M6[i][12]=W_sigma[5]
       Pwave_M6[i][14]=W_sigma[6]
       Pwave_M6[i][16]=W_sigma[7]
       Pwave_M6[i][18]=W_sigma[8]
       Pwave_M6[i][20]=W_sigma[9]
       Pwave_M6[i][22]=W_sigma[10]
       Pwave_M6[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M6:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M6:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        variable flag3
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp2_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp3_fep
        flag3=V_value
        if(flag1+flag2+flag3>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M6[i][1]-Pwave_M6[i-1][1])*flag1+(Pwave_M6[i][7]-Pwave_M6[i-1][7])*flag2+(Pwave_M6[i][13]-Pwave_M6[i-1][13])*flag3)/(flag1+flag2+flag3)
         else
          delta=((Pwave_M6[i][1]-Pwave_M6[i+1][1])*flag1+(Pwave_M6[i][7]-Pwave_M6[i+1][7])*flag2+(Pwave_M6[i][13]-Pwave_M6[i+1][13])*flag3)/(flag1+flag2+flag3)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "7.Three Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M7
     make/o/n=(wavenum, 23) Pwave_M7=0
     make/o/n=11 cwave
     cwave[0]=arguwave[78]
     cwave[1]=arguwave[79]
     cwave[2]=arguwave[80]
     cwave[3]=arguwave[83]
     cwave[4]=arguwave[84]
     cwave[5]=arguwave[85]
     cwave[6]=arguwave[86]
     cwave[7]=arguwave[87]
     cwave[8]=arguwave[88]
     cwave[9]=arguwave[40]
     cwave[10]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold threelorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M7[i][1]=cwave[0]
       Pwave_M7[i][3]=cwave[1]
       Pwave_M7[i][5]=cwave[2]
       Pwave_M7[i][7]=cwave[3]
       Pwave_M7[i][9]=cwave[4]
       Pwave_M7[i][11]=cwave[5]
       Pwave_M7[i][13]=cwave[6]
       Pwave_M7[i][15]=cwave[7]
       Pwave_M7[i][17]=cwave[8]
       Pwave_M7[i][19]=cwave[9]
       Pwave_M7[i][21]=cwave[10]
       Pwave_M7[i][2]=W_sigma[0]
       Pwave_M7[i][4]=W_sigma[1]
       Pwave_M7[i][6]=W_sigma[2]
       Pwave_M7[i][8]=W_sigma[3]
       Pwave_M7[i][10]=W_sigma[4]
       Pwave_M7[i][12]=W_sigma[5]
       Pwave_M7[i][14]=W_sigma[6]
       Pwave_M7[i][16]=W_sigma[7]
       Pwave_M7[i][18]=W_sigma[8]
       Pwave_M7[i][20]=W_sigma[9]
       Pwave_M7[i][22]=W_sigma[10]
       Pwave_M7[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M7:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M7:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp6_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp7_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp8_fep
        flag3=V_value
        if(flag1+flag2+flag3>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M7[i][1]-Pwave_M7[i-1][1])*flag1+(Pwave_M7[i][7]-Pwave_M7[i-1][7])*flag2+(Pwave_M7[i][13]-Pwave_M7[i-1][13])*flag3)/(flag1+flag2+flag3)
         else
          delta=((Pwave_M7[i][1]-Pwave_M7[i+1][1])*flag1+(Pwave_M7[i][7]-Pwave_M7[i+1][7])*flag2+(Pwave_M7[i][13]-Pwave_M7[i+1][13])*flag3)/(flag1+flag2+flag3)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "8.One Gauss+Two Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M8
     make/o/n=(wavenum, 23) Pwave_M8=0
     make/o/n=11 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[78]
     cwave[4]=arguwave[79]
     cwave[5]=arguwave[80]
     cwave[6]=arguwave[83]
     cwave[7]=arguwave[84]
     cwave[8]=arguwave[85]
     cwave[9]=arguwave[40]
     cwave[10]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold onegauss_twolorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M8[i][1]=cwave[0]
       Pwave_M8[i][3]=cwave[1]
       Pwave_M8[i][5]=cwave[2]
       Pwave_M8[i][7]=cwave[3]
       Pwave_M8[i][9]=cwave[4]
       Pwave_M8[i][11]=cwave[5]
       Pwave_M8[i][13]=cwave[6]
       Pwave_M8[i][15]=cwave[7]
       Pwave_M8[i][17]=cwave[8]
       Pwave_M8[i][19]=cwave[9]
       Pwave_M8[i][21]=cwave[10]
       Pwave_M8[i][2]=W_sigma[0]
       Pwave_M8[i][4]=W_sigma[1]
       Pwave_M8[i][6]=W_sigma[2]
       Pwave_M8[i][8]=W_sigma[3]
       Pwave_M8[i][10]=W_sigma[4]
       Pwave_M8[i][12]=W_sigma[5]
       Pwave_M8[i][14]=W_sigma[6]
       Pwave_M8[i][16]=W_sigma[7]
       Pwave_M8[i][18]=W_sigma[8]
       Pwave_M8[i][20]=W_sigma[9]
       Pwave_M8[i][22]=W_sigma[10]
       Pwave_M8[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M8:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M8:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp6_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp7_fep
        flag3=V_value
        if(flag1+flag2+flag3>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M8[i][1]-Pwave_M8[i-1][1])*flag1+(Pwave_M8[i][7]-Pwave_M8[i-1][7])*flag2+(Pwave_M8[i][13]-Pwave_M8[i-1][13])*flag3)/(flag1+flag2+flag3)
         else
          delta=((Pwave_M8[i][1]-Pwave_M8[i+1][1])*flag1+(Pwave_M8[i][7]-Pwave_M8[i+1][7])*flag2+(Pwave_M8[i][13]-Pwave_M8[i+1][13])*flag3)/(flag1+flag2+flag3)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "9.Two Gauss+One Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M9
     make/o/n=(wavenum, 23) Pwave_M9=0
     make/o/n=11 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[44]
     cwave[4]=arguwave[45]
     cwave[5]=arguwave[46]
     cwave[6]=arguwave[78]
     cwave[7]=arguwave[79]
     cwave[8]=arguwave[80]
     cwave[9]=arguwave[40]
     cwave[10]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold twogauss_onelorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       Pwave_M9[i][1]=cwave[0]
       Pwave_M9[i][3]=cwave[1]
       Pwave_M9[i][5]=cwave[2]
       Pwave_M9[i][7]=cwave[3]
       Pwave_M9[i][9]=cwave[4]
       Pwave_M9[i][11]=cwave[5]
       Pwave_M9[i][13]=cwave[6]
       Pwave_M9[i][15]=cwave[7]
       Pwave_M9[i][17]=cwave[8]
       Pwave_M9[i][19]=cwave[9]
       Pwave_M9[i][21]=cwave[10]
       Pwave_M9[i][2]=W_sigma[0]
       Pwave_M9[i][4]=W_sigma[1]
       Pwave_M9[i][6]=W_sigma[2]
       Pwave_M9[i][8]=W_sigma[3]
       Pwave_M9[i][10]=W_sigma[4]
       Pwave_M9[i][12]=W_sigma[5]
       Pwave_M9[i][14]=W_sigma[6]
       Pwave_M9[i][16]=W_sigma[7]
       Pwave_M9[i][18]=W_sigma[8]
       Pwave_M9[i][20]=W_sigma[9]
       Pwave_M9[i][22]=W_sigma[10]
       Pwave_M9[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M9:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M9:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp2_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp6_fep
        flag3=V_value
        if(flag1+flag2+flag3>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M9[i][1]-Pwave_M9[i-1][1])*flag1+(Pwave_M9[i][7]-Pwave_M9[i-1][7])*flag2+(Pwave_M9[i][13]-Pwave_M9[i-1][13])*flag3)/(flag1+flag2+flag3)
         else
          delta=((Pwave_M9[i][1]-Pwave_M9[i+1][1])*flag1+(Pwave_M9[i][7]-Pwave_M9[i+1][7])*flag2+(Pwave_M9[i][13]-Pwave_M9[i+1][13])*flag3)/(flag1+flag2+flag3)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
     endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "10.Four Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M10
     make/o/n=(wavenum, 29) Pwave_M10=0
     make/o/n=14 cwave
     cwave[0]=arguwave[78]
     cwave[1]=arguwave[79]
     cwave[2]=arguwave[80]
     cwave[3]=arguwave[83]
     cwave[4]=arguwave[84]
     cwave[5]=arguwave[85]
     cwave[6]=arguwave[86]
     cwave[7]=arguwave[87]
     cwave[8]=arguwave[88]
     cwave[9]=arguwave[91]
     cwave[10]=arguwave[92]
     cwave[11]=arguwave[93]
     cwave[12]=arguwave[40]
     cwave[13]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa8cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp9cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw9cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa9cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0","K10>0","K11>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold fourlorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       variable k
       for(k=0;k<14;k+=1)
         Pwave_M10[i][2*k+1]=cwave[k]
         Pwave_M10[i][2*k+2]=W_sigma[k]
       endfor
       Pwave_M10[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M10:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M10:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp6_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp7_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp8_fep
        flag3=V_value
        controlinfo/w=emdcfitpanel mp9_fep
        variable flag4=V_value
        if(flag1+flag2+flag3+flag4>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M10[i][1]-Pwave_M10[i-1][1])*flag1+(Pwave_M10[i][7]-Pwave_M10[i-1][7])*flag2+(Pwave_M10[i][13]-Pwave_M10[i-1][13])*flag3+(Pwave_M10[i][19]-Pwave_M10[i-1][19])*flag4)/(flag1+flag2+flag3+flag4)
         else
          delta=((Pwave_M10[i][1]-Pwave_M10[i+1][1])*flag1+(Pwave_M10[i][7]-Pwave_M10[i+1][7])*flag2+(Pwave_M10[i][13]-Pwave_M10[i+1][13])*flag3+(Pwave_M10[i][19]-Pwave_M10[i+1][19])*flag4)/(flag1+flag2+flag3+flag4)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
       endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "11.Four Gauss":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M11
     make/o/n=(wavenum, 29) Pwave_M11=0
     make/o/n=14 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[44]
     cwave[4]=arguwave[45]
     cwave[5]=arguwave[46]
     cwave[6]=arguwave[67]
     cwave[7]=arguwave[68]
     cwave[8]=arguwave[69]
     cwave[9]=arguwave[70]
     cwave[10]=arguwave[71]
     cwave[11]=arguwave[72]
     cwave[12]=arguwave[40]
     cwave[13]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa3cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp4cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw4cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa4cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0","K10>0","K11>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold fourgauss, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       for(k=0;k<14;k+=1)
         Pwave_M11[i][2*k+1]=cwave[k]
         Pwave_M11[i][2*k+2]=W_sigma[k]
       endfor
       Pwave_M11[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M11:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M11:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp2_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp3_fep
        flag3=V_value
        controlinfo/w=emdcfitpanel mp4_fep
        flag4=V_value
        if(flag1+flag2+flag3+flag4>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M11[i][1]-Pwave_M11[i-1][1])*flag1+(Pwave_M11[i][7]-Pwave_M11[i-1][7])*flag2+(Pwave_M11[i][13]-Pwave_M11[i-1][13])*flag3+(Pwave_M11[i][19]-Pwave_M11[i-1][19])*flag4)/(flag1+flag2+flag3+flag4)
         else
          delta=((Pwave_M11[i][1]-Pwave_M11[i+1][1])*flag1+(Pwave_M11[i][7]-Pwave_M11[i+1][7])*flag2+(Pwave_M11[i][13]-Pwave_M11[i+1][13])*flag3+(Pwave_M11[i][19]-Pwave_M11[i+1][19])*flag4)/(flag1+flag2+flag3+flag4)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
       endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   case "12.Two Gauss+Two Lorentz":
     foldername="fit_"+nameofwave(wavname)
     newdatafolder/s/o $foldername
     newdatafolder/o fitwaves_M12
     make/o/n=(wavenum, 29) Pwave_M12=0
     make/o/n=14 cwave
     cwave[0]=arguwave[37]
     cwave[1]=arguwave[38]
     cwave[2]=arguwave[39]
     cwave[3]=arguwave[44]
     cwave[4]=arguwave[45]
     cwave[5]=arguwave[46]
     cwave[6]=arguwave[78]
     cwave[7]=arguwave[79]
     cwave[8]=arguwave[80]
     cwave[9]=arguwave[83]
     cwave[10]=arguwave[84]
     cwave[11]=arguwave[85]
     cwave[12]=arguwave[40]
     cwave[13]=arguwave[41]
     Hold=""
     controlinfo/w=emdcfitpanel pp1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa1cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa2cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa6cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pp7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pw7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel pa7cb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel slopecb_fep
     hold+=num2str(V_value)
     controlinfo/w=emdcfitpanel constcb_fep
     hold+=num2str(V_value)
     dowindow/k fitemdcresult
     controlinfo/w=emdcfitpanel dis_fep
     if(V_value==1) 
       display
     endif
     for(i=snum-1;(i>=lownum-1 && i<highnum);i+=step)
       sname="C"+num2str(i)
       make/o/n=(dimsize(wavname,0)) $sname
       wave tempname=$sname
       tempname[]=wavname[p][i]
       setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), tempname
       make/o/t C_constraint={"K1>0","K2>0","K4>0","K5>0","K7>0","K8>0","K10>0","K11>0"}
       funcfit/l=(dimsize(wavname,0))/h=Hold twogauss_twolorentz, cwave, tempname(fitstart,fitend) /d/c=C_constraint
       wave fitname=$("fit_"+sname)
       wave W_sigma
       for(k=0;k<14;k+=1)
         Pwave_M12[i][2*k+1]=cwave[k]
         Pwave_M12[i][2*k+2]=W_sigma[k]
       endfor
       Pwave_M12[i][0]=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       duplicate/o fitname, $(":fitwaves_M12:fit_"+sname)
       killwaves fitname
       controlinfo/w=emdcfitpanel dis_fep
       if(V_value==1) 
        appendtograph wavname[][i]
        if(abs(i-snum+1)>0)
         modifygraph offset($(nameofwave(wavname)+"#"+num2str(abs(i-snum+1))))={0,(i-lownum+1)*arguwave[34]}
        else
         modifygraph offset($(nameofwave(wavname)))={0,(i-lownum+1)*arguwave[34]}
        endif
        appendtograph $(":fitwaves_M12:fit_"+sname)
        modifygraph  rgb($("fit_"+sname))=(0,0,65280),offset($("fit_"+sname))={0,(i-lownum+1)*arguwave[34]}
       endif
       if(abs(i-snum+1)>0)
        controlinfo/w=emdcfitpanel mp1_fep
        flag1=V_value
        controlinfo/w=emdcfitpanel mp2_fep
        flag2=V_value
        controlinfo/w=emdcfitpanel mp6_fep
        flag3=V_value
        controlinfo/w=emdcfitpanel mp7_fep
        flag4=V_value
        if(flag1+flag2+flag3+flag4>0)
         controlinfo/w=edcmdcpanel fitdir_cs
         if(V_value==0)
          delta=((Pwave_M12[i][1]-Pwave_M12[i-1][1])*flag1+(Pwave_M12[i][7]-Pwave_M12[i-1][7])*flag2+(Pwave_M12[i][13]-Pwave_M12[i-1][13])*flag3+(Pwave_M12[i][19]-Pwave_M12[i-1][19])*flag4)/(flag1+flag2+flag3+flag4)
         else
          delta=((Pwave_M12[i][1]-Pwave_M12[i+1][1])*flag1+(Pwave_M12[i][7]-Pwave_M12[i+1][7])*flag2+(Pwave_M12[i][13]-Pwave_M12[i+1][13])*flag3+(Pwave_M12[i][19]-Pwave_M12[i+1][19])*flag4)/(flag1+flag2+flag3+flag4)
         endif
        else
         delta=0
        endif
        fitstart+=delta
        fitend+=delta
       endif
       killwaves tempname
       endfor
     killwaves cwave
     killwaves W_sigma
     killwaves C_constraint
     break
   default:
     break
   endswitch
end
  
function showfitresult(ctrlname): buttoncontrol
   string ctrlname
   variable popnum
   execute "Createbrowser prompt=\"Select parameter wave\""
   SVAR List=S_BrowserList
   NVAR Flag=V_Flag
   if(Flag==0)
     return -1
   endif
   string name=stringfromlist(0,list)
   wave para=$name
   variable index=strlen(name)-1
   variable method=str2num(name[index])
   controlinfo/w=edcmdcpanel startcurve_cs
   variable snum=V_value-1
   controlinfo/w=edcmdcpanel endcurve_cs
   variable enum=V_value-1
   switch(method)
   case 1:
     variable/g root:globalvar:one
     variable/g root:globalvar:two
     variable/g root:globalvar:three
     variable/g root:globalvar:four
     variable/g root:globalvar:five
     NVAR one=root:globalvar:one
     NVAR two=root:globalvar:two
     NVAR three=root:globalvar:three
     NVAR four=root:globalvar:four
     NVAR five=root:globalvar:five
     newpanel/k=2/n=paraselectpanel/w=(450,250,750,350)
     checkbox one, pos={10,10},title="Position",variable=root:globalvar:one
     checkbox two, pos={80,10},title="Width",variable=root:globalvar:two
     checkbox three, pos={150,10},title="Amplitude",variable=root:globalvar:three
     checkbox four, pos={220,10},title="Slope",variable=root:globalvar:four
     checkbox five, pos={10,35},title="Const",variable=root:globalvar:five
     button confirm, pos={115, 60},size={70,20},title="Confirm",proc=killpanel
     pauseforuser paraselectpanel
     if(one==1)
       display para[snum,enum][1] vs para[snum,enum][0]
       Label left "\\F'Times New Roman'\\Z12Position"
       ErrorBars $nameofwave(para) Y,wave=(para[snum,enum][2],para[snum,enum][2])
       ModifyGraph mode=3,marker=19,msize=2,useMrkStrokeRGB=1
     endif
     if(two==1)
       display para[snum,enum][3] vs para[snum,enum][0]
       Label left "\\F'Times New Roman'\\Z12Width"
       ErrorBars $nameofwave(para) Y,wave=(para[snum,enum][4],para[snum,enum][4])
       ModifyGraph mode=3,marker=19,msize=2,useMrkStrokeRGB=1
     endif
     if(three==1)
       display para[snum,enum][5] vs para[snum,enum][0]
       Label left "\\F'Times New Roman'\\Z12Amplitude"
       ErrorBars $nameofwave(para) Y,wave=(para[snum,enum][6],para[snum,enum][6])
       ModifyGraph mode=3,marker=19,msize=2,useMrkStrokeRGB=1
     endif
     if(four==1)
       display para[snum,enum][7] vs para[snum,enum][0]
       Label left "\\F'Times New Roman'\\Z12Slope"
       ErrorBars $nameofwave(para) Y,wave=(para[snum,enum][8],para[snum,enum][8])
       ModifyGraph mode=3,marker=19,msize=2,useMrkStrokeRGB=1
     endif
     if(five==1)
       display para[snum,enum][9] vs para[snum,enum][0]
       Label left "\\F'Times New Roman'\\Z12Constant"
       ErrorBars $nameofwave(para) Y,wave=(para[snum,enum][10],para[snum,enum][10])
       ModifyGraph mode=3,marker=19,msize=2,useMrkStrokeRGB=1
     endif
     killvariables root:globalvar:one
     killvariables root:globalvar:two
     killvariables root:globalvar:three
     killvariables root:globalvar:four
     killvariables root:globalvar:five
     break
   default:
     break
   endswitch
end

function testemdcfit(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   make/o/n=3000 root:globalvar:emdcfittestwave
   wave testwave=root:globalvar:emdcfittestwave
   setscale/i x, arguwave[42], arguwave[43], testwave
   if(whichlistitem("emdcfittestwave", tracenamelist("singlecurvedisplay",";",1),";")==-1)
     appendtograph/w=singlecurvedisplay testwave
     modifygraph/w=singlecurvedisplay  rgb(emdcfittestwave)=(0,0,65280)
   endif
   controlinfo/w=emdcfitpanel ff_femdc
   switch(V_value)
   case 1:
     testwave=arguwave[41]+(x-arguwave[37])*arguwave[40]+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)
   break
   case 2:
     testwave=arguwave[41]+(x-arguwave[44])*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)
   break
   case 3:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[44])/2)*arguwave[40]+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)+arguwave[46]*exp(-ln(2)*((x-arguwave[44])/arguwave[45])^2)
   break
   case 4:
     testwave=arguwave[41]+(x-(arguwave[78]+arguwave[83])/2)*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[85]/(1+((x-arguwave[83])/arguwave[84])^2)
   break
   case 5:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[78])/2)*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)
   break
   case 6:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[44]+arguwave[67])/3)*arguwave[40]+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)+arguwave[46]*exp(-ln(2)*((x-arguwave[44])/arguwave[45])^2)+arguwave[69]*exp(-ln(2)*((x-arguwave[67])/arguwave[68])^2)
   break
   case 7:
     testwave=arguwave[41]+(x-(arguwave[78]+arguwave[83]+arguwave[86])/3)*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[85]/(1+((x-arguwave[83])/arguwave[84])^2)+arguwave[88]/(1+((x-arguwave[86])/arguwave[87])^2)
   break
   case 8:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[78]+arguwave[83])/3)*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[85]/(1+((x-arguwave[83])/arguwave[84])^2)+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)
   break
   case 9:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[44]+arguwave[78])/3)*arguwave[40]+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)+arguwave[46]*exp(-ln(2)*((x-arguwave[44])/arguwave[45])^2)
   break
   case 10:
     testwave=arguwave[41]+(x-(arguwave[78]+arguwave[83]+arguwave[86]+arguwave[91])/4)*arguwave[40]+arguwave[93]/(1+((x-arguwave[91])/arguwave[92])^2)+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[85]/(1+((x-arguwave[83])/arguwave[84])^2)+arguwave[88]/(1+((x-arguwave[86])/arguwave[87])^2)
   break
   case 11:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[44]+arguwave[67])+arguwave[70]/4)*arguwave[40]+arguwave[72]*exp(-ln(2)*((x-arguwave[70])/arguwave[71])^2)+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)+arguwave[46]*exp(-ln(2)*((x-arguwave[44])/arguwave[45])^2)+arguwave[69]*exp(-ln(2)*((x-arguwave[67])/arguwave[68])^2)
   break
   case 12:
     testwave=arguwave[41]+(x-(arguwave[37]+arguwave[44]+arguwave[78]+arguwave[83])/4)*arguwave[40]+arguwave[39]*exp(-ln(2)*((x-arguwave[37])/arguwave[38])^2)+arguwave[46]*exp(-ln(2)*((x-arguwave[44])/arguwave[45])^2)+arguwave[80]/(1+((x-arguwave[78])/arguwave[79])^2)+arguwave[85]/(1+((x-arguwave[83])/arguwave[84])^2)
   break
   endswitch
end

function showcurve_SV(ctrlname,varnum,varstr,varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave wavname=$currwave[6]
   variable i, offset=arguwave[34]
   string name
   for(i=1;i<dimsize(wavname,1);i+=1)
     name=nameofwave(wavname)+"#"+num2str(i)
     dowindow curvedisplay
     if(V_flag==1)
      modifygraph/w=curvedisplay offset($name)={0,i*offset}
     endif
   endfor
end

function showcurve_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "show_cs":
    dowindow/k Curvedisplay
    showcurve($currwave[6],arguwave[34],"curvedisplay")
    dowindow/f edcmdcpanel
   break
   case "exmc_cs":
    showcurve($currwave[6],arguwave[34],"")
   break
   case "app_cs":
    variable i
    string name
    wave wavname=$currwave[6]
    appendtograph wavname[][0]
    for(i=1;i<dimsize(wavname,1);i+=1)
     appendtograph wavname[][i]
     name=nameofwave(wavname)+"#"+num2str(i)
     modifygraph offset($name)={0,i*arguwave[34]}
    endfor
   break
   default:
   break
   endswitch
end

function showsinglecurve_pum(ctrlname, popnum, popstr):popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave/t currwave=root:globalvar:currwave
   wave wavname=$currwave[6]
   wave tempwave=root:globalvar:singlecurve
   NVAR popup=root:globalvar:popupnum
   SVAR iniv=root:globalvar:inivalue
   SVAR endv=root:globalvar:endvalue
   SVAR currvalue=root:globalvar:currvalue
   currvalue=num2str(dimoffset(wavname,1)+dimdelta(wavname,1)*(popnum-1))
   variable oldpopnum=popup
   popup=popnum
   //popupmenu startcurve_cs, mode=popnum
   //popupmenu endcurve_cs, mode=popnum
   setvariable value_cs, value=currvalue
   dowindow SingleCurvedisplay
   if(V_flag==0)
     tempwave[]=wavname[p][popnum-1]
     display/k=1/n=singlecurvedisplay tempwave
   else
     tempwave[]=wavname[p][popnum-1]
   endif
   dowindow curvedisplay
   if(V_flag==1)
     string tracename
     if(oldpopnum==1)
       tracename=nameofwave(wavname)
     else  
       tracename=nameofwave(wavname)+"#"+num2str(oldpopnum-1)
     endif
     ModifyGraph/w=curvedisplay lsize($tracename)=1,rgb($tracename)=(65280,0,0)
     if(popnum==1)
       tracename=nameofwave(wavname)
     else
       tracename=nameofwave(wavname)+"#"+num2str(popnum-1)
     endif
     ModifyGraph/w=curvedisplay lsize($tracename)=1.5,rgb($tracename)=(0,12800,52224)
   endif
end

function showsinglecurve_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   NVAR popup=root:globalvar:popupnum
   variable temppop=popup
   dowindow singlecurvedisplay
   if(V_flag==1)
   if(cmpstr(ctrlname,"lastc_cs")==0)
     if(temppop==1)
       temppop=dimsize($currwave[6],1)
     else
       temppop-=1
     endif
     showsinglecurve_pum("",temppop,"")
     popupmenu pum_cs, mode=temppop
   else
     if(temppop==dimsize($currwave[6],1))
       temppop=1
     else
       temppop+=1
     endif
     showsinglecurve_pum("",temppop,"")
     popupmenu pum_cs, mode=temppop
   endif
   endif
end
 
function exportcurve_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave tempcurve=root:globalvar:singlecurve
   NVAR popupnum=root:globalvar:popupnum
   string newname=nameofwave($currwave[6])+"_C"+num2str(popupnum-1)
   setdatafolder getwavesdatafolder($currwave[6],1)
   duplicate/o tempcurve $newname
   display $newname
end

function curvelimit_pum(ctrlName,popNum,popStr): popupmenucontrol
   string ctrlname
   variable popNum
   string popStr
   variable snum, enum
   controlinfo/w=edcmdcpanel startcurve_cs
   snum=V_value
   controlinfo/w=edcmdcpanel endcurve_cs
   enum=V_value
   if(enum<snum)
     print "Please choose correct endcurve"
     popupmenu endcurve_cs, mode=snum
   endif
end
     
function sandc_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   NVAR nx=root:globalvar:sandcx
   NVAR ny=root:globalvar:sandcy
   NVAR nz=root:globalvar:sandcz
   NVAR nv=root:globalvar:sandcv
   NVAR shx=root:globalvar:shiftx
   NVAR shy=root:globalvar:shifty
   NVAR shy=root:globalvar:shiftz
   NVAR shv=root:globalvar:shiftv
   variable xtemp=nx
   variable ytemp=ny
   variable ztemp=nz
   variable vtemp=nv
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
      sandc(tempwave, ctrlname)
   else
      variable i
      string newname
      for(i=0;i<itemsinlist(namelist);i+=1)
          nx=xtemp
          ny=ytemp
          nz=ztemp
          nv=vtemp
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          sandc($newname, ctrlname)
      endfor
      controlinfo/w=toolpanel pum_tool
      newname="root:globalvar:"+nameofwave($S_value)
      duplicate/o $newname, tempwave
    endif
end

function sandc(wavname, ctrlname)
   wave wavname
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   NVAR nx=root:globalvar:sandcx
   NVAR ny=root:globalvar:sandcy
   NVAR nz=root:globalvar:sandcz
   NVAR nv=root:globalvar:sandcv
   NVAR shx=root:globalvar:shiftx
   NVAR shy=root:globalvar:shifty
   NVAR shz=root:globalvar:shiftz
   NVAR shv=root:globalvar:shiftv
   strswitch(ctrlname)
   case "xleft_tool":
     setscale/p x, dimoffset(wavname,0)/nx, dimdelta(wavname,0)/nx,wavname
     if(nx>arguwave[24])
       nx-=arguwave[24]
     endif
     setscale/p x, dimoffset(wavname,0)*nx, dimdelta(wavname,0)*nx,wavname
     break
   case "xright_tool":
     setscale/p x, dimoffset(wavname,0)/nx, dimdelta(wavname,0)/nx,wavname
     nx+=arguwave[24]
     setscale/p x, dimoffset(wavname,0)*nx,dimdelta(wavname,0)*nx,wavname
     break
   case "xup_tool":
     setscale/p y, dimoffset(wavname,1)/ny, dimdelta(wavname,1)/ny,wavname
     ny+=arguwave[25]
     setscale/p y, dimoffset(wavname,1)*ny,dimdelta(wavname,1)*ny,wavname
     break
   case "xdown_tool":
     setscale/p y, dimoffset(wavname,1)/ny, dimdelta(wavname,1)/ny,wavname
     if(ny>arguwave[25])
       ny-=arguwave[25]
     endif
     setscale/p y, dimoffset(wavname,1)*ny,dimdelta(wavname,1)*ny,wavname
     break
   case "xzdown_tool":
     setscale/p z, dimoffset(wavname,2)/nz, dimdelta(wavname,2)/nz,wavname
     if(nz>arguwave[66])
      nz-=arguwave[66]
     endif
     setscale/p z, dimoffset(wavname,2)*nz,dimdelta(wavname,2)*nz,wavname
     break
   case "xzup_tool":
     setscale/p z, dimoffset(wavname,2)/nz, dimdelta(wavname,2)/nz,wavname
     nz+=arguwave[66]
     setscale/p z, dimoffset(wavname,2)*nz,dimdelta(wavname,2)*nz,wavname
     break
   case "xbig_tool":
     wavname=(wavname-shv)/nv+shv
     nv+=arguwave[26]
     wavname=(wavname-shv)*nv+shv
     break
   case "xsmall_tool":
     wavname=(wavname-shv)/nv+shv
     if(nv>arguwave[26])
       nv-=arguwave[26]
     endif
     wavname=(wavname-shv)*nv+shv
     break
   endswitch
end

function movegraph(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  NVAR movey=root:globalvar:movey
  NVAR movex=root:globalvar:movex
  variable wavenum=itemsinlist(currwave[3])
  if(wavenum!=2)
    Pause("Error", "")
    return -1
  endif
  wave ywave=$stringfromlist(0, currwave[3])
  wave xwave=$stringfromlist(1, currwave[3])
  variable xdim=wavedims(xwave), ydim=wavedims(ywave)
  if(xdim!=1||ydim!=1)
    Pause("Error", "")
    return -1
  endif
  variable pnumx=dimsize(xwave,0), pnumy=dimsize(ywave,0)
  if(pnumx!=pnumy)
    Pause("Error", "")
    return -1
  endif
  variable dy=arguwave[52], dx=arguwave[53]
  variable i
  strswitch(ctrlname)
   case "yp_tool": 
    for(i=0;i<pnumx;i+=1)
     ywave[i]+=dy
    endfor
    movey+=dy
    break
   case "ym_tool":
    for(i=0;i<pnumx;i+=1)
     ywave[i]-=dy
    endfor
    movey-=dy
    break
   case "xp_tool":
    for(i=0;i<pnumx;i+=1)
     xwave[i]+=dx
    endfor
    movex+=dx
    break
   case "xm_tool":
    for(i=0;i<pnumx;i+=1)
     xwave[i]-=dx
    endfor
    movex-=dx
    break
   default:
    break
   endswitch
end

function rotategraph(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  NVAR grotate=root:globalvar:grotate
  variable wavenum=itemsinlist(currwave[3])
  if(wavenum!=2)
    Pause("Error", "")
    return -1
  endif
  wave ywave=$stringfromlist(0, currwave[3])
  wave xwave=$stringfromlist(1, currwave[3])
  variable xdim=wavedims(xwave), ydim=wavedims(ywave)
  if(xdim!=1||ydim!=1)
    Pause("Error", "")
    return -1
  endif
  variable pnumx=dimsize(xwave,0), pnumy=dimsize(ywave,0)
  if(pnumx!=pnumy)
    Pause("Error", "")
    return -1
  endif
  variable cx=arguwave[49], cy=arguwave[50], angle=arguwave[51]
  variable i
  duplicate/o xwave, tempx_RG
  duplicate/o ywave, tempy_RG
  for(i=0;i<pnumx;i+=1)
    tempx_RG[i]=cx+(xwave[i]-cx)*cos(angle*pi/180)-(ywave[i]-cy)*sin(angle*pi/180)
    tempy_RG[i]=cy+(xwave[i]-cx)*sin(angle*pi/180)+(ywave[i]-cy)*cos(angle*pi/180)
  endfor
  grotate+=angle
  duplicate/o tempx_RG, xwave
  duplicate/o tempy_RG, ywave
  killwaves tempx_RG, tempy_RG
end

function draw(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  SVAR yname=root:globalvar:yname
  SVAR xname=root:globalvar:xname
  controlinfo/w=toolpanel drawwin_tool
  string winn=S_value
  dowindow/f $winn
  graphwavedraw/o/w=$winn $yname, $xname
end

function mapkspace(ctrlname): buttoncontrol
  string ctrlname
  wave/t currwave=root:globalvar:currwave
  wave arguwave=root:globalvar:arguwave
  NVAR disp=root:globalvar:kspacedis
  variable eini=arguwave[10],de=arguwave[31],ea=arguwave[32],num=arguwave[33]
  variable i,e
  string mark="new"
  prompt mark,"Enter one mark"
  doprompt "", mark
  if(V_flag==1)
    return -1
  endif
  for(i=0;i<num;i+=1)
    e=eini-i*de
    kspace($currwave[2],e,ea,disp,i,mark)
  endfor
end

function exportprofile(ctrlname): buttoncontrol
   string ctrlname
   wave xprofile=root:map3d:threed:xprofile
   wave yprofile=root:map3d:threed:yprofile
   wave zprofile=root:map3d:threed:zprofile
   setdatafolder root:Map3D
   string mark="new"
   prompt mark, ""
   doprompt "Enter mark:",mark
   if(V_flag==1)
      return -1
   endif
   string name
   strswitch(ctrlname)
   case "xpro_ks":
       name="Xprofile_"+mark
       duplicate/o xprofile, $name
       display/k=1 $name
   break
   case "ypro_ks":
       name="Yprofile_"+mark
       duplicate/o yprofile, $name
       display/k=1 $name
   break
   case "zpro_ks":
       name="Zprofile_"+mark
       duplicate/o zprofile, $name
       display/k=1 $name
   break
   default:
   break
   endswitch
end

function kspaces(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   NVAR xp=root:map3d:threed:xposition
   NVAR yp=root:map3d:threed:yposition
   NVAR zp=root:map3d:threed:zposition
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave tempz=root:map3d:threed:tempz
   setdatafolder root:Map3D
   string mark="new"
   prompt mark, ""
   doprompt "Enter mark:",mark
   if(V_flag==1)
      return -1
   endif
   string name
   strswitch(ctrlname)
   case "xb_ks":
     name="ZvY_"+mark
     duplicate/o tempx, $name
     NewImage/f/k=1  $name
     ModifyImage $name ctab= {*,*,PlanetEarth256,0}
     ModifyGraph tickUnit(bottom)=1
     Label bottom "\\F'Times New Roman'\\Z10x="+num2str(xp)
     break
   case "yb_ks":
     name="ZvX_"+mark
     duplicate/o tempy, $name
     NewImage/f/k=1  $name
     ModifyImage $name ctab= {*,*,PlanetEarth256,0}
     ModifyGraph tickUnit(bottom)=1
     Label bottom "\\F'Times New Roman'\\Z10y="+num2str(yp)
     break
   case "zb_ks":
     name="XvY_"+mark
     duplicate/o tempz, $name
     NewImage/f/k=1  $name
     ModifyImage $name ctab= {*,*,PlanetEarth256,0}
     ModifyGraph tickUnit(bottom)=1
     Label bottom "\\F'Times New Roman'\\Z10z="+num2str(zp)
     break
   default:
     break
   endswitch
end  

function kspace_cutx(wavname, ypos, average, namestr)
   wave wavname
   variable ypos
   variable average
   string namestr
   setdatafolder root:map3d:
   make/o/n=(dimsize(wavname, 0), dimsize(wavname, 2)) $namestr
   wave temp=$namestr
   setscale/p x, dimoffset(wavname, 0), dimdelta(wavname, 0), temp
   setscale/p y, dimoffset(wavname, 2), dimdelta(wavname, 2), temp
   make/o/n=(dimsize(wavname, 1))  tempwave
   setscale/p x, dimoffset(wavname, 1), dimdelta(wavname, 1), tempwave
   variable i,j
   for(i=0;i<dimsize(wavname, 0);i+=1)
     for(j=0;j<dimsize(wavname, 2);j+=1)
        tempwave[]=wavname[i][p][j]
        temp[i][j]=faverage(tempwave, ypos-average, ypos+average)
     endfor
   endfor
   killwaves tempwave
end

function kspace_cuty(wavname, xpos, average, namestr)
   wave wavname
   variable xpos
   variable average
   string namestr
   setdatafolder root:map3d:
   make/o/n=(dimsize(wavname, 1), dimsize(wavname, 2)) $namestr
   wave temp=$namestr
   setscale/p x, dimoffset(wavname, 1), dimdelta(wavname, 1), temp
   setscale/p y, dimoffset(wavname, 2), dimdelta(wavname, 2), temp
   make/o/n=(dimsize(wavname, 0))  tempwave
   setscale/p x, dimoffset(wavname, 0), dimdelta(wavname, 0), tempwave
   variable i,j
   for(i=0;i<dimsize(wavname, 1);i+=1)
     for(j=0;j<dimsize(wavname, 2);j+=1)
        tempwave[]=wavname[p][i][j]
        temp[i][j]=faverage(tempwave, xpos-average, xpos+average)
     endfor
   endfor
   killwaves tempwave
end

function Saveop(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   strswitch(ctrlname)
   case "save_emdc":
     NVAR tabvalue=root:globalvar:tabvalue
     string origin="root:EDC_MDC:"+nameofwave($currwave[0])+":"+eorm(tabvalue)+"ongraph"
     if(waveexists($origin)==1)
     string mark="new"
     prompt mark, "Enter one mark:"
     doprompt "", mark
     if(V_flag==1)
       return -1
     endif
     setdatafolder $("root:EDC_MDC:"+nameofwave($currwave[0])+":")
     duplicate/o $origin, $(eorm(tabvalue)+"_"+mark)
     //notebook edcmdcpanel#nb1_emdc, text=("\r"+time()+"\tSAVE "+" as: "+"root:EDC_MDC:"+nameofwave($currwave[0])+":"+eorm(tabvalue)+"_"+mark+"     ")
     SVAR namelist=root:globalvar:namelistcs
     SVAR iniv=root:globalvar:inivalue
     SVAR endv=root:globalvar:endvalue
     SVAR currvalue=root:globalvar:currvalue
     NVAR popupnum=root:globalvar:popupnum
     currwave[6]="root:EDC_MDC:"+nameofwave($currwave[0])+":"+eorm(tabvalue)+"_"+mark
     titlebox tb_cs, title=currwave[6]
     setvariable offset_cs, disable=0
     button show_cs, disable=0
     button lastc_cs, disable=0
     button nextc_cs, disable=0
     popupmenu pum_cs, disable=0
     button ex_cs, disable=0
     button fit_cs, disable=0
     button fitp_cs, disable=0
     popupmenu startcurve_cs, disable=0
     popupmenu endcurve_cs, disable=0
     button exmc_cs, disable=0
     setdatafolder $getwavesdatafolder($currwave[6],1)
     iniv=num2str(dimoffset($currwave[6],1))
     endv=num2str(dimoffset($currwave[6],1)+(dimsize($currwave[6],1)-1)*dimdelta($currwave[6],1))
     currvalue=iniv
     namelist=""
     variable i
     for(i=0;i<dimsize($currwave[6],1);i+=1)
       namelist+="Curve "+num2str(i)+";"
     endfor
     popupmenu pum_cs, mode=1
     popupmenu startcurve_cs, mode=1
     popupmenu endcurve_cs, mode=1
     wave wavname=$currwave[6]
     wave tempwave=root:globalvar:singlecurve
     redimension/n=(dimsize($currwave[6],0)) tempwave
     setscale/p x, dimoffset(wavname,0),dimdelta(wavname,0),tempwave
     tempwave[]=wavname[p][0]
     popupnum=1
     endif
     break
   case "save_tool":
     SVAR namelist=root:globalvar:namelisttool
     controlinfo/w=toolpanel tab1_tool
     switch(V_Value)
     case 0:
     case 1:
      wave tempwave1=root:globalvar:tempwave
      controlinfo/w=toolpanel pum_tool
      duplicate/o tempwave1, $stringfromlist(V_value-1, namelist)
      NVAR shx=root:globalvar:shiftx
      NVAR shy=root:globalvar:shifty
      NVAR shv=root:globalvar:shiftv
      NVAR scx=root:globalvar:sandcx
      NVAR scy=root:globalvar:sandcy
      NVAR scv=root:globalvar:sandcv
      shx=0
      shy=0
      shv=0
      scx=1
      scy=1
      scv=1
      controlinfo/w=toolpanel appall_tool
      if(V_value==1)
         for(i=0;i<itemsinlist(namelist);i+=1)
            string newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
            duplicate/o $newname, $stringfromlist(i, namelist)
         endfor
      endif
      break
     case 2:
      if(itemsinlist(namelist)!=2)
        return -1
      endif
      wave oriname0=$("root:globalvar:ytemp")
      wave oriname1=$("root:globalvar:xtemp")
      wave currname0=$stringfromlist(0,namelist)
      wave currname1=$stringfromlist(1,namelist)
      duplicate/o currname0, oriname0
      duplicate/o currname1, oriname1
      NVAR grotate=root:globalvar:grotate
      NVAR movey=root:globalvar:movey
      NVAR movex=root:globalvar:movex
      grotate=0
      movey=0
      movex=0
      break
     default:
      break
     endswitch
     break  
   default:
     break
   endswitch
end     

function copyop(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   strswitch(ctrlname)
   case "copy_tool":
     SVAR namelist=root:globalvar:namelisttool
     controlinfo/w=toolpanel tab1_tool
     switch(v_value)
     case 0:
     case 1:
      wave tempwave=root:globalvar:tempwave
      setdatafolder root:toolsimg
      string mark="new"
      prompt mark, "Enter mark:"
      doprompt "", mark
      if(V_flag==1)
       return -1
      endif
      controlinfo/w=toolpanel appall_tool
      if(V_value==0)
        controlinfo/w=toolpanel pum_tool
        duplicate/o tempwave, $(nameofwave($S_value)+"_"+mark)
      else
        variable i
        for(i=0;i<itemsinlist(namelist);i+=1)
            string originname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
            string newname=nameofwave($stringfromlist(i, namelist))+"_"+mark
            duplicate/o $originname, $newname
        endfor
      endif
     break
     case 2:
      if(itemsinlist(namelist)!=2)
        return -1
      endif
      wave currname0=$stringfromlist(0,namelist)
      wave currname1=$stringfromlist(1,namelist)
      setdatafolder root:toolsimg
      mark="new"
      prompt mark, "Enter mark:"
      doprompt "", mark
      if(V_flag==1)
       return -1
      endif
      duplicate/o currname0, $(nameofwave(currname0)+"_"+mark)
      duplicate/o currname1, $(nameofwave(currname1)+"_"+mark) 
     break
     default:
     break
     endswitch
    break
   default:
    break
   endswitch
end

function reset(ctrlname): buttoncontrol
  string ctrlname
  SVAR namelist=root:globalvar:namelisttool
  if(strlen(namelist)!=0)
  controlinfo/w=toolpanel tab1_tool
  switch(v_value)
  case 0:
  case 1:
   wave tempwave=root:globalvar:tempwave
   controlinfo/w=toolpanel pum_tool
   wave originwave=$stringfromlist(V_Value-1, namelist)
   duplicate/o originwave, tempwave
   NVAR shx=root:globalvar:shiftx
   NVAR shy=root:globalvar:shifty
   NVAR shv=root:globalvar:shiftv
   NVAR scx=root:globalvar:sandcx
   NVAR scy=root:globalvar:sandcy
   NVAR scv=root:globalvar:sandcv
   NVAR imgrotate=root:globalvar:imgrotate
   shx=0
   shy=0
   shv=0
   scx=1
   scy=1
   scv=1
   imgrotate=0
   controlinfo/w=toolpanel appall_tool
   if(V_value==1)
      variable i
      for(i=0;i<itemsinlist(namelist);i+=1)
         string newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
         duplicate/o $stringfromlist(i, namelist), $newname
      endfor
    endif
  break
  case 2:
   if(itemsinlist(namelist)!=2)
     return -1
   endif
   wave currname0=$stringfromlist(0,namelist)
   wave currname1=$stringfromlist(1,namelist)
   wave oriname0=$("root:globalvar:ytemp")
   wave oriname1=$("root:globalvar:xtemp")
   duplicate/o oriname0, currname0
   duplicate/o oriname1, currname1
   NVAR grotate=root:globalvar:grotate
   NVAR movey=root:globalvar:movey
   NVAR movex=root:globalvar:movex
   grotate=0
   movey=0
   movex=0
  break
  endswitch
  endif
end

function app2all(ctrlname, flag): checkboxcontrol
   string ctrlname
   variable flag
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   SVAR namelist=root:globalvar:namelisttool
   if(flag==1)
    variable i
    for(i=0;i<itemsinlist(namelist);i+=1)
      wave originwave=$stringfromlist(i, namelist)
      string newname="root:globalvar:"+nameofwave(originwave)
      duplicate/o originwave, $newname
    endfor
    popupmenu pum_tool, disable=2, win=toolpanel
   else
    popupmenu pum_tool, disable=0, win=toolpanel
   endif
end

function cutwave_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
       controlinfo/w=toolpanel pum_tool
       cutwave($S_value, tempwave)
   else
       variable i
       string newname
       for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          cutwave($stringfromlist(i, namelist), $newname)
       endfor
       controlinfo/w=toolpanel pum_tool
       newname="root:globalvar:"+nameofwave($S_value)
       duplicate/o $newname, tempwave
   endif
end

function cutwave(originwave, cutwave)
   wave originwave, cutwave
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   if(wavedims(originwave)==1)
     duplicate/o/r=(arguwave[27],arguwave[28]) originwave, cutwave
   else
     duplicate/o/r=(arguwave[27],arguwave[28])(arguwave[29],arguwave[30]) originwave, cutwave
   endif
end

function rotateimage_BC(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   NVAR imgrotate=root:globalvar:imgrotate
   variable dang
   if(cmpstr(ctrlname, "CCW_tool")==0)
      dang=imgrotate+arguwave[145]
   else
      dang=imgrotate-arguwave[145]
   endif
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
       controlinfo/w=toolpanel pum_tool
       rotateimage(tempwave, $S_value, arguwave[143], arguwave[144], dang)
   else
       variable i
       string newname
       for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          rotateimage($newname, $stringfromlist(i, namelist), arguwave[143], arguwave[144], dang)
       endfor
       controlinfo/w=toolpanel pum_tool
       newname="root:globalvar:"+nameofwave($S_value)
       duplicate/o $newname, tempwave
   endif
   imgrotate=dang
end

function rotateimage(deswave, scrwave, cx, cy, dang)
   wave deswave
   wave scrwave
   variable cx
   variable cy
   variable dang
   dang=mod(dang, 360)
   variable xmin0=dimoffset(scrwave, 0), xmax0=dimoffset(scrwave, 0)+(dimsize(scrwave,0)-1)*dimdelta(scrwave, 0), ymin0=dimoffset(scrwave, 1), ymax0=dimoffset(scrwave, 1)+(dimsize(scrwave,1)-1)*dimdelta(scrwave, 1)
   make/o/n=4 xtemp, ytemp
   xtemp[0]=cx+(xmin0-cx)*cos(dang*pi/180)-(ymin0-cy)*sin(dang*pi/180)
   xtemp[1]=cx+(xmax0-cx)*cos(dang*pi/180)-(ymin0-cy)*sin(dang*pi/180)
   xtemp[2]=cx+(xmax0-cx)*cos(dang*pi/180)-(ymax0-cy)*sin(dang*pi/180)
   xtemp[3]=cx+(xmin0-cx)*cos(dang*pi/180)-(ymax0-cy)*sin(dang*pi/180)
   ytemp[0]=cy+(xmin0-cx)*sin(dang*pi/180)+(ymin0-cy)*cos(dang*pi/180)
   ytemp[1]=cy+(xmax0-cx)*sin(dang*pi/180)+(ymin0-cy)*cos(dang*pi/180)
   ytemp[2]=cy+(xmax0-cx)*sin(dang*pi/180)+(ymax0-cy)*cos(dang*pi/180)
   ytemp[3]=cy+(xmin0-cx)*sin(dang*pi/180)+(ymax0-cy)*cos(dang*pi/180)
   variable xmin=wavemin(xtemp), xmax=wavemax(xtemp), ymin=wavemin(ytemp), ymax=wavemax(ytemp)
   killwaves xtemp, ytemp
   variable xnum=(xmax-xmin)/dimdelta(scrwave, 0), ynum=(ymax-ymin)/dimdelta(scrwave, 1)
   switch(wavedims(scrwave))
   case 2:
      redimension/n=(xnum, ynum)  deswave
      setscale/i x, xmin, xmax, deswave
      setscale/i y, ymin, ymax, deswave
      deswave=interp2d(scrwave, cx+(x-cx)*cos(dang*pi/180)+(y-cy)*sin(dang*pi/180), cy+(x-cx)*sin(-dang*pi/180)+(y-cy)*cos(dang*pi/180))
    break
    case 3:
      redimension/n=(xnum, ynum, dimsize(deswave, 2))  deswave
      setscale/i x, xmin, xmax, deswave
      setscale/i y, ymin, ymax, deswave
      deswave=interp3d(scrwave, cx+(x-cx)*cos(dang*pi/180)+(y-cy)*sin(dang*pi/180), cy+(x-cx)*sin(-dang*pi/180)+(y-cy)*cos(dang*pi/180), z)
    break
    endswitch
end

function showcurve(wavname, offset, windowsname)
   wave wavname
   variable offset
   string windowsname
   variable i
   string name
   display/k=1/n=$windowsname wavname[][0]
   for(i=1;i<dimsize(wavname,1);i+=1)
     appendtograph wavname[][i]
     name=nameofwave(wavname)+"#"+num2str(i)
     modifygraph offset($name)={0,i*offset}
   endfor
end

function Pause(info, ctrlwin)
  string info
  string ctrlwin
  newpanel/N=ErrorMessage/k=2/W=(550,250,750,370)
  drawtext 10,20,info
  Button killpause,pos={65,48},size={70,25},title="Continue",font="Times New Roman"
  Button killpause,proc=killpanel_button
  //if(strlen(ctrlwin)>0)
   //autopositionwindow/E/M=0/r=$ctrlwin
   //dowindow/f $ctrlwin
  //endif
  pauseforuser ErrorMessage
end  

function flipimg(wavname)  
  wave wavname
  if(wavedims(wavname)==2)
    matrixtranspose wavname
  endif
  if(wavedims(wavname)==3)
    make/n=(dimsize(wavname,1), dimsize(wavname,0), dimsize(wavname,2))/o temp_f
    temp_f[][][]=wavname[q][p][r]
    setscale/p x, dimoffset(wavname,1), dimdelta(wavname, 1), temp_f
    setscale/p y, dimoffset(wavname,0), dimdelta(wavname, 0), temp_f
    setscale/p z, dimoffset(wavname,2), dimdelta(wavname, 2), temp_f
    duplicate/o temp_f, wavname
    killwaves temp_f
  endif
end

function average(wavname, direction, startp, endp)
   wave wavname
   string direction
   variable startp, endp
   if(cmpstr(direction,"x")==0)
     string newname=nameofwave(wavname)+"_xave"
     make/o/n=(dimsize(wavname,1)) $newname
     make/o/n=(dimsize(wavname,0)) temp
     wave newwave=$newname
     setscale/p x, dimoffset(wavname,1), dimdelta(wavname,1), newwave
     setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), temp
     variable i
     for(i=0;i<dimsize(wavname,1);i+=1)
        temp[]=wavname[p][i]
        newwave[i]=faverage(temp, startp, endp)
     endfor
     killwaves temp
     display/k=1 $newname
   else
     newname=nameofwave(wavname)+"_yave"
     make/o/n=(dimsize(wavname,0)) $newname
     make/o/n=(dimsize(wavname,1)) temp
     wave newwave=$newname
     setscale/p x, dimoffset(wavname,0), dimdelta(wavname,0), newwave
     setscale/p x, dimoffset(wavname,1), dimdelta(wavname,1), temp
     for(i=0;i<dimsize(wavname,0);i+=1)
        temp[]=wavname[i][p]
        newwave[i]=faverage(temp, startp, endp)
     endfor
     killwaves temp
     display/k=1 $newname
   endif
end

function flipimg_BC(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
      flipimg(tempwave)
   else
      variable i
      string newname
      for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          flipimg($newname)
      endfor
      controlinfo/w=toolpanel pum_tool
      newname="root:globalvar:"+nameofwave($S_value)
      duplicate/o $newname, tempwave
   endif
end

function flipxy_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
      flipxy(tempwave, ctrlname)
   else
      variable i
      string newname
      for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          flipxy($newname, ctrlname)
      endfor
      controlinfo/w=toolpanel pum_tool
      newname="root:globalvar:"+nameofwave($S_value)
      duplicate/o $newname, tempwave
    endif
end

function flipxy(wavname, ctrlname)
   wave wavname
   string ctrlname
   duplicate/o wavname, root:globalvar:flipxytemp
   wave flipxytemp=root:globalvar:flipxytemp
   variable dim,i
   if(wavedims(wavname)==2)
   if(cmpstr(ctrlname,"flipx_tool")==0)
     dim=dimsize(wavname,0)
     for(i=0;i<dim;i+=1)
       wavname[i][]=flipxytemp[dim-i-1][q]
     endfor
   else 
     dim=dimsize(wavname,1)
     for(i=0;i<dim;i+=1)
       wavname[][i]=flipxytemp[p][dim-i-1]
     endfor
   endif
   killwaves flipxytemp
   endif
end

function oppositexy_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
      oppositexy(tempwave, ctrlname)
   else
      variable i
      string newname
      for(i=0;i<itemsinlist(namelist);i+=1)
          newname="root:globalvar:"+nameofwave($stringfromlist(i, namelist))
          oppositexy($newname, ctrlname)
      endfor
      controlinfo/w=toolpanel pum_tool
      newname="root:globalvar:"+nameofwave($S_value)
      duplicate/o $newname, tempwave
    endif
end

function oppositexy(wavname, ctrlname)
    wave wavname
    string ctrlname
    variable x0, xn
    if(wavedims(wavname)==2)
     if(cmpstr(ctrlname,"oppositex_tool")==0)
      x0=dimoffset(wavname,0)
      xn=x0+(dimsize(wavname,0)-1)*dimdelta(wavname,0)
      setscale/i x, -xn, -x0, wavname
     else 
      x0=dimoffset(wavname,1)
      xn=x0+(dimsize(wavname,1)-1)*dimdelta(wavname,1)
      setscale/i y, -xn, -x0, wavname
     endif
    endif
end

function flip3d_button(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   if(wavedims(tempwave)==3)
     strswitch(ctrlname)
     case "flip3dx_tool":
        make/n=(dimsize(tempwave, 1), dimsize(tempwave, 2), dimsize(tempwave,0))/o  temp_f
        temp_f[][][]=tempwave[r][p][q]
        setscale/p x, dimoffset(tempwave,1), dimdelta(tempwave, 1), temp_f
        setscale/p y, dimoffset(tempwave,2), dimdelta(tempwave, 2), temp_f
        setscale/p z, dimoffset(tempwave,0), dimdelta(tempwave, 0), temp_f
        duplicate/o temp_f, tempwave
        killwaves temp_f
     break
     case "flip3dy_tool":
        make/n=(dimsize(tempwave, 2), dimsize(tempwave, 0), dimsize(tempwave,1))/o  temp_f
        temp_f[][][]=tempwave[q][r][p]
        setscale/p x, dimoffset(tempwave,2), dimdelta(tempwave, 2), temp_f
        setscale/p y, dimoffset(tempwave,0), dimdelta(tempwave, 0), temp_f
        setscale/p z, dimoffset(tempwave,1), dimdelta(tempwave, 1), temp_f
        duplicate/o temp_f, tempwave
        killwaves temp_f
     break
     endswitch
   endif
end
   
function averageimg_pum(ctrlName,popNum,popStr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   controlinfo/w=toolpanel pum_tool
   wave tempwave=$(S_value)
   setdatafolder root:toolsimg:
   if(popnum==2)
     average(tempwave,"x",arguwave[121], arguwave[122])
   else
     average(tempwave,"y",arguwave[121], arguwave[122])
   endif
end

function dispersion_pum(ctrlname,popnum,popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   controlinfo/w=toolpanel pum_tool
   wave wavname=$(S_value)
   setdatafolder root:toolsimg:
   string mark="new"
   prompt mark,""
   doprompt "Enter the mark",mark
   if(V_flag==1)
     return -1
   endif
   variable i
   switch(popnum)
   case 1:
     string newname="root:toolsimg:"+nameofwave(wavname)+"_2ndD_EDC_"+mark
     duplicate/o wavname, $newname
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=0 arguwave[117], newwave
     endif
     differentiate/dim=0 newwave
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=0 arguwave[118], newwave
     endif
     differentiate/dim=0 newwave
   break
   case 2:
    if(wavedims(wavname)==2)
     newname="root:toolsimg:"+nameofwave(wavname)+"_2ndD_MDC_"+mark
     duplicate/o wavname, $newname
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=1 arguwave[117], newwave
     endif
     differentiate/dim=1 newwave
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=1 arguwave[118], newwave
     endif
     differentiate/dim=1 newwave
    endif
   break
   case 3:
     newname="root:toolsimg:"+nameofwave(wavname)+"_Curv_EDC_"+mark
     duplicate/o wavname, $newname
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=0 arguwave[117], newwave
     endif
     differentiate/dim=0 newwave
     duplicate/o newwave, temp1stD
     duplicate/o temp1stD, temp
     temp=abs(temp)
     variable tempmax=wavemax(temp)
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=0 arguwave[118], newwave
     endif
     differentiate/dim=0 newwave
     newwave[][]=newwave[p][q]/(arguwave[119]*(tempmax)^2+(temp1stD[p][q])^2)^(3/2)
     killwaves temp1stD,temp
   break
   case 4:
    if(wavedims(wavname)==2)
     newname="root:toolsimg:"+nameofwave(wavname)+"_Curv_MDC_"+mark
     duplicate/o wavname, $newname
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=1 arguwave[117], newwave
     endif
     differentiate/dim=1 newwave
     duplicate/o newwave, temp1stD
     duplicate/o temp1stD, temp
     temp=abs(temp)
     tempmax=wavemax(temp)
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=1 arguwave[118], newwave
     endif
     differentiate/dim=1 newwave
     newwave[][]=newwave[p][q]/(arguwave[119]*(tempmax)^2+(temp1stD[p][q])^2)^(3/2)
     killwaves temp1stD,temp
    endif
   break
   case 5:
    if(wavedims(wavname)==2)
     newname="root:toolsimg:"+nameofwave(wavname)+"_2D_Curv_map_"+mark
     duplicate/o wavname, $newname
     duplicate/o wavname, temp1stDx
     duplicate/o wavname, temp1stDy
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=0 arguwave[117], temp1stDx
       smooth/B/EVEN/dim=1 arguwave[117], temp1stDy
     endif
     differentiate/dim=0 temp1stDx
     differentiate/dim=1 temp1stDy
     duplicate/o temp1stDx, tempx
     duplicate/o temp1stDy, tempy
     tempx=abs(tempx)
     tempy=abs(tempy)
     variable tempxmax=wavemax(tempx)
     variable tempymax=wavemax(tempy)
     tempmax=max(tempxmax, tempymax)
     duplicate/o temp1stDx, temp2ndDx
     duplicate/o temp1stDy, temp2ndDy
     duplicate/o temp1stDx, temp2ndDxy
     duplicate/o temp1stDy, temp2ndDxy0
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=0 arguwave[118], temp2ndDx
       smooth/B/EVEN/dim=1 arguwave[118], temp2ndDy
       smooth/B/EVEN/dim=1 arguwave[118], temp2ndDxy
       smooth/B/EVEN/dim=0 arguwave[118], temp2ndDxy0
     endif
     differentiate/dim=0 temp2ndDx
     differentiate/dim=1 temp2ndDy
     differentiate/dim=1 temp2ndDxy
     differentiate/dim=0 temp2ndDxy0
     temp2ndDxy=(temp2ndDxy+temp2ndDxy0)/2
     variable C=arguwave[119]*tempmax
     newwave=((C+(temp1stDx)^2)*temp2ndDy-2*temp1stDx*temp1stDy*temp2ndDxy+(C+(temp1stDy)^2)*temp2ndDx)/(C+(temp1stDx)^2+(temp1stDy)^2)^(3/2)
     killwaves temp1stDx,temp1stDy, tempx, tempy, temp2ndDx, temp2ndDy, temp2ndDxy, temp2ndDxy0
    endif
   break
   case 6:
    if(wavedims(wavname)==2)
     newname="root:toolsimg:"+nameofwave(wavname)+"_2D_Curv_spec_"+mark
     duplicate/o wavname, $newname
     duplicate/o wavname, temp1stDx
     duplicate/o wavname, temp1stDy
     wave newwave=$newname
     if(arguwave[117]!=0)
       smooth/B/EVEN/dim=0 arguwave[117], temp1stDx
       smooth/B/EVEN/dim=1 arguwave[117], temp1stDy
     endif
     differentiate/dim=0 temp1stDx
     differentiate/dim=1 temp1stDy
     duplicate/o temp1stDx, tempx
     duplicate/o temp1stDy, tempy
     tempx=abs(tempx)
     tempy=abs(tempy)
     tempxmax=wavemax(tempx)
     tempymax=wavemax(tempy)
     duplicate/o temp1stDx, temp2ndDx
     duplicate/o temp1stDy, temp2ndDy
     duplicate/o temp1stDx, temp2ndDxy
     duplicate/o temp1stDy, temp2ndDxy0
     if(arguwave[118]!=0)
       smooth/B/EVEN/dim=0 arguwave[118], temp2ndDx
       smooth/B/EVEN/dim=1 arguwave[118], temp2ndDy
       smooth/B/EVEN/dim=1 arguwave[118], temp2ndDxy
       smooth/B/EVEN/dim=0 arguwave[118], temp2ndDxy0
     endif
     differentiate/dim=0 temp2ndDx
     differentiate/dim=1 temp2ndDy
     differentiate/dim=1 temp2ndDxy
     differentiate/dim=0 temp2ndDxy0
     temp2ndDxy=(temp2ndDxy+temp2ndDxy0)/2
     variable Cx=arguwave[119]*tempxmax
     variable Cy=arguwave[112]*tempymax
     newwave=((1+(temp1stDx)^2/Cx)*temp2ndDy/Cy-2*temp1stDx*temp1stDy*temp2ndDxy/Cx/Cy+(1+(temp1stDy)^2/Cy)*temp2ndDx/Cx)/(1+(temp1stDx)^2/Cx+(temp1stDy)^2/Cy)^(3/2)
     killwaves temp1stDx,temp1stDy, tempx, tempy, temp2ndDx, temp2ndDy, temp2ndDxy, temp2ndDxy0
    endif
   endswitch
end

function enhance(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   if(wavedims(tempwave)==2)
     variable periodx=2*(arguwave[139]-arguwave[138])
     variable periody=2*(arguwave[141]-arguwave[140])
     tempwave[scale2pnt(tempwave,arguwave[138], 0), scale2pnt(tempwave, arguwave[139], 0)][scale2pnt(tempwave,arguwave[140],1), scale2pnt(tempwave, arguwave[141], 1)]*=1+arguwave[142]*(sin((pnt2scale(tempwave, p, 0)-arguwave[138])/periodx*2*pi))^2*(sin((pnt2scale(tempwave, q, 1)-arguwave[140])/periody*2*pi))^2
   endif
end

function angtok_BC(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   controlinfo/w=toolpanel appall_tool
   if(V_value==0)
     controlinfo/w=toolpanel pum_tool
     angtok($S_value, arguwave[6], "root:toolsimg:")
     NewImage/f/k=1  $(nameofwave($S_value)+"_k")
     ModifyImage $(nameofwave($S_value)+"_k") ctab= {*,*,PlanetEarth256,0}
   else
     variable i
     for(i=0;i<itemsinlist(namelist);i+=1)
         angtok($stringfromlist(i, namelist), arguwave[6], "root:toolsimg:")
     endfor
   endif
end

function angtok3d_BC(ctrlname): buttoncontrol
   string ctrlname
   wave arguwave=root:globalvar:arguwave
   setdatafolder root:toolsimg:
   controlinfo/w=toolpanel pum_tool
   string wavname=S_value
    if(wavedims($wavname)==3)
      strswitch(ctrlname)
      case "thetak3d_tool":
        controlinfo/w=toolpanel accurate_tool
        if(V_Value==0)
          Thetakspace($wavname, arguwave[120], arguwave[6])
        else
          Thetakspace_accurate($wavname, arguwave[120], arguwave[6], arguwave[57])
        endif
      break
      case "azik3d_tool":
        Azimuthkspace($wavname, arguwave[120], arguwave[6])
      break
      endswitch
    else
      return -1
    endif
end

function jigsaw2d_pum(ctrlname,popnum,popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   setdatafolder root:toolsimg:
   string namestr,mark="new"
   prompt mark,""
   doprompt "Enter the mark",mark
   if(V_flag==1)
     return -1
   endif
   namestr="J2d_"+mark
   make/o/n=(100,100) $namestr
   wave wavname=$namestr
   variable i
   duplicate/o $stringfromlist(0, namelist), tempjoint
   for(i=1;i<itemsinlist(namelist);i+=1)
     jigsaw2d(tempjoint, $stringfromlist(i, namelist), wavname, popnum)
     duplicate/o wavname, tempjoint
   endfor
   killwaves tempjoint
end

function jigsaw2d(wave_a, wave_b, wavef, flag)
   wave wave_a, wave_b, wavef
   variable flag
   if((wavedims(wave_a)==2)&&(wavedims(wave_b)==2))
     variable a,b,c,d,i,j
     variable min1,max1,min2,max2
     switch(flag)
     case 1:
       min1=min(dimoffset(wave_a,1), dimoffset(wave_a,1)+(dimsize(wave_a,1)-1)*dimdelta(wave_a,1))
       max1=max(dimoffset(wave_a,1), dimoffset(wave_a,1)+(dimsize(wave_a,1)-1)*dimdelta(wave_a,1))
       min2=min(dimoffset(wave_b,1), dimoffset(wave_b,1)+(dimsize(wave_b,1)-1)*dimdelta(wave_b,1))
       max2=max(dimoffset(wave_b,1), dimoffset(wave_b,1)+(dimsize(wave_b,1)-1)*dimdelta(wave_b,1))
       if(min1<min2)
         a=min1
         b=min2
         c=max1
         d=max2
         wave wave1=wave_a
         wave wave2=wave_b
       else
         b=min1
         a=min2
         d=max1
         c=max2
         wave wave1=wave_b
         wave wave2=wave_a
       endif
       redimension/n=((dimsize(wave1,0)+dimsize(wave2,0))/2,(d-a)*2/(dimdelta(wave1,1)+dimdelta(wave2,1))) wavef
       setscale/p x, dimoffset(wave1,0), dimdelta(wave1,0), wavef
       setscale/i y, a, d, wavef
       for(i=0;i<round((b-dimoffset(wavef,1))/dimdelta(wavef,1));i+=1)
        wavef[][i]=wave1[p][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave1,1))/dimdelta(wave1,1)]
       endfor
       for(i=round((c-dimoffset(wavef,1))/dimdelta(wavef,1));i<round((d-dimoffset(wavef,1))/dimdelta(wavef,1));i+=1)
        wavef[][i]=wave2[p][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave2,1))/dimdelta(wave2,1)]
       endfor
       for(i=round((b-dimoffset(wavef,1))/dimdelta(wavef,1));i<round((c-dimoffset(wavef,1))/dimdelta(wavef,1));i+=1)
        for(j=0;j<dimsize(wavef,0);j+=1)
        if((numtype(wave1[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave1,1))/dimdelta(wave1,1)])!=2)&&(numtype(wave2[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave2,1))/dimdelta(wave2,1)])!=2))
         wavef[j][i]=wave1[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave1,1))/dimdelta(wave1,1)]*(c-dimoffset(wavef,1)-i*dimdelta(wavef,1))/(c-b)+wave2[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave2,1))/dimdelta(wave2,1)]*(dimoffset(wavef,1)+i*dimdelta(wavef,1)-b)/(c-b)
        else
         if(numtype(wave1[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave1,1))/dimdelta(wave1,1)])==2)
           wavef[j][i]=wave2[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave2,1))/dimdelta(wave2,1)]
         else
           wavef[j][i]=wave1[j][(dimoffset(wavef,1)+i*dimdelta(wavef,1)-dimoffset(wave1,1))/dimdelta(wave1,1)]
         endif
        endif
        endfor
       endfor
     break
     case 2:
       min1=min(dimoffset(wave_a,0), dimoffset(wave_a,0)+(dimsize(wave_a,0)-1)*dimdelta(wave_a,0))
       max1=max(dimoffset(wave_a,0), dimoffset(wave_a,0)+(dimsize(wave_a,0)-1)*dimdelta(wave_a,0))
       min2=min(dimoffset(wave_b,0), dimoffset(wave_b,0)+(dimsize(wave_b,0)-1)*dimdelta(wave_b,0))
       max2=max(dimoffset(wave_b,0), dimoffset(wave_b,0)+(dimsize(wave_b,0)-1)*dimdelta(wave_b,0))
       if(min1<min2)
         a=min1
         b=min2
         c=max1
         d=max2
         wave wave1=wave_a
         wave wave2=wave_b
       else
         b=min1
         a=min2
         d=max1
         c=max2
         wave wave1=wave_b
         wave wave2=wave_a
       endif
       redimension/n=((d-a)*2/(dimdelta(wave1,0)+dimdelta(wave2,0)),(dimsize(wave1,1)+dimsize(wave2,1))/2) wavef
       setscale/p y, dimoffset(wave1,1), dimdelta(wave1,1), wavef
       setscale/i x, a, d, wavef
       for(i=0;i<round((b-dimoffset(wavef,0))/dimdelta(wavef,0));i+=1)
        wavef[i][]=wave1[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave1,0))/dimdelta(wave1,0)][q]
       endfor
       for(i=round((c-dimoffset(wavef,0))/dimdelta(wavef,0));i<round((d-dimoffset(wavef,0))/dimdelta(wavef,0));i+=1)
        wavef[i][]=wave2[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave2,0))/dimdelta(wave2,0)][q]
       endfor
       for(i=round((b-dimoffset(wavef,0))/dimdelta(wavef,0));i<round((c-dimoffset(wavef,0))/dimdelta(wavef,0));i+=1)
        for(j=0;j<dimsize(wavef, 1);j+=1)
        if((numtype(wave1[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave1,0))/dimdelta(wave1,0)][j])!=2)&&(numtype(wave2[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave2,0))/dimdelta(wave2,0)][j])!=2))
         wavef[i][j]=wave1[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave1,0))/dimdelta(wave1,0)][j]*(c-dimoffset(wavef,0)-i*dimdelta(wavef,0))/(c-b)+wave2[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave2,0))/dimdelta(wave2,0)][j]*(dimoffset(wavef,0)+i*dimdelta(wavef,0)-b)/(c-b)
        else
         if(numtype(wave1[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave1,0))/dimdelta(wave1,0)][j])==2)
           wavef[i][j]=wave2[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave2,0))/dimdelta(wave2,0)][j]
         else
           wavef[i][j]=wave1[(dimoffset(wavef,0)+i*dimdelta(wavef,0)-dimoffset(wave1,0))/dimdelta(wave1,0)][j]
         endif
        endif
        endfor
       endfor
     break
     endswitch
   endif
end

function jigsaw3d_pum(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave arguwave=root:globalvar:arguwave
   wave tempwave=root:globalvar:tempwave
   SVAR namelist=root:globalvar:namelisttool
   setdatafolder root:toolsimg:
   string namestr,mark="new"
   prompt mark,""
   doprompt "Enter the mark",mark
   if(V_flag==1)
     return -1
   endif
   namestr="J3d_"+mark
   make/o/n=(100,100,100) $namestr
   wave wavname=$namestr
   variable i
   duplicate/o $stringfromlist(0, namelist), tempjoint
   for(i=1;i<itemsinlist(namelist);i+=1)
     jigsaw3d(tempjoint, $stringfromlist(i, namelist), wavname, popnum)
     duplicate/o wavname, tempjoint
   endfor
   killwaves tempjoint
end

function jigsaw3d(wave_a, wave_b, wavef, flag)
   wave wave_a
   wave wave_b
   wave wavef
   variable flag
   if((wavedims(wave_a)==3)&&(wavedims(wave_b)==3))
   variable a,b,c,d,i,j,k
   variable min1,max1,min2,max2
   switch(flag)
   case 1:
      min1=min(dimoffset(wave_a,0), dimoffset(wave_a,0)+(dimsize(wave_a,0)-1)*dimdelta(wave_a,0))
      max1=max(dimoffset(wave_a,0), dimoffset(wave_a,0)+(dimsize(wave_a,0)-1)*dimdelta(wave_a,0))
      min2=min(dimoffset(wave_b,0), dimoffset(wave_b,0)+(dimsize(wave_b,0)-1)*dimdelta(wave_b,0))
      max2=max(dimoffset(wave_b,0), dimoffset(wave_b,0)+(dimsize(wave_b,0)-1)*dimdelta(wave_b,0))
      if(min1<min2)
        a=min1
        b=min2
        c=max1
        d=max2
        wave wave1=wave_a
        wave wave2=wave_b
      else
        b=min1
        a=min2
        d=max1
        c=max2
        wave wave1=wave_b
        wave wave2=wave_a
      endif
      redimension/n=((d-a)*2/(dimdelta(wave1,0)+dimdelta(wave2,0)), (dimsize(wave1,1)+dimsize(wave2,1))/2, (dimsize(wave1,2)+dimsize(wave2,2))/2) wavef
      setscale/i x, a, d, wavef
      setscale/p y, dimoffset(wave1, 1), dimdelta(wave1, 1), wavef
      setscale/p z, dimoffset(wave1, 2), dimdelta(wave1, 2), wavef
      for(i=0;i<scale2pnt(wavef, b, 0);i+=1)
        wavef[i][][]=wave1[scale2pnt(wave1, pnt2scale(wavef, i, 0), 0)][q][r]
      endfor
      for(i=scale2pnt(wavef, c, 0);i<scale2pnt(wavef, d, 0);i+=1)
        wavef[i][][]=wave2[scale2pnt(wave2, pnt2scale(wavef, i, 0), 0)][q][r]
      endfor
      for(i=scale2pnt(wavef, b, 0);i<scale2pnt(wavef, c, 0);i+=1)
       for(j=0;j<dimsize(wavef, 1);j+=1)
       for(k=0;k<dimsize(wavef, 2);k+=1)
        if(numtype(wave1[scale2pnt(wave1, pnt2scale(wavef, i, 0), 0)][j][k])==2)
          wavef[i][j][k]=wave2[scale2pnt(wave2, pnt2scale(wavef, i, 0), 0)][j][k]
        else
          if(numtype(wave2[scale2pnt(wave2, pnt2scale(wavef, i, 0), 0)][j][k])==2)
            wavef[i][j][k]=wave1[scale2pnt(wave1, pnt2scale(wavef, i, 0), 0)][j][k]
          else 
            wavef[i][j][k]=wave1[scale2pnt(wave1, pnt2scale(wavef, i, 0), 0)][j][k]*(c-pnt2scale(wavef, i, 0))/(c-b)+wave2[scale2pnt(wave2, pnt2scale(wavef, i, 0), 0)][j][k]*(pnt2scale(wavef, i, 0)-b)/(c-b)
          endif
        endif
       endfor
       endfor
      endfor
   break
   case 2:
      min1=min(dimoffset(wave_a,1), dimoffset(wave_a,1)+(dimsize(wave_a,1)-1)*dimdelta(wave_a,1))
      max1=max(dimoffset(wave_a,1), dimoffset(wave_a,1)+(dimsize(wave_a,1)-1)*dimdelta(wave_a,1))
      min2=min(dimoffset(wave_b,1), dimoffset(wave_b,1)+(dimsize(wave_b,1)-1)*dimdelta(wave_b,1))
      max2=max(dimoffset(wave_b,1), dimoffset(wave_b,1)+(dimsize(wave_b,1)-1)*dimdelta(wave_b,1))
      if(min1<min2)
        a=min1
        b=min2
        c=max1
        d=max2
        wave wave1=wave_a
        wave wave2=wave_b
      else
        b=min1
        a=min2
        d=max1
        c=max2
        wave wave1=wave_b
        wave wave2=wave_a
      endif
      redimension/n=((dimsize(wave1,0)+dimsize(wave2,0))/2, (d-a)*2/(dimdelta(wave1,1)+dimdelta(wave2,1)), (dimsize(wave1,2)+dimsize(wave2,2))/2) wavef
      setscale/p x, dimoffset(wave1, 0), dimdelta(wave1, 0), wavef
      setscale/i y, a, d, wavef
      setscale/p z, dimoffset(wave1, 2), dimdelta(wave1, 2), wavef
      for(i=0;i<scale2pnt(wavef, b, 1);i+=1)
        wavef[][i][]=wave1[p][scale2pnt(wave1, pnt2scale(wavef, i, 1), 1)][r]
      endfor
      for(i=scale2pnt(wavef, c, 1);i<scale2pnt(wavef, d, 1);i+=1)
        wavef[][i][]=wave2[p][scale2pnt(wave2, pnt2scale(wavef, i, 1), 1)][r]
      endfor
      for(j=scale2pnt(wavef, b, 1);j<scale2pnt(wavef, c, 1);j+=1)
       for(i=0;i<dimsize(wavef, 0);i+=1)
       for(k=0;k<dimsize(wavef, 2);k+=1)
        if(numtype(wave1[i][scale2pnt(wave1, pnt2scale(wavef, j, 1), 1)][k])==2)
          wavef[i][j][k]=wave2[i][scale2pnt(wave2, pnt2scale(wavef, j, 1), 1)][k]
        else
          if(numtype(wave2[scale2pnt(wave2, pnt2scale(wavef, i, 0), 0)][j][k])==2)
            wavef[i][j][k]=wave1[i][scale2pnt(wave1, pnt2scale(wavef, j, 1), 1)][k]
          else 
            wavef[i][j][k]=wave1[i][scale2pnt(wave1, pnt2scale(wavef, j, 1), 1)][k]*(c-pnt2scale(wavef, j, 1))/(c-b)+wave2[i][scale2pnt(wave2, pnt2scale(wavef, j, 1), 1)][k]*(pnt2scale(wavef, j, 1)-b)/(c-b)
          endif
        endif
       endfor
       endfor
      endfor
   break
   case 3:
      min1=min(dimoffset(wave_a,2), dimoffset(wave_a,2)+(dimsize(wave_a,2)-1)*dimdelta(wave_a,2))
      max1=max(dimoffset(wave_a,2), dimoffset(wave_a,2)+(dimsize(wave_a,2)-1)*dimdelta(wave_a,2))
      min2=min(dimoffset(wave_b,2), dimoffset(wave_b,2)+(dimsize(wave_b,2)-1)*dimdelta(wave_b,2))
      max2=max(dimoffset(wave_b,2), dimoffset(wave_b,2)+(dimsize(wave_b,2)-1)*dimdelta(wave_b,2))
      if(min1<min2)
        a=min1
        b=min2
        c=max1
        d=max2
        wave wave1=wave_a
        wave wave2=wave_b
      else
        b=min1
        a=min2
        d=max1
        c=max2
        wave wave1=wave_b
        wave wave2=wave_a
      endif
      redimension/n=((dimsize(wave1,0)+dimsize(wave2,0))/2, (dimsize(wave1,1)+dimsize(wave2,1))/2, (d-a)*2/(dimdelta(wave1,2)+dimdelta(wave2,2))) wavef
      setscale/i z, a, d, wavef
      setscale/p y, dimoffset(wave1, 1), dimdelta(wave1, 1), wavef
      setscale/p x, dimoffset(wave1, 0), dimdelta(wave1, 0), wavef
      for(i=0;i<scale2pnt(wavef, b, 2);i+=1)
        wavef[][][i]=wave1[p][q][scale2pnt(wave1, pnt2scale(wavef, i, 2), 2)]
      endfor
      for(i=scale2pnt(wavef, c, 2);i<scale2pnt(wavef, d, 2);i+=1)
        wavef[][][i]=wave2[p][q][scale2pnt(wave2, pnt2scale(wavef, i, 2), 2)]
      endfor
      for(i=scale2pnt(wavef, b, 2);i<scale2pnt(wavef, c, 2);i+=1)
       for(j=0;j<dimsize(wavef, 0);j+=1)
       for(k=0;k<dimsize(wavef, 1);k+=1)
        if(numtype(wave1[j][k][scale2pnt(wave1, pnt2scale(wavef, i, 2), 2)])==2)
          wavef[j][k][i]=wave2[j][k][scale2pnt(wave2, pnt2scale(wavef, i, 2), 2)]
        else
          if(numtype(wave2[j][k][scale2pnt(wave2, pnt2scale(wavef, i, 2), 2)])==2)
            wavef[j][k][i]=wave1[j][k][scale2pnt(wave1, pnt2scale(wavef, i, 2), 2)]
          else 
            wavef[j][k][i]=wave1[j][k][scale2pnt(wave1, pnt2scale(wavef, i, 2), 2)]*(c-pnt2scale(wavef, i, 2))/(c-b)+wave2[j][k][scale2pnt(wave2, pnt2scale(wavef, i, 2), 2)]*(pnt2scale(wavef, i, 2)-b)/(c-b)
          endif
        endif
       endfor
       endfor
      endfor
   break
   endswitch
   endif
end

function valuenormalize(ctrlname):buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   SVAR namelist=root:globalvar:namelisttool
   wave tempwave=root:globalvar:tempwave
   variable maxv, minv
   variable i,j
   strswitch(ctrlname)
   case "normal_tool":
    controlinfo/w=toolpanel appall_tool
    if(V_value==0)
      maxv=findextreme(tempwave,"max")
      minv=findextreme(tempwave, "min")
      tempwave=(tempwave-minv)/(maxv-minv)
    else
      for(i=0;i<itemsinlist(namelist);i+=1)
         wave newwave=$("root:globalvar:"+nameofwave($stringfromlist(i, namelist)))
         maxv=findextreme(newwave,"max")
         minv=findextreme(newwave, "min")
         newwave=(newwave-minv)/(maxv-minv)
      endfor
      controlinfo/w=toolpanel pum_tool
      wave newwave=$("root:globalvar:"+nameofwave($S_value))
      duplicate/o newwave, tempwave
    endif
    break
   case "normalmdc_tool":
    controlinfo/w=toolpanel appall_tool
    if(V_value==0)
     for(j=0;j<dimsize(tempwave,0);j+=1)
      duplicate/o/r=[j,j] tempwave, tempmdc
      maxv=findextreme(tempmdc,"max")
      minv=findextreme(tempmdc, "min")
      tempmdc=(tempmdc-minv)/(maxv-minv)
      tempwave[j][]=tempmdc[q]
     endfor
    else
      for(i=0;i<itemsinlist(namelist);i+=1)
         wave newwave=$("root:globalvar:"+nameofwave($stringfromlist(i, namelist)))
         for(j=0;j<dimsize(newwave,0);j+=1)
           duplicate/o/r=[j,j] tempwave, tempmdc
           maxv=findextreme(tempmdc,"max")
           minv=findextreme(tempmdc, "min")
           tempmdc=(tempmdc-minv)/(maxv-minv)
           newwave[j][]=tempmdc[q]
         endfor
      endfor
      controlinfo/w=toolpanel pum_tool
      wave newwave=$("root:globalvar:"+nameofwave($S_value))
      duplicate/o newwave, tempwave
    endif
    killwaves tempmdc
    break
    case "normaledc_tool":
    controlinfo/w=toolpanel appall_tool
    if(V_value==0)
     for(j=0;j<dimsize(tempwave,1);j+=1)
      duplicate/o/r=[][j,j] tempwave, tempedc
      maxv=findextreme(tempedc,"max")
      minv=findextreme(tempedc, "min")
      tempedc=(tempedc-minv)/(maxv-minv)
      tempwave[][j]=tempedc[p]
     endfor
    else
      for(i=0;i<itemsinlist(namelist);i+=1)
         wave newwave=$("root:globalvar:"+nameofwave($stringfromlist(i, namelist)))
         for(j=0;j<dimsize(newwave,1);j+=1)
           duplicate/o/r=[][j,j] tempwave, tempedc
           maxv=findextreme(tempedc,"max")
           minv=findextreme(tempedc, "min")
           tempedc=(tempedc-minv)/(maxv-minv)
           newwave[][j]=tempedc[p]
         endfor
      endfor
      controlinfo/w=toolpanel pum_tool
      wave newwave=$("root:globalvar:"+nameofwave($S_value))
      duplicate/o newwave, tempwave
    endif
    killwaves tempedc
    break
    endswitch
end  

function smooths(ctrlname, checked):checkboxcontrol
   string ctrlname
   variable checked
   wave arguwave=root:globalvar:arguwave
   if(checked==1)
     setvariable smn_norm, disable=0
     arguwave[35]=1
   else
     setvariable smn_norm, disable=2
     arguwave[35]=0
   endif
end

function view3d(ctrlname): buttoncontrol
   string ctrlname
   variable timec=1
   wave/t currwave=root:globalvar:currwave
   wave wavname=$currwave[2]
   wave tempz=root:map3d:threed:tempz
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   NVAR xposition=root:map3d:threed:xposition
   NVAR yposition=root:map3d:threed:yposition
   NVAR zposition=root:map3d:threed:zposition
   variable t0,i,j,k
   strswitch(ctrlname)
   case "z_ks":
     dowindow kspace_z
     if(V_flag==1)
     else
       newimage/f/n=kspace_z tempz  
       Modifyimage  $nameofwave(tempz) ctab= {*,*,PlanetEarth256,0}
       autopositionwindow/e/m=0/r=kspacepanel
       checkbox zc_ks, value=1, win=kspacepanel
     endif
     dowindow/f kspace_z
     doupdate/w=kspacepanel/e=1
     for(i=0;i<dimsize(wavname,2);i+=1)
       zposition=dimoffset(wavname,2)+i*dimdelta(wavname,2)
       t0=ticks
       for(j=0;j<dimsize(wavname,1);j+=1)
        for(k=0;k<dimsize(wavname,0);k+=1)
         tempz[k][j]=wavname[k][j][i]
        endfor
       endfor
       do
       while(round((ticks-t0)/timec)<1)
       doupdate/w=kspace_z
       doupdate/w=kspacepanel
       if(V_Flag==2)
          break
       endif
     endfor
     break
   case "x_ks":
     dowindow kspace_x
     if(V_flag==1)
     else
      newimage/f/n=kspace_x tempx
      Modifyimage  $nameofwave(tempx) ctab= {*,*,PlanetEarth256,0}
      autopositionwindow/e/m=0/r=kspacepanel
      checkbox xc_ks, value=1, win=kspacepanel
     endif
     dowindow/f kspace_x
     doupdate/w=kspacepanel/e=1
     for(i=0;i<dimsize(wavname,0);i+=1)
       xposition=dimoffset(wavname,0)+i*dimdelta(wavname,0)
       t0=ticks
       for(j=0;j<dimsize(tempx,1);j+=1)
        for(k=0;k<dimsize(tempx,0);k+=1)
         tempx[k][j]=wavname[i][k][j]
        endfor
       endfor
       do
       while(round((ticks-t0)/timec)<1)
       doupdate/w=kspace_x
       doupdate/w=kspacepanel
       if(V_Flag==2)
          break
       endif
     endfor
     break
   case "y_ks":
     dowindow kspace_y
     if(V_flag==1)
     else
      newimage/f/n=kspace_y tempy
      Modifyimage  $nameofwave(tempy) ctab= {*,*,PlanetEarth256,0}
      autopositionwindow/e/m=0/r=kspacepanel
      checkbox yc_ks, value=1, win=kspacepanel
     endif
     dowindow/f kspace_y
     doupdate/w=kspacepanel/e=1
     for(i=0;i<dimsize(wavname,1);i+=1)
       yposition=dimoffset(wavname,1)+i*dimdelta(wavname,1)
       t0=ticks
       for(j=0;j<dimsize(tempy,1);j+=1)
        for(k=0;k<dimsize(tempy,0);k+=1)
         tempy[k][j]=wavname[k][i][j]
        endfor
       endfor
       do
       while(round((ticks-t0)/timec)<1)
       doupdate/w=kspace_y
       doupdate/w=kspacepanel
       if(V_Flag==2)
          break
       endif
     endfor
     break
   default:
     break
   endswitch
end

function threedview_SC(ctrlname, value, event): slidercontrol
   string ctrlname
   variable value
   variable event
   wave/t currwave=root:globalvar:currwave
   wave wavname=$currwave[2]
   wave tempz=root:map3d:threed:tempz
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave xprofile=root:map3d:threed:xprofile
   wave yprofile=root:map3d:threed:yprofile
   wave zprofile=root:map3d:threed:zprofile
   wave pro_EP=root:map3d:threed:pro_EP
   NVAR xp=root:map3d:threed:xposition
   NVAR yp=root:map3d:threed:yposition
   NVAR zp=root:map3d:threed:zposition
   variable i,j,k
   i=scale2pnt(wavname, xp, 0)
   j=scale2pnt(wavname, yp, 1)
   k=scale2pnt(wavname, zp, 2)
   strswitch(ctrlname)
   case "xs_ks":
       tempx[][]=wavname[i][p][q]
       yprofile[]=wavname[i][p][k]
       zprofile[]=wavname[i][j][p]
     break
   case "ys_ks":
       tempy[][]=wavname[p][j][q]
       xprofile[]=wavname[p][j][k]
       zprofile[]=wavname[i][j][p]
     break
   case "zs_ks":
       tempz[][]=wavname[p][q][k]
       xprofile[]=wavname[p][j][k]
       yprofile[]=wavname[i][p][k]
     break
   default:
     break
   endswitch
   pro_EP[0]=wavemin(xprofile)
   pro_EP[1]=wavemax(xprofile)
   pro_EP[2]=wavemin(yprofile)
   pro_EP[3]=wavemax(yprofile)
   pro_EP[4]=wavemin(zprofile)
   pro_EP[5]=wavemax(zprofile)
end

function graph3dview(ctrlname): buttoncontrol
   string ctrlname
   dowindow/f ThreeDView
   if(V_flag==0)
   wave/t currwave=root:globalvar:currwave
   wave tempz=root:map3d:threed:tempz
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave x_EP=root:map3d:threed:x_EP
   wave y_EP=root:map3d:threed:y_EP
   wave z_EP=root:map3d:threed:z_EP
   wave pro_EP=root:map3d:threed:pro_EP
   wave x_V=root:map3d:threed:x_V
   wave y_V=root:map3d:threed:y_V
   wave z_V=root:map3d:threed:z_V
   wave xpro=root:map3d:threed:xprofile
   wave ypro=root:map3d:threed:yprofile
   wave zpro=root:map3d:threed:zprofile
   NVAR xpos=root:map3d:threed:xposition
   NVAR ypos=root:map3d:threed:yposition
   NVAR zpos=root:map3d:threed:zposition
   Display/k=1/n=ThreeDView;AppendImage/R tempz
   ModifyGraph/w=threedview width={Plan,1,bottom,right}, margin(left)=200,margin(top)=200,margin(bottom)=110, margin(right)=110
   ModifyGraph fSize=10
   ModifyGraph tick=1,standoff=0
   ModifyImage tempz ctab= {*,*,Grays,1}
   appendtograph/w=threedview/r  y_EP vs x_V
   ModifyGraph lstyle(y_EP)=2, rgb(y_EP)=(0,15872,65280)
   appendtograph/w=threedview/r y_V vs x_EP
   ModifyGraph lstyle(y_V)=2, rgb(y_V)=(0,52224,0)
   defineguide/w=ThreeDView zx_up={FT, 10}
   defineguide/w=ThreeDView zx_down={PT, -10}
   defineguide/w=ThreeDView zy_left={FL, 10}
   defineguide/w=ThreeDView zy_right={PL, -10}
   defineguide/w=ThreeDView x_up={PB, 28}
   defineguide/w=ThreeDView x_down={FB, -10}
   defineguide/w=ThreeDView y_left={PR, 28}
   defineguide/w=ThreeDView y_right={FR, -10}
   display/host=ThreeDView/n=ZvX/PG=(PL, zx_up, PR, zx_down);appendimage/r/t tempy
   ModifyGraph/w=ThreeDView#zvx tick=1,noLabel(top)=2,standoff=0
   ModifyImage tempy ctab= {*,*,Grays,1}
   appendtograph/w=threedview#zvx/r/t  z_EP vs x_V
   ModifyGraph lstyle(z_EP)=2
   appendtograph/w=threedview#zvx/r/t  z_V vs x_EP
   ModifyGraph lstyle(z_V)=2, rgb(z_V)=(0,52224,0)
   display/host=ThreeDView/n=ZvY/PG=(zy_left, PT, zy_right, PB);appendimage tempx
   ModifyGraph swapXY=1
   ModifyImage tempx ctab= {*,*,Grays,1}
   ModifyGraph tick=1,noLabel(left)=2,standoff=0
   SetAxis/A/R bottom
   appendtograph/w=threedview#zvy  z_EP vs y_V
   ModifyGraph lstyle(z_EP)=2
   appendtograph/w=threedview#zvy  z_V vs y_EP
   ModifyGraph lstyle(z_V)=2, rgb(z_V)=(0,15872,65280)
   display/host=ThreeDView/n=Xdistribution/PG=(PL, x_up, PR, x_down);appendtograph/t xpro
   ModifyGraph tick(left)=3,tick(top)=1,mirror(left)=1,mirror(top)=2, noLabel=2,standoff=0, rgb=(0,52224,0)
   display/host=ThreeDView/n=Ydistribution/PG=(y_left, PT, y_right, PB);appendtograph ypro
   ModifyGraph swapXY=1
   ModifyGraph tick(bottom)=3,tick(left)=1,mirror=2,noLabel=2,standoff=0, rgb=(0,15872,65280)
   display/host=ThreeDView/n=Zdistribution1/PG=(zy_left, x_up, zy_right, x_down);appendtograph/t zpro
   ModifyGraph tick(left)=3,tick(top)=1,mirror(left)=1,mirror(top)=2, noLabel=2,standoff=0
   SetAxis/A/R top
   display/host=ThreeDView/n=Zdistribution2/PG=(y_left, zx_up, y_right, zx_down);appendtograph zpro
   ModifyGraph swapXY=1
   ModifyGraph tick(bottom)=3,tick(left)=1,mirror=2,noLabel=2,standoff=0
   newpanel/host=threedview/n=threedviewpanel/FG=(zy_left, zx_up, zy_right, zx_down)
   modifypanel  framestyle=1, frameinset=0
   slider xs_ks, pos={50,40}, size={135,30},vert=0, ticks=0, limits={0,1,0}, value=0, variable=root:map3d:threed:xposition, proc=threedview_SC
   setvariable xv_ks, pos={70,60}, size={80,20},title="X ", value=root:map3d:threed:xposition, proc=threedview_SV
   button xb_ks, pos={155,60}, size={20,20}, title="E",font="Times New Roman",proc=kspaces 
   slider ys_ks, pos={50,90}, size={135,30},vert=0, ticks=0, limits={0,1,0}, value=0, variable=root:map3d:threed:yposition, proc=threedview_SC
   setvariable yv_ks, pos={70,110}, size={80,20},title="Y ", value=root:map3d:threed:yposition, proc=threedview_SV
   button yb_ks, pos={155,110}, size={20,20}, title="E",font="Times New Roman",proc=kspaces
   slider zs_ks, pos={50,140}, size={135,30},vert=0, ticks=0, limits={0,1,0}, value=0, variable=root:map3d:threed:zposition, proc=threedview_SC
   setvariable zv_ks, pos={70,160}, size={80,20},title="Z ", value=root:map3d:threed:zposition, proc=threedview_SV
   button zb_ks, pos={155,160}, size={20,20}, title="E",font="Times New Roman",proc=kspaces
   button xpro_ks, pos={50, 190}, size={20,20}, title="X", font="Times New Roman", fcolor=(0,52224,0), proc=exportprofile
   button ypro_ks, pos={107.5, 190}, size={20,20}, title="Y", font="Times New Roman", fcolor=(0,15872,65280), proc=exportprofile
   button zpro_ks, pos={165, 190}, size={20,20}, title="Z", font="Times New Roman", fcolor=(65280,0,0), proc=exportprofile
   wave mapk=$currwave[2]
   slider xs_ks, limits={dimoffset(mapk,0),dimoffset(mapk,0)+(dimsize(mapk,0)-1)*dimdelta(mapk,0),dimdelta(mapk,0)}, value=dimoffset(mapk,0)
   setvariable xv_ks, limits={dimoffset(mapk,0),dimoffset(mapk,0)+(dimsize(mapk,0)-1)*dimdelta(mapk,0),dimdelta(mapk,0)}
   slider ys_ks, limits={dimoffset(mapk,1),dimoffset(mapk,1)+(dimsize(mapk,1)-1)*dimdelta(mapk,1),dimdelta(mapk,1)}, value=dimoffset(mapk,1)
   setvariable yv_ks, limits={dimoffset(mapk,1),dimoffset(mapk,1)+(dimsize(mapk,1)-1)*dimdelta(mapk,1),dimdelta(mapk,1)}   
   slider zs_ks, limits={dimoffset(mapk,2),dimoffset(mapk,2)+(dimsize(mapk,2)-1)*dimdelta(mapk,2),dimdelta(mapk,2)}, value=dimoffset(mapk,2)
   setvariable zv_ks, limits={dimoffset(mapk,2),dimoffset(mapk,2)+(dimsize(mapk,2)-1)*dimdelta(mapk,2),dimdelta(mapk,2)}
   variable i,j,k
   i=scale2pnt(mapk, xpos, 0)
   j=scale2pnt(mapk, ypos, 1)
   k=scale2pnt(mapk, zpos, 2)
   tempx[][]=mapk[0][p][q]
   tempy[][]=mapk[p][0][q]
   tempz[][]=mapk[p][q][0]
   xpro[]=mapk[p][j][k]
   ypro[]=mapk[i][p][k]
   zpro[]=mapk[i][j][p]
   pro_EP[0]=wavemin(xpro)
   pro_EP[1]=wavemax(xpro)
   pro_EP[2]=wavemin(ypro)
   pro_EP[3]=wavemax(ypro)
   pro_EP[4]=wavemin(zpro)
   pro_EP[5]=wavemax(zpro)
   appendtograph/w=threedview#xdistribution/t pro_EP[0,1] vs x_V
   ModifyGraph/w=threedview#xdistribution lstyle(pro_EP)=2
   appendtograph/w=threedview#ydistribution pro_EP[2,3] vs y_V
   ModifyGraph/w=threedview#ydistribution lstyle(pro_EP)=2
   appendtograph/w=threedview#zdistribution1/t pro_EP[4,5] vs z_V
   ModifyGraph/w=threedview#zdistribution1 lstyle(pro_EP)=2, rgb(pro_EP)=(0,15872,65280)
   appendtograph/w=threedview#zdistribution2 pro_EP[4,5] vs z_V
   ModifyGraph/w=threedview#zdistribution2 lstyle(pro_EP)=2, rgb(pro_EP)=(0,52224,0)
   newpanel/host=threedview/n=logo/FG=(y_left, x_up, y_right, x_down)
   modifypanel  framestyle=1, frameinset=0
   DrawPict 0,0,1.19,1.3,ProcGlobal#ThreeDPic
   setwindow threedview, hook(threedhook)=threedwinhook
   endif
end

function threedwinhook(s)
   struct WMWinHookStruct &s
   variable hookresult=0
   wave/t currwave=root:globalvar:currwave
   wave mapk=$currwave[2]
   NVAR xpos=root:map3d:threed:xposition
   NVAR ypos=root:map3d:threed:yposition
   NVAR zpos=root:map3d:threed:zposition
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave tempz=root:map3d:threed:tempz
   wave xpro=root:map3d:threed:xprofile
   wave ypro=root:map3d:threed:yprofile
   wave zpro=root:map3d:threed:zprofile
   wave pro_EP=root:map3d:threed:pro_EP
   if(s.keycode==97)
       getwindow threedview, psizeDC
       if(s.mouseloc.v>V_top && s.mouseloc.v<V_bottom && s.mouseloc.h>V_left && s.mouseloc.h<V_right)
       getaxis/w=threedview/q right
       ypos=V_min+(V_max-V_min)*(s.mouseloc.v-V_bottom)/(V_top-V_bottom)
       getaxis/w=threedview/q bottom
       xpos=V_min+(V_max-V_min)*(s.mouseloc.h-V_left)/(V_right-V_left)
       variable i,j,k
       i=scale2pnt(mapk, xpos, 0)
       j=scale2pnt(mapk, ypos, 1)
       k=scale2pnt(mapk, zpos, 2)
       tempx[][]=mapk[i][p][q]
       tempy[][]=mapk[p][j][q]
       xpro[]=mapk[p][j][k]
       ypro[]=mapk[i][p][k]
       zpro[]=mapk[i][j][p]
       pro_EP[0]=wavemin(xpro)
       pro_EP[1]=wavemax(xpro)
       pro_EP[2]=wavemin(ypro)
       pro_EP[3]=wavemax(ypro)
       pro_EP[4]=wavemin(zpro)
       pro_EP[5]=wavemax(zpro)
      endif
      hookresult=1
  endif
  if(s.eventcode==22)
      getwindow threedview, psizeDC
      if(s.mouseloc.v>V_top && s.mouseloc.v<V_bottom && s.mouseloc.h>V_left && s.mouseloc.h<V_right)
         variable deltaz=(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)*0.01
         zpos+=s.wheeldy*deltaz
         if(zpos<dimoffset(mapk, 2))
            zpos=dimoffset(mapk, 2) 
         elseif(zpos>(dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)))
            zpos=dimoffset(mapk, 2)+(dimsize(mapk, 2)-1)*dimdelta(mapk, 2)
         else
           i=scale2pnt(mapk, xpos, 0)
           j=scale2pnt(mapk, ypos, 1)
           k=scale2pnt(mapk, zpos, 2)
           tempz[][]=mapk[p][q][k]
           xpro[]=mapk[p][j][k]
           ypro[]=mapk[i][p][k]
         endif
      endif
      pro_EP[0]=wavemin(xpro)
      pro_EP[1]=wavemax(xpro)
      pro_EP[2]=wavemin(ypro)
      pro_EP[3]=wavemax(ypro)
      pro_EP[4]=wavemin(zpro)
      pro_EP[5]=wavemax(zpro)
      hookresult=1
  endif
  if(s.eventcode==6)
       getaxis/w=threedview/q bottom
       setaxis/w=threedview#ZvX top, V_min, V_max
       setaxis/w=threedview#xdistribution top, V_min, V_max
       slider xs_ks, limits={V_min,V_max,dimdelta(mapk,0)}, win=threedview#threedviewpanel
       setvariable xv_ks, limits={V_min,V_max,dimdelta(mapk,0)}, win=threedview#threedviewpanel
       getaxis/w=threedview/q right
       setaxis/w=threedview#zvy left, V_min, V_max
       setaxis/w=threedview#ydistribution left, V_min, V_max
       slider ys_ks, limits={V_min,V_max,dimdelta(mapk,1)}, win=threedview#threedviewpanel
       setvariable yv_ks, limits={V_min,V_max,dimdelta(mapk,1)}, win=threedview#threedviewpanel
       hookresult=1
   endif
   return hookresult
end

function threedview_SV(ctrlName,value,varStr,varName) : SetVariableControl
   string ctrlname
   variable value
   string varstr
   string varname
   wave/t currwave=root:globalvar:currwave
   wave wavname=$currwave[2]
   wave tempz=root:map3d:threed:tempz
   wave tempx=root:map3d:threed:tempx
   wave tempy=root:map3d:threed:tempy
   wave xprofile=root:map3d:threed:xprofile
   wave yprofile=root:map3d:threed:yprofile
   wave zprofile=root:map3d:threed:zprofile
   wave pro_EP=root:map3d:threed:pro_EP
   NVAR xp=root:map3d:threed:xposition
   NVAR yp=root:map3d:threed:yposition
   NVAR zp=root:map3d:threed:zposition
   variable i,j,k
   i=scale2pnt(wavname, xp, 0)
   j=scale2pnt(wavname, yp, 1)
   k=scale2pnt(wavname, zp, 2)
   strswitch(ctrlname)
   case "xv_ks":
       tempx[][]=wavname[i][p][q]
       yprofile[]=wavname[i][p][k]
       zprofile[]=wavname[i][j][p]
     break
   case "yv_ks":
       tempy[][]=wavname[p][j][q]
       xprofile[]=wavname[p][j][k]
       zprofile[]=wavname[i][j][p]
     break
   case "zv_ks":
       tempz[][]=wavname[p][q][k]
       xprofile[]=wavname[p][j][k]
       yprofile[]=wavname[i][p][k]
     break
   default:
     break
   endswitch
   pro_EP[0]=wavemin(xprofile)
   pro_EP[1]=wavemax(xprofile)
   pro_EP[2]=wavemin(yprofile)
   pro_EP[3]=wavemax(yprofile)
   pro_EP[4]=wavemin(zprofile)
   pro_EP[5]=wavemax(zprofile)
end

function EMDCShow(ctrlname): buttoncontrol
   string ctrlname
   variable timec=5
   wave emdctemp=root:globalvar:emdctemp
   wave/t currwave=root:globalvar:currwave
   wave wavname=$currwave[0]
   NVAR tab=root:globalvar:tabvalue
   variable i,t0
   if(tab==0)
     redimension/n=(dimsize($currwave[0],0)) emdctemp
     setscale/p x,dimoffset($currwave[0],0),dimdelta($currwave[0],0),emdctemp
     dowindow dynamicshow
     if(V_flag==0)
       display/k=1/n=dynamicshow emdctemp
     endif
     for(i=0;i<dimsize($currwave[0],1);i+=1)
       t0=ticks
       emdctemp[]=wavname[p][i]
       do
       while(round((ticks-t0)/timec)<1)
       doupdate
     endfor
   else
     redimension/n=(dimsize($currwave[0],1)) emdctemp
     setscale/p x,dimoffset($currwave[0],1),dimdelta($currwave[0],1),emdctemp
     dowindow dynamicshow
     if(V_flag==0)
       display/k=1/n=dynamicshow emdctemp
     endif
     for(i=0;i<dimsize($currwave[0],0);i+=1)
       t0=ticks
       emdctemp[]=wavname[i][p]
       do
       while(round((ticks-t0)/timec)<1)
       doupdate
     endfor
   endif
end

function findextreme(wavname, type)
   wave wavname
   string type
   variable i,j,intensity
   switch(wavedims(wavname))
   case 2:
    for(i=0;i<dimsize(wavname,1);i+=1)
      for(j=0;j<dimsize(wavname,0);j+=1)
        intensity=wavname[j][i]
        if(numtype(intensity)!=2)
          break
        endif
      endfor
      if(numtype(intensity)!=2)
        break
      endif
    endfor
    if(numtype(intensity)==2)
       print "No extreme value!"
       return -1
    else
    if(cmpstr(type,"max")==0)
     for(i=0;i<dimsize(wavname,1);i+=1)
      for(j=0;j<dimsize(wavname, 0); j+=1)
       if(wavname[j][i]>intensity)
         intensity=wavname[j][i]
       endif
      endfor
     endfor
    else
     for(i=0;i<dimsize(wavname,1);i+=1)
      for(j=0;j<dimsize(wavname, 0); j+=1)
       if(wavname[j][i]<intensity)
         intensity=wavname[j][i]
       endif
      endfor
     endfor
    endif
    endif
    break
    case 1:
    for(i=0;i<dimsize(wavname,0);i+=1)
      intensity=wavname[i]
      if(numtype(intensity)!=2)
        break
      endif
    endfor
    if(numtype(intensity)==2)
       print "No extreme value!"
       return -1
    else
    if(cmpstr(type,"max")==0)
      for(j=0;j<dimsize(wavname, 0); j+=1)
       if(wavname[j]>intensity)
         intensity=wavname[j]
       endif
      endfor
    else
      for(j=0;j<dimsize(wavname, 0); j+=1)
       if(wavname[j]<intensity)
         intensity=wavname[j]
       endif
      endfor
    endif
    endif
   break
   default:
   break
   endswitch
   return intensity
end
     
Function information(ctrlname): ButtonControl
   string ctrlname
   newpanel/k=1/w=(500,200,700,355)/n=Information
   modifypanel fixedsize=1
   setdrawenv fname="Times New Roman",fsize=16,fillbgc=(65535,65535,65535),textrgb=(26368,0,52224)
   drawtext 35,55,"Copyright by Yao Wei" 
   drawpict 65, 65, 1, 1, ProcGlobal#yao
end

function/s eorm(mode)
  variable mode
  if(mode==0)
   return "EDC"
  else
   return "MDC"
  endif
end

function killwindows(windowname,wavenum)
  string windowname
  variable wavenum
  string tempname
  variable i
  dowindow/k windowname
  for(i=0;i<wavenum-1;i+=1)
    tempname=windowname+num2str(i)
    dowindow/k $tempname
  endfor
end

function FDfittest(ctrlname): buttoncontrol
   string ctrlname
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   setdatafolder root:FermiEnergyFit:
   wave targetwave=TraceNameToWaveRef("fit_range", stringfromlist(0, tracenamelist("fit_range",";",1)))
   string testwavename=nameofwave(targetwave)+"_test"
   duplicate/o targetwave, $testwavename
   wave testwave=$testwavename
   controlinfo/w=fermidiracpanel fitmode_ffd
   switch(V_value)
   case 0:
      testwave[]=arguwave[62]+((pnt2x(testwave,p)-arguwave[58])*arguwave[61]+arguwave[60])/(1+exp((pnt2x(testwave,p)-arguwave[58])/arguwave[59]))
   break
   case 1:
      variable kB=8.6173325e-5
      redimension/n=(arguwave[153]*dimsize(testwave, 0))  testwave
      setscale/i x, leftx(targetwave)-(rightx(targetwave)-leftx(targetwave))*arguwave[153]/2, rightx(targetwave)+(rightx(targetwave)-leftx(targetwave))*arguwave[153]/2, testwave
      testwave=arguwave[150]+((x-arguwave[146])*arguwave[149]+arguwave[148])/(1+exp((x-arguwave[146])/(kB*arguwave[147])))
      make/o/n=(round(dimsize(testwave,0)/2)*2+1)  gausswave
      setscale/p x, -deltax(testwave)*round(dimsize(testwave,0)/2),deltax(testwave), gausswave 
      gausswave = exp(-ln(2)*(x*2000/arguwave[151])^2)
      Variable sumgauss
      sumgauss = sum(gausswave, -inf,inf)
      gausswave /= sumgauss
      convolve/A gausswave, testwave
      killwaves gausswave
   break
   case 2:
      kB=8.6173325e-5
      redimension/n=(arguwave[153]*dimsize(testwave, 0))  testwave
      setscale/i x, leftx(targetwave)-(rightx(targetwave)-leftx(targetwave))*arguwave[153]/2, rightx(targetwave)+(rightx(targetwave)-leftx(targetwave))*arguwave[153]/2, testwave
      testwave=arguwave[150]+((x-arguwave[146])*arguwave[149]+arguwave[148])/(1+exp((x-arguwave[146])/(kB*arguwave[147])))
      make/o/n=(round(dimsize(testwave,0)/2)*2+1)  gausswave
      setscale/p x, -deltax(testwave)*round(dimsize(testwave,0)/2),deltax(testwave), gausswave 
      gausswave = exp(-ln(2)*(x*2000/arguwave[151])^2)
      sumgauss = sum(gausswave, -inf,inf)
      gausswave /= sumgauss
      convolve/A gausswave, testwave
      killwaves gausswave
   break
   endswitch
   if(findlistitem(testwavename, tracenamelist("fit_range",";",1))==-1)
     appendtograph testwave[x2pnt(testwave,leftx(targetwave)), x2pnt(testwave, rightx(targetwave))]
     ModifyGraph rgb($testwavename)=(0,52224,0)
   endif
end

function AnalogCut_panel(ctrlname):buttoncontrol
   string ctrlname
   newdatafolder/o/s root:AnalogCut
   if(waveexists(root:AnalogCut:parameter)==0)
      make/o/n=20 parameter=0
   endif
   wave para=root:AnalogCut:parameter
   //para[0]=lattice constant
   //para[1]=rotation
   //para[2]=theta
   //para[3]=tilt
   //para[4]=K (hex: Gamma-K, square: Gamma-X)
   //para[5]=kinetic energy
   //para[6]=angle_AKC
   //para[7]=deltaK_AKC
   //para[8]=energy_AKC
   //para[9]=inner potential_EKzC
   //para[10]=theta_EKzC
   //para[11]=energy_EKzC
   //para[12]=Kz_EKzC
   make/o/n=(500,2) slit=0
   make/o/n=7 Brillouinwavey=0
   make/o/n=7 Brillouinwavex=0
   dowindow ACPanel
   if(V_flag==1)
    dowindow/f ACPanel
   else
   newpanel/k=1/w=(500,285,820,515)/n=ACPanel
   modifypanel fixedsize=1
   setwindow ACpanel, hook(killpanel)=killpanel
   groupbox bg_ac, pos={5,5}, size={190,100}, title="Brillouin", fcolor=(0,52224,52224),font="Times New Roman"
   setvariable lc_ac, pos={10,25},size={100,20},title="LC", font="Times New Roman", value=para[0], proc=RKconvert
   setvariable rot_ac, pos={10,50},size={100,20},title="Rot", font="Times New Roman", value=para[1]
   setvariable K_ac, pos={10,75},size={100,20}, title="K", font="Times New Roman", value=para[4], proc=RKconvert
   checkbox ls1_ac, pos={120,25},size={20,20},title="Hexagonal",font="Times New Roman",mode=1,value=1,proc=ACcheck
   checkbox ls2_ac, pos={120,50},size={20,20},title="Square",font="Times New Roman",mode=1,proc=ACcheck
   button Brilgen_ac, pos={125,75},size={60,25},title="Generate", font="Times New Roman", proc=Brillouingen
   setvariable theta_ac, pos={5,110},size={100,20},title="Theta",font="Times New Roman",value=para[2],limits={-inf,inf,0.2},proc=moveslit
   setvariable tilt_ac, pos={5,135},size={100,20},title="Tilt   ",font="Times New Roman",value=para[3],limits={-inf,inf,0.2},proc=moveslit
   setvariable Ef_ac, pos={5,160},size={100,20},title="Ek     ", font="Times New Roman",value=para[5],proc=moveslit
   popupmenu angmode_ac, pos={10,185},size={100,20}, value="Angular 30;Angular 14;",mode=1,proc=moveslit2
   //button mov_ac, pos={125,130},size={60,25},title="Move", font="Times New Roman",proc=moveslit
   groupbox cal_ac, pos={205,5}, size={110, 195}, title="Calculator", fcolor=(0,52224,52224),font="Times New Roman"
   setvariable ang_ac, pos={210,47}, size={100,20},title="Angle",  font="Times New Roman", value=para[6], proc=AKconvert
   setvariable dk_ac, pos={210,69}, size={100,20},title="deltaK",  font="Times New Roman", value=para[7], proc=AKconvert
   setvariable energy1_ac, pos={210,25}, size={100,20},title="Energy",  font="Times New Roman", value=para[8]
   setvariable InnPotential_ac, pos={210,107}, size={100,20}, title="IP",  font="Times New Roman", value=para[9]
   setvariable Kp_ac, pos={210,129}, size={100,20}, title="Kp",  font="Times New Roman", value=para[10]
   setvariable energy2_ac, pos={210,151}, size={100,20}, title="Energy",  font="Times New Roman", value=para[11], proc=CalKz
   setvariable Kz_ac, pos={210, 173}, size={100,20}, title="Kz",  font="Times New Roman", value=para[12], proc=CalKz
   endif
end

function ACcheck(ctrlname,value):checkboxcontrol
   string ctrlname
   variable value
   wave para=root:analogcut:parameter
   variable flag
   strswitch(ctrlname)
     case "ls1_ac":
        flag=1
     break
     case "ls2_ac":
        flag=2
     break
   endswitch
   checkbox ls1_ac, value=(flag==1)
   checkbox ls2_ac, value=(flag==2)
end

function Brillouingen(ctrlname): buttoncontrol
   string ctrlname
   wave Bwavey=root:analogcut:brillouinwavey
   wave Bwavex=root:analogcut:brillouinwavex
   wave para=root:analogcut:parameter
   wave slit=root:analogcut:slit
   setdatafolder root:analogcut:
   duplicate/o bwavey, tempy
   duplicate/o bwavex, tempx
   dowindow/k Brillouinzone
   controlinfo ls1_ac
   if(V_value==1)
      tempy[0]=para[4]/2
      tempx[0]=para[4]*sqrt(3)/2
      tempy[1]=para[4]
      tempx[1]=0
      tempy[2]=para[4]/2
      tempx[2]=-para[4]*sqrt(3)/2
      tempy[3]=-para[4]/2
      tempx[3]=-para[4]*sqrt(3)/2
      tempy[4]=-para[4]
      tempx[4]=0
      tempy[5]=-para[4]/2
      tempx[5]=para[4]*sqrt(3)/2
      tempy[6]=para[4]/2
      tempx[6]=para[4]*sqrt(3)/2
      bwavey[]=cos(para[1]*pi/180)*tempy[p]+sin(para[1]*pi/180)*tempx[p]
      bwavex[]=-sin(para[1]*pi/180)*tempy[p]+cos(para[1]*pi/180)*tempx[p]
      display/n=BrillouinZone/w=(100,100,400,400) bwavey vs bwavex
      ModifyGraph width={Plan,1,bottom,left},lsize=2,rgb=(0,0,0),tick=2,mirror=1,standoff=0,margin(left)=28,margin(bottom)=20,margin(top)=14,margin(right)=14,zero=2
      killwaves tempy, tempx
   else
      tempy[0]=para[4]
      tempx[0]=para[4]
      tempy[1]=para[4]
      tempx[1]=-para[4]
      tempy[2]=-para[4]
      tempx[2]=-para[4]
      tempy[3]=-para[4]
      tempx[3]=para[4]
      tempy[4]=para[4]
      tempx[4]=para[4]
      bwavey[]=cos(para[1]*pi/180)*tempy[p]+sin(para[1]*pi/180)*tempx[p]
      bwavex[]=-sin(para[1]*pi/180)*tempy[p]+cos(para[1]*pi/180)*tempx[p]
      display/n=BrillouinZone/w=(100,100,400,400) bwavey[0,4] vs bwavex[0,4]
      ModifyGraph width={Plan,1,bottom,left},height={Plan,1,left,bottom},lsize=2,rgb=(0,0,0),tick=2,mirror=1,standoff=0,margin(left)=28,margin(bottom)=20,margin(top)=14,margin(right)=14,zero=2
      killwaves tempy, tempx
   endif
      moveslit("",0,"","")
      appendtograph/W=BrillouinZone slit[][0] vs slit[][1]
      ModifyGraph/W=BrillouinZone lsize=2,rgb(slit)=(26112,52224,0)
end

function RKconvert(ctrlname,varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave para=root:analogcut:parameter
   strswitch(ctrlname)
   case "lc_ac":
     controlinfo ls1_ac
     if(V_value==1)
      para[4]=4*pi/3/varnum
     else
      para[4]=pi/varnum
     endif
   break
   case "K_ac":
     controlinfo ls1_ac
     if(V_value==1)
      para[0]=4*pi/3/varnum
     else
      para[0]=pi/varnum
     endif
   break
   endswitch
end

function AKconvert(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave para=root:analogcut:parameter
   strswitch(ctrlname)
   case "ang_ac":
       para[7]=0.512*sqrt(para[8])*sin(para[6]*pi/180)
       break
   case "dk_ac":
       para[6]=180/pi*asin(para[7]/0.512/sqrt(para[8]))
       break
   endswitch
end

function CalKz(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave para=root:analogcut:parameter
   strswitch(ctrlname)
   case "energy2_ac":
     para[12]=sqrt(0.512^2*(para[11]+para[9])-(para[10])^2)
     break
   case "Kz_ac":
     para[11]=((para[12])^2+(para[10])^2)/0.512^2-para[9]
     break
   endswitch
end

function moveslit(ctrlname,varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave para=root:analogcut:parameter
   wave slit=root:analogcut:slit
   controlinfo/w=ACPanel angmode_ac
   if(V_value==1)
     setscale/i x, para[3]-15, para[3]+15, slit
   else
     setscale/i x, para[3]-7, para[3]+7, slit
   endif
   slit[][0]=0.512*sqrt(para[5])*sin(pnt2scale(slit,p,0)*pi/180)
   slit[][1]=0.512*sqrt(para[5])*sin(para[2]*pi/180)*cos(pnt2scale(slit,p,0)*pi/180)
end   

function moveslit2(ctrlname,popnum,popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   moveslit("",0,"","")
end

function tr_panel(ctrlname): buttoncontrol
   string ctrlname
   newdatafolder/o/s root:tr
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   dowindow/f trSpectrum
   if(V_flag==0)
      if(!(waveexists(XY_plane)))
        make/n=(100, 100)/o XY_plane
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(XZ_plane)))
        make/n=(100, 100)/o XZ_plane
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(YZ_plane)))
        make/n=(100, 100)/o YZ_plane
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(trCurve)))
        make/n=100/o trCurve
        if(V_flag)
          return -1
        endif
      endif
      variable/g root:tr:Zvalue=0
      variable/g root:tr:X1value//=dimoffset(XY_plane,0)
      variable/g root:tr:X2value//=dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)
      variable/g root:tr:Y1value//=dimoffset(XY_plane,1)
      variable/g root:tr:Y2value//=dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)
      variable/g root:tr:Xp=dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)/2
      variable/g root:tr:Xw=(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)
      variable/g root:tr:Yp=dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)/2
      variable/g root:tr:Yw=(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)
      variable/g root:tr:OffsetValue=dimoffset(XY_plane,1)
      variable/g root:tr:DeltaValue=0
      variable/g root:tr:DiffValue=0
      make/o/n=2 trCEP
      make/o/n=2 XlineEP
      make/o/n=2 YlineEP
      make/o/n=2 Zv
      make/o/n=2 X1v
      make/o/n=2 X2v
      make/o/n=2 Y1v
      make/o/n=2 Y2v
      NVAR Zvalue=root:tr:Zvalue
      NVAR X1value=root:tr:X1value
      NVAR X2value=root:tr:X2value
      NVAR Y1value=root:tr:Y1value
      NVAR Y2value=root:tr:Y2value
      NVAR Xp=root:tr:Xp
      NVAR Xw=root:tr:Xw
      NVAR Yp=root:tr:Yp
      NVAR Yw=root:tr:Yw
      wave trCEP=root:tr:trCEP
      wave XlineEP=root:tr:XlineEP
      wave YlineEP=root:tr:YlineEP
      wave Zv=root:tr:Zv
      wave X1v=root:tr:X1v
      wave X2v=root:tr:X2v
      wave Y1v=root:tr:Y1v
      wave Y2v=root:tr:Y2v
      trCEP[0]=wavemin(trCurve)
      trCEP[1]=wavemax(trCurve)
      setformula Zv, "Zvalue"
      setformula X1value, "Xp-Xw/2"
      setformula X2value, "Xp+Xw/2"
      setformula Y1value, "Yp-Yw/2"
      setformula Y2value, "Yp+Yw/2"
      setformula X1v, "X1value"
      setformula X2v, "X2value"
      XlineEP[0]=X1value
      XlineEP[1]=X2value
      YlineEP[0]=Y1value
      YlineEP[1]=Y2value
      preferences 0
   	  display/k=1/n=trSpectrum/w=(250, 50, 750, 500); appendimage/w=trSpectrum XY_plane
      ModifyGraph fSize=12,font="Arial", tick=1,standoff=0, mirror=1, tickUnit=1, margin(left)=30, margin(top)=270, margin(right)=230, margin(bottom)=30
      Label left " "
      Label bottom " "
      ModifyImage XY_plane ctab= {*,*,VioletOrangeYellow,1}
      appendtograph/w=trSpectrum Y1v vs XlineEP
      appendtograph/w=trSpectrum Y2v vs XlineEP
      appendtograph/w=trSpectrum YlineEP vs X1v
      appendtograph/w=trSpectrum YlineEP vs X2v
      ModifyGraph rgb=(0,15872,65280),lstyle=2
      defineguide/w=trSpectrum XZ_top={FT, 120}
      defineguide/w=trSpectrum XZ_bottom={PT, -15}
      defineguide/w=trSpectrum YZ_left={PR, 15}
      defineguide/w=trSpectrum YZ_right={FR, -20}
      defineguide/w=trSpectrum panel_top={FT, 5}
      defineguide/w=trSpectrum panel_bottom={FT, 100}
      display/host=trSpectrum/n=xzimg/PG=(PL, XZ_top, PR, XZ_bottom); appendimage/w=trSpectrum#xzimg XZ_plane
      ModifyGraph fsize=12,font="Arial", tick=1,standoff=0, mirror=1, noLabel(bottom)=2, tlblRGB(left)=(65280,0,0),margin(left)=1, margin(top)=1, margin(right)=1, margin(bottom)=1 
      ModifyImage XZ_plane ctab= {*,*,VioletOrangeYellow,1}
      appendtograph/w=trSpectrum#xzimg Zv vs XlineEP
      ModifyGraph rgb=(0,15872,65280)
      display/host=trSpectrum/n=yzimg/PG=(YZ_left, PT, YZ_right, PB); appendimage/w=trSpectrum#yzimg YZ_plane
      ModifyGraph fsize=12,font="Arial", tick=1,standoff=0, mirror=1, noLabel(left)=2, tlblRGB(bottom)=(65280,0,0),margin(left)=1, margin(top)=1, margin(right)=1, margin(bottom)=1 
      ModifyImage YZ_plane ctab= {*,*,VioletOrangeYellow,1}
      appendtograph/w=trSpectrum#yzimg YlineEP vs Zv
      ModifyGraph rgb=(0,15872,65280)
      display/host=trSpectrum/n=dynamic/PG=(YZ_left, XZ_top, YZ_right, XZ_bottom); appendtograph/w=trSpectrum#dynamic/t trCurve
      ModifyGraph fsize=12,font="Arial", tick(left)=3,tick(top)=1,standoff=0, mirror=1, noLabel(left)=2, rgb(trCurve)=(0,52224,26368), tlblRGB(top)=(65280,0,0),margin(left)=1, margin(top)=1, margin(right)=1, margin(bottom)=1 
      ModifyGraph mode=4,marker=19,useMrkStrokeRGB=1
      appendtograph/w=trSpectrum#dynamic/t trCEP vs Zv
      ModifyGraph rgb(trCEP)=(0,15872,65280)
      newpanel/n=trpanel/FG=(PL, panel_top, YZ_right, panel_bottom)/host=trSpectrum
      modifypanel  framestyle=1, frameinset=0
      button load_tr, pos={15,5}, size={65,20}, title="Load",font="Times new roman", proc=load
      titlebox tb_tr, pos={90, 5}, size={300, 20}, fixedsize=1,frame=2, title="Please load waves.",font="Arial"
      popupmenu export_tr, pos={420, 5}, size={80, 20}, title="Export", mode=0, font="Times new roman", value="I vs t curve;E vs t image;k vs t image;", proc=tr_export
      tabcontrol tc_tr, pos={15, 30}, size={380, 27}, font="Times new roman", tabLabel(0)="Int. Mode", tabLabel(1)="Temp. Mode", labelBack=(0,52224,26368), proc=tr_tab
      button gen_tr, disable=2, pos={300,95}, size={65, 25}, title="Generate",font="Times new roman", fcolor=(0,52224,26368), proc=tr_generate
      button fit1_tr,disable=2, pos={370,95}, size={65, 25}, title="Fit",font="Times new roman", fcolor=(0,52224,26368)
      setvariable Z_tr, pos={470,53}, size={100,20},title="Z:", font="Times new roman",value=Zvalue, limits={leftx(trCurve), rightx(trCurve), deltax(trCurve)}, proc=tr_sv
      SetWindow trSpectrum, hook(resetcontrol)=movecontrol_tr
      tr_tab("",0)
      if(waveexists($currwave[8]))
        wave XY_plane=root:tr:XY_plane
        wave trMap=$currwave[8]
        redimension/n=(dimsize(trMap,0),dimsize(trMap,1)) XY_plane
        setscale/p x, dimoffset(trMap,0),dimdelta(trMap,0),XY_plane
        setscale/p y, dimoffset(trMap,1),dimdelta(trMap,1),XY_plane
        XY_plane=trMap[p][q][0]
        Zvalue=dimoffset(trMap,2)
        titlebox tb_tr, title=currwave[8], win=trSpectrum#trpanel
        button gen_tr, disable=0
        button fit1_tr, disable=0
      endif
   endif
end

function tr_tab(ctrlname, tab): tabcontrol
   string ctrlname
   variable tab
   NVAR X1value=root:tr:X1value
   NVAR X2value=root:tr:X2value
   NVAR Y1value=root:tr:Y1value
   NVAR Y2value=root:tr:Y2value
   NVAR Xp=root:tr:Xp
   NVAR Xw=root:tr:Xw
   NVAR Yp=root:tr:Yp
   NVAR Yw=root:tr:Yw
   NVAR OffsetValue=root:tr:OffsetValue
   NVAR DeltaValue=root:tr:DeltaValue
   NVAR DiffValue=root:tr:DiffValue
   wave XY_plane=root:tr:XY_plane
   wave Y1v=root:tr:Y1v
   wave Y2v=root:tr:Y2v
   setvariable Xp_tr, disable=(tab!=0),pos={15, 70}, size={100, 20}, title="Xp:",font="Times new roman",value=Xp, limits={dimoffset(XY_plane,0)+Xw/2,dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xw/2, dimdelta(XY_plane,0)}, proc=tr_sv
   setvariable Yp_tr, disable=(tab!=0),pos={15, 100}, size={100, 20}, title="Yp:",font="Times new roman",value=Yp, limits={dimoffset(XY_plane,1)+Yw/2,dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yw/2, dimdelta(XY_plane,1)}, proc=tr_sv
   setvariable Xw_tr, disable=(tab!=0),pos={125, 70}, size={100, 20}, title="Xw:",font="Times new roman",value=Xw, limits={0, min(2*(dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xp), 2*(Xp-dimoffset(XY_plane,0))), dimdelta(XY_plane,0)}, proc=tr_sv
   setvariable Yw_tr, disable=(tab!=0),pos={125, 100}, size={100, 20}, title="Yw:",font="Times new roman",value=Yw, limits={0, min(2*(dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yp), 2*(Yp-dimoffset(XY_plane,1))), dimdelta(XY_plane,1)}, proc=tr_sv
   setvariable temp_offset_tr, disable=(tab!=1),pos={25, 70}, bodywidth=80, size={100, 20}, title="Offset:",font="Times new roman",value=OffsetValue, limits={-inf, inf, dimdelta(XY_plane,1)}, proc=tr_sv
   setvariable temp_delta_tr, disable=(tab!=1),pos={25, 100}, bodywidth=80, size={100, 20}, title="Delta:",font="Times new roman",value=DeltaValue, limits={-inf, inf, dimdelta(XY_plane,1)}, proc=tr_sv
   setvariable temp_diff_tr, disable=(tab!=1),pos={145, 70}, bodywidth=80, size={100, 20}, title="Diff:",font="Times new roman",value=DiffValue, limits={0, inf, dimdelta(XY_plane,1)}, proc=tr_sv
   switch(tab)
     case 0:
       setformula Y1v, "Y1value"
       setformula Y2v, "Y2value"
       ModifyGraph/w=trSpectrum lsize(YlineEP)=1,lsize(YlineEP#1)=1
     break
     case 1:
       setformula Y1v, "OffsetValue+p*DeltaValue"
       setformula Y2v, "OffsetValue+DiffValue+p*DeltaValue"
       ModifyGraph/w=trSpectrum lsize(YlineEP)=0,lsize(YlineEP#1)=0
     break
   endswitch
end

function tr_generate(ctrlname): buttoncontrol
   string ctrlname
   setdatafolder root:tr
   wave/t currwave=root:globalvar:currwave
   wave arguwave=root:globalvar:arguwave
   wave trMap=$currwave[8]
   wave trCurve=root:tr:trCurve
   wave XZ_plane=root:tr:XZ_plane
   wave YZ_plane=root:tr:YZ_plane
   wave trCEP=root:tr:trCEP
   wave XlineEP=root:tr:XlineEP
   wave YlineEP=root:tr:YlineEP
   wave Zv=root:tr:Zv
   wave X1v=root:tr:X1v
   wave X2v=root:tr:X2v
   wave Y1v=root:tr:Y1v
   wave Y2v=root:tr:Y2v
   NVAR Zvalue=root:tr:Zvalue
   NVAR X1value=root:tr:X1value
   NVAR X2value=root:tr:X2value
   NVAR Y1value=root:tr:Y1value
   NVAR Y2value=root:tr:Y2value
   NVAR Xp=root:tr:Xp
   NVAR Xw=root:tr:Xw
   NVAR Yp=root:tr:Yp
   NVAR Yw=root:tr:Yw
   NVAR OffsetValue=root:tr:OffsetValue
   NVAR DeltaValue=root:tr:DeltaValue
   NVAR DiffValue=root:tr:DiffValue
   controlinfo/w=trSpectrum#trPanel tc_tr
   switch(V_value)
   case 0:
   getmarquee/w=trSpectrum bottom, left
   if(V_flag==1)
    Xp=(V_left+V_right)/2
    Xw=V_right-V_left
    Yp=(V_top+V_bottom)/2
    Yw=V_top-V_bottom
    getmarquee/w=trSpectrum/k
   endif
   make/o/n=(dimsize(trMap,2)) trCtemp=0
   setscale/p x, dimoffset(trMap,2), dimdelta(trMap,2), trCtemp
   make/o/n=(dimsize(trMap,0), dimsize(trMap,2)) XZtemp=0
   setscale/p x, dimoffset(trMap,0), dimdelta(trMap,0), XZtemp
   setscale/p y, dimoffset(trMap,2), dimdelta(trMap,2), XZtemp
   make/o/n=(dimsize(trMap,2), dimsize(trMap,1)) YZtemp=0
   setscale/p x, dimoffset(trMap,2), dimdelta(trMap,2), YZtemp
   setscale/p y, dimoffset(trMap,1), dimdelta(trMap,1), YZtemp
   variable/g root:globalvar:progress=0
   NVAR progress=root:globalvar:progress
   string/g root:globalvar:progressstr="0%"
   SVAR progressstr=root:globalvar:progressstr
   NewPanel/k=2/N=Complete/W=(285,111,739,193)
   ValDisplay valdisp0,pos={18,25},size={342,20}, mode=3, limits={0,100,0},barmisc={0,0}, value=#"root:globalvar:progress"
   setvariable val, pos={365, 25}, size={80, 20}, noedit=1, title=" ", value=progressstr
   Button bStop,pos={170,55},size={50,20},title="Abort"
   DoUpdate /W=Complete/E=1
   variable i,j,k
   for(k=0;k<dimsize(trMap,2);k+=1)
     for(j=scale2pnt(trMap,Y1value,1);j<=scale2pnt(trMap,Y2value,1);j+=1)
       for(i=scale2pnt(trMap,X1value,0);i<=scale2pnt(trMap,X2value,0);i+=1)
          trCtemp[k]+=trMap[i][j][k]
          if((j-scale2pnt(trMap,Y1value,1))==0)
            YZtemp[][]+=trMap[i][q][p]
          endif
       endfor
       if(k==0)
         XZtemp[][]+=trMap[p][j][q]
       endif
     endfor
     progress=k/dimsize(trMap, 2)*100
     progressstr=num2str(progress)+"%"
     DoUpdate /W=Complete
   endfor
   KillWindow complete
   duplicate/o trCtemp, trCurve
   note trCurve, currwave[8]
   note trCurve, "X1="+num2str(X1value)
   note trCurve, "X2="+num2str(X2value)
   note trCurve, "Y1="+num2str(Y1value)
   note trCurve, "Y2="+num2str(Y2value)
   duplicate/o XZtemp, XZ_plane
   note XZ_plane, currwave[8]
   note XZ_plane, "X1="+num2str(X1value)
   note XZ_plane, "X2="+num2str(X2value)
   note XZ_plane, "Y1="+num2str(Y1value)
   note XZ_plane, "Y2="+num2str(Y2value)
   duplicate/o YZtemp, YZ_plane
   note YZ_plane, currwave[8]
   note YZ_plane, "X1="+num2str(X1value)
   note YZ_plane, "X2="+num2str(X2value)
   note YZ_plane, "Y1="+num2str(Y1value)
   note YZ_plane, "Y2="+num2str(Y2value)
   killwaves trCtemp, XZtemp, YZtemp
   killvariables root:globalvar:progress
   killstrings root:globalvar:progressstr
   trCEP[0]=wavemin(trCurve)
   trCEP[1]=wavemax(trCurve)
   setvariable Z_tr, limits={leftx(trCurve), rightx(trCurve), deltax(trCurve)}
   break
   case 1:
   make/o/n=(dimsize(trMap,0), dimsize(trMap,2)) XZtemp=0
   setscale/p x, dimoffset(trMap,0), dimdelta(trMap,0), XZtemp
   setscale/p y, dimoffset(trMap,2), dimdelta(trMap,2), XZtemp
   make/o/n=(dimsize(trMap,1)) tempMDC=0
   setscale/p x, dimoffset(trMap,1), dimdelta(trMap,1), tempMDC
   variable slop
   slop=DeltaValue/(dimsize(trMap,0)-1)
   for(k=0;k<dimsize(trMap,2);k+=1)
     for(i=0;i<dimsize(trMap,0);i+=1)
       tempMDC[]=trMap[i][p][k]
       XZtemp[i][k]=area(tempMDC, OffsetValue+slop*i, OffsetValue+slop*i+DiffValue)
     endfor
   endfor
   duplicate/o XZtemp, XZ_plane
   note XZ_plane, currwave[8]
   note XZ_plane, "Offset="+num2str(OffsetValue)
   note XZ_plane, "Delta="+num2str(DeltaValue)
   note XZ_plane, "Diff="+num2str(DiffValue)
   killwaves XZtemp, tempMDC
   break
   endswitch
end

function movecontrol_tr(s)
   struct WMWinHookStruct &s
   variable hookresult=0
   wave/t currwave=root:globalvar:currwave
   wave trMap=$currwave[8]
   wave XY_plane=root:tr:XY_plane
   NVAR Zvalue=root:tr:Zvalue
   if(waveexists(trMap))
   if(s.eventcode==22)
      getwindow trSpectrum, psizeDC
      if(s.mouseloc.v>V_top && s.mouseloc.v<V_bottom && s.mouseloc.h>V_left && s.mouseloc.h<V_right)
         variable deltaz=(dimsize(trMap, 2)-1)*dimdelta(trMap, 2)*0.01
         Zvalue+=s.wheeldy*deltaz
         if(Zvalue<dimoffset(trMap, 2))
            Zvalue=dimoffset(trMap, 2) 
         elseif(Zvalue>(dimoffset(trMap, 2)+(dimsize(trMap, 2)-1)*dimdelta(trMap, 2)))
            Zvalue=dimoffset(trMap, 2)+(dimsize(trMap, 2)-1)*dimdelta(trMap, 2)
         else
           variable k
           k=scale2pnt(trMap, Zvalue, 2)
           XY_plane[][]=trMap[p][q][k]
         endif
      endif
      hookresult=1
  endif
  endif
  return hookresult
end

function tr_sv(ctrlName,varNum,varStr,varName): setvariablecontrol
  string ctrlname
  variable varnum
  string varstr,varname
  wave/t currwave=root:globalvar:currwave
  wave trMap=$currwave[8]
  wave XY_plane=root:tr:XY_plane
  NVAR X1value=root:tr:X1value
  NVAR X2value=root:tr:X2value
  NVAR Y1value=root:tr:Y1value
  NVAR Y2value=root:tr:Y2value
  NVAR Xp=root:tr:Xp
  NVAR Xw=root:tr:Xw
  NVAR Yp=root:tr:Yp
  NVAR Yw=root:tr:Yw
  strswitch(ctrlname)
  case "z_tr":
  	if(waveexists(trMap))
    	variable k
    	k=scale2pnt(trMap, varNum, 2)
    	XY_plane[][]=trMap[p][q][k]
  	endif
  break
  endswitch
  setvariable Xp_tr, limits={dimoffset(XY_plane,0)+Xw/2,dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xw/2, dimdelta(XY_plane,0)}
  setvariable Yp_tr, limits={dimoffset(XY_plane,1)+Yw/2,dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yw/2, dimdelta(XY_plane,1)}
  setvariable Xw_tr, limits={0, min(2*(dimoffset(XY_plane,0)+(dimsize(XY_plane,0)-1)*dimdelta(XY_plane,0)-Xp), 2*(Xp-dimoffset(XY_plane,0))), dimdelta(XY_plane,0)}
  setvariable Yw_tr, limits={0, min(2*(dimoffset(XY_plane,1)+(dimsize(XY_plane,1)-1)*dimdelta(XY_plane,1)-Yp), 2*(Yp-dimoffset(XY_plane,1))), dimdelta(XY_plane,1)}
end

function tr_export(ctrlName,popNum,popStr): popupmenucontrol
  string ctrlname
  variable popnum
  string popstr
  wave trCurve=root:tr:trCurve
  wave XZ_plane=root:tr:XZ_plane
  wave YZ_plane=root:tr:YZ_plane
  string name=""
  string mark="New"
  prompt mark,""
  doprompt "Enter the mark",mark
  if(V_flag==1)
    return -1
  endif
  switch(popnum)
  case 1:
   name="root:Ivt_"
   name+=mark
   duplicate/o trCurve, $name 
  break
  case 2:
   name="root:Evt_"
   name+=mark
   duplicate/o XZ_plane, $name
  break
  case 3:
   name="root:kvt_"
   name+=mark
   duplicate/o YZ_plane, $name
  break
  endswitch
end

function tr_fitIvt1(wavname, fitstart, fitend, cwave, C_constraint, hold)
  wave wavname
  variable fitstart, fitend
  wave cwave
  wave/t C_constraint
  string hold
  funcfit/l=(dimsize(wavname,0))/h=hold trFitfunc1, cwave, wavname(fitstart,fitend) /d/c=C_constraint
end

function CT_panel(ctrlname): buttoncontrol
   string ctrlname
   newdatafolder/o/s root:CT
   dowindow/f CTpanel
   if(V_flag==0)
      if(!(waveexists(CT)))
        make/n=(256, 3)/o CT
        ct[][]=65535*p/255
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(visiual)))
        make/n=(256, 3)/o Visiual
        visiual[][]=p
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(colorlist)))
        make/n=(30,3)/o colorlist
        colorlist[0][]=0       //2 colors #1
        colorlist[1][]=65535   //2 colors #2
        colorlist[2][]=0       //3 colors #1
        colorlist[3][]=32768   //3 colors #2
        colorlist[4][]=65535   //3 colors #3
        colorlist[5][]=0       //4 colors #1
        colorlist[6][]=21845   //4 colors #2
        colorlist[7][]=43690   //4 colors #3
        colorlist[8][]=65535   //4 colors #4
        if(V_flag)
          return -1
        endif
      endif
      if(!(waveexists(parameter)))
        make/n=50/o parameter
        parameter[0]=1    //gamma
        parameter[1]=0.5  //3 colors 2nd position
        parameter[2]=0.33 //4 colors 2nd position
        parameter[3]=0.66 //4 colors 3rd position
        parameter[16]=0   //builtin CT index
        parameter[17]=0   //low limit
        parameter[18]=255 //high limit
        parameter[19]=2   //CT type
        parameter[20]=0   //reverse1 flag
        parameter[21]=0   //reverse2 flag
        if(V_flag)
          return -1
        endif
      endif
      wave para=root:CT:parameter
      newpanel/k=1/w=(450,100,850,350)/n=CTPanel
      modifypanel fixedsize=1
      setvariable lowct, pos={90, 190}, size={90, 20}, title="Min", font="Times new roman", value=para[17], proc=CT_setlimit
      setvariable highct, pos={190, 190}, size={90, 20}, title="Max", font="Times new roman", value=para[18], proc=CT_setlimit
      button limitRecover, pos={290, 190}, size={20, 20}, title="R", font="Times new roman", proc=CT_limit_recover
      button generatect, pos={330, 190}, size={65, 25}, title="Generate", fcolor=(65280,0,26112), font="Times new roman", proc=CT_generate
      checkbox reverse1ct, pos={10, 150}, size={65, 25}, title="Reverse1", font="Times new roman", value=para[20], proc=CT_reverseCT
      checkbox reverse2ct, pos={10, 200}, size={65, 25}, title="Reverse2", font="Times new roman", value=para[21], proc=CT_reverseCT
      display/host=ctpanel/w=(5, 5, 395, 60); appendimage root:CT:visiual
      ModifyImage Visiual cindex= CT
      ModifyGraph tick(bottom)=1,tick(left)=3, noLabel(left)=2, standoff=0, margin(left)=7,margin(bottom)=22,margin(top)=7,margin(right)=7
      popupmenu colornum_ct, pos={12, 65}, size={100,20}, bodywidth=100, mode=para[19], value="Builtin CT;2 Colors;3 Colors;4 Colors;5 Colors;6 Colors;7 Colors;8 Colors;9 Colors;External CT", proc=CT_colornum
      popupmenu applyCT_ct, pos={130, 65}, size={100,20}, title="Apply to ", font="times new roman", value=winlist("*",";","WIN:1"), proc=CT_app2graph
      setvariable gammaV_1, pos={12, 97}, size={100, 20}, title="Gamma", font="times new roman", value=para[0], limits={0, inf, 0.01}, proc=CT_gamma_setvariable
      slider gammaS_1, pos={130, 97}, size={265, 20}, ticks=0, vert=0, limits={-4, 4, 0.01}, proc=CT_gamma_slider, value=ln(para[0])
      DrawLine/w=ctpanel 5,125,395,125
      CT_colornum("",para[19],"")
      setdatafolder root:
   endif
end

function CT_colornum(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave/t currwave=root:globalvar:currwave
   wave colorlist=root:CT:colorlist
   wave para=root:CT:parameter
   popupmenu builtin_CT, disable=(popnum!=1), pos={100, 140}, size={40, 30}, title="", font="times new roman", value="*COLORTABLEPOP*", proc=CT_builtin_pum
   popupmenu color2_1, disable=(popnum!=2), pos={12, 140}, size={100,20}, bodywidth=60, title="Color 1", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[0][0], colorlist[0][1], colorlist[0][2]), proc=CT_setcolor_pum
   setvariable red2_1, disable=(popnum!=2), pos={125, 142}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[0][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green2_1, disable=(popnum!=2), pos={205, 142}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[0][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue2_1, disable=(popnum!=2), pos={295, 142}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[0][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color2_1, disable=(popnum!=2), pos={375, 140}, size={20,20}, title="A", font="times new roman"
   popupmenu color2_2, disable=(popnum!=2), pos={12, 180}, size={100,20}, bodywidth=60, title="Color 2", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[1][0], colorlist[1][1], colorlist[1][2]), proc=CT_setcolor_pum
   setvariable red2_2, disable=(popnum!=2), pos={125, 182}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[1][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green2_2, disable=(popnum!=2), pos={205, 182}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[1][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue2_2, disable=(popnum!=2), pos={295, 182}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[1][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color2_2, disable=(popnum!=2), pos={375, 180}, size={20,20}, title="A", font="times new roman"
   popupmenu color3_1, disable=(popnum!=3), pos={12, 140}, size={100,20}, bodywidth=60, title="Color 1", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[2][0], colorlist[2][1], colorlist[2][2]), proc=CT_setcolor_pum
   setvariable red3_1, disable=(popnum!=3), pos={125, 142}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[2][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green3_1, disable=(popnum!=3), pos={205, 142}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[2][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue3_1, disable=(popnum!=3), pos={295, 142}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[2][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color3_1, disable=(popnum!=3), pos={375, 140}, size={20,20}, title="A", font="times new roman"
   popupmenu color3_2, disable=(popnum!=3), pos={12, 180}, size={100,20}, bodywidth=60, title="Color 2", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[3][0], colorlist[3][1], colorlist[3][2]), proc=CT_setcolor_pum
   setvariable red3_2, disable=(popnum!=3), pos={125, 182}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[3][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green3_2, disable=(popnum!=3), pos={205, 182}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[3][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue3_2, disable=(popnum!=3), pos={295, 182}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[3][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color3_2, disable=(popnum!=3), pos={375, 180}, size={20,20}, title="A", font="times new roman"
   setvariable cpV3_1, disable=(popnum!=3), pos={12, 212}, size={100, 20}, title="Position", font="times new roman", value=para[1], limits={0, 1, 0.001}, proc=CT_CP_sv
   slider cpS3_1, disable=(popnum!=3), pos={120, 212}, size={250, 20}, ticks=0, vert=0, limits={0, 1, 0.001}, proc=CT_CP_slider, value=para[1]
   popupmenu color3_3, disable=(popnum!=3), pos={12, 243}, size={100,20}, bodywidth=60, title="Color 3", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[4][0], colorlist[4][1], colorlist[4][2]), proc=CT_setcolor_pum
   setvariable red3_3, disable=(popnum!=3), pos={125, 243}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[4][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green3_3, disable=(popnum!=3), pos={205, 243}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[4][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue3_3, disable=(popnum!=3), pos={295, 243}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[4][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color3_3, disable=(popnum!=3), pos={375, 243}, size={20,20}, title="A", font="times new roman"
   popupmenu color4_1, disable=(popnum!=4), pos={12, 140}, size={100,20}, bodywidth=60, title="Color 1", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[5][0], colorlist[5][1], colorlist[5][2]), proc=CT_setcolor_pum
   setvariable red4_1, disable=(popnum!=4), pos={125, 142}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[5][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green4_1, disable=(popnum!=4), pos={205, 142}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[5][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue4_1, disable=(popnum!=4), pos={295, 142}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[5][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color4_1, disable=(popnum!=4), pos={375, 140}, size={20,20}, title="A", font="times new roman"
   popupmenu color4_2, disable=(popnum!=4), pos={12, 190}, size={100,20}, bodywidth=60, title="Color 2", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[6][0], colorlist[6][1], colorlist[6][2]), proc=CT_setcolor_pum
   setvariable red4_2, disable=(popnum!=4), pos={125, 192}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[6][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green4_2, disable=(popnum!=4), pos={205, 192}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[6][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue4_2, disable=(popnum!=4), pos={295, 192}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[6][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color4_2, disable=(popnum!=4), pos={375, 190}, size={20,20}, title="A", font="times new roman"
   setvariable cpV4_1, disable=(popnum!=4), pos={12, 225}, size={100, 20}, title="Position1", font="times new roman", value=para[2], limits={0, 1, 0.001}, proc=CT_CP_sv
   slider cpS4_1, disable=(popnum!=4), pos={120, 225}, size={250, 20}, ticks=0, vert=0, limits={0, 0.66, 0.001}, proc=CT_CP_slider, value=para[2]
   popupmenu color4_3, disable=(popnum!=4), pos={12, 256}, size={100,20}, bodywidth=60, title="Color 3", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[7][0], colorlist[7][1], colorlist[7][2]), proc=CT_setcolor_pum
   setvariable red4_3, disable=(popnum!=4), pos={125, 258}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[7][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green4_3, disable=(popnum!=4), pos={205, 258}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[7][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue4_3, disable=(popnum!=4), pos={295, 258}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[7][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color4_3, disable=(popnum!=4), pos={375, 256}, size={20,20}, title="A", font="times new roman"
   setvariable cpV4_2, disable=(popnum!=4), pos={12, 290}, size={100, 20}, title="Position2", font="times new roman", value=para[3], limits={0, 1, 0.001}, proc=CT_CP_sv
   slider cpS4_2, disable=(popnum!=4), pos={120, 290}, size={250, 20}, ticks=0, vert=0, limits={0.33, 1, 0.001}, proc=CT_CP_slider, value=para[3]
   popupmenu color4_4, disable=(popnum!=4), pos={12, 324}, size={100,20}, bodywidth=60, title="Color 4", font="times new roman", value="*COLORPOP*", popcolor=(colorlist[8][0], colorlist[8][1], colorlist[8][2]), proc=CT_setcolor_pum
   setvariable red4_4, disable=(popnum!=4), pos={125, 326}, size={70, 20}, title="Red", fcolor=(65535,0,0), font="times new roman", value=colorlist[8][0], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable green4_4, disable=(popnum!=4), pos={205, 326}, size={80, 20}, title="Green", fcolor=(0, 65535,0), font="times new roman", value=colorlist[8][1], proc=CT_setcolor_sv, limits={0, 65535, 1}
   setvariable blue4_4, disable=(popnum!=4), pos={295, 326}, size={75, 20}, title="Blue", fcolor=(0,0,65535), font="times new roman", value=colorlist[8][2], proc=CT_setcolor_sv, limits={0, 65535, 1}
   button ad_color4_4, disable=(popnum!=4), pos={375, 324}, size={20,20}, title="A", font="times new roman"
   button load_CT, disable=(popnum!=10), pos={22, 140}, size={65, 20}, title="Load", font="times new roman", proc=load
   titlebox external_CT, disable=(popnum!=10), pos={110,140},size={270,20},fixedsize=1,frame=2, title=currwave[7]
   para[19]=popnum
   switch(popnum)
   case 1:
     getwindow CTPanel, wsize
     movewindow/w=CTPanel V_left, V_top, V_right, V_top+155
     getwindow CTPanel, wsizeDC 
     setvariable lowct, pos={90, V_bottom-V_top-27}
     setvariable highct, pos={190, V_bottom-V_top-27}
     button limitRecover, pos={290, V_bottom-V_top-27}
     button generatect, pos={330, V_bottom-V_top-30}
     checkbox reverse1ct, pos={10, V_bottom-V_top-33}
     checkbox reverse2ct, pos={10, V_bottom-V_top-17}
     popupmenu builtin_CT, mode=para[16]+1
   break
   case 2:
     getwindow CTPanel, wsize
     movewindow/w=CTPanel V_left, V_top, V_right, V_top+185
     getwindow CTPanel, wsizeDC 
     setvariable lowct, pos={90, V_bottom-V_top-27}
     setvariable highct, pos={190, V_bottom-V_top-27}
     button limitRecover, pos={290, V_bottom-V_top-27}
     button generatect, pos={330, V_bottom-V_top-30}
     checkbox reverse1ct, pos={10, V_bottom-V_top-33}
     checkbox reverse2ct, pos={10, V_bottom-V_top-17}
   break
   case 3:
     getwindow CTPanel, wsize
     movewindow/w=CTPanel V_left, V_top, V_right, V_top+231
     getwindow CTPanel, wsizeDC 
     setvariable lowct, pos={90, V_bottom-V_top-27}
     setvariable highct, pos={190, V_bottom-V_top-27}
     button limitRecover, pos={290, V_bottom-V_top-27}
     button generatect, pos={330, V_bottom-V_top-30}
     checkbox reverse1ct, pos={10, V_bottom-V_top-33}
     checkbox reverse2ct, pos={10, V_bottom-V_top-17}
   break
   case 4:
     getwindow CTPanel, wsize
     movewindow/w=CTPanel V_left, V_top, V_right, V_top+293
     getwindow CTPanel, wsizeDC 
     setvariable lowct, pos={90, V_bottom-V_top-27}
     setvariable highct, pos={190, V_bottom-V_top-27}
     button limitRecover, pos={290, V_bottom-V_top-27}
     button generatect, pos={330, V_bottom-V_top-30}
     checkbox reverse1ct, pos={10, V_bottom-V_top-33}
     checkbox reverse2ct, pos={10, V_bottom-V_top-17}
   break
   case 10:
     getwindow CTPanel, wsize
     movewindow/w=CTPanel V_left, V_top, V_right, V_top+155
     getwindow CTPanel, wsizeDC 
     setvariable lowct, pos={90, V_bottom-V_top-27}
     setvariable highct, pos={190, V_bottom-V_top-27}
     button limitRecover, pos={290, V_bottom-V_top-27}
     button generatect, pos={330, V_bottom-V_top-30}
     checkbox reverse1ct, pos={10, V_bottom-V_top-33}
     checkbox reverse2ct, pos={10, V_bottom-V_top-17}
   break
   endswitch
   CT_colortable()
end

function CT_builtin_pum(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave para=root:CT:parameter
   para[16]=popnum-1
   CT_colortable()
end

function CT_CP_sv(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   strswitch(ctrlname)
   case "cpV3_1":
     slider cpS3_1, value=varnum
   break
   case "cpV4_1":
     slider cpS4_1, value=varnum
     slider cpS4_2, limits={varnum, 1, 0.001}
   break
   case "cpV4_2":
     slider cpS4_2, value=varnum
     slider cpS4_1, limits={0, varnum, 0.001}
   break
   endswitch
   CT_colortable()
end

function CT_gamma_setvariable(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   slider gammaS_1, value=ln(varnum)
   CT_colortable()
end

function CT_CP_slider(name, value, event): slidercontrol
   string name
   variable value
   variable event
   wave para=root:CT:parameter
   strswitch(name)
   case "cpS3_1":
       para[1]=value
   break
   case "cpS4_1":
       para[2]=value
       slider cpS4_2, limits={value, 1, 0.001} 
   break
   case "cpS4_2":
       para[3]=value
       slider cpS4_1, limits={0, value, 0.001} 
   break
   endswitch
   CT_colortable()
end

function CT_gamma_slider(name, value, event): slidercontrol
   string name
   variable value
   variable event
   wave para=root:CT:parameter
   para[0]=exp(value)
   CT_colortable()
end

function CT_setcolor_pum(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave colorlist=root:CT:colorlist
   controlinfo/w=ctpanel $ctrlname
   strswitch(ctrlname)
   case "color2_1":
      colorlist[0][0]=V_Red
      colorlist[0][1]=V_Green
      colorlist[0][2]=V_Blue
   break
   case "color2_2":
      colorlist[1][0]=V_Red
      colorlist[1][1]=V_Green
      colorlist[1][2]=V_Blue
   break
   case "color3_1":
      colorlist[2][0]=V_Red
      colorlist[2][1]=V_Green
      colorlist[2][2]=V_Blue
   break
   case "color3_2":
      colorlist[3][0]=V_Red
      colorlist[3][1]=V_Green
      colorlist[3][2]=V_Blue
   break
   case "color3_3":
      colorlist[4][0]=V_Red
      colorlist[4][1]=V_Green
      colorlist[4][2]=V_Blue
   break
   case "color4_1":
      colorlist[5][0]=V_Red
      colorlist[5][1]=V_Green
      colorlist[5][2]=V_Blue
   break
   case "color4_2":
      colorlist[6][0]=V_Red
      colorlist[6][1]=V_Green
      colorlist[6][2]=V_Blue
   break
   case "color4_3":
      colorlist[7][0]=V_Red
      colorlist[7][1]=V_Green
      colorlist[7][2]=V_Blue
   break
   case "color4_4":
      colorlist[8][0]=V_Red
      colorlist[8][1]=V_Green
      colorlist[8][2]=V_Blue
   break
   endswitch
   CT_colortable()
end

function CT_setcolor_sv(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave colorlist=root:CT:colorlist
   strswitch(ctrlname)
   case "red2_1":
      popupmenu color2_1, popcolor=(colorlist[0][0], colorlist[0][1], colorlist[0][2])
   break 
   case "green2_1":
      popupmenu color2_1, popcolor=(colorlist[0][0], colorlist[0][1], colorlist[0][2])
   break 
   case "blue2_1":
      popupmenu color2_1, popcolor=(colorlist[0][0], colorlist[0][1], colorlist[0][2])
   break 
   case "red2_2":
      popupmenu color2_2, popcolor=(colorlist[1][0], colorlist[1][1], colorlist[1][2])
   break 
   case "green2_2":
      popupmenu color2_2, popcolor=(colorlist[1][0], colorlist[1][1], colorlist[1][2])
   break 
   case "blue2_2":
      popupmenu color2_2, popcolor=(colorlist[1][0], colorlist[1][1], colorlist[1][2])
   break
   case "red3_1":
      popupmenu color3_1, popcolor=(colorlist[2][0], colorlist[2][1], colorlist[2][2])
   break 
   case "green3_1":
      popupmenu color3_1, popcolor=(colorlist[2][0], colorlist[2][1], colorlist[2][2])
   break 
   case "blue3_1":
      popupmenu color3_1, popcolor=(colorlist[2][0], colorlist[2][1], colorlist[2][2])
   break 
   case "red3_2":
      popupmenu color3_2, popcolor=(colorlist[3][0], colorlist[3][1], colorlist[3][2])
   break 
   case "green3_2":
      popupmenu color3_2, popcolor=(colorlist[3][0], colorlist[3][1], colorlist[3][2])
   break 
   case "blue3_2":
      popupmenu color3_2, popcolor=(colorlist[3][0], colorlist[3][1], colorlist[3][2])
   break  
   case "red3_3":
      popupmenu color3_3, popcolor=(colorlist[4][0], colorlist[4][1], colorlist[4][2])
   break 
   case "green3_3":
      popupmenu color3_3, popcolor=(colorlist[4][0], colorlist[4][1], colorlist[4][2])
   break 
   case "blue3_3":
      popupmenu color3_3, popcolor=(colorlist[4][0], colorlist[4][1], colorlist[4][2])
   break
   case "red4_1":
      popupmenu color4_1, popcolor=(colorlist[5][0], colorlist[5][1], colorlist[5][2])
   break 
   case "green4_1":
      popupmenu color4_1, popcolor=(colorlist[5][0], colorlist[5][1], colorlist[5][2])
   break 
   case "blue4_1":
      popupmenu color4_1, popcolor=(colorlist[5][0], colorlist[5][1], colorlist[5][2])
   break 
   case "red4_2":
      popupmenu color4_2, popcolor=(colorlist[6][0], colorlist[6][1], colorlist[6][2])
   break
   case "green4_2":
      popupmenu color4_2, popcolor=(colorlist[6][0], colorlist[6][1], colorlist[6][2])
   break
   case "blue4_2":
      popupmenu color4_2, popcolor=(colorlist[6][0], colorlist[6][1], colorlist[6][2])
   break 
   case "red4_3":
      popupmenu color4_3, popcolor=(colorlist[7][0], colorlist[7][1], colorlist[7][2])
   break
   case "green4_3":
      popupmenu color4_3, popcolor=(colorlist[7][0], colorlist[7][1], colorlist[7][2])
   break
   case "blue4_3":
      popupmenu color4_3, popcolor=(colorlist[7][0], colorlist[7][1], colorlist[7][2])
   break
   case "red4_4":
      popupmenu color4_4, popcolor=(colorlist[8][0], colorlist[8][1], colorlist[8][2])
   break
   case "green4_4":
      popupmenu color4_4, popcolor=(colorlist[8][0], colorlist[8][1], colorlist[8][2])
   break
   case "blue4_4":
      popupmenu color4_4, popcolor=(colorlist[8][0], colorlist[8][1], colorlist[8][2])
   break
   endswitch
   CT_colortable()
end  

function CT_reverseCT(ctrlname, checked): checkboxcontrol
   string ctrlname
   variable checked
   wave para=root:CT:parameter
   strswitch(ctrlname)
   case "reverse1ct":
    para[20]=checked
   break
   case "reverse2ct":
    para[21]=checked
   break
   endswitch
   CT_colortable()
end
   
function CT_generate(ctrlname): buttoncontrol
   string ctrlname
   wave CT=root:CT:CT
   wave para=root:CT:parameter
   string name="root:CT:CT_"
   string mark="New"
   prompt mark,""
   doprompt "Enter the mark",mark
   if(V_flag==1)
     return -1
   endif
   name+=mark
   duplicate/o CT, $name
   wave CTwave=$name
   note CTwave, "gamma="+num2str(para[0])
   controlinfo/w=CTPanel applyCT_ct
   ModifyImage/w=$S_value $stringfromlist(0, imagenamelist(S_value,";")) cindex= CTwave
end

function CT_colortable()
   variable colornum
   controlinfo/w=ctpanel colornum_ct
   colornum=V_value
   wave/t currwave=root:globalvar:currwave
   wave CT=root:CT:CT
   wave colorlist=root:CT:colorlist
   wave para=root:CT:parameter
   switch(colornum)
   case 1:
      string CTname=stringfromlist(para[16], CTablist())
      colortab2wave $CTname
      duplicate/o M_colors, CT
      killwaves M_colors
   break
   case 2:
      redimension/n=(256, 3) CT
      CT[][]=colorlist[0][q]+(colorlist[1][q]-colorlist[0][q])*(p/255)
   break
   case 3:
      redimension/n=(256, 3) CT
      CT[0, round(255*para[1])][]=colorlist[2][q]+(colorlist[3][q]-colorlist[2][q])*(p/round(255*para[1]))
      CT[round(255*para[1])+1, 255][]=colorlist[3][q]+(colorlist[4][q]-colorlist[3][q])*((p-round(255*para[1])-1)/(255-round(255*para[1])-1))
   break
   case 4:
      redimension/n=(256, 3) CT
      CT[0, round(255*para[2])][]=colorlist[5][q]+(colorlist[6][q]-colorlist[5][q])*(p/round(255*para[2]))
      CT[round(255*para[2])+1, round(255*para[3])][]=colorlist[6][q]+(colorlist[7][q]-colorlist[6][q])*((p-round(255*para[2])-1)/(round(255*para[3])-round(255*para[2])-1))
      CT[round(255*para[3])+1, 255][]=colorlist[7][q]+(colorlist[8][q]-colorlist[7][q])*((p-round(255*para[3])-1)/(255-round(255*para[3])-1))
   break
   case 10:
      if(waveexists($stringfromlist(0,currwave[7]))==0)
        titlebox external_CT, title="Please Load Color Table.", win=CTPanel
        return -1
      else
        if(dimsize($currwave[7], 1)==3)
         duplicate/o $currwave[7], CT
        endif
      endif
   break
   endswitch
   setscale/i x, para[17], para[18], CT
   controlinfo/w=CTPanel reverse1ct  //apply reverse1 operation
   if(V_value==1)
     duplicate/o CT, cttemp
     cttemp[][]=CT[dimsize(CT, 0)-1-p][q]
     CT=cttemp
     killwaves cttemp
   endif
   variable CTlength=dimsize(CT,0)  //apply gamma value
   make/n=(CTlength)/o tempR, tempG, tempB, Xscale
   Xscale[]=dimoffset(CT, 0)+p*dimdelta(CT, 0)
   tempR[]=CT[p][0]
   tempG[]=CT[p][1]
   tempB[]=CT[p][2]
   CT[][0]=interp(Xscale[0]+((Xscale[p]-Xscale[0])/(Xscale[CTlength-1]-Xscale[0]))^para[0]*(Xscale[CTlength-1]-Xscale[0]), Xscale, tempR)
   CT[][1]=interp(Xscale[0]+((Xscale[p]-Xscale[0])/(Xscale[CTlength-1]-Xscale[0]))^para[0]*(Xscale[CTlength-1]-Xscale[0]), Xscale, tempG)
   CT[][2]=interp(Xscale[0]+((Xscale[p]-Xscale[0])/(Xscale[CTlength-1]-Xscale[0]))^para[0]*(Xscale[CTlength-1]-Xscale[0]), Xscale, tempB)
   killwaves tempR, tempG, tempB, Xscale
   controlinfo/w=CTPanel reverse2ct  //apply reverse2 operation
   if(V_value==1)
     duplicate/o CT, cttemp
     cttemp[][]=CT[dimsize(CT, 0)-1-p][q]
     CT=cttemp
     killwaves cttemp
   endif
end

function CT_app2graph(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   wave CT=root:CT:CT
   wave visiual=root:CT:visiual
   wave imagename=ImageNameToWaveRef(popstr, stringfromlist(0, imagenamelist(popstr,";")))
   wave para=root:CT:parameter
   para[17]=wavemin(imagename)
   para[18]=wavemax(imagename)
   setscale/i x, wavemin(imagename), wavemax(imagename), CT
   setscale/i x, wavemin(imagename), wavemax(imagename), visiual
   visiual=x
   ModifyImage/w=$popstr $nameofwave(imagename) cindex= root:CT:CT
end

function CT_setlimit(ctrlName,varNum,varStr,varName): SetVariableControl
   string ctrlname
   variable varnum
   string varstr
   string varname
   wave CT=root:CT:CT
   wave para=root:CT:parameter
   setscale/i x, para[17], para[18], CT
end

function CT_limit_recover(ctrlname): buttoncontrol
   string ctrlname
   wave CT=root:CT:CT
   wave para=root:CT:parameter
   controlinfo/w=CTPanel applyCT_ct
   wave imagename=ImageNameToWaveRef(S_value, stringfromlist(0, imagenamelist(S_value,";")))
   para[17]=wavemin(imagename)
   para[18]=wavemax(imagename)
   setscale/i x, wavemin(imagename), wavemax(imagename), CT
end
   
function opengraphpanel(ctrlname): buttoncontrol
   string ctrlname
   newdatafolder/o/s  root:Graph
   make/o/n=0/t wavenamelist
   make/o/n=0 waveselwave=0
   make/o/n=10/t graphnamelist=""
   make/o/n=10 graphselwave=0
   make/o/n=(5,4)/t infolist=""
   make/o/n=(128, 128) graphtemp=0
   string/g wavnamestring="graphtemp"
   make/o/n=128 xpro=0
   make/o/n=128 ypro=0
   variable/g xpos=0
   variable/g xwid=0
   variable/g xavg=1
   variable/g ypos=0
   variable/g ywid=0
   variable/g yavg=1
   variable/g zval=0
   make/o/n=2 root:graph:x_EP
   make/o/n=2 root:graph:y_EP
   make/o/n=4 root:graph:pro_EP
   make/o/n=2 root:graph:x_V1:=#"root:graph:xpos-root:graph:xwid"
   make/o/n=2 root:graph:x_V2:=#"root:graph:xpos+root:graph:xwid"
   make/o/n=2 root:graph:y_V1:=#"root:graph:ypos-root:graph:ywid"
   make/o/n=2 root:graph:y_V2:=#"root:graph:ypos+root:graph:ywid"
   SVAR path=root:graph:path
   if(SVAR_exists(path)==0)
      string/g path="root:"
   endif
   string/g mark=""
   SVAR mark=root:graph:mark
   dowindow graphpanel
   if(V_flag==1)
    dowindow/f graphpanel
   else
    newpanel/k=1/w=(520,150,880,542)/n=Graphpanel
    modifypanel fixedsize=1
    setwindow graphpanel, hook(killpanel)=killpanel
    popupmenu dir_gra, pos={5, 5}, mode=0, title=path, value=folderlist(), proc=entersubfolder
    listbox wlist_gra, pos={5, 30}, size={140, 200}, mode=9, listwave=root:graph:wavenamelist, selwave=root:graph:waveselwave, proc=listboxproc
    listbox glist_gra, pos={215, 30}, size={140, 200}, mode=9, listwave=root:graph:graphnamelist, selwave=root:graph:graphselwave, proc=listboxproc
    button dis_gra, pos={150, 110}, size={60, 25}, title="Display>>", font="Times New Roman", proc=graphdisplay
    button del_gra, pos={150, 185}, size={60, 25}, title="<<Delete", font="Times New Roman", proc=deletegraph
    button update2_gra, pos={285, 235}, size={70,20}, title="Update",  font="Times New Roman", proc=updategraph
    checkbox selall_gra, pos={5, 238}, title="select all", proc=selectall
    button img_gra, pos={5, 260}, size={70, 25}, title="Image", font="Times New Roman", fcolor=(0,0,65280), proc=openimage
    button update1_gra, pos={75, 235}, size={70, 20},title="Update", font="Times New Roman", proc=updategraph
    checkbox pre_gra, pos={150, 140}, size={60, 20}, title="Prefer...", font="Times New Roman"
    checkbox plan_gra, pos={150, 157}, size={60, 20}, title="Plan", font="Times New Roman"
    setvariable mark_gra, pos={220, 236}, size={60, 25}, bodywidth=60, title="keyword", value=mark
    listbox info_gra, pos={5,290}, size={350, 97},frame=4,editstyle=1,mode=0,font="Times New Roman", listwave=root:graph:infolist
   endif
   setdatafolder $path
   string wavlist
   wavlist=wavelist("*",";","")
   redimension/n=(itemsinlist(wavlist)) wavenamelist
   redimension/n=(itemsinlist(wavlist)) waveselwave
   variable i
   for(i=0;i<itemsinlist(wavlist);i+=1)
       wavenamelist[i]=stringfromlist(i, wavlist)
   endfor
   updategraph("update2_gra")
   updategraph("")
end

function selectall(ctrlname, flag): checkboxcontrol
   string ctrlname
   variable flag
   wave waveselwave=root:graph:waveselwave
   if(flag==1)
      waveselwave=1
   else
      waveselwave=0
   endif
end

function graphdisplay(ctrlname): buttoncontrol
   string ctrlname
   SVAR path=root:graph:path
   wave/t wavenamelist=root:graph:wavenamelist
   wave waveselwave=root:graph:waveselwave
   wave/t graphnamelist=root:graph:graphnamelist
   wave graphselwave=root:graph:graphselwave
   SVAR mark=root:graph:mark
   variable i
   for(i=0;i<dimsize(wavenamelist,0);i+=1)
      if(waveselwave[i]!=0)
        wave wavname=$(path+wavenamelist[i])
        controlinfo/w=graphpanel pre_gra
        if(V_value==1)
          preferences 1
        else
          preferences 0
        endif
        if(wavedims(wavname)==2)
          display; appendimage wavname
          ModifyGraph tickUnit=1
          dowindow/k $wavenamelist[i]
          newdatafolder/o/s root:temp
          dowindow/c $wavenamelist[i]
          killdatafolder root:temp
        else
          if(wavedims(wavname)==1)
            display; appendtograph wavname
            ModifyGraph tickUnit=1
            dowindow/k $wavenamelist[i]
            newdatafolder/o/s root:temp
            dowindow/c $wavenamelist[i]
            killdatafolder root:temp
          endif
        endif
        preferences 0
        controlinfo/w=graphpanel plan_gra
        if(V_value==1)
          modifygraph width={Plan,1,bottom,left}
        endif
      endif
    endfor
    updategraph("update2_gra")
end

function openimage(ctrlname): buttoncontrol
   string ctrlname
   dowindow/f spectrum
   if(V_flag==0)
     setdatafolder root:graph:
   wave graphtemp=root:graph:graphtemp
   if(wavedims(graphtemp)!=2)
      return -1
   endif
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave x_EP=root:graph:x_EP
   wave y_EP=root:graph:y_EP
   wave pro_EP=root:graph:pro_EP
   wave x_V1=root:graph:x_V1
   wave x_V2=root:graph:x_V2
   wave y_V1=root:graph:y_V1
   wave y_V2=root:graph:y_V2
   NVAR xpos=root:graph:xpos
   NVAR xwid=root:graph:xwid
   NVAR xavg=root:graph:xavg
   NVAR ypos=root:graph:ypos
   NVAR ywid=root:graph:ywid
   NVAR yavg=root:graph:yavg
   NVAR zval=root:graph:zval
   x_EP[0]=dimoffset(graphtemp, 0)
   x_EP[1]=dimoffset(graphtemp, 0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0)
   y_EP[0]=dimoffset(graphtemp, 1)
   y_EP[1]=dimoffset(graphtemp, 1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1)
   pro_EP[0]=wavemin(xpro)
   pro_EP[1]=wavemax(xpro)
   pro_EP[2]=wavemin(ypro)
   pro_EP[3]=wavemax(ypro)
   redimension/n=(dimsize(graphtemp, 0)) xpro
   redimension/n=(dimsize(graphtemp, 1)) ypro
   setscale/p x, dimoffset(graphtemp, 0), dimdelta(graphtemp, 0), xpro
   setscale/p x, dimoffset(graphtemp, 1), dimdelta(graphtemp, 1), ypro
   preferences 0
   display/k=1/n=spectrum/w=(250, 50, 700, 450); appendimage/w=spectrum/t graphtemp
   ModifyGraph tick=1,standoff=0, mirror=1, tickUnit=1, margin(left)=150, margin(top)=150, margin(right)=30, margin(bottom)=70
   Label left " "
   Label top " "
   ModifyImage graphtemp ctab= {*,*,VioletOrangeYellow,1}
   showinfo
   appendtograph/t y_V1 vs x_EP
   appendtograph/t y_V2 vs x_EP
   appendtograph/t y_EP vs x_V1
   appendtograph/t y_EP vs x_V2
   ModifyGraph lstyle=2,rgb=(0,15872,65280)
   defineguide/w=spectrum X_top={FT, 5}
   defineguide/w=spectrum X_bottom={PT, -30}
   defineguide/w=spectrum Y_left={FL, 5}
   defineguide/w=spectrum Y_right={PL, -40} 
   slider xslide_graph  pos={200, 450}, size={360, 20}, ticks=0, vert=0, side=2, variable=xpos, limits={dimoffset(graphtemp, 0),dimoffset(graphtemp,0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0),dimdelta(graphtemp, 0)}, win=spectrum, proc=graph_image_slider, help={"Press \"a\" to control both x and y axis." }
   slider yslide_graph  pos={570, 200}, size={20, 240}, ticks=0, vert=1, side=2, variable=ypos, limits={dimoffset(graphtemp, 1),dimoffset(graphtemp,1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1),dimdelta(graphtemp, 1)}, win=spectrum, proc=graph_image_slider, help={"Press \"a\" to control both x and y axis." }
   setvariable xpos_graph pos={200, 475}, size={80, 20}, value=xpos, title="X", limits={dimoffset(graphtemp, 0),dimoffset(graphtemp,0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0),dimdelta(graphtemp, 0)}, win=spectrum, proc=graph_image_SV
   setvariable ypos_graph pos={200, 500}, size={80, 20}, value=ypos, title="Y", limits={dimoffset(graphtemp, 1),dimoffset(graphtemp,1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1),dimdelta(graphtemp, 1)}, win=spectrum, proc=graph_image_SV
   setvariable xavepnt_graph pos={300, 475}, size={130, 20}, title="X Average Slices", limits={1, inf, 2}, value=xavg, win=spectrum, proc=graph_avepnt
   setvariable yavepnt_graph pos={300, 500}, size={130, 20}, title="Y Average Slices", limits={1, inf, 2}, value=yavg, win=spectrum, proc=graph_avepnt
   valdisplay zval_graph pos={115, 490}, size={70, 20}, value=#"root:graph:zval", frame=2, title="Z"
   display/host=spectrum/n=xproimg/PG=(PL, X_top, PR, X_bottom); appendtograph/w=spectrum#xproimg xpro
   appendtograph/w=spectrum#xproimg pro_EP[0,1] vs x_V1
   appendtograph/w=spectrum#xproimg pro_EP[0,1] vs x_V2
   ModifyGraph tick(left)=3,tick(bottom)=1,mirror=2,noLabel=2,standoff=0, lstyle(pro_EP)=2,rgb(pro_EP)=(0,15872,65280)
   ModifyGraph tick(left)=3,tick(bottom)=1,mirror=2,noLabel=2,standoff=0, lstyle(pro_EP#1)=2,rgb(pro_EP#1)=(0,15872,65280)
   display/host=spectrum/n=yproimg/PG=(Y_left, PT, Y_right, PB); appendtograph/w=spectrum#yproimg/t ypro
   ModifyGraph swapXY=1
   ModifyGraph tick(bottom)=3,tick(right)=1,mirror=2,noLabel=2,standoff=0
   SetAxis/A/R bottom
   appendtograph/w=spectrum#yproimg/R  pro_EP[2,3] vs y_V1
   appendtograph/w=spectrum#yproimg/R  pro_EP[2,3] vs y_V2
   ModifyGraph/w=spectrum#yproimg lstyle(pro_EP)=2,rgb(pro_EP)=(0,15872,65280)
   ModifyGraph/w=spectrum#yproimg lstyle(pro_EP#1)=2,rgb(pro_EP#1)=(0,15872,65280)
   newpanel/n=imgpanel_graph/FG=(Y_left, X_top, Y_right, X_bottom)/host=spectrum
   modifypanel  framestyle=1, frameinset=0
   popupmenu imgtran_graph pos={30, 10}, size={80, 20}, mode=0, title="Transfer", value="Transpose;Crop;", font="Times New Roman", bodywidth=80, proc=trans_graph
   popupmenu imgexp_graph pos={30, 35}, size={80, 20}, mode=0, title="Export", value="X Profile;Y Profile", font="Times New Roman", bodywidth=80, proc=export_graph
   SetWindow spectrum,hook(resetcontrol)=movecontrol_graph
   setdatafolder root:
   endif
end

function movecontrol_graph(s)
   STRUCT WMWinHookStruct &s
   variable hookresult=0
   NVAR xpos=root:graph:xpos
   NVAR ypos=root:graph:ypos
   NVAR zval=root:graph:zval
   variable pnt, i
   wave graphtemp=root:graph:graphtemp
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave pro_EP=root:graph:pro_EP
   wave x_EP=root:graph:x_EP
   wave y_EP=root:graph:y_EP
   if(s.eventcode==6)
       getwindow spectrum, psizeDC
       slider xslide_graph pos={V_left, V_bottom+10}, size={V_right-V_left, 20}, win=spectrum
       slider yslide_graph pos={V_right+10, V_top}, size={20, V_bottom-V_top}, win=spectrum
       setvariable xpos_graph pos={V_left, V_bottom+35}, win=spectrum
       setvariable ypos_graph pos={V_left, V_bottom+60}, win=spectrum
       valdisplay zval_graph pos={V_left-85, V_bottom+50}, win=spectrum
       setvariable xavepnt_graph pos={V_left+100, V_bottom+35}, win=spectrum
       setvariable yavepnt_graph pos={V_left+100, V_bottom+60}, win=spectrum
       hookresult=1
   endif
   if(s.eventcode==8)
       getaxis/w=spectrum/q top
       setaxis/w=spectrum#xproimg bottom, V_min, V_max
       slider xslide_graph limits={V_min, V_max, dimdelta(graphtemp, 0)}, win=spectrum
       setvariable xpos_graph limits={V_min, V_max, dimdelta(graphtemp, 0)}, win=spectrum
       getaxis/w=spectrum/q left
       setaxis/w=spectrum#yproimg right, V_min, V_max
       slider yslide_graph limits={V_min, V_max, dimdelta(graphtemp, 1)}, win=spectrum
       setvariable ypos_graph limits={V_min, V_max, dimdelta(graphtemp, 1)}, win=spectrum
       hookresult=1
   endif
   if(s.keycode==97)
       getwindow spectrum, psizeDC
       if(s.mouseloc.v>V_top && s.mouseloc.v<V_bottom && s.mouseloc.h>V_left && s.mouseloc.h<V_right)
       getaxis/w=spectrum/q left
       ypos=V_min+(V_max-V_min)*(s.mouseloc.v-V_bottom)/(V_top-V_bottom)
       getaxis/w=spectrum/q top
       xpos=V_min+(V_max-V_min)*(s.mouseloc.h-V_left)/(V_right-V_left)
       ypro[]=graphtemp[scale2pnt(graphtemp, xpos, 0)][p]
       controlinfo/w=spectrum xavepnt_graph
       pnt=floor(V_value/2)
       for(i=0;i<pnt;i+=1)
         ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)+i+1][p]
         ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)-i-1][p]
       endfor
      ypro/=(1+2*pnt)
      xpro[]=graphtemp[p][scale2pnt(graphtemp, ypos, 1)]
      controlinfo/w=spectrum yavepnt_graph
      pnt=floor(V_value/2)
      for(i=0;i<pnt;i+=1)
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)+i+1]
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)-i-1]
      endfor
      xpro/=(1+2*pnt)
      zval=graphtemp[scale2pnt(graphtemp, xpos, 0)][scale2pnt(graphtemp, ypos, 1)]
      pro_EP[0]=wavemin(xpro)
      pro_EP[1]=wavemax(xpro)
      pro_EP[2]=wavemin(ypro)
      pro_EP[3]=wavemax(ypro)
     endif
     hookresult=1
   endif
   return hookresult
end

function graph_image_slider(name, value, event): slidercontrol
   string name
   variable value
   variable event
   variable pnt, i
   wave graphtemp=root:graph:graphtemp
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave pro_EP=root:graph:pro_EP
   NVAR xpos=root:graph:xpos
   NVAR ypos=root:graph:ypos
   NVAR zval=root:graph:zval
   strswitch(name)
   case "xslide_graph":
      ypro[]=graphtemp[scale2pnt(graphtemp, value, 0)][p]
      controlinfo/w=spectrum xavepnt_graph
      pnt=floor(V_value/2)
      for(i=0;i<pnt;i+=1)
         ypro[]+=graphtemp[scale2pnt(graphtemp, value, 0)+i+1][p]
         ypro[]+=graphtemp[scale2pnt(graphtemp, value, 0)-i-1][p]
      endfor
      ypro/=(1+2*pnt)
      zval=graphtemp[scale2pnt(graphtemp, value, 0)][scale2pnt(graphtemp, ypos, 1)]
   break
   case "yslide_graph":
      xpro[]=graphtemp[p][scale2pnt(graphtemp, value, 1)]
      controlinfo/w=spectrum yavepnt_graph
      pnt=floor(V_value/2)
      for(i=0;i<pnt;i+=1)
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, value, 1)+i+1]
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, value, 1)-i-1]
      endfor
      xpro/=(1+2*pnt)
      zval=graphtemp[scale2pnt(graphtemp, xpos, 0)][scale2pnt(graphtemp, value, 1)]
   break
   endswitch
   pro_EP[0]=wavemin(xpro)
   pro_EP[1]=wavemax(xpro)
   pro_EP[2]=wavemin(ypro)
   pro_EP[3]=wavemax(ypro)
end   

function graph_image_SV(ctrlname, value, varstr, varname): setvariablecontrol
   string ctrlname
   variable value
   string varstr
   string varname
   variable pnt, i
   wave graphtemp=root:graph:graphtemp
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave pro_EP=root:graph:pro_EP
   NVAR xpos=root:graph:xpos
   NVAR ypos=root:graph:ypos
   NVAR zval=root:graph:zval
   strswitch(ctrlname)
   case "xpos_graph":
      ypro[]=graphtemp[scale2pnt(graphtemp, value, 0)][p]
      controlinfo/w=spectrum xavepnt_graph
      pnt=floor(V_value/2)
      for(i=0;i<pnt;i+=1)
         ypro[]+=graphtemp[scale2pnt(graphtemp, value, 0)+i+1][p]
         ypro[]+=graphtemp[scale2pnt(graphtemp, value, 0)-i-1][p]
      endfor
      ypro/=(1+2*pnt)
      zval=graphtemp[scale2pnt(graphtemp, value, 0)][scale2pnt(graphtemp, ypos, 1)]
   break
   case "ypos_graph":
      xpro[]=graphtemp[p][scale2pnt(graphtemp, value, 1)]
      controlinfo/w=spectrum yavepnt_graph
      pnt=floor(V_value/2)
      for(i=0;i<pnt;i+=1)
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, value, 1)+i+1]
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, value, 1)-i-1]
      endfor
      xpro/=(1+2*pnt)
      zval=graphtemp[scale2pnt(graphtemp, xpos, 0)][scale2pnt(graphtemp, value, 1)]
   break
   endswitch
   pro_EP[0]=wavemin(xpro)
   pro_EP[1]=wavemax(xpro)
   pro_EP[2]=wavemin(ypro)
   pro_EP[3]=wavemax(ypro)
end

function graph_avepnt(ctrlname, varnum, varstr, varname): setvariablecontrol
   string ctrlname
   variable varnum
   string varstr
   string varname
   variable pnt, i
   wave graphtemp=root:graph:graphtemp
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave pro_EP=root:graph:pro_EP
   NVAR xpos=root:graph:xpos
   NVAR xwid=root:graph:xwid
   NVAR ypos=root:graph:ypos
   NVAR ywid=root:graph:ywid
   strswitch(ctrlname)
   case "xavepnt_graph":
       ypro[]=graphtemp[scale2pnt(graphtemp, xpos, 0)][p]
       if(varnum/2==floor(varnum/2))
          setvariable xavepnt_graph value=_NUM:(varnum-1), win=spectrum
          pnt=floor((varnum-1)/2)
       else
          pnt=floor(varnum/2)
       endif
       xwid = dimdelta(graphtemp,0)*(pnt-1)/2
       for(i=0;i<pnt;i+=1)
          ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)+i+1][p]
          ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)-i-1][p]
       endfor
       ypro/=(1+2*pnt)
   break
   case "yavepnt_graph":
       xpro[]=graphtemp[p][scale2pnt(graphtemp, ypos, 1)]
       if(varnum/2==floor(varnum/2))
          setvariable yavepnt_graph value=_NUM:(varnum-1), win=spectrum
          pnt=floor((varnum-1)/2)
       else
          pnt=floor(varnum/2)
       endif
       ywid = dimdelta(graphtemp,1)*(pnt-1)/2
       for(i=0;i<pnt;i+=1)
          xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)+i+1]
          xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)-i-1]
       endfor
       xpro/=(1+2*pnt)
   break
   endswitch
   pro_EP[0]=wavemin(xpro)
   pro_EP[1]=wavemax(xpro)
   pro_EP[2]=wavemin(ypro)
   pro_EP[3]=wavemax(ypro)
end

function trans_graph(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   NVAR xpos=root:graph:xpos
   NVAR ypos=root:graph:ypos
   wave graphtemp=root:graph:graphtemp
   wave x_V=root:graph:x_V
   wave y_V=root:graph:y_V
   wave x_EP=root:graph:x_EP
   wave y_EP=root:graph:y_EP
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   switch(popnum)
   case 1:
       matrixtranspose graphtemp
       variable tempvar
       tempvar=xpos
       xpos=ypos
       ypos=tempvar
   break
   case 2:
       getmarquee/w=spectrum  left, top
       if(V_flag==0)
          return 0
       else
          setdatafolder root:graph:
          duplicate/o/r=(V_left, V_right)(V_bottom, V_top) graphtemp, croptemp
          duplicate/o croptemp, graphtemp
          killwaves croptemp
       endif
       xpos=dimoffset(graphtemp, 0)
       ypos=dimoffset(graphtemp, 1)
       getmarquee/k/w=spectrum
   break
   endswitch
   x_EP[0]=dimoffset(graphtemp, 0)
   x_EP[1]=dimoffset(graphtemp, 0)+dimdelta(graphtemp, 0)*(dimsize(graphtemp, 0)-1)
   y_EP[0]=dimoffset(graphtemp, 1)
   y_EP[1]=dimoffset(graphtemp, 1)+dimdelta(graphtemp, 1)*(dimsize(graphtemp, 1)-1)
   SetAxis/A/w=spectrum
   doupdate/w=spectrum
   redimension/n=(dimsize(graphtemp, 0))  xpro
   redimension/n=(dimsize(graphtemp, 1))  ypro
   setscale/p x, dimoffset(graphtemp, 0), dimdelta(graphtemp, 0), xpro
   setscale/p x, dimoffset(graphtemp, 1), dimdelta(graphtemp, 1), ypro
end

function export_graph(ctrlname, popnum, popstr): popupmenucontrol
   string ctrlname
   variable popnum
   string popstr
   string mark="new"
   prompt mark, ""
   doprompt "Enter the mark", mark
   if(V_flag==1)
      return 0
   endif
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   string wavname
   if(popnum==1)
       wavname="root:Xprofile_"+mark
       duplicate/o xpro, $wavname
   elseif(popnum==2)
       wavname="root:Yprofile_"+mark
       duplicate/o ypro, $wavname
   endif
end 
 
function deletegraph(ctrlname): buttoncontrol
   string ctrlname
   wave/t graphnamelist=root:graph:graphnamelist
   wave graphselwave=root:graph:graphselwave
   variable i
   for(i=0;i<dimsize(graphnamelist, 0);i+=1)
      if(graphselwave[i]!=0)
          dowindow/k $graphnamelist[i]
      endif
    endfor
    updategraph("update2_gra")
end

function updategraph(ctrlname): buttoncontrol
   string ctrlname
   wave/t graphnamelist=root:graph:graphnamelist
   wave/t wavenamelist=root:graph:wavenamelist
   wave graphselwave=root:graph:graphselwave
   wave waveselwave=root:graph:waveselwave
   if(cmpstr(ctrlname,"update2_gra")==0)
     SVAR mark=root:graph:mark
     variable i
     string graphlist=winlist("*"+mark+"*", ";", "WIN: 1")
     redimension/n=(itemsinlist(graphlist)) graphnamelist
     redimension/n=(itemsinlist(graphlist)) graphselwave
     for(i=0;i<itemsinlist(graphlist);i+=1)
       graphnamelist[i]=stringfromlist(i, graphlist)
     endfor
   else
     SVAR path=root:graph:path
     setdatafolder $path
     string wavlist=wavelist("*",";","")
     redimension/n=(itemsinlist(wavlist)) wavenamelist
     redimension/n=(itemsinlist(wavlist)) waveselwave
     for(i=0;i<itemsinlist(wavlist);i+=1)
        wavenamelist[i]=stringfromlist(i, wavlist)
    endfor
   endif     
end

function listboxproc(ctrlname, row, col, event):listboxcontrol
   string ctrlname
   variable row, col
   variable event
   wave/t wavenamelist=root:graph:wavenamelist
   wave waveselwave=root:graph:waveselwave
   wave/t graphnamelist=root:graph:graphnamelist
   wave/t infolist=root:graph:infolist
   SVAR path=root:graph:path
   wave graphtemp=root:graph:graphtemp
   wave xpro=root:graph:xpro
   wave ypro=root:graph:ypro
   wave x_EP=root:graph:x_EP
   wave y_EP=root:graph:y_EP
   wave pro_EP=root:graph:pro_EP
   NVAR xpos=root:graph:xpos
   NVAR ypos=root:graph:ypos
   SVAR wavnamestring=root:graph:wavnamestring
   strswitch(ctrlname)
   case "wlist_gra":
      wave wavname=$(path+wavenamelist[row])
      if(waveexists(wavname)==0)
        deletepoints/m=0 row, 1, wavenamelist
        deletepoints/m=0 row, 1, waveselwave
        return 0
      elseif(wavedims(wavname)==2 && event==4)
        wavnamestring=path+wavenamelist[row]
        duplicate/o wavname, root:graph:graphtemp
        wave graphtemp=root:graph:graphtemp
        x_EP[0]=dimoffset(graphtemp, 0)
        x_EP[1]=dimoffset(graphtemp, 0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0)
        y_EP[0]=dimoffset(graphtemp, 1)
        y_EP[1]=dimoffset(graphtemp, 1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1)
        redimension/n=(dimsize(graphtemp, 0)) xpro
        redimension/n=(dimsize(graphtemp, 1)) ypro
        setscale/p x, dimoffset(graphtemp, 0), dimdelta(graphtemp, 0), xpro
        setscale/p x, dimoffset(graphtemp, 1), dimdelta(graphtemp, 1), ypro
        dowindow spectrum
        if(V_flag==1)
        slider xslide_graph  limits={dimoffset(graphtemp, 0),dimoffset(graphtemp,0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0),dimdelta(graphtemp, 0)}, win=spectrum
        slider yslide_graph  limits={dimoffset(graphtemp, 1),dimoffset(graphtemp,1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1),dimdelta(graphtemp, 1)}, win=spectrum
        setvariable xpos_graph limits={dimoffset(graphtemp, 0),dimoffset(graphtemp,0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0),dimdelta(graphtemp, 0)}, win=spectrum
        setvariable ypos_graph limits={dimoffset(graphtemp, 1),dimoffset(graphtemp,1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1),dimdelta(graphtemp, 1)}, win=spectrum
        endif
        if(xpos<dimoffset(graphtemp, 0) || xpos>dimoffset(graphtemp,0)+(dimsize(graphtemp, 0)-1)*dimdelta(graphtemp, 0))
          xpos=dimoffset(graphtemp, 0)
        endif
        if(ypos<dimoffset(graphtemp, 1) || ypos>dimoffset(graphtemp,1)+(dimsize(graphtemp, 1)-1)*dimdelta(graphtemp, 1))
          ypos=dimoffset(graphtemp, 1)
        endif
        variable pnt, i
        ypro[]=graphtemp[scale2pnt(graphtemp, xpos, 0)][p]
        controlinfo/w=spectrum xavepnt_graph
        pnt=floor(V_value/2)
        for(i=0;i<pnt;i+=1)
         ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)+i+1][p]
         ypro[]+=graphtemp[scale2pnt(graphtemp, xpos, 0)-i-1][p]
        endfor
        ypro/=(1+2*pnt)
        xpro[]=graphtemp[p][scale2pnt(graphtemp, ypos, 1)]
        controlinfo/w=spectrum yavepnt_graph
        pnt=floor(V_value/2)
        for(i=0;i<pnt;i+=1)
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)+i+1]
         xpro[]+=graphtemp[p][scale2pnt(graphtemp, ypos, 1)-i-1]
        endfor
        xpro/=(1+2*pnt)
        pro_EP[0]=wavemin(xpro)
        pro_EP[1]=wavemax(xpro)
        pro_EP[2]=wavemin(ypro)
        pro_EP[3]=wavemax(ypro)
      endif
      if(event==4)
      switch(wavedims(wavname))
      case 1:
        redimension/n=(5,2) infolist
        infolist[0][0]="Dimension:"
        infolist[1][0]="X Size:"
        infolist[2][0]="X Min:"
        infolist[3][0]="X Max:"
        infolist[4][0]="X Delta:"
        infolist[0][1]="1"
        infolist[1][1]=num2str(dimsize(wavname,0))
        infolist[2][1]=num2str(dimoffset(wavname,0))
        infolist[3][1]=num2str(dimoffset(wavname, 0)+(dimsize(wavname, 0)-1)*dimdelta(wavname, 0))
        infolist[4][1]=num2str(dimdelta(wavname, 0))
      break
      case 2:
        redimension/n=(5,4) infolist
        infolist[0][0]="Dimension:"
        infolist[1][0]="X Size:"
        infolist[2][0]="X Min:"
        infolist[3][0]="X Max:"
        infolist[4][0]="X Delta:"
        infolist[1][2]="Y Size:"
        infolist[2][2]="Y Min:"
        infolist[3][2]="Y Max:"
        infolist[4][2]="Y Delta:"
        infolist[0][1]="2"
        infolist[1][1]=num2str(dimsize(wavname, 0))
        infolist[2][1]=num2str(dimoffset(wavname, 0))
        infolist[3][1]=num2str(dimoffset(wavname, 0)+(dimsize(wavname, 0)-1)*dimdelta(wavname, 0))
        infolist[4][1]=num2str(dimdelta(wavname, 0))
        infolist[1][3]=num2str(dimsize(wavname, 1))
        infolist[2][3]=num2str(dimoffset(wavname, 1))
        infolist[3][3]=num2str(dimoffset(wavname, 1)+(dimsize(wavname, 1)-1)*dimdelta(wavname, 1))
        infolist[4][3]=num2str(dimdelta(wavname, 1))
      break
      case 3:
        redimension/n=(5,6) infolist
        infolist[0][0]="Dimension:"
        infolist[1][0]="X Size:"
        infolist[2][0]="X Min:"
        infolist[3][0]="X Max:"
        infolist[4][0]="X Delta:"
        infolist[1][2]="Y Size:"
        infolist[2][2]="Y Min:"
        infolist[3][2]="Y Max:"
        infolist[4][2]="Y Delta:"
        infolist[1][4]="Z Size:"
        infolist[2][4]="Z Min:"
        infolist[3][4]="Z Max:"
        infolist[4][4]="Z Delta:"
        infolist[0][1]="3"
        infolist[1][1]=num2str(dimsize(wavname, 0))
        infolist[2][1]=num2str(dimoffset(wavname, 0))
        infolist[3][1]=num2str(dimoffset(wavname, 0)+(dimsize(wavname, 0)-1)*dimdelta(wavname, 0))
        infolist[4][1]=num2str(dimdelta(wavname, 0))
        infolist[1][3]=num2str(dimsize(wavname, 1))
        infolist[2][3]=num2str(dimoffset(wavname, 1))
        infolist[3][3]=num2str(dimoffset(wavname, 1)+(dimsize(wavname, 1)-1)*dimdelta(wavname, 1))
        infolist[4][3]=num2str(dimdelta(wavname, 1))
        infolist[1][5]=num2str(dimsize(wavname, 2))
        infolist[2][5]=num2str(dimoffset(wavname, 2))
        infolist[3][5]=num2str(dimoffset(wavname, 2)+(dimsize(wavname, 2)-1)*dimdelta(wavname, 2))
        infolist[4][5]=num2str(dimdelta(wavname, 2))
        break
      endswitch
     endif
   break
   case "glist_gra":
       if(event==3)
          dowindow/f $graphnamelist[row]
       endif
   break
   endswitch
end

function entersubfolder(ctrlname, num, str): popupmenucontrol
   string ctrlname
   variable num
   string str
   strswitch(ctrlname)
   case "dir_gra":
    SVAR path=root:graph:path
    wave/t wavenamelist=root:graph:wavenamelist
    wave waveselwave=root:graph:waveselwave
    if(num==1)
      if(cmpstr(path,"root:")!=0)
         path=removelistitem(itemsinlist(path, ":")-1, path, ":")
      endif
    else
      path=path+str+":"
    endif
    popupmenu dir_gra, title=path, value=folderlist(), win=graphpanel
    setdatafolder $path
    string wavlist=wavelist("*",";","")
    redimension/n=(itemsinlist(wavlist)) wavenamelist
    redimension/n=(itemsinlist(wavlist)) waveselwave
    variable i
    for(i=0;i<itemsinlist(wavlist);i+=1)
        wavenamelist[i]=stringfromlist(i, wavlist)
    endfor
    break
   case "path_lf":
     SVAR path=root:load:path
     if((cmpstr(str,"New Path")==0)||(cmpstr(str,"<-- Change disk")==0))
        newpath/o datafolder
        pathinfo datafolder
        path=S_path
        if(strlen(path)!=0)
          popupmenu path_lf, title=path, win=loadfile
          update("")
        else
          path="Folder"
        endif
     else
        if(num==1)
           if(itemsinlist(path,":")>1)
              path=removelistitem(itemsinlist(path, ":")-1, path, ":")
           endif
        else
           path=path+str+":"
        endif
        newpath/o/q datafolder, path
        popupmenu path_lf, title=path, win=loadfile
        update("")
     endif
   break
   endswitch
end

function/s folderlist()
   SVAR path=root:graph:path
   string subfolderlist="<-- Up;"
   variable i
   for(i=0;i<countobjects(path,4);i+=1)
     subfolderlist+=getindexedobjname(path, 4, i)+";"
   endfor
   return subfolderlist
end

function removeNaN(wavname, v)
   wave wavname
   variable v
   variable i,j
   for(j=0;j<dimsize(wavname,1);j+=1)
     for(i=0;i<dimsize(wavname,0);i+=1)
       if(numtype(wavname[i][j])==2)
          wavname[i][j]=v
       endif
     endfor
   endfor
end

function scale2pnt(wavname, value, dim)
   wave wavname
   variable value
   variable dim
   return round((value-dimoffset(wavname,dim))/dimdelta(wavname, dim))
end

function pnt2scale(wavname, pnt, dim)
   wave wavname
   variable pnt
   variable dim
   return dimoffset(wavname, dim)+pnt*dimdelta(wavname,dim)
end

function FermiDirac(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[4]+((x-cwave[0])*cwave[3]+cwave[2])/(1+exp((x-cwave[0])/cwave[1]))
end

function FermiDirac_gauss(cwave, yw, xw): fitfunc
   wave cwave, yw, xw
   wave arguwave=root:globalvar:arguwave
   variable kB=8.6173325e-5
   Variable resolutionFactor = arguwave[152]
   variable  extendFactor= arguwave[153]
   Variable dT = min(2*cwave[5]/resolutionFactor, 4*kB*cwave[1]/resolutionFactor)
   Variable Pntsnum =max(extendFactor*round((rightx(yw)-leftx(yw))/dT/2)*2 + 1, extendFactor*round(cwave[5]/dT)*2+1)
   Make/D/O/N=(Pntsnum) gausswave
   Make/D/O/N=(Pntsnum) FDWave
   setscale/P x -dT*round(Pntsnum/2),dT, gausswave
   setscale/P x xw[0]-(dT*Pntsnum-rightx(yw)+leftx(yw))/2,dT, FDWave
   gausswave = exp(-ln(2)*(x/cwave[5])^2)
   Variable sumgauss
   sumgauss = sum(gausswave, -inf,inf)
   gausswave /= sumgauss
   FDwave=cwave[4]+((x-cwave[0])*cwave[3]+cwave[2])/(1+exp((x-cwave[0])/(kB*cwave[1])))
   convolve/A gausswave, FDWave
   yw = FDWave(xw[p])
   killwaves gausswave, FDWave
end

function SingleGauss(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[4]+((x-cwave[0])*cwave[3]+cwave[2])*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function SingleLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[4]+((x-cwave[0])*cwave[3]+cwave[2])/(1+((x-cwave[0])/cwave[1])^2)
end

function DoubleGauss(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[7]+(x-(cwave[0]+cwave[3])/2)*cwave[6]+cwave[5]*exp(-ln(2)*((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function DoubleLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[7]+(x-(cwave[0]+cwave[3])/2)*cwave[6]+cwave[5]/(1+((x-cwave[3])/cwave[4])^2)+cwave[2]/(1+((x-cwave[0])/cwave[1])^2)
end

function GaussLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[7]+(x-(cwave[0]+cwave[3])/2)*cwave[6]+cwave[5]/(1+((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function ThreeGauss(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[10]+(x-(cwave[0]+cwave[3]+cwave[6])/3)*cwave[9]+cwave[8]*exp(-ln(2)*((x-cwave[6])/cwave[7])^2)+cwave[5]*exp(-ln(2)*((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function ThreeLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[10]+(x-(cwave[0]+cwave[3]+cwave[6])/3)*cwave[9]+cwave[8]/(1+((x-cwave[6])/cwave[7])^2)+cwave[5]/(1+((x-cwave[3])/cwave[4])^2)+cwave[2]/(1+((x-cwave[0])/cwave[1])^2)
end

function OneGauss_TwoLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[10]+(x-(cwave[0]+cwave[3]+cwave[6])/3)*cwave[9]+cwave[8]/(1+((x-cwave[6])/cwave[7])^2)+cwave[5]/(1+((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function TwoGauss_OneLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[10]+(x-(cwave[0]+cwave[3]+cwave[6])/3)*cwave[9]+cwave[8]/(1+((x-cwave[6])/cwave[7])^2)+cwave[5]*exp(-ln(2)*((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function FourLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[13]+(x-(cwave[0]+cwave[3]+cwave[6]+cwave[9])/4)*cwave[12]+cwave[11]/(1+((x-cwave[9])/cwave[10])^2)+cwave[8]/(1+((x-cwave[6])/cwave[7])^2)+cwave[5]/(1+((x-cwave[3])/cwave[4])^2)+cwave[2]/(1+((x-cwave[0])/cwave[1])^2)
end

function FourGauss(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[13]+(x-(cwave[0]+cwave[3]+cwave[6]+cwave[9])/4)*cwave[12]+cwave[11]*exp(-ln(2)*((x-cwave[9])/cwave[10])^2)+cwave[8]*exp(-ln(2)*((x-cwave[6])/cwave[7])^2)+cwave[5]*exp(-ln(2)*((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function TwoGauss_TwoLorentz(cwave,x): fitfunc
   wave cwave
   variable x
   return cwave[13]+(x-(cwave[0]+cwave[3]+cwave[6]+cwave[9])/4)*cwave[12]+cwave[11]/(1+((x-cwave[9])/cwave[10])^2)+cwave[8]/(1+((x-cwave[6])/cwave[7])^2)+cwave[5]*exp(-ln(2)*((x-cwave[3])/cwave[4])^2)+cwave[2]*exp(-ln(2)*((x-cwave[0])/cwave[1])^2)
end

function trFitfunc(cwave, x): fitfunc
   wave cwave
   variable x
   return cwave[3]+cwave[2]*(1+erf((x-cwave[4])/cwave[1]-cwave[1]/cwave[0], 1e-10))*exp(-(x-cwave[4])/cwave[0])
end


// PNG: width= 108, height= 98
Picture ThreeDPic
	ASCII85Begin
	M,6r;%14!\!!!!.8Ou6I!!!"8!!!".#R18/!4?W$]`8$4!HV./63+16*9dG'!!Hq#9gJaZZ&]:j@0H
	W2!"!U8=`XQC%`A>I%`AC5.h3Ku!!!mY79FY1De=*8@<,oZ6"FnCAKXQ]@:s.LART+pEQMcS!!#pr8
	OPjDG[BdNGFW55\Mj<VmbKsJNmg-OcS4E"L-Z+J$46idJ:Ik8aq4e>.cu8#;3-#hP$'%YTI;!43N&9
	raZ7DeEVIbP]>*NSCTj=A`#6=:^[o)#O'=DUYGtb@hKkf?6e)NL1;\SAVP'eZ8kOsiQWEVHL51PLJ8
	\+!jluWoHMci-4U.P)B4lpHg[`K,W8>6Fm@4)V_nKV\Gd"d[\)G(:0SQdVMth_4gGdFti;]!e8rq5H
	Y;-Ib9"f^3]N8<DptofK?Od&&JGoN,s(jY;@+f?+HWo1Og=CferX/p^./!J:H8L8!n=Lnn9l<;b4hp
	<l7,>?ek9UZ-MHAYg^%#S2Qtfq:>u6$JrnN!ia-3^VLU&\M>q['E?F7#$#$8M5;uBX?G:0O>jXU;dB
	br;90\\4b0tBCs.?,ip>AVUM1N.s.7Wde=:gk4:6:%HIRS+1uKi(iMJT)lNGm=Z]"K\An$\b8Ur2"j
	QF'0cP.=t[;d.!-&pQ_&%&gOu`BH+sCk65d#G%RO\e;UmmqUGSYZiqtYs7Tsc&sb7Pj8QC/hE1n&EP
	K6sV$,'eUbJ\D^;8"bLuV;$jRTr;VOTNe1_l\&pSM45$hQ,+b'&f4r@C5W:kgC7.4ZpT;W;=nHRC/!
	DamGqQ.=Vr3$;V?W"*n%4::m(Eqt<`77\nn69:Z'5!NQXC;pWH,EUM?-M"n`n(Mhs)l9]?%q;ol`U+
	RR`G6M.>U=sDEf=1K6sUXVV+OBRGa'+K-,gb\qGO+ka!/_Uk.Njd&df]/`tm9f9bp0WD5:"&@klB4(
	]bQ7q"[^2A^j2c:s]1TmC?I3h*$2MlKLT1G9:;a3"h&^(7]Itk0BB/D=&tr&?nPHM+BHQMG2_=L.G.
	$dPaLd$3Wt88RXZF5q8G6[$p[#0nJWj;T]I$L8_&nOh$Vf%Fta/J'Qg')gCYrO6S`U/RNL(2(:'<q8
	jlabUW.O`RTIC%m-gTfD]Hf,/!%j;^t0G"7n>RQgNK]S;Ka0eJ69-mnf)G;3KF0Ja+m()ambO006^l
	d,,p4StNXf6urZ[RE$2C0>O@i/a?`YiIHFf%OMH`ACMn@;8sHu@Lk^9Q-VHJ=XX]`m#^Jr<&0GT-;3
	?UFX7VF:lHe23L/n)_gf6E?-`pp=%j3n#,FkI<FU,#o5rZ#W?`-@P:d*9UeE[I?s#3c:1m4(*QRg"d
	jURjlpIKkZ!piFgKNTZ=%%=/Jg=7:PKaN_[ep$"elFo)5Yk`O]"9@Z4Ju*A,6&X2es?!)*$@TiIH91
	i:g6lCeGdA#!*J#%bc*UF5Z4]k]+T2OO:"n;$6rN4"Tu#;W`"Hg7Q-GtK).Nl-%M4F8VguRT>1iI+W
	d(n2BF`np([8^>0YfljOr%W`EcmS8r'B4-Xe(C,$G&fb*Fk2>?&?EDN`XT\Ld2(6u?Xc.P2PrDTeg/
	%0coV^.PLBWO\VWIWPo>SctLHkJS&TVJ4P82-f2aduK.p"73=SS]<X@.^7h"0*)iK7'%%>:(9gd\6j
	r!RKOHP8Y?)tf,.U\cAIfJf&n.Y@YUm=:&m.R[:-M!$kVG&Sj;re;;6tsg*HD-pJdjrh"iYscYK;+(
	$g.=a=$,\>g[J0P:"8F!GjU3$0mnYnWX1YZpt7TnU*N])#;TS2:p[5MuJ8n;eo9jU.%eFRTE`W\F(o
	H4dXJF`H.?/pkm6I[.o3h!<LYc$&1c)>4S-<HS_m.9rB1D$MMXb&L6>>_2\s+,HJYC+XVU?Ar$Q6d!
	82ZKaM)8opbOqodAnDe'\X@:h"qllPQA!%6R:a#:EsBGVE^ifpQE0$!0lq#Vsl?,[*#c`<5`hrD[pN
	/pie<-dg]#B+i]i24#T%)N03iW"FUAk)#j+m<HIY*6mQ*b#h[Nc,UAJ^@4M$E56EX^lleb)%^b8Z)A
	"fg$2+JNt;mATI47RM]kXl@^.lt"I)uPUR\c3hdH/=1Y*gJ$tFG)mPOTcP"1Pa'Ek)_Q^ns;*<iHK`
	u'"[cudi,faF1g)=c3aOZ&hmP/=.7Y">B202Cp3fY1sPApn%d!%"Qc"$FWGLE+pA<h=G&O4mHMIFCi
	cIC1[aWQ6'!99[U4_>Lto-\5_FK/Cd)B:`l.",-gY-A1R-B[:tNJ>=(b;ILhU@>HQ9P3$JaCJQ<@`t
	;9@b;"JD30]^4/M./8Ongk7&N#QL7nn,[e_<"g4Ca>K@XgG,<)V$i"<]!eR<"RP_4liQb@VSn9P\&i
	?rbL'kSU:Ui1tMJUfV_1dO66gmf:&3hS'"3c48s8$044J]RhJ]g(FV<f]F;2XhJm/a?sWSR57O?3?0
	G9.)\]s1..Qg!kY*sC&HF*QZSRu9F)$g+)?9E-l`f&F@MuhD!MC%#^JhD,GYU'Q`\(3D_B(Gb;WltC
	EGm.25mOUj5j17&d_O(%cR39'6*O$ZS?gH1uq5M?HhT$%O2/,<(8RET`u6sji-*5*CQ?4>bRfVlEFL
	q0L_8&ae\5LI<)0Dq';"cOr0Ha*H/'U>oK\&?$C$9J_kjU\Gee#8X`T[8)r,FYdTFQ@)V5@*GH6D>,
	WjAViY8D$=HA**%SI?@eTli[>teh=[:f<$jG.77PMA2N%'bJR+bf#Wf!aC!J.Dq/Br7Si<L<]#7:\=
	9J]JN]:>E;&fEgHGR^6ip*IAWHo(>e$3M]t2$\7<L9_\tUKJZE8)OnJ0gbOINt%a70T9M=2W4c0O2C
	Z`'9M?3+K(X+nfpN#MMBJW?Y,Dlc[qN5<B*$4Q,t,!-LeBq#\fDni$92o<KQBDWX2-8PtGWP+:OX;'
	0quFA/)&P/eUJZR[>En<,n@s"qntPb5s+8$"g!85E"'=#-i&i58V*aG#;XO*#&2j).oBR!hljgU,3E
	*5kL_u8PH,o@G\)"3,!%OVUq%V*"?E+jGDI^J\hEg1OE-Ci49a%nAsT`*+U$&-8],HOU%R+erI1_hS
	QR`l]L5;b=!<f`3GJ+%Z7Sq.PVJ@1EJ4SBVA]hSA>"3SrWV:bX$Ag25SU#bHu1:nEMKuW2lmOh7gWH
	!!UpblV$n"KYqnn(^=\91V>V2J7;bV%a^D4dk_^m2Y@B.\'S/]#8SVHLX_[?T&oHsE$NH/PYmTRq%@
	M%'sP6(b7n[uY.P2$@G9WJ-V^11W_#BbWg#D>ldJ2Gl;ol$UQ:ULabo29X]rdK=;n,T^r*WdMi5nCP
	J%qq*"XfX/+.d"%kQC#.3U,<)>(%8L&?t=(n"Wg8S9]pq&fGe=u_.]euZZmF^'t%EFtDSdd9pV!_]s
	G&.B^]*p&=g';,s0G'.8/<=m3qCrWaOVAlitPe*A)&Mc^3TXl=@],*%SFT3LO^f+Jf<)lq-g\)XiZ"
	e^7q-[M,2fP;Ml?T$h_uL\k=Di_jYV)428*dCtE%,tLLCL3]<$!=g6MU]2R-3rT1JM?-M'TA0:Qeg_
	hgdUWo;;12YkaQ^JGp%OIN6L+q[aD3:>egE!gYFY7Em8DEm+,jD85%[JA(L<.a3CJ#?Z3j.fCZl%$m
	WZ`.bg4k]hA!g7N[0R;HjC1MSW@ljr+BF"bH_s"JW"?A18kgCUHf,%/[s&C:<^/[jh4cSNAENDrZ1Z
	S%kD?trCI$g(4$TsH(DlF9%:XH`f.+bLsqhR+(AlMLPKC<JE`6lCs(n]L0U9e'\/j>^k90$j_:..%3
	Qle%Ye6'Fqa"@um?fT0<0g8;\Kq@iL1ksS?2E#bZD.TlkJ)![aIe0]`iC1N]HWi@dM(;ZHiDe%mEcN
	$$cZ>i)USM2-5?@4&Bc8crh3!$=u1$Wi6F"q8s478UT_e1V^h.ZUs@K1jT-^T;LBac(L%u-fRGK2.P
	!>$fW/e2A\1k=r<54&-h)sDV@H";+4]\1PsGMsjXjMU/R4uJ/PgU:Nlf)SF=<X;Z-^i),%/@+r7ktm
	D*H)V2gdb-I;Sl1>RVN8X5EHRL*%aHu'7IUkgb<osA.6!O#DpW+'R$^HXn^`l"A>1Sa&o(=`^7"]-7
	HW;IeL&PF3rs.B1]*AX5buu<gu,^cc]t.0Qsm"546SZf4MmkR[_/\M*;R;RY<Mt3$EN#oX'BU>RYp\
	h]FZk`Hnet%<TDWsI@=.U/11FoRN@aL@.KbH;X5+ZDYZP[UA#/p"mh:'0#L,ICH:LD&6K,RREPWkEm
	ZpH2$Ek;XtGT$14EW]0!'?hFUYqV/;F#P!6619;b6EB-dG4\FqEE;DF[bj6dTN4=P(++2!g[5,c*J5
	.:KSZ=pFbVE71h-3-P!@qHKE(,+!&1!7Y#&;6c2#a\Ks+Q9AJEPpjZt9>KZIR$9;/8!A[**^^&Zm>G
	FX@KbG4P$E<PiD'U"\]JF<*K#Fg,hbUuT6OsqQq)Fd[W^@5F>8:<Z8^/\Q'\/ncs&]mXL#/#,8XhYd
	%g*WmOUC[#NW_+GLE\f[\R)78[rKp3*Usj3;-T5"65m97-8iNr;q01]o2F466h%j63'kL$nOu'J]8e
	2!<K)9b[Yfb!:stNLlt?1hqF#8O1p/*>>u!H?@mA(cFi@=S9`VHW:"TEg9#^`O=HBW;%d]b$FJf$gJ
	fAM!7h<GE;#t=0R\<NP*A;X5lk:5%\TN(_Fc7J_IQ1-AA[?F.kr`FjI37le^[[^80kShQHl2-&AXkO
	mF..-;79mS-pa/70Bp]bO.;LFnrh\'[aOa2'Lo%<-;:%dA9A"*X^-enYB+Nl[ZVFm<#g!6Y.=+$9Rk
	r&GbPbchf][/'Kp*6=Ifg>Wco-o2o'ZOaWVcQAVhCUZQP-T4)),Bb^5$A!`nmp8kRoa#DbqgcN6[X;
	_]gK[A<+NM6S3*=M\d<<1QP1KQ1I2R-J6"D`tKJMuN3.i[\=8b2Xm1rA7c.fk!-li](KBm)6J@S`W@
	U^J7%^$KGqBU.QnSacPW.<r8f>CrGR.bX@3]Z:V>l(#^:8/"NIr^g*GLDm)K'?cn`k17Uk!98@IT'k
	SJ///E0k_WF!EkbeZR9@5&`7$WoMA;EgO*#PeDdo9ZlQDq$i`:3Q$f[J`32kPC),AS*8bk+HjjaH("
	F)]O'QQe/5'(4SI`NjsX<Cr7IM5lRF>1@Z*AtXYeE#r\ge]MD0\8"nO^V8bg%HTajIK:t0kma;^RD9
	(J!@Go<`kA]M(RlgF=bru%Jf&'j"B.Kf28-\5lbb]l+b8BSSG@Y\$a2_e49ekM#>D28jKh($b<L/!V
	WD<4F7hG\&49XQETXep6k2gtKJnBSLGKHU_>=b4b406(:qQ_nO#AjdgGftQ78$[$h3Bg^X.u2Fb73A
	/4o0JNE7Ob3iS4gd6.LX&=O%)R2KFS`N\#-$2p`X:%ik^sPQ$E&Z"7kc9Ab+74YJuoM4lF@Xi@^]Nl
	O#D?\GrthN-8:8C-]F7%A"tO6l5"1^P#(<hP7rJYf^$OsW9^3[]f]-"Z_-(Y30fbge(T[-nn+&(iI=
	.l>Z@1k<SroFHJWYi5f0mi+P+1SRQt3T'n8<Z0Fn)$(FrFn@GMUt!Yjo@';Mn`sOENm5=e(rQ#<<*o
	2ogj/97Z0\G;YpZ-N[>X_^[J89hoa9E3#[RID0Rs<_C,)-`Bs,N-PgG0kg0VRL-t+V3=NZpDne;8[p
	E"\aD&rRG`VL-]hi9.F+aj49&)jU2cSKp7TpM1?LUb&WKnl7H!AFKK+^k%fN\:H-S:[dps!TMpaG8,
	B<JRJqA?hU3AiVPJZ8#'WFtoSMe-HV*G4a!#Z'm#Te>'!3`[-Ib&2;h^j6D1aTDIa*<;Qpeq^X,dd4
	pg'ZN0R3P);*3";WLA?Zr8s>c]25U!aMU.2;lT6VLG*XGSa#i/W`jZ#ESTI<7_m]Dc]LH2;5_<WJcl
	aW6c&]*%B2;RB5"Zr8,9#Y'VleC-d$jOu30puM:MH(<Hna<>tP&p-?52cH&>-,p4<):sFc?q0kXH[f
	.Pp<F_<Ulm.Jd3`Gb.*KRaTr%s"pt?N<I`>&Do]1q?pW:0Yf9Y6'n1]k_FTJY[i^1jQp+ZD](RIje<
	23nXgXOePL>tkr4?u`ORm\tuLKH(O.-Y3j^f.s=(se?tWBs1C!2G2f=]^KWf,V]Fmi=A][Hida(EX*
	.TfG7V.$PM5<S,p-V1Z,oAO.+Kf6C$^OT-lRIn$?ik#p;];2\OJ>``e4AdeCOVEq<N:?&D]Y/R:[r@
	drT#B8E4=6#9,(g!5N,\E(;`LQ(**&4]&a%rnVbbfDQR$3n#I7XOt87DfdnM!9h0Xp2m-7l-JcX00)
	L@lr`Jas`S[9Z2sbBQucBb,:uqVk(_:5,Xt,%qlZ"5j(.Qa$&JkOHe=hMg']F7B,S0s'UV5_.%K!&[
	?1,ISR8Y)(gtRA$8SgRss#3Xdjgf:fRo((UpPjltDnnB%GG"*WuC$d);mri(K1*.'$M6?GN:J+k<Y<
	mc%C0Y`M5^VF?@[&YLTEf=n52(5ltnr!lO?J!!Q\R@V+-B;$ec,">L4G[.j8)]RPgkdDfFlV8P-PNR
	r1fm1,Dn&%YNEN9HCjlMl>R=<p9XH/\.4"*s\4&)5jo5CYTTI@F4\m6EKmA\b?K['>#h@E<Zq?R;W9
	27>aAWIgFEV/0CCd#o0nB*6:W&o6Hjb);T7o?ckO@]HQoQ:_U4Q5Q\n.Xc$cPJs1s*'+KSP/UH&/Y/
	ruk:^3#a<AZQa6tA]L%?1PNcQfe0,I2PPKA]Am`eD,o&nDg3[/"=XK<9'_oLSQ&]*Q^/e=p['s,OD:
	#/q_XP/=,4TC4pg+Y3Xf8G,_?W2DqspnhYeQ9,S-Z.BousYF5R*q>qMhIV:,T1\EIO0Fo7Z[q#%0pg
	R"ZroFiX)6k,:sp0hpM$r8P6L<onXf=:.UO.gXh*qXSt+\/Frp<*O7OT"cl]iW41A@M/%;iY0k]PS&
	!WpAUsYC\E*NiXmimT9OmoI00GO(0KL[<K1h<./aI:.*M:N^hDKWl8&9[8Tu]Ol__a37FI@N0P#Mie
	dq!fK29P@orR?pr4&QopSR20ne0..-!M_L8?c`@hdpr/k]F$/L4W/o(K-BTMqd((HqCm_&CkJcqO/p
	EJUe/EU<bqEpg@4i4J[gKJ#G0p!<UH41kBOZl*+LUkJp#KWo(DT[gEk)Dd0%^=6@_.ZZK6P.06?0jJ
	tqO]]>,4h^"aE[.F569t#=rR:Q:^KlW`IdU-:oDE*CpsI-]HFYZg!h7)<gma-GQ0MT^oMSF<;hnmKY
	c8$"4e%SliMUFTH:/lJAs]6)Lc-qEAB`Bkcnq%&YslPq%ts4aF>H.ZCXi5B-Up7%*o[q374$Qi]=4N
	q],(I6ZiDaBJG.$$V_("6-,9F6:r`aF\bsGiZYQ)rUWqFN3"RZY/;*Ti<)s=AU]SLc()lGb\XG-f1P
	2u)D#Fg&2#Ju<]QOA!)eUAE4:euRG5QAU%X5@rL5A_)&aPad6+[nK_%=;#c'VoAc5=@.!`811fI[.b
	fL1`nbDkG9'5&QI2Mad`qs_u$+30A5]`EWYq2^WioG3%HG+a=(eh;Ia>IJCT4i9"M1L=$&7^IoZ9_b
	BJ#aX'dft@W]>SH7T$h.6F2%*HX5iAHaUL[8[b]@.u*$(&OWHg)b$TbUW/`?k8`YbKM8-a_P/U@oSX
	,fUCFiP`>jCrqEg;*DjpWf=s4_HZB2QoFRf7mo;N=foQ)!*pd]RUV9l;P;\U.'@uZq]<a/F1d0.YTA
	*0^WU'hsu#*lI*OaNANE/%fK?WPq=Db)38ac<!;JiOQ*9i`kf"OJ"8b2:JAsiZK6R)qb&SOF__f!Zl
	,D1#*^imoP*7/JKb2`R:*@:H?,s!XMDF?4h1H/M_K:$'mb),K.k]-I(UK!_(K9X?!Jh&@)]-gk`619
	<4Ce/jP.IdENOdAheY,4`\N-H(9X<5$)2k4Z\WgB8"d9o^*o=%X=RS@(1:rI>@F7EfVD.QAV/iV(CS
	TS,"j',>'3`6T0Bau02uaQj%lgH):ro&\q:Ts57$4=4Y"V1Q;_M'(MIJI1s#n@H!s!,o7)28Pb-:f[
	d;X.o1;.;#au)lpj"Xem.Q#D%0&>U*o5-7[&,Z$C07lg"M%PN)9G],lGdCo.XD/r-d5!'GY2+]1P2t
	AiTb1=332s7<OhI,$aB$<;t-^)?IUWW#4GCR@N;&o1,^TR"J.a6$l?g0F=MGZH"`CN7PgW]AeF<hI3
	/[*2B^l6JS^Vg`e;UkFqV#=<<m5NRiI+k_=f<,H1EA/Ta2n],.g=kqueV"0G/`&hF;+]K*t3*q0!fq
	RZcgK&o@^)M[MKLg5mS7WjIh8?TkV'c^(`N2erXp*XO#3DPE\<Ten^TN,aH6eWCpH>J^OR*>j*,R+'
	t?L]s=dY:HV)NC%udSfQ:5djRn*R'%.p7#;87?l?Iq:HfW+mk2Q-#:D6Oo5^LNO>R*\77/Jsg[3I2F
	FcK35P.?#9KNBBPNO.3.472T:Tn[0jB<OLckM^Gf?p'<`Nf"F_]M+T&F2R9Jtk6<NpU-N`2]%(Q`$[
	XVl3omA;VcFZCN9^=WDYF9V<noB=G<YeqBp6:;rUIfbYl#queUf!G^NJ"i[llV7Qd%!XC(n=hlkl-K
	G(r"jL*XU.s*Mf/@Y_S:Ca9JilUs_K[,e0X`?jPa>m,]4gYrnU>k^YRZ-nDoBUPGmp$@E0=+Ocm((N
	<MPMQ[tLWo7iU`kBBU^V5*"6dK,GNEU`hc9!l0D<T]"56;D=B7^3Spf96lIGl;NG^8KggJ#uM@+k1O
	PpV.VD?'Kc<c"KX_gJ;)b7`X(DXOj5d1bW-*1SrOE.bi\$l>^k*HD#!>`3;%\ITY;n/+<:s<*S#]5C
	^,:p6lI$7_bZkYDqF]V,>QRF5frOM42rMk:1a441IINgOfG1V&Pp-G!Xm<+HWO6iL<5NBiuI]g\3Qs
	lc/r\BMUJ<:.5",c6ouD/[*l[m],<*ffE`@!::8VG*euF;\"<qAnoKCS76?%,3&^#1b6)"d<)Frk\$
	,oE272>L\h[g6Po/)@NoS[g5,hsN2"FI3LlZ<'(D'tO:7O!FdS+I9;^VCA6c?9Mg4f&SmZ+i&V&^Q1
	&19[V=.Uj7bt)-e]d#Zn@D^&Sm$:.]^:#?ZQoT(7T)&:5fQgU-*kUSb<,c,_oqc<]_<]FaI@iS9Q^i
	6/4`m].o*2YN;4J&2T+UB`P=1?+%kTa\Vu+!DiAsN$R+X3[QYLUp1Mp<g'U*3(GO9.cb[XC&>/IWMO
	iH&[Ngks,$$04Gg7Ft#'PSo*&ZKF!.!;$$l<A&2:^(\g]hSUl@i\m/5?,b4=YgE\2!^:WbVL3XAt3]
	a"*nE**QM`7iB-.<R)TH#%TT/I7%agE[^AH\&FEHH9a4?8T:\Ag_*6(bM#\d!r\E2&!bf4pERJBJO]
	HU*(R!go'PYp8.G>1H%N:[!j&d9TmdVl[jpEUkYfs8TD%/Oi0;-'ENLIk%S9;\*I,`M!r;9&l_t\6E
	ZtBCq_G6i,9<5,nQ=M6T%O4;*2.JO_fnsGArZ$rWDaK$]8_jq&457ST!kg0DN2[2F"PS3!3V-&[6?!
	30ADD9+2G^+(S;'p6Rd?:\(Xig`l]f5TCmO-jj!+ZD<7)fjc+[&?$G6@%7<>*?%i3KS-T:4V)If:'P
	H1mm)6,VM>n8#K($i].80i"aXo61C+/Pqf^r8L\klI:eY/a-?=<LM$Pb&d<pjP@X-5GYHen_@^Voh-
	l>DF7T[6*FXB%*8/,#CC?KZ%S.EJ04me`OtQMaenf$C"LBNs&OiZ5_N0'?H;TKJT^b4]'9DL2#\UWj
	2]fS9[moq#hc8h8=JanT&I#\f3XR;pIrMN-1TjQg4)@'8+6dep%\R:HjGo5%H.4&Y4.X.N0ZX=uVK)
	M5VIS"i8>bc<U+bJXEO17C.t>@oLn2*9!?YN$<]/RKbN%6tQQ]dE-Wbm?Xgf%T\mK$$t@6d6tA:#f:
	,)p*M(_!_Jm0!J9I9o>FmR:FapC]+q(#7>[=Pq=KbH[+^g)e<_#0H@Qlell_);EnN^M!MuK',)Y8iG
	?KTNj_c&1b4K(uD,og%Y<(U!NA1\=h(LOaBDP@Xk,W(j:W(8[*mh"OU2X@9,;Q5D^A@Nk+Ab3=k?W$
	90)`_<ip%J#`1#5Wcqr>Mb.8oV%Af.t94E^'PZO`lenb6;+j?ZR&#tdV:6;@8((Rn_2%sVr[Uh4oS!
	jnjVM&quLfn2UkRh+GZVo#,6=ee;VNOD@HUun*A997$dk6G:""Y,E.7:m=Mc@#F=\W.P(F$&ZAqQTn
	Oslf#lpm8r*#p$2m3<.o+/D&pN@a,KVk$mO>Zl],QE$:ECD'b=La+Tr"ABH.>=IPYb_NST/C]_%&Q;
	g5VmmUTG-9LH_ep)gXJE0jbZNfu?pP7&%D0Wf:m@OLonb&8bfOL+_PG*>rLa#=>j0<:FT8767q\\-h
	tYm"3:H.unX%!TKlL?Aj="G`JT?^t6k\O[V!@8Mk^a4P_XojeRkbqj9eE:a5FuYuH;nlYA$8,]D?9"
	-#t+iSUuJS0ic]O8d\/B"WLgL(>XIQZBW3-)$aHfjq'1CmQI]4@N/ER%CXrk1c$3RUJ$nB$`@INkW-
	q@n3"c&kejiN@1dLpa^o3:\m8`jSHo*oRYWIRHLkPC_5Kut^B/WCm.EIfPMWH!sAS)7*TK3l4dcEAG
	R?l]o>&ffVIE^18FggMtfh#d%<Sp7&r[BJ6i$3JZfg_3i\b4G6d,%GdPcCgTl^jPbP;.(R>_JPXiLX
	[_iK$dJAC!&H?_-uE(`[3aA,+Sn<>>jGs%SqB(\Qf9U2JD(eBrHJd%7[&dZGq5N=cD_&QP>l(*%Fm*
	37(m'$31sWZ"f3;N#^nP_0JB95)5M7IATtb_C:!o]1$\m0X[48*pX3#F9tq9VnR=)#.Ua#HH];4Vge
	L%$an'0V0P^aq:CMCI*X<:j]!(]U)dK'@OI'UdHes#U`BW;L=^8C-i)8O5'i-7$_<G-WM?mf1a&_AJ
	-2!0M`\9Cm%F1+[KmEXhn$(50X&g3aD:T+(O0/l."gb=`l<p*^9bW/^mPH4;m7FR.?\,e2N>]92:hB
	D5qltDI+LtD62lf%][k/C1K)FZqR$DL5F/gWNX0,H>3nO!2?hnNbQKX8"n0Yfk.*LC[j)SMr89-V:5
	XZ3NB^Db00#m*K>bQ1IOl2L8dKt/DtW6;D,^E.kG<_<4ru-[QGU&d]#+(-@rk:-?Z@K-UrB(NU?X6.
	g]I8r>EH<N.$t1dK_8ETdRch\&';kGqDe[QKhJR2#3ZR8=dY<Bd6Pi%WcB#_5Ojh9L-_@3h,8`(4^]
	X4;s45X$RcWD8N>,]R\<kYQj>lS+4YGfAUA'^4cF;s+)]8p2q?:G7*>XIG33qUOopDnS&f1l:?tuV:
	`3n9qE1BStnq0l%36Sd%Yi6F$1l#7*n>plD&0JbS"1o/r(-$TX,K/;t6sRV.h=AdW:Rt9?#c;o_T2q
	4]=X<W>a2W8F&NX8?76>6qsC,cXf:Q2TuJ8q-5gN?Qhq245Qq7GUdR^7)k&.bSsu?_lONFB,D`;HO/
	.m;G_2F3`nF8^]^7!)"j$RFkJO00gfZ==%_D]+=!>DI:[4s0.ZP'8Y"?4*c\@)&UT#:L9j#]%HF?Nr
	AgI!k#j6B^'_Jq\(T6AF6Clc236OP_nU:4?-lb+qpE[`i=GCmWbEj?PMc3dhESU^]2lV)T&&.`m-?u
	QYS[+W!_F<q3#OBK&n<6<OtHb_LAAA$dqis*FA`h[Q6K%m2Se!.8/3Cm.$b/]d4$E01SlMklph@;0L
	1`D%S>B!%T"t6-QFN@)LNtE4aN]4H)X)\7B;(Mdp+jL:BZJqOrcF*Ahut*FMBD%H]tr%lt&tN4hIjS
	nOZM%&k%%b&Aa5rg,`l$N%Rke.Z#h1B!PbN+kj[fGq(oZU=>p`efG6g)7G"P<R!@WTfF.kVmN%lW33
	;CRr9q!)'?MQ3k5SVgit?pq8eirhN)T]D43oqfosM8B3SlE3-H3(s6H.ndWb.H\FCDP\GaIXkptZ.?
	_arH_qfOqSG<C5^3'V5=1u`/XOiA"0Ylr.-[J=uXJe6_!N%_ON\lu?Ep8i14_NE6b+h+^75p:DfRNu
	\U;DpR`d%#_1sJD&SoYO/HS7H-d!,ge7T@3q91cCmS;]S:-!ArafDVjmel*.<l=3/%"(ocM[n<i+St
	)AYfsPr)d_-[`%;OmJI;:d>N;>Fe(e8jO2:;W#8=F>q)PV+0'VtS(&9(O$\h((]jg]]"rhkmTXu+["
	!qjp:,YTM,X``fMI-Qof6l#+9)%4d/bHJWGkFn<7;C+6Nj/qF4E5e`hJ8;oE,EhFU3#Y"flU^$U)gd
	[7eVJ!joH3kdD>2BX3>HDGGlZ`r>Q8ZF!>k\10jOI>=&??pHt5)rfjR+aWD.]&6&&\RBLuK\C*lJUe
	"=dV24;A-rZl[Sl,'S4>EE`@`K51)f.g`r-EQtq8_%5)O#mXfpV%T78*@aKhg("qffeI*I'[7_OQ.L
	lW&*&pFSReFSc0YjA.d8mANie(Y/0I-P;.LJ'YM+f2``n$62S5^khEKGWP/iVW'te28di]MQ(p%9"^
	,RFUIni;V/LahgQp8'S*6%C<*U?eifl?n*^(8e&ilp\+f=W<m9;=".fO8%0QpI?5[A)efCd,fQ'Jdt
	Ga.9QFG#>S?9)&hh2K*5r`@5t4-kb4=PAtYO#HZ?>C?[X^%E&KlkfC=3r<_%4SCmdG58!0Y8b63K;R
	,3;>j,caH@!OVJa^N`ge%_j+mh1WOb!3`NXDR4*Ia`N8<gN@Fr(*#c>6$q>:<KOM-oqWJ]OT;&bN.S
	r'8B1Hf1n@&-(F8Ag;[MDGk,8^\lG,[!0;A>j*,Pi-4V-qAbo=st.ZU:3?u&#X/6,Md>-c[UHehYSh
	Q*BYDa41Cr$m@3=pYS`oMQ_6b@(q6A=FkAF=KZ/^?70'__@tbu/G#*VPc@[*s&:kHH(2#gFFt-9@*G
	AuBR\qPM=!#n`D4UIDkAS3nHce);JTcG'#JWZ$BaVt5G"P1CKhRZM+>U2sc2ajkh4rs<*VKGT,'Y&9
	)>mlP+("#95BkR&pu7oqL$O6[0^ebU/QeNcDKO$g6`D8Jiag[gJu5s/J/7BTh6p+glL!-S]ll9eeuq
	@%VA7aoIQ?PNYI8Z-KPlV6ZY10H2,G;glC;$U^&]P,N&IHZGX0$50ujAfQrKcNe`c0V-5m^&<8"Nuh
	R$+H'<%q"$Y&Zun':$/9>C#?kO@&W2I(7A+kZA[+6(sBYMbYgYJVK*len?lLaP1H-adoV`AnlN*<hf
	W")0lnV98XrK-:mCTYhq\.,#@oajU;O8)kt86j$BH1-L]<0Z"^=QF7udc8>lGgkhB4Hk#MsjMr]F`p
	i*EIR?nJ"I[a>15S1g-5#Ejp,cB$bq219U"\oW/Yei0D.r*+r'#\DUEb>FkTt\T2+tP]5_?emDWji^
	S.3S08t]aNbd0^l:,H$?Yk!d?WGYb0C\o%BZu)^u)TLHCS7\r`20)tL)l9,@bcYqZp:_;JG"kTHKg2
	/qVt%r2$:qIWPoQ`K`fTeJ5`KaR$sQu\*TgmEdY9)#Una)pNGGK0DdQ\/Vd=`Y\(l9g0#-Woh"0lYb
	\R^JWLnPBgGZcs>CQ;l3js&9E3_t`.QC6+`qGC"`[=_FgEfEHVi(Pc$0Z2mo+F&FoJU-8i`XE,-c;P
	,3eDu5Tj_fbm`W`DE:D1l_1[ku%_c#1i/u>kN][(UE:I-=I.(_BiPqKRJMV6C$S^Zf`-:UsV[(kT?9
	g0h@M,FZW@LSINeX6c1KE%L3R0`M24J,]]+"8ObVNbn2EbqPp$7\5U35cO%!6<`l^U7H6OOt1YHM?^
	jDgPND5)<"B&npXg7@2I[-$@-"G6Fp4:<ioAY$/tZ=U<FP-/TFV'ho?g!g#VP*C6NQ.'6'$g[+Ef=K
	*YSm/QC+8sJ,nA:'R=R^lq39?ZaLj-;eNna$A-Z8oHDY_aZHi<1bQS-&m0E):NLX&//K[M.#je:"s_
	%Dme*U0rfi#s*aY/;Mn;Y+)P$FCEu`^\aS9at,;CJRg^6s>BAd,!*/k!'N0L'jG3UDDnSR(R\$Ms1#
	l_oUF<j4^\d&a`fVLqF6c>a&^_!=e_pU5b)je[(;?l=rnT]HIn7<@L+7?si9@STWoqrmsn24X8[ePL
	!94*^]l?Dpa:-`HfiP4SZ]60ko&]Ht`LAS?q,Z%-kelY3Cs.i<3Ydm$HT(YGnV=o<0d34/]?Q4c<6c
	4OG4GVahIqeX"AoOJDuBUcQ\ACd[LO'<jSY!Df?=J@!g!98JuEN\.[VgGH/;fl.X"oefj[D?kXc+F2
	?R7jV/F-k`pNb$ZKRk)&,#LSeJDEjY:Q8);,*Qo;&ZpO2W[S4gKmjQu[ZC?mRHm+BdEO^F]@$k9XO"
	;EL735M82A:1h4@U>e<qNji.?J8kV;j#boB.7T5'N<6X%dM"jSTnOX%o0_$I@,$;D*[nZAD/r:P%E^
	3C?rjB>9(&1pi'.\?>aMs7s;NSFS7cm+O4]Z?;N$7[:gY(I>A:%?@nK9V`@j#_2?M@,25$6h"/k3++
	O"jP.R%>YaRkJGK01:)&P2eP0MaiD)ZI4$=oXgmoYcOpN_+P=l98#;gmm^)+g;ELa0m@f<g>le]Y\o
	X@>?VFga3m(t;TZ]5I]$rTK=;dTq@37g\H"l3NXOUkRZG)=/H\NXaajdFs<-7idF"5&^]iEpigD+."
	mA1noHX8Jp_2@%1t3NZRGR;G2e_=%81B8,DlONGKkGHBOC>W^[H>-a-53U,!GDNTfI*Tdk$jd/0"f1
	?C0h3@"R.U(cjl3_QueC[:2if6LmoZsOU.9"nnb'=)0]PYo$+H9sER+'cU8>8IA^rC+W,[_t![W?3F
	SNX__YZOMW&(jaeM60c:QE6PA$@G6jOpr2c#oPJo.":jGM5<XaJmsg-g#jjlKLblZ/r%FnEBZeMe;D
	=fQR/8a`.3W>%_^Q@2^>&%K+gC:0)F^/'$9Y.&eLS!k]'gMarVj:QPOi;DPR1U[e0@r/nOFcM@G88S
	T:4'$&LVO5=)>[GF/Is2qgV>cQf+r<cbWO7h,^6#d8lXa+otn-Q"+7LVk'VpUs?BtP#;XKf5_!_K28
	uHjjNJ>7sRn%mk9s)3(a8ik9D4Y)"@g)KBfe=,)WhbD4&mPb>ij;>&'e!dSbkj1r':?=F#/Y]d[c4n
	%oNT_g!WA'UNZ`*>m9/E!Fknj&&+:Nh^r+IcF-Nq8<0@4hMfW]0:`k5<]lZId%JHQ9jq_Ujb@RpY&Z
	Ta+dDr57UO/n/u@gY,EWd@[%uZAgCSq0DT?MQHLP5=1$m#KB*mW8M/F$-lo<a'\PUFoURSIBGo]Z]#
	I4O92Nl#?W%/".r60.ONuK?AEe=O)'5,NF9_/_i)a%VfUl#$@j[X.I3[IU::&VA2/V'*p@sLiS!iA#
	:MDn!&0`a\G-c$7C+rNNP9CV0@:lI2[\dk`9d]-DMr4kd*c/V12[2(-%1P8J@:s@7VUSUTE_XKb\1H
	1p[V]mVb7cP%]sSOL6lba2<bu^1NWDn8:Gg,^EqgZFfX@A6d&h>s70^`qN?3N=CuEAji*5b5DHIq"n
	*+h;_&iq+;E"cEduHrA;%#,?i+)<JmL6*F/'V[j)9ntC'1Hc<=euih>Sr-H>Aq'Y8Jr%cV2>4/8S&/
	$_T\[O!QXb/;rs7@+B:WH28QFa\"l)?(rK`o-i1I/d'8!4:-SY"*-]Okpb^Tk9-8Qr<V$^<Q1t1hpV
	";)9sHuUN7=P#mm&g,3e!Y4,B-&[?N/:lIT)5bCR\-5B3q=JZ/#l7EXfs1lmZfFmP,N0-T4d>=OA&]
	[XY[Bk.54K*Q6#q(9NEUQ>Gs,gTS;C2(q.QhNcFGU@[6&^HMQ=C2<GM+C/"@1Vc#ta,0;<Wi\6p$NZ
	BI2#`HlmVVptgmt'*nC157:HsGHhhpHs?eraXSB8)QT`1UJ1%j0Td55De-I%p19W/T[\R>X5*!G#X;
	:]"TZX[fK5a\Z_>'!D^Zn:dC]+Ei9=`1p_U_aC2Yd5+hjodEb"eeP$JE,7*\$WQ>*qD.2nUVPNCfnR
	Yr)27Njd7p)(*C<j.bt'FKD=E'5:t1^VdFd6::U03\8u@+)lMSoDg:K6:9$Ve_P`H/Z<lU&aO/J*9:
	hltTH/@cNjO>IosuTL\Y;%[-%;RcDQmuJC1JUfo^QHAq_6AREXa^f`<]a`1&U\R40a%X.]e-k%;^F[
	6#;&MVf_Bo)\MiDp0O8=rcqVOGVNrJC.LUW:&<4j&:W!UM+Dh0V`PX$3bH"5Y3j%a^2j<INkQ5+O8f
	]N<M,)Js78]:c9;H]O#e0=VTcus3O:F"n@>L$X2<H%$u2MF<)>aDZOrqbk[lN(`"pX5hLW\6\c3Z/W
	3d"rH+L8a/MM$CBue1lQJ.Hg<!:K:7dC@3D>9ulC%Sk%_=gleY]]%O<0RmOo/D($3sj![c93*eX4Lb
	U)'?f3rT-$j>4?HTH7>1BqXBH>9%lo29C^:[h"n9#lkYq7e3La#f"u`ahq\Od`3Pp^XWo,`V@LZu>@
	2=P6;o[9`_YLd4an/Z^d&Dli#m,TjB='-R0$>hj7b4/`?F2hXSVn)dC\pK:*@%#4?!,uNna*_o?P=<
	GF"nqZ&,e5Lfddo2eH*3!dhE1Gp47fDs50l^Nh9T3"I\?jAm8jnUJTD=U1XGg/La1F;?2uCbhJ_9?H
	JFNn>:%]&BPA8;bFlNCSr:?XD1[T;b"L)H2LjVqWHmp4geB`gkTs'a1$l;an*h>:I4^gI1F5f43:8=
	-2Z\_pr,(*]))$*FJ[<AQ\T_rJ2M@1sWl'B8Cs.0&4'&K`p4XHZ_s]krg^@AA6pg\GEF%e2Gn4fHhf
	sN#+J==mAgi]BlTX>'fuY&SQ(^:qBmBR1sR6P;n,L?kc*gZ3eba)+k?oA\$M!(+dCq`J^spnISrNfg
	dpDIgFm5.Z$OphnAhtS:BMn=MJ8HC)Y-$@3+*ZdDZhf,e6%6ZbuQZB+c#0p+l?lKWj80(d<AiBc'(;
	NZ\ML5m_=h:YHFd\#e=Z.:lKsI2d\H[\H-(*9+GZmKb)tBaiAQYn`b>UpLQXUJoi&V5^!&NQK#BauY
	E>naP#lk\Y7WeeN+3g[[:Cd3TUgK4"BTDS>^Tr1<4O7*9N7(VbO=mWfLrp.r`oe_Ab+_%Bu4Q[!/OM
	hen-lbLiM3LTI]B=q7uAj\S(h#0bV_]W3;OUClZ(Bp9$g_@6"S72M!cs--_4g3m>Ybs#%Z$"21q[uk
	6#6V=\Dqo_'SsXm;DLQ=8N]q]jF_$&.#m?um"C]Refu+NqoQ9+d?iC\`s6)tXZb6GGQdKRgEPr`.S4
	W&CdPtc\1OOs!LY+[=OmiSejeU="K6Aa*JT_I!Y]`)Gf[^:UmQhtO'4S3d"nC;OH"/l_+Dm-2Ush?Y
	AXC;B+5b;SceRfBM%EBKL-lrm2RN<CkMcTr^1K)0R55#=\a-0gc!R*Y*LD6Y6bU1#H2bj(g;D7qj[2
	7k2cioUEH8'TZW#uqMKd$,jQu-JlKaHuf&n+#OA-I.9[f,"P'"\9:D0NSG"phK\aRa^CG>JkJUN*(K
	sX$:d262=e-$O(/F)-PCuM$WG'DuN07OQkB79l0GMRjhIed4;htS&&n[iEg@pG!&2O>XEWVcA0Z>C8
	;+<;ICmC;5`2dl7KO&LqLobiB!7)o1?7fjL?O.N,M!`-SA";C*qA1SafF<4Z?]32lRH.p\I:7Qn753
	&dB@=@/lcTLR<i7Vo:!e[`l-i1(#%]QBhmE5dcQL(+/2S5XY`@1<rBdZ.=X]r"fn&'@pSr\F;Mc"i<
	)0l0e^I."\DrZP2r>=t"kti\6TuelmR=t*,>jZYDi/nDe@G8rqA>.ahP4WO+&e`SBZR"9OPqJ_/;*n
	f6-D7`_Q<I6m'ss$u!QsU46p9N*STu2hP+Cl5WJJra87UbIFrYVAV)\.!VbpKA'GfMD3H"Z;?SLeIC
	[pf(IuEMe%[gi9,mKam,2gnhiriBXY"eKA),m,Hg).SO0S9[QBd]YbGie<mp;*u8Sc.3GVZY%CP"a/
	0KZrlJA"7WNfZ,h,)qR3j!4N_bm><@@(:oX,BQ*>^60!4C7[E=F?D@-1j5pY(W/r$qM=gGek'ZV^0#
	RPCh$o=8JRcEB#AS2V2."GUTj@+S98]e]Jg1e+VF,'g4g;Npn:u(bE7XqiaADQ`"uH@C'M5=k=anp6
	cP<6*"epM\0"s*I"nY9_qGbhr.2G`8j=6\A'G.1,IJ]Oed$WA_(H[se*!IpP2cd?F9pYb9*FHi15Bn
	#VkrSb@qQ"VbCE9qGNBqsklSlYHM,W.#-C*BG0d/j),seurd/_Ea@pJ'f0lkdkk\opt]tg5BIKRa+m
	R.0%2->Uu<.iS2okYhN0$guBX*'T23$t1R=Z!i*1+#_W'!ZnEfPWk`?5M)_G^uijZeF?*'-Xc4RH;c
	-r-HTamB_&LjX=ru]LVir/ANB":a:-a,Kf%LD&#Z>*Uh"R/&pPtA#Btk`rgm(O(5MT4e]kXnQbl^CR
	;q1*65sT</GJsl:.2sHEG6[30i/MWBW;7YA-[Xk\^?2=3[sr;mtX3q^0jlfu(ChmPl78E.-4#EQ6hl
	`q3&S'.',/nV^1LNnXabi3NRTh`q&]X?t#_\(QHJ^#l)@\J,Pa7>#.'bq@-h_oO$<O#rir@TgB\?5D
	')[6`LfO[7)t^-4Vo,?%DPCr`sIg6\oQW#B<"[-'GPncPGqip'Lq,Aue=$%\q/d[\+9Wi!E.MObjc'
	\7<Ll0K+:Y)@bt0W.6S.%f+j_QU'.`1!_Rfqr_+Qo'm7rO!(j8*jGKAW#Q>S+FRI[7)L#1C&SQPr#=
	*)00EpPg(mSO"/l4VejHjD;&c9?Dsk:DgndRT_/pOp*07\UlC-8-f\Cb#4_GI>mQsH#X3LbXf,V%Bp
	:aY,(=pqFa1:UIJDMpC[EW3DYFdBS9Yh'TIjSpCVqDkM%R,BD/UUDAR#;$E$i`.)e"5Bnk+Pch16O^
	Vg8SO1i)\_BCT=\kZ;7jF.2`!JPn.hCtc=dL8bZ<BOaQ2W`?!d[WBeoM<;A4`&#SGhJqaI"`g0(Y]A
	4CW34h,4.,/[,9U?NQD&aiG%;]/E-)PP-$fr![Tl)^PD#/AQB]1PPVK=r9[-U0'9HTRlHQIL)7429$
	<h1:NeRc(4YEB<F;]n9TQ8a/Q(FU,F#%)!8=97`MZ[BdP!fg;isH=*[=1V1r^QCS>]q%Js83p;9fi`
	f5<Xa*Bt0e&HlfG<4,7`linU/IZt"p5Z:W<I.-/cNQ`[\YJ;i?iia`rNYaU,h2Bs.[FPh`1qT(jWa*
	LYFSm(bcY9_G_jY9.bUDoXOT?Cb!XH.ppM=tZq9BdTt4`*<IL/A[;eYb,O4pk+@DP/_XCUu5gp&2l+
	m<IpkS396-onVmB=\4ku3S@RNeTt&T-/&NYHjMZAlB,2-HAKT@;E5b8]ql+BB*(PXI6X&%V/#)jC>2
	8P5`^V=IUhfIWE=RG,q=8Pf$HH\P3)dH<09'M')p1b*k\)g@I@2Ma&1am0172$*s6VAIsK->\G>-"O
	DLTq.O.)+=aNN+m7+-#F;3O?5</u>1t)RXRnP&r8KjWu'YPsC?779fJ`S.MoIF%m<5j.tc,N4%dtXp
	_-$ij_9U+5ZbBt'nO+C1KMg)*Crc`!DMUrT><#nocNb@M@`._-B8-^W;YHeK`]rWA@H8egB@sNl:;o
	6=nR!;0E=G1[SJc4nC+iPmUc9%/N'7G5@'=Y8*"3:]-O@U#Oj2YtmJrBI3'<pGqWE>Nl:Ht8GBqPN$
	i#,ob7#<s!jfrK72qCqt\I>t\+9'AXE5hkU1L,=j%k4o&;rpHZLp43IoKA3S#F=NqV7%ZbqYZo6TUl
	B^`T'M`G8o$(5cSFnJ5]h`p++i3m*%i/$2Q]l`[sb<k<pe^P,;#-R9QjE*rR-VC=]O:c@k;YN:L,6F
	PYZT*d>h",#VFc2,UnUQ2X=*Urn%b7h`u(ZR1ti2+.i,e%?DB78b^^T!.p,DdY%s"([]b;;5!U(E,E
	bRL-RqVe_/_A_KZL[@pf%MheJs$GVup\$gE,_;aBIg>n?70Qn-8`kF4u%,TdjLVM8i\NaGU8(piDM]
	cfb*]"3]*NDR<:e#4j-RZeV:OAj,i\IJ9&d(96khM/[6nbSI.'97HSUK1iX<!kb2hMn#;D#1a3N>D;
	AJs*LHL48TUi.Fs]+fpnKkF+*d:DKNh"#^7UGZ,11J;rOV:jUBnq7@/Ph4XV*pr5cWktHkJS*6\oC+
	#!^kpY]Wd(S#gK8Vn>FD4]n\<IE0KBDF21roYcrCVZ]XX?+=ZEi7),:&5+2'1i.LG):mlLStY%YabK
	f-5Sr>ZO;RU+t;"dT?A$1nES+EcM-TFODR%[CHDs19sO-\-']:3h>J-Q.sghU@$Xq_%O/hM+Y]=o9D
	!#,nEKP-q.61?B@IUuI>p*fXB1Am)LX*r;!k'No/KW0#D14HDY<]V/6Q']Sn5_b,<#%a@Q339YLZ8@
	^XQ_mUGb=-=h3!_UdhLd$mG#*siQ,ec=#<b)Rt.r4c=\eXQn*A4ZX&7r/?Vt[l45k1I3ZOY7B;9UKS
	6%+B<.V5Ee&[u+f,[Oi>_;+aL5XJk`nu,85*X8.o3Yr=1Et:6o$;Mp;'3[`L:<B>.'<G=!*qZr/5ce
	`;Zhr-@4m'I:Wr%)C<gE'HlJjT+P[.9J:(l*kNK`DmCUrBs&DZS?*^)t3.p70L]e%+tEFmfMr,qjR*
	&=c"^8cKY<`UAI*hiGZgR+[3$.GA!Rb[VV%/FYN*T]<9j4XC=5DOg[=4\>akkE6*Ahc[GMfJ]qP!F%
	c<ZH?=D$N-;G]jUTLE;*TKu1q,6C9l^3o9Z(U%icj7eh.C-3pJe2=OHlo*.GAliF,8ptt;o26mtQ<3
	LE#OQgN#5hgJSmbEW7cCILIrKM3WNVQ'd`2^^gC94c=<MEIt]HY9[ZAmkV2+F"Fj<;.:TP$:WBS5+k
	P6],_lHN-qQY76Mf.l@,KR=m@1i<I\4,[UPCS=[+6a/',ND/k.pTPoKmOn_Z?iD9p$77X+9jG)_6e[
	LNQK,VEn^df<`NmCtkS=+t8?+sCo#/h0//GU6&L7N1bIg\D,83IAKT%[79qnE1Eb*?CE;"!9U@X6X>
	aJ_'FE$WAYDii&)n^A9F,X+e->Bi4lmpg47kHkm4ZkdP\d?L(*QS\3E06[0gmLkrH2`38ShnjpCmI=
	@]%N$)g5<-$YoWtU/-F)ZB/trCH^]Ct#`[N)"o#\t=1Cd3j8,\j-2i/i9)NsH4.9BBl+,C!hlkOF_D
	2QuHNM?-Ej?kAHN@^O^;r,%"?B5ZI;Ru-LJA\VQRLSKV(7Mq>\0=ALF7NP69u?.Gb15[cEsaS60E-s
	FEYU9$e<uJ6dGc"8i"B)J(d),P"\`$a\djpj'*<@KiP$]0u%jfr,f>7-EmY.@k;SoH&@Mo!f[<<fn"
	nB'<lc8@LT13\TX]kaSt%Gp]N_Qd/EZ3KhBMRe!`aW/_H,QeC2g];VJj9?IHaua"gPFAX"Tif8JSO'
	drZ#l:f'rs'e@5AN2ZY#ERCg`Pp:m(ohC=Gt"QX<`Um,bN7<u,3=,MJKTfsR_Y&AUs*\Qli*OID$-6
	l:HKB`$`!eCE)*ETh(W9kF8A!Ac-L@`+<%=282Cun@'K`4Yh>]S<.Kb,n*!E>[4?u,Y-2m)$G)WK$m
	`08kD#(qM^uEg*RCER0.lgn&8iJC7m8gIO1/ppe'>@kXa9]$dpXdm(,%F8ET9#+c)P>7ihYW(cKd,l
	8@MHN;g@4Z\)XslhJ^V>*Bi7e;QhnpYM*#["6E*\i;B!CR$Lm5me0\G']8BrB[S#L(Q8GR_";>^Rk,
	f6#]s[m3W(r+RFm)%VIoTRl;1bb9u&4a7"@POIWD,%9,Gr8O@!:uLLbRak7%2)O69+ha@T+W4,/q_a
	%Jpo^fD$(`G^aPd\:.Y%_?PnNWPsadEE]OQ)=Zba4<.`bZ-oDDZ[fhpZ`(g\9:GeF<SKn;-dZ6!k^-
	56QT)]7,(0o/r-5USYrquMSj.Hem(6R\+u>aFSdBt/`7V42&VA%m*BJhqa5!\8ob7!\7B:AC;mr;i^
	,2#r"]c(nef;S"#`EZDPr]gT$!2&l&bSD2APCHHe'"'EBLBd/;TG>A]E@83_hT&<JY/89cd5_PcFPI
	%<sZ!##:^oM3=<IW2QjRYiGgWQ0O9&\j\#A+tZu1lAsueG^P&rP$I>Ge!hA6-a::"!.tS1qSdAriRF
	>qLW4+&4/l+]A$IcP3mSjB,qL1$Yn?5P%@1^6*">LJ:f`H$e*,r<o@>r(O=Wo):HK(A7-eV#@V;rs!
	EE*9"'iGe>)\f.'MogHb=b).Ys/*X[4V/[7lc<mB>HbBkL;C9Q4^,6rr[bd5mnL%jLuT&]rt[r8Q07
	uh'UB)KR)c>OE6uK1.,A`HWp^qO9RiAdd(-Bk`5i0aY9kC(t[ZS1llZ*LXfW&i5sOJW+_QMXiVj"cb
	'sibc&O^CU`:",Kk(KI2Vr?N<kloTnqF^=+*ZBVMMt84L4K^cZ-f=fpp.S:=F2X-;ITK]j@':fQN[k
	eL$Psa+O:/_d3M-pBHNE(_apK;*nkepd`5K<DYAgR,(%_QOBn@)Q4+/53?YP;U6cPHMb37)+I>KSUF
	1048p_)FsWu$h0(1r!i;dcr?XfJ:;l\HdOhtIf.^OpAn)Q55`?(cg9*dQD8pjb7r[^$9c2*22SHijF
	q/?_J.0r6Q*rC.7$5<(h:%+5`d5;eibMfa\\1?LK@/Z-OD`7"g%tRu:V=7Gr_s+<+*Kifdn0@?BFdH
	&>Z4YSRZ5b$7=D/l?q.0@4[pU1]X<nClp%%9+eM?#S1adHf48&DC(BM]Ja?p$D]!UokN!HcC;["I`u
	puBHd*h[0!M(%#,NGV;SG$2_pZ3K:)uT&1N?GiPr:?Tae3:bG4L8j1F6K9cmX[KE\dKG'D"Z*GsL^g
	D%G`KW![;F5UqS5BIJe%Hks>;[+ROe_^,KYG#>)4WlIi&M5I.iVXcQ([)UM2Q,02*#qRf)'!Q_,.iO
	ipnA5R:,KEsS!G6"b*:aY0K7H`+p1'c!MtJ9mMZcmW_hE#GKC)WO/LC(f>>KQp>S$^&eZ1@P(/hn`;
	nS<dP3/.NL.Y4lFD9*F<V5('3,9Fijas"AohjGW@bR"e*K#nPMrtEW+X:.gkn8W9cGF>7X737r=@A_
	RA6mt/.:/>JOIL!.Ra'R@+dB'Err@e%6`0a'P>KSaX&Iigd1&*cRJm2"J^46Kb,O+EY3i"q4#Nnu/b
	GCJ]=PR%26D\_1HYO(,E.JjMkF4U[o9Z=.^7ttCYN[gY!!Ul^n-&O%:mpj"&6rLFfri_qP%uUSfR/p
	?^.4#ioI,=Y3+0*gt#A,;e`cdJ<Q464lYDU=;3t6-YF9o`ZVDZoUncbUo"n63aGoJg)_h3e!NjPW\^
	fk)C"_tST>s#'Loo9RQU7^n:HFJZXI?!PYbcl`N9]t#)iQ*89_\^)b;GiSaCPpX?dI9A0a=*6m3:8Y
	d3%h?2\b\&Z76<:^%a+O[9Q>SB9(,Fh@)<@fok+Tf.8XnMj]VgX&O]%R0Yqbaj*BAl-n&d%T7uh9Y\
	$(F?/^6%HY/X>Yts.D2p"bqp:'6'>umJnh?@:./)^Q*'"3!NNlnG*6O',EX"/=%?_&=`%iN`_<XsIA
	W3Jd[imlG0XGtD4`p'=Cd*T6;ImQ3>%P>YDp/[lO;g_`i_]!,(5>!:MC!/'h6Z2-s/gP.Mkt=2os5\
	cteIH?4E$*cUnn`Q^!>':ZB6]M*l=VqZ\`BBrg5%Ui&S\@+[#?=\54M(762;ZXJoSF(Pb5%86Mb9U^
	,PCOa-:a3L6qcikehK%ep^p?-s)Ss[-:=">1<@F)XVRRsLXd#FhjcWgmuH4_J`[?ULp]&qCRKG#)p/
	L4/W-qUGi;X'n7\G3h[1?4?>5glKgY\[dqnjGjR/AuZgV29>JYNe]:2*R3E7WfKMoh;2Ub1PX^kK]Z
	@r<$.qRtU0UiL^9ZNTH[dCP#]'-<*]R;5C^rG$W]Z#jn8i.$YZ&W\]8^cGV+\BZpk<ct*=Ef3:KI4M
	CPn)0'gk2^J&UJ6LJU],kV6?bYpll(u>c_=VHjEV)!+Nm9;'Xg2C3cIK8I^Oe<>;#dNU+PZ)GY,ub1
	dHc^V7nnubZdU)\73Cqikb]nF;O_FP-8:)#g<m-+QSL"R`_*8Y(r=`>e;jilUe5ch\"$8U]3CSCIQ8
	iOCA/B@hSV]n&#3";]Sd-s/?L.j>:$;ne#<+Q>&fNp+IQDC>5N@ZJ/)^%YNtE$%&neD'LqYL:aP@/G
	2(&IGu)BtE-+qKk<H>>ZaL.*(6dI%e&#/$l&UF?F`eUQ7j!-fRTisS&\D_o.P!%:&&+mNe/07X?anQ
	p[h@e%M%pcep>VXoJ"?b;07)s%b^,\P9ZWA,d@di"PcE9#D,O>a5'_JX?/Jr;%9>J)ikMHadd!q<("
	]%[m9Eakgu=\H@H*\6&_)!o\k7pM,V(PIm7k@=L3]30:hg]C0kl'/b8(/^paArC'(aV.3>[o.X3Z8N
	]LFTYlR_1op"#lBcS_,,S"rYOO#h>(G8]duCUW5[?iQoO.</Na8b,PL`Wji<d=H%a11S<4;ia"`m`*
	6UlYK'Xmu^&;q?3P\9kf$O1'1)89(g:.P\h2TnmoGG^&gV78=CZn-G?cj'pTO-GK9>ABiAm*6t:XSj
	VZ1YmEBV[@LE.A)+t2L@>;es?9D7bSq;1B$YI9jGul='!T@&0Y;OCW(6)e)O]\]Z[)61[/B"n8&Cja
	?#-QXTo'/a4#W)uIc3:]4pB[1$$ZJ-4@Z\3%Y4A`UT!bfA[b=_#CtF34'^0Ihl+'2F$D*ot8X8Sc99
	H$p=M96YZhs@dDET;l;Y969NI!cbJ,E#NcrfZh+:+F85X#",1Ncf&<GCo0X-D18)MZBBC=-Q7Y[9%j
	6#/t<6S;08(q[b]_<iW:$_G5IS<!=p^q?r(F.@ZA0E]O>=^G\#M33)[S:WqmW\LKE=Q$hA)eC`u.?r
	?PXM6]^8`c%idC*`k[@F\-kge?3?l@^hAUSi2qQj+pdPbmS2AqjmPW("UWPu0mPAErYS%Q+&p.UA?-
	>e))?>;+5'u.b`p?_<f2J4RK`&*4pNsoltTFbCT/N0"uH)J*A8T8'.Z7H]XU9V8;,^E.J/Bp6<N%jV
	A>D<%GhTfV2ikC*]Pip"SNF'#4CiXep\j/a,kiV-SR<7^E!b@<.WA^Q(X;JRU1^C+^!^an/ZSE]Y`n
	%QS.\ZLe6ss/K.iLg1N4F*Z<*AKWH+",8`i',*rM@K=qW4M,*@2Jf&3./h.\!DkY^eN$(EGq%CgJ/'
	OK<81L=/]_;P+Z!gm]*.l#l*e!EdmDF"Gb4T_>KZO(Qe<$Z&m11tpTMefitb+>#E.Xm6=@q9M#V'oG
	S,d7]NPW'$mZY=K<T@ZLH#L!KPGY%DMoRo.W#Q9FO]GFDsDVo=QV4;FkSeWa[GS<CfUP*7)F-rnT42
	J7GPcmisAo3[#AWsAq=82XdET4Qg$oP2tY:a"4ifrf%T$WQpqqKO?ngmFJ4CK`BJ@=$udSP@jld:[1
	Tp?P:Xd4)Y4ql3/`)tC5[%MZ<^B.b:ML,7-#<QIe"]dqO/Fp*gqn%NLiZ2F@55BZ:W2`@erPr!bT!d
	)sSR*"YVEUDhY?)Qs%8/`<MXtqk6dXi:A5'V<1Z]'i9`O4jNTU_\>Z#&O6$0(77cs&&0D5&N!lWP7<
	W.:'jWHX!&_neGi9@nHkPj2,@:ikd<163+fZ_T/cab8%_U#"1Up)1$)F^9+nJYU]ATXnl/-Nd(7!j2
	/Z8Wa6kBDY[bn)g[1c$8DDN4nZ@N=GpGFEiMrX4#W_`KdeMV:@#i=t@/JX8i)f.?K\D(8s5@b%F.A$
	S'0^;N'B3h)0M@agB`qEk:3&_B%s"60_8-2.7]_fc\(n**po]\k!5UO4$IDjr>HfO%^G-?p%r\eV[U
	MmJ-"(AhB8?5-ZGkg=>)<(/0%9<ci(9!_SE:C0,bV6\>uQ`Znb*=IbabT#SVtUS'W=rM(91=_iZ+l4
	i:I(&$s8m&q"f-^skkW&Ht$]ku,bV,i-.1e7X^GMYomg(L*ZAu\;JaE$QH<<S6bSJY&JM]4siC^?Hf
	e>Q?)qK"KXq8bfU880,+/#N$2'B0iSJ7;)ug=7oT&ug?0T,,5bQ.N"SZ`-4PMb]a`CtPV:OAj#JkU?
	/E^9ff)ooppAK>l?[BUrV%`O*pbbtF,"qp3,-?t1/HirA@-2XJ]K=Vf%,G.VAaAR+N;Z7Y>-Lu*4Hb
	3:0c?rIim,ppkpV79k'dE.3k@8Jo%)Kma%:Lh$`pg<Z\qW)('h)i%_F7hMFMMf`3f\&0Nfq@$++J"T
	FV+Q"OPL`_8bY8=silMS2*L7hM*dISQ883d+q<!C9f=gtY_Pg(+(gG,*5#>Ekh`Uie7nMffK2GHK.I
	A:GFL&7jm&<'f//WAA7I?%!IfR*^p^&$d?#4UJWGJhd97%]&+Ybk!4Cr=!AEf8X>m"/+`)`ZXobShE
	6G!&8B`c[#EHEonWmW_^(aKhGif2RdYSbFBeZh"hSps^b?5T0p`=E[>"dm//+r%]0p2+nfqRu/B=K5
	KT$Y.AI,`$<]1NfUpW`gl^E<cQ%,X\-9:_bni>TG7o\`V%UP3)A1Ksc)8=Is*CF+%Cf.:'9'XW'#pl
	UKG9Z&m`0[72-TN&,$fbk&0<?&jO5dTD`D<#*jh3fg\n?5Qm9_;iYP')hp9rtE4adN_0EYse!6jX>(
	?'X,%e(DGgS0sX0XXSN"AS.EVnT:?-6;1$i\!40K;.\h3EbmkVEY)HSc;;F"^?`[HW_4\2n?3Z&%iC
	T#qhKM*Zk'?3>cX'HE?Od#eJGnp>oe(Q]4>APW0t`l1#r=>RTR-KgSg]d(;V))^2K>:fEqN+8Fd6\&
	W4K=!P,oj[Qt^7:d7RQMeaP%;m?M>R)"**+<M"g54NULR[uSN"Z$H@aq#;<f05)lX]M&O#**%=j-8G
	aV5]TZEH38B\\fD!Y^<V'O76r%U8QI5p:^=>.1ufoVN4[g3r')e2cN/u8N1FrX'_B760@t7hFP`?tQ
	1:@HO4CC-Md"Iu]k?!l#0#uH]5mWtofjZ$rsN[M!H(k$#.=L3!!#SZ:.26O@"J
	ASCII85End
End

// PNG: width= 101, height= 98
Picture yao
	ASCII85Begin
	M,6r;%14!\!!!!.8Ou6I!!!"1!!!".#R18/!(hGVG5qUC!HV./63+16*9dG'!!Hq#9gJaZZ&]:j@0H
	W2!"!U8=`XQC%`A>I%`AC5.h3Ku!"tJe6pXds?L=9kFB$6Xa!^aTJ/A?d]O)9QKNEE?,6>0EPl?rh)
	mq7g<"oU9"[*,^&O\eQC+8PD-Iol\.Ng-1gV5m"'F]Xb^d<VY-E&d73'uJQOHA8tn+W=/m,$RbDK_5
	UbI6d#S2p=fBBIL145W,@BBILq%FY:h,,d3c2FJ)g&g[eiM%YJp6jZ1HU')V_;1amk-p^BpPTV4s8e
	;UJ,mXg6&qkp+#srN$;&1a0;8i.o.FtS'_`koU/N6=mFm>4T)^!CQP$fel>HXhK,UCaf&geW^Pa!GQ
	+Q92So&9<0id+#smfeHRCY"BKnoA1$IDc2)p[6ks\%h`uoEYZ*q$Igk%qTGAgU>)0K%t4*O]kUZ+c#
	odmbPJ%H(fsP3:uOmWu&gfq#mdrm/?9L0f3=+aLcDBmSphdnZI<>q%kGA&DYsE-#HpN65hds_UcsZ@
	%qc,fLb/dk(o6^F$qm35^SM=:JFR&]mt(ci'H)Vq.lLSE?WiV,%..``l<lg?"-4j5(2)(:17!C>Q3[
	*ji\d"-<C'@fA`3Do0a&_@?%PB)LglT!s*nu=&r>,"a;K,47B[HPa.J*%mMg`nmp.V9cNWNo&\l?)`
	ENI^3sRPAZ@6Iq7>5^>a/jJc.S7cdN@EXIcSnKZ]BSqHhOPn^OO!X"_/68DJlU6\:tD04BNN<!'frT
	7ec?,Z,+fF6#Z)bN#FR26iFp\]C4<7qX?l/P>E=Yr6X[NqtrD1E6-9Oi&)fYol>.kpl+GnfJ9%Nl02
	[Nm+GkGKF-ui6trX6\I@MG@+,lB"C)XBI!OjI[YuSRpi,cUbaH*kH%+^=[\/NIK>+p#s+Iqn"C;dbC
	[*m!iWNJ:iTm!R[Uf+l5!E:0EA:5A!$)+T.k`POHkF.V#$dCMMJI%]0jATFBe9;\iX<20@rXQecsai
	EZBLH7,3I4D004:C+F;&HM#d\`g,fOg-K(UTC"/M%3u/X?V]kF*oM`#2feVEbS(f,3fs6g0R7Z-@(\
	1"/=W,o+HhA.5DVQAhT*/D`l-lQ:A`q/_T4H+^G3mj)52NuBpY;O8-bXiG8V?hHqfZu?a:XjJ_JVFq
	YUckXL^=*L;%C)a%m2h3/N`@R[:@B9cs(&(4ZPN0f/[>M1-&\7clkd0P'lip^Ipq$J_=r-U/i.llkp
	$4W;>TEZoCNOitQE7\p1L2ZY*)$iJ/LeTA%(':b+#;5P':$qK:P/0h=[dYKrg%:s$GbHc[@OYiSgF[
	<&6@*6Wg7<0XJc/FB$k,O+4Q,7:_kj[qQ<?"--PG4<j%%ahXJDr.S/[d"UaF%sK9.pAFnXm('VMCU#
	JSkNR=;*;fVP(8FqB?qX1-lbZ+5mG5tm43*mg-it2[rok0nrN+a6b<DRmYUDHqbCqT\-X2=Y)mG!X0
	pf4qG8$kPOcn:nJqNTTVB*1l;cSm.T+d"?,NAMnarncFM-J4Gkkn\FjImV#:ZgR4$P)OQi,*:@3gYt
	MHRH.Tm#\K-'%(O4Go:&9g`f9%du9F#nt>%!We)DFh#u%Q'I\UW,J1iI@ATiRa%(_X29"ucCMRX*r)
	VJj..&I?m(/sBX1ZoH(DY]^j4aWmbBf7'@Ts/[WaD%1lR@g(T"r2REDNZEB^:L"#>,Zdh]*;9)%b)K
	4r"ProV^1Y&Z81P+A.4h9n"FV5Z&<'A]?LLM5R`88[/RiJnq#Qi([d=RF>#1KmLI%>X]gVIM@&-3<M
	2;,''h%ZFQCWga"kqGTH="q2?a^7Lb_b?rD>E(tW;nL$:aP()<hq-u"]QqW`G.r6rtl<NQ(XJoR5lO
	=nN$8Q&L6nrlO=Rgm5Hm7S0ii%pQH1PWF>ZAWrI&"8BZV>r*\5=O]->D6p!M]0lh*codYQ^-NFn>U`
	/Sn!N92!p#AAFiM0jA29:o^$oX2Q:,SG/jQQAWjMr[;t!VG:!MVk89m[OOX#B$:gW3d24?^\4,gn,X
	2-TIN0S3L5qqM;<[[X%5lVA"U?S3.+hqb]#64J8FT-"#h]HTg>?]Gf_g#eWa/!QB=cTZ\_0GLGCV5Y
	0hJ?8n)8(BGMU?WZaagE4=b"<*WZP?<k-FoPsEHh%`?^"ge`fc#]:)p&a'SI_C!JL\[rorq@GeRcpS
	'i8sl>R):Vk2QEW`5#kj(*D@e9La!#7;(^h8B[MF?L*Kp-\r#h.'ltY4LiB\1%goZe5B$DdHiEOGMM
	oNRB*tg=66;OQ9tR/h$aRJ)k`I*34;=28XTACtF/W`QiDti>SgdU99]6Q)gMabor[OQ(e?u;tTmQgQ
	p\>*TnQM1NmG$AJ"uE6e.\l#GHAH(B#NO3#Ee-V;Pn/2J#7h`KV5C)'0ekE:kb$Y2mJ?#k/arT*.GU
	>XQ7T<(L"#TnP_egJGq:r1^AI?1*+J*/A&^L(YJ`^kFQ]0kAW4WE;36Ti#`$Xh*VqEp\s-^Uk!kW+o
	2;=@?/@\)=rTFtNX8<MMRBMHj]Zb*'^b5BKaS\V'aa`qnbR<R,Kdc01llYLG<HE_SUp2dKji\]1%#u
	DRUc+/T1#s?Tq#Q);bbrc]68117lL>)%hu076)Q@/lIDpT9@GM!]P)(1ol1[%PET_<3M$0JqJcr</6
	fPVV@*l&D%mRgl`Pa*\`[en.m[@qGpaU/'$'K+5)Fl!-;abC+F8fOkZfhOSf8NDii3C+q(QHqLLs1$
	([X_i:":Rdi^lIBQqD#J]Qnn3HX;!Z'jJ8Z]cE\SQh'`.<7A-JSK`Qs+Ib9+im>IAjm*kd<kYO04*D
	bD-l6,>dC4%$C$9dI`ZPQ/$E,dBFmR28SX-B]YpI5.hqu">Cu;L'SqG@aVcU'.CjEgqLP@soC@5qe[
	V(Zb_th;,5.Z"g.H2ct%KmE:79R:u72eSR'*8Q/**b"#0A;e$<`Tua?D&\?r->^rW(gfd8.jUYS+P'
	9L@-F`"@So+3./T9_Glb[mG"u/4h*DCEF\fjqS"[oBKI(9bN\9UioJ4F@`.Y`7t-$/B2Ob->ND_"$R
	?,b;V6a81KhdWK0pD*=?p'oY-<,Ir+^(5jIc>9F)<hoFo)NZm9I9g!crY_nmr`eNu1&IN#XiUS,sit
	fWg(KAZfd[2jBVm#jB\+?9R7Zb\,damOK>r0q1&$'qLWVE#8gfV89C[bY3muH2Y;ifsn;GO7Pm^^1"
	n`$?mgWGp\7*/2G5S=tEje7@jTu-rAQbjZFI-i*NUgjJ1P;DV[@A#Ml]nh%kG]@h`4BUOkjhqGM6/O
	M6-hdm[Ea:s^>@)%$\J\ZsN.5:L:d`PX;[mctsfrS7%2.^!(+g8Qe=Uh;Q9(a&s!eZn=7'V'?eF.r2
	[Y$JW[F?pJ'8*B!87Y%\C1$s+!f<UHU1e<i5T7>,i"EuZR'Wa1WjUd0K?b8dcmh[Vb!t,tL7([`NAm
	/V/!N0Jkkg?.>D@V:UbrS]ED=kTDF(b@7$>h'r4jL]jnt<$0$&OKY@OtHT9VM++3KLGXTg>CqF6Cj1
	!lEZC;quE))kAHLF=<@W$<f;mn$s9,,;UEgN7.k`F>ZLD>Zt+.V5:&P9sp-Qp',f$?'K=>b*m-''.6
	PNoTf"_\Bu57`f1p+o&Gdh.\<FD$StXTW7qX`'W-DXL3=\1R&j<sFh(0[g&0--Bjc/1K[Yo9?0n<"r
	V#"*[cjT_CMYQt62j:^S9G)uR-VWl&,ZrB`mVAZI&3JCpI?='p_taknu&iO0b22H3."h7/QWMC/8KB
	&2$h$HAN1E"LY)#&_l>3,G:?):Rr=1!XbML."chKV<V%r_G^4"ce%;-YD;2AX)chm06&]FLloAlRIP
	u@#>@'Yh`?:I!IaM2-Z)u&Y!h13P1^[k7_[l+kcUZYc%nLgO*QLn!_=Vi0V9uRm'b@cD1(JA]B/$L&
	q9$HsO[G(=pTBQok>HSQ-Dg,J#DJkG+;]M%6!Nj6Z]l&%W6PmjS1-*E-\!G>Vte`<:*i,H1M=p>hn$
	Z!qD<]:E?g5UbMeBgLNDE3iP)pL6"^TB"i5(nM\aPX18Z&fh1#7g*7GD3q0*Q\NHt0S^@H3mWg.a%2
	kfIBIJRWLa?7`k`hPbbr]1PT((\!oOCsG,\Dk2pT[7+N7#uXPkZRl\lYJS5=44ijJ%5Z[YHZq/M$;3
	h.iRqWM6CH&T4Z:Hi2^rNO.cjd,"MBUN%5;Qj\9u%^Ti)BA\`$Zcc/aMNFGP9Mobhi<@h=\8/f9)ro
	G:<]0h>`D#)B)V2O"^Q@d:]fQ'Acigcp=QA-=e'dZ(/?d)02bBj4*.Y8D(.Q)aKBfjd#.Z,f>fGP0[
	#T$F;9pHd8neEYp"M]8bp.%[1J/A4R]KE,Eg![b<.P%]\%mJVmqXh2!>L6`dilnrSCq5+d0gk0Q\J(
	RkhK+:b+$SbMNFD%rSiO\YfI8=$F#XpUmRK`)i>A#lk_0ho&)1b4T)SQK**P;]a7BX4DWfEeWM5.<o
	so.tcQ@S"dSgY-1!k'<K)rA0#7MP+@K[e;)T+u-fKmeaKnmk!2e<7ajchb:,i!.>4mYpVAarW@PULR
	h&k;FGMT:,^]23`lEO")r\a2FTqCJp**7-@Gdg>p%='oqUmodAP\McY9+Y>la:*EKK+AFjD-RVc._V
	csM:-HEW`kt6)ShNQs[s/(4/Mib+aFq\e(4t(Q(FAt>.6c1B5OrQ8FVgN4e3a/cADR+TjC\X90g2nU
	GE&FQ?ap2aId.p<4@=i3d?Z=dU9.\*U<XLH<E5=<LuF24S9"2sj>7Op?K2g(=-`qJDD<h_b1sOtP'[
	TL"_W5QKQNPJL/\?iLC`"nqo`>W(h=CNJW[\?h7);4OgSoPV@CM*MMcF&+IqqsFPn@n*Bro-#<C:\1
	66"pZ*q#A(qmggf>imldp@KKKf3K2h:fR:gnTiHF2)Q\%lu1ffOA/@%<_'j,+sog>u`m5QfM_,)_B.
	0r65O+<AYk5OV<oA[r^_-MUS=j&)'NN9T[pLo('lZ'f_$)"ioR<=*j@\]L[-Z;KLqlcQ<G'"+#cF]Q
	-u]>d,P\%<puSZ4pLEFAs4K\ogcU#g*V?hbRIiH8V>.DAjcm;,NJC,,?X>T$!J[c5eue/Gi,H\oY1V
	Fco,)j%oS>9bp!]m@kQ*rp%FYj4aJ+hkr>He;2PI3usb-/Eh%dJh8>68*@fB3"c>%iHXC.&.dgHTDs
	jn0u&1d3"6K(?XdFjj9;drP>g_$F<fDI\2_d8b]J#Om0C<P>4^oro]?bR7'uEolRiZa(t_79GES=?S
	V&!1ptc6k"'cf?@4_g660uo%FKJ`Tdb;*G9="u]]>\Mh[r/%MC\f>UoqC6:4Su0d;8t<-Z=dTqZ1UM
	*1<5Qro.rnmiMV)8AbX5cEY$W"l'js5.p$K#+DV7f0enp$2f<k,K(dN=ql!#0mFjG"[%r@R0nt#Q"R
	a1VVMVG0[a>Eqp"ffVHK^(n)+(C_oaD`q8/sjCS-EdHkB'b5kh3T9,s`7\'r"^OQD11^Pa3*4)G:'[
	iGKM4C9#[sh(CGmVMg69h.IKsH21GpERH*eC@l35nIm1-QgB@:UF?W6n1\TmH&MR`SshNpA(ncl^pm
	tn_c>5OSXn$!Slrk0'sSWRk;`(pQQ5kZMq=]]9PbAKOlG_RFRQBKh9.Mn_4F\LF>Uu.<>:Cmn&`64`
	Z#oghi1Dh,rIQFf(si:r]Ia_i4f0P4GUN1GbuGs@,WS4d'#'"k01)eJNqq5/(($HQab2+52B8T=PN,
	8(qSENIaU4U/8b`*r;KppKnY5TCJ5OA:ak5%2iWh1`C5gE)*.l5)X80tmn6EFC7cZ`AKY[qk$id'4n
	S?[ca2HtC/BcIJ.S<g?E2tkC>E&55&s&un'IYPbV6!&I>^9Fg$tsB6e'+/U*-f;2nVs$r8[j4cEpqa
	jo6DWqbP7NU(kGM">QC_KF(`>j%;GlZ/fHLL2`2\+8"AuA*HK?btq^8F72L6Kr=P2c%g8!heEL=R&=
	.b&7kVjINa[^*XTpF5N,D[i]?"ma,\PCBnZ!"/bblBrsAJ.q$Kt`6D=T++]3iQO=3Cc8<b5B,YAU\&
	g[eiM%YJp6jZ1HU')V_;1amk-p^BpPTV4s8e;UJ-0Pp"rrIh9cGb?D4\#JP!!#SZ:.26O@"J
	ASCII85End
End

