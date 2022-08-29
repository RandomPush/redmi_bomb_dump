#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:a1d5b3902c3561b9019158b914ba49707e9abe56; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:d8d152c8e3099b90638b95be3b6729e0d16527f0 \
          --target EMMC:/dev/block/by-name/recovery:134217728:a1d5b3902c3561b9019158b914ba49707e9abe56 && \
      log -t recovery "Installing new recovery image: succeeded" && \
        echo "Installing new recovery image: succeeded" > /cache/recovery/last_install_recovery_status || \
      (log -t recovery "Installing new recovery image: failed" && \
        echo "Installing new recovery image: failed" > /cache/recovery/last_install_recovery_status)
else
  log -t recovery "Recovery image already installed" && \
  echo "Recovery image already installed" > /cache/recovery/last_install_recovery_status
fi
