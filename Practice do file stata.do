log using "C:\Users\Abdul\Desktop\BUI\Financial Modelling\Revision\panal data practice log.smcl"
encode company, gen(comp)
tstest comp year
tsset comp year
reg cash cft liq lev mbr size
hettest
winsor cash, gen(wcash) p(0.1)
winsor cft, gen(wcft) p(0.1)
winsor liq, gen(wliq) p(0.1)
winsor lev, gen(wlev)
winsor lev, gen(wlev) p(0.1)
winsir mbr, gen(wmbr) p(0.1)
winsor mbr, gen(wmbr) p(0.1)
winsor size, gen(wsize) p(0.1)
reg wcash wcft wliq wlev wmbr wsize
xtreg wcash wcft wliq wlev wmbr wsize, fe
estimate store fe
xtreg wcash wliq wlev wmbr wsize, re
estimate store re
hausman fe re
##AS THE PROBABILITY IS LESS THE 0.5 SO WE WILL GO WITH FIXED EFFECT
xtabond wcash wcft wliq wlev wmbr wsize, lags(1) twostep artests(2)
xtabond wcash wcft wliq wlev wmbr wsize, diffvars(l.wcft l.wlev) lags(1) twostep artests(2)
xtabond wcash wcft wliq wlev wmbr wsize, inst(l.wcft l.wlev) lags(1) twostep artests(2)
xtabond wcash wcft wliq wlev wmbr wsize, inst(l.wcft l.wlev) lags(1) twostep artests(2)
estat sargon
estat sargan
estat abond
log close
