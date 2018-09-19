rm output.out
mkdir /tmp/$(whoami)
rm /tmp/$(whoami)/myhepmc.fifo
export RIVET_ANALYSIS_PATH=/afs/desy.de/user/j/jung/public/school/2018/rivet
export RIVET_DATA_PATH=/afs/desy.de/user/j/jung/public/school/2018/rivet
export RIVET_PLOT_PATH=/afs/desy.de/user/j/jung/public/school/2018/rivet
export HEPMCOUT=/tmp/$(whoami)/myhepmc.fifo
mkfifo /tmp/$(whoami)/myhepmc.fifo
nice ./main31 > pythia.out&
#rivet -a myanalysis $HEPMCOUT> rivet.out
rivet --pwd -a ATLAS_2015_I1408516 $HEPMCOUT > rivet.out
#rivet --pwd -a READ_HEPMC $HEPMCOUT > rivet.out
#rivet -a MC_PRINTEVENT -a READ_HEPMC  $HEPMCOUT > rivet.out
#rivet -a MC_PRINTEVENT -a nullexample  $HEPMCOUT> rivet.out
mv Rivet.yoda YODA_files/hdamp91_pT1001.yoda
