#%Module 1.0 -*- tcl -*-

source $env(KAUST_MODULES_ROOT)/common/setup.tcl
GeneralAppSetup

prepend-path      LM_LICENSE_FILE         27020@wthflxsr03.kaust.edu.sa


set             CADENCE_MOD             $app_dir
setenv          CADENCE_MOD_PATH        $CADENCE_MOD

# Set a default OS-Platform for Unsupported os!
setenv      OA_UNSUPPORTED_PLAT linux_rhel40
# Run on 64bit-mode
setenv      CDS_AUTO_64BIT      ALL

set             ASSURA_dir      [glob -nocomplain -directory $CADENCE_MOD ASSURA*]
set             EDI_dir         [glob -nocomplain -directory $CADENCE_MOD EDI*]
set             EXT_dir         [glob -nocomplain -directory $CADENCE_MOD EXT*]
set             IC_dir          [glob -nocomplain -directory $CADENCE_MOD IC*]
set             INCISIV_dir    [glob -nocomplain -directory $CADENCE_MOD INCISIV*]
set             LCU_dir         [glob -nocomplain -directory $CADENCE_MOD LCU*]
set             MMSIM_dir       [glob -nocomplain -directory $CADENCE_MOD MMSIM*]
set             PVS_dir         [glob -nocomplain -directory $CADENCE_MOD PVS*]
set             SSV_dir         [glob -nocomplain -directory $CADENCE_MOD SSV*]
set             CONFRML_dir     [glob -nocomplain -directory $CADENCE_MOD CONFRML*]
set             ETS_dir         [glob -nocomplain -directory $CADENCE_MOD ETS*]
set             PVE_dir         [glob -nocomplain -directory $CADENCE_MOD PVE*]
set             RC_dir         [glob -nocomplain -directory $CADENCE_MOD RC*]

setenv          ASSURAHOME      $ASSURA_dir
setenv          EDIHOME         $EDI_dir
setenv          EXTHOME         $EXT_dir
setenv          ICHOME          $IC_dir
setenv          INCISIVHOME    $INCISIV_dir
setenv          LCUHOME         $LCU_dir
setenv          MMSIMHOME       $MMSIM_dir
setenv          PVSHOME         $PVS_dir
setenv          SSVHOME         $SSV_dir
setenv          CDSHOME         $IC_dir
setenv          QRC_HOME        $EXT_dir
setenv          CONFRMLHOME     $CONFRML_dir
setenv          ETSHOME         $ETS_dir
setenv          PVEHOME         $PVE_dir
setenv          RCHOME          $RC_dir
setenv          CDS_Netlisting_Mode             Analog
setenv          CDS_BIND_TMP_DD         true
setenv          AMSHOME          $INCISIV_dir
setenv          IUSDIR           $env(AMSHOME)


set             ASSURAPATH      $ASSURA_dir/tools/bin:$ASSURA_dir/tools/dfII/bin
set             EDIPATH         $EDI_dir/tools.lnx86/bin:$EDI_dir/tools.lnx86/dfII/bin
set             EXTPATH         $EXT_dir/tools/bin:$EXT_dir/tools/dfII/bin
set             ICPATH          $IC_dir/tools/bin:$IC_dir/tools/dfII/bin
set             INCISIVPATH     $INCISIV_dir/tools/bin:$INCISIV_dir/tools/dfII/bin
set             LCUPATH         $LCU_dir/bin:$LCU_dir/tools/bin:$LCU_dir/tools/dfII/bin
set             MMSIMPATH       $MMSIM_dir/tools.lnx86/bin:$MMSIM_dir/tools.lnx86/dfII/bin
set             PVSPATH         $PVS_dir/tools.lnx86/bin:$PVS_dir/tools.lnx86/dfII/bin:$PVS_dir/bin
set             SSVPATH         $SSV_dir/tools.lnx86/bin:$SSV_dir/tools.lnx86/dfII/bin

set             OA_PATH         $EDI_dir/oa_v22.50.011/bin
set             CDSPATH         $IC_dir/tools/bin:$IC_dir/tools/dfII/bin
set             QRCPATH         $EXT_dir/tools/bin:$EXT_dir/tools/dfII/bin:$EXT_dir/bin
set             CONFRMLPATH     $CONFRML_dir/tools.lnx86/bin:$CONFRML_dir/tools.lnx86/dfII/bin
set             ETSPATH         $ETS_dir/tools.lnx86/bin:$ETS_dir/tools.lnx86/dfII/bin
set             PVEPATH         $PVE_dir/tools.lnx86/bin:$PVE_dir/tools.lnx86/dfII/bin
set             RCPATH          $RC_dir/tools.lnx86/bin:$RC_dir/tools.lnx86/dfII/bin

AddDeps calibre/2012.3_31

prepend-path    PATH          $EDIPATH:$EXTPATH:$ICPATH:$INCISIVPATH:$LCUPATH:$MMSIMPATH:$PVSPATH:$SSVPATH:$OA_PATH:$ASSURAPATH:$CDSPATH:$QRCPATH:$CONFRMLPATH:$ETSPATH:$PVEPATH:$RCPATH

module use    /opt/share/cadence/modules

file copy -force /opt/share/cadence/kits/.cdsinit ~
