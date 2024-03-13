pw.x -i iron.scf > iron.scf.out
pw.x -i iron.nscf > iron.nscf.out

wannier90.x -pp iron_up
wannier90.x -pp iron_dn

pw2wannier90.x < iron_up.pw2wan > pw2wan_up.out
pw2wannier90.x < iron_dn.pw2wan > pw2wan_dn.out

wannier90.x iron_up
wannier90.x iron_dn

FERMI=$(grep 'the Fermi energy is' iron.nscf.out | tr -d 'a-zA-Z ():')
wann2J.py --efermi $FERMI --kmesh 4 4 4 --elements Fe1 --prefix_up iron_up --prefix_down iron_dn --emin -10.0 --emax 0.0
