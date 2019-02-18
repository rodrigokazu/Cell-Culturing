-----------------------------------------------------------------------------------------------------------------#

--Written by Rodrigo Kazu#
--Any enquiries to r.siqueiradesouza@pgr.reading.ac.uk#

-----------------------------------------------------------------------------------------------------------------#

--First block import the relevant libraries and initialises the important variables

-----------------------------------------------------------------------------------------------------------------#


print ("\n\nBrain Embodiment Laboratory script for Media Making. \n\nWhich media are you trying to make?\n\n0: CgR8 Media\n1: ADNFK \n2: DIV(-4) Retinoic Acid + Purmophamine. \n3: DIV(-1) GDNF \n4: DIV O to 6 - Neuronal Media FBS(+) \n5: DIV O to 6 - Neuronal Media FBS(-) \n6: DIV 2 - Contention Media \n7: DIV 6 - Neuronal Differentiation Media (DIV7+)\n8: Astrocyte Media \n "); 

case = io.read(); --Reads the input for the option from the keyboard

conditional = case;

print ("\n\nPlease insert the volume you plan on making, in mL.\n");

volume = io.read(); --Reads the input for the volume from the keyboard



-----------------------------------------------------------------------------------------------------------------#

--Third block evaluates general percentages for the most used reagents

-----------------------------------------------------------------------------------------------------------------#


function tenpercent()
		local ten_p = volume/10;
		return ten_p;
end

function onepercent()
		local one_p = volume/100;
		return one_p;
end

function twopercent()
	local two_p = volume/50; 
	return two_p;
end

function mercapto()
		local bmercapto = volume; --100uM stock
		return bmercapto;
end


-----------------------------------------------------------------------------------------------------------------#

--CGR8 media block 

-----------------------------------------------------------------------------------------------------------------#


function lif()
		local leukemia = volume/10;
		return leukemia;
end


FCS = tenpercent();
penstrep = onepercent();
lglut = onepercent();
bmercaptoethanol = mercapto();
LIF = lif();

function dmem()
	local rest = FCS + penstrep + lglut + bmercaptoethanol/1000 + LIF/1000;
	local DMEM = volume - rest;
	return DMEM;
end

DMEM = dmem();

function cgr8()	
	print("\n\n\nYour CRG8 media recipe:\n\nDMEM(mL):",DMEM,"\n\nFBS(mL):",FCS,"\n\nPenicillin/Streptomycin(mL):",penstrep,"\n\nL-glutamine(mL):",lglut,"\n\nB-mercaptopethanol(uL):",bmercaptoethanol,"\n\nLIF(uL):",LIF)
end

-----------------------------------------------------------------------------------------------------------------#

--ADFNK media block 

-----------------------------------------------------------------------------------------------------------------#

KSR = tenpercent();

function admem()
	local rest = KSR + penstrep + lglut + bmercaptoethanol/1000;
	local total = volume - rest;
	local ADMEM = total/2;
	return ADMEM;
end

ADMEM = admem();

function adfnk()
	print("\n\n\nYour ADFNK media recipe:\n\nADMEM/Neurobasal(mL):",ADMEM,"\n\nKSR(mL):",KSR,"\n\nPenicillin/Streptomycin(mL):",penstrep,"\n\nL-glutamine(mL):",lglut,"\n\nB-mercaptopethanol(uL):",bmercaptoethanol);
end


-----------------------------------------------------------------------------------------------------------------#

-- DIV(-5) Retinoic Acid + Purmophamine block

-----------------------------------------------------------------------------------------------------------------#


function ra()
	retinoic = volume/1000;
	return retinoic;
end


function gdnf5ng()
	local ng = volume*5;
	local uL = ng/100;
	return uL;
end

function purmorphamine() -- Stock is stored at 10mM, need to dilute it to 2 uM giving us a 5000 dilution factor
	local pur = volume/5000;
	return pur;
end

RA = ra();

purmorphamine = purmorphamine();

function divminusfour()
	print("\n\n\nYour DIV(-5) media recipe:\n\nRetinoic Acid(mL) volume added to ADFNK:",RA,"\n\nPurmorphamine(mL) volume added to ADFNK:",purmorphamine);
end


-----------------------------------------------------------------------------------------------------------------#

--DIV(-1) GDNF 5ng/mL block

-----------------------------------------------------------------------------------------------------------------#



function gdnf5ng()
	local ng = volume*5;
	local uL = ng/100;
	return uL;
end


GDNF = gdnf5ng();

function divminusone()
	print("\n\n\nYour DIV(-5) media recipe:\n\nGDNF(uL) volume added to ADFNK:",GDNF);
end

-----------------------------------------------------------------------------------------------------------------#

--DIV 0 to 6 Neuronal Media - FBS (+) and FBS (-)
-----------------------------------------------------------------------------------------------------------------#

FBS = tenpercent();
GS21 = onepercent();
GMAX = onepercent();

function gentamicin() -- 50ug/mL from stock solution that is 50mg/mL
	gentamicin = volume/1000;
	gentamicin = gentamicin*5; -- New one(April, 2017) is 10mg/mL
	return gentamicin;
end

gentamicin = gentamicin();
GNDF_10 = GDNF; -- redundancy


function bFGF() 
	local bFGF = volume*0.04; --in uL
	return bFGF;
end

bFGF = bFGF();

function glucose() -- From 1.7M on stock to 8.6mM -- Dilution factor of 198
	local glucose = volume/198;
	return glucose;
end

glucose = glucose();

BDNF = tenpercent(); -- in uL

laminin = volume/1.1; -- 1.1mg/mL stock!

function Neurobasal() -- Gentamicin removed on 13/02/2018 for the FBS (+) and (-) test
	local otheringredients = FBS + GS21 + GMAX + penstrep + bFGF/1000 + bmercaptoethanol/1000 + GNDF_10/1000 + glucose + BDNF/1000 + laminin/1000; -- Laminin optional for seeding, 1.1mg stock: + laminin/1000
	local Neurobasal = volume - otheringredients;
	Neurobasal = Neurobasal/2;
	return Neurobasal;
end	

neurobasal = Neurobasal();


function amplification()
	print("\n\n\nYour Amplication media FBF(+) recipe:\n\nADMEM/F12 and Neurobasal(mL):",neurobasal,"\n\nFBS:",FBS,"\n\nGS21 (mL):",GS21,"\n\nGMAX (mL):",GMAX, "\n\nPenicillin/Streptomycin(mL):",penstrep,"\n\nbFGF (uL):", bFGF, "\n\nB-mercaptopethanol(uL):",bmercaptoethanol,"\n\nGDNF (uL):",GNDF_10,"\n\nGlucose (mL):",glucose,"\n\nBDNF (uL):", BDNF, "\n\nNot included in the calculation - Laminin optional (uL):",laminin);
end


function FBSminus() -- Gentamicin removed on 13/02/2018 for the FBS (+) and (-) test
	local otheringredients = GS21 + GMAX + penstrep + bmercaptoethanol/1000 + GNDF_10/1000 + glucose + BDNF/1000 + laminin/1000; -- Laminin optional for seeding, 1.1mg stock: + laminin/1000
	local ADMEMF12 = volume - otheringredients;
	-- Debug: print(otheringredients)
	ADMEMF12 = ADMEMF12/2;
	return ADMEMF12;
end	

ADMEMF12 = FBSminus();

function FBSminus_medium()
	print("\n\n\nYour Amplication media FBF(-) recipe:\n\n\nADMEM/F12 and Neurobasal(mL):",ADMEMF12,"\n\nB27 (mL):",GS21,"\n\nGMAX (mL):",GMAX, "\n\nPenicillin/Streptomycin(mL):",penstrep,"\n\nbFGF (uL):", bFGF, "\n\nB-mercaptopethanol(uL):",bmercaptoethanol,"\n\nGDNF (uL):",GNDF_10,"\n\nGlucose (mL):",glucose,"\n\nBDNF (uL):", BDNF, "\n\nNot included in the calculation - Laminin optional (uL):",laminin);
end
-----------------------------------------------------------------------------------------------------------------#

--DIV 2 -- Contention Media block -- araC 5uM (BEL used 2.5uM before but it was too weak for neuronal cultures

-----------------------------------------------------------------------------------------------------------------#


function araC() -- Stock at 0.2mM
	local araC = 0.025*volume;
	return araC;
end

araC = araC();

function contention()
	print("\n\n\nYour contention media recipe with 3 uM of ara-C:\n\naraC(uL) volume added to Amplification Media from the 0.1 M stock:",araC,"\n\nNO bFGF");
end




-----------------------------------------------------------------------------------------------------------------#

-- DIV 3 to 5 - Patterning Media block

-----------------------------------------------------------------------------------------------------------------#

-- function FGF8() -- Stock at 25ug/100uL -- 250ng/uL
--	local FGF8_needed_ng = volume*100;
--	local FGF8_needed_uL = FGF8_needed_ng/250 ;
--	return FGF8_needed_uL;
--end	

--FGF8 = FGF8();

--function patterning()
--	print("\n\nDIV 3 to 5 - Patterning Media recipe:\n\nFGF8(uL) volume added to Amplification Media:",FGF8,"\n\nNO bFGF");
--end

-----------------------------------------------------------------------------------------------------------------#

-- DIV 6 - Neuronal Differentiation Media block

-----------------------------------------------------------------------------------------------------------------#

function NT4() -- Stock at 10ug/100uL -- 1ug / 10 uL -- 100ng/uL
	local NT4_needed_ng = volume*10;
	local NT4_needed_uL = NT4_needed_ng/100;
	return NT4_needed_uL;
end

NT4 = NT4();


function differentiation()
	print("\n\n\nYour DIV 6 Neuronal Differentiation Media recipe:\n\nNT4(uL) volume added to Amplification Media:",NT4,"\n\nNO bFGF");
end

-----------------------------------------------------------------------------------------------------------------#

-- Astrocyte media block

-----------------------------------------------------------------------------------------------------------------#

Astro_FBS = twopercent();
N2 = onepercent();
heparin = volume;

function F12()
	local otheringredients = Astro_FBS + N2 + penstrep + lglut + heparin/1000 + bmercaptoethanol;
	local F12 = volume - otheringredients;
	return F12;
end	

F12 = F12();

function astrocytic()
	print("\n\n\nYour Astrocytic media recipe:\n\nADMEM/F12(mL):",F12,"\n\nFBS(mL):",Astro_FBS,"\n\nPenicillin/Streptomycin(mL):",penstrep,"\n\nL-glutamine(mL):",lglut,"\n\nB-mercaptopethanol(mL):",bmercaptoethanol, "\n\nHeparin(uL):", heparin,"\n\nN2(mL):",N2);
end




-----------------------------------------------------------------------------------------------------------------#

--This block runs the specific function for the media wanted

-----------------------------------------------------------------------------------------------------------------#


if conditional=="0" then 
	cgr8();
	elseif conditional=="1" then
		adfnk();
		elseif conditional=="2" then
			divminusfour();
			elseif conditional=="3" then
				divminusone();
					elseif conditional=="4" then
						amplification();
							elseif conditional=="5" then
								FBSminus_medium();
									elseif conditional=="6" then
										contention();
											elseif conditional=="7" then
												differentiation();
													elseif conditional=="8" then
														astrocytic();


end


function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
end

wait(50000)


	
