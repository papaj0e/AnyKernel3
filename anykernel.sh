# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Steroid Kernel @Tetsuo&Nomad&PJ
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=raphael
device.name2=raphaelin
device.name3=cepheus
supported.versions=11-14
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_block_display=true;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel boot install
dump_boot;

case "$ZIPFILE" in
  *66fps*|*66hz*)
    ui_print "  • Setting 66 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=1"
    ;;
  *69fps*|*69hz*)
    ui_print "  • Setting 69 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=2"
    ;;
  *72fps*|*72hz*)
    ui_print "  • Setting 72 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=3"
    ;;
  *75fps*|*75hz*)
    ui_print "  • Setting 75 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=4"
    ;;
  *78fps*|*78hz*)
    ui_print "  • Setting 78 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=5"
    ;;
  *80fps*|*80hz*)
    ui_print "  • Setting 80 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=6"
    ;;
  *81fps*|*81hz*)
    ui_print "  • Setting 81 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=7"
    ;;
  *84fps*|*84hz*)
    ui_print "  • Setting 84 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=8"
    ;;
  *90fps*|*90hz*)
    ui_print "  • Setting 90 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=9"
    ;;
  *)
    patch_cmdline "msm_drm.framerate_override" ""
    fr=$(cat /sdcard/framerate_override | tr -cd "[0-9]");
    [ $fr -eq 66 ] && ui_print "  • Setting 66 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=1"
    [ $fr -eq 69 ] && ui_print "  • Setting 69 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=2"
    [ $fr -eq 72 ] && ui_print "  • Setting 72 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=3"
    [ $fr -eq 75 ] && ui_print "  • Setting 75 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=4"
    [ $fr -eq 78 ] && ui_print "  • Setting 78 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=5"
    [ $fr -eq 80 ] && ui_print "  • Setting 80 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=6"
    [ $fr -eq 81 ] && ui_print "  • Setting 81 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=7"
    [ $fr -eq 84 ] && ui_print "  • Setting 84 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=8"
    [ $fr -eq 90 ] && ui_print "  • Setting 90 Hz refresh rate" && patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=9"
    ;;
esac

write_boot;
## end boot install


# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;


## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install
