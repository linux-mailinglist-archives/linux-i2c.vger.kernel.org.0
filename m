Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EE37E13C2
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Nov 2023 14:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjKENra (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Nov 2023 08:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjKENr3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Nov 2023 08:47:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D134CC;
        Sun,  5 Nov 2023 05:47:26 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C6BC433C7;
        Sun,  5 Nov 2023 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699192045;
        bh=WYZei7Hpr6vnL+Va4ka+3aDj0pq0KAFuCxxUjCCfeV8=;
        h=Date:From:To:Cc:Subject:From;
        b=Xo+/BM9Eubb3RiZRSv18sW26bWiwJd4Gw/G67nkHNvkKvwgqs06YNeUqU558v0Stw
         lm6RscPFU9/qzWJUWsP/92ezwaYnt9yMOvLN2g4OtAhUfFQ9SnkslD6d4Q/nLmu44o
         CijcywoS7tsQU+Z8tgyHFBCkaDvNEGfaSEw5qtCJTlmxn8XVQHDsYbBUdt94JGyV6J
         kQo63sD29TrD4hBzBl9eMKyWGT035JbPDlwyiMIQHmo+7AvEMjXjrka3tVJ10Ltbs7
         SUZkTQ0tw/3Y0PT9v4LHML4Rk6Ow5e6cm24HUkIXxNx8j4Fxc5d9C/kiK5X1cuzIo9
         jnEG1cvAG8F4Q==
Date:   Sun, 5 Nov 2023 14:47:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.7-rc1
Message-ID: <ZUec6zftAPNR+dsb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5YVlkJaEHRS8Krcp"
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5YVlkJaEHRS8Krcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc1

for you to fetch changes up to 10e806d39d304f837ed2921f36499f17a774a220:

  i2c: s3c2410: make i2c_s3c_irq_nextbyte() void (2023-10-29 22:31:52 +0100)

----------------------------------------------------------------
I2C has largely driver updates for 6.7., i.e. feature additions (like
adding transfers while in atomic mode), using new helpers (like
devm_clk_get_enabled), new IDs, documentation fixes and additions... you
name it. The core got a memleak fix and better support for nested muxes.

----------------------------------------------------------------
Alain Volmat (1):
      i2c: stm32f7: add description of atomic in struct stm32f7_i2c_dev

Alexander Stein (2):
      dt-bindings: at24: add ST M24C64-D Additional Write lockable page
      eeprom: at24: add ST M24C64-D Additional Write lockable page support

Andi Shyti (3):
      i2c: at91-core: Use devm_clk_get_enabled()
      i2c: stm32f4: Use devm_clk_get_enabled()
      i2c: stm32f7: Use devm_clk_get_enabled()

Axel Lin (1):
      i2c: sun6i-p2wi: Prevent potential division by zero

Benjamin Bara (5):
      kernel/reboot: emergency_restart: Set correct system_state
      i2c: core: Run atomic i2c xfer when !preemptible
      kernel/reboot: Add device to sys_off_handler
      mfd: tps6586x: Use devm-based power off handler
      mfd: tps6586x: Register restart handler

Biju Das (1):
      eeprom: at24: Drop at24_get_chip_data()

Bryan O'Donoghue (1):
      dt-bindings: i2c: qcom-cci: Document sc8280xp compatible

Camel Guo (1):
      i2c: exynos5: Calculate t_scl_l, t_scl_h according to i2c spec

Dan Carpenter (1):
      i2c: rcar: fix error code in probe()

Daniel Golle (1):
      i2c: mt65xx: allow optional pmic clock

Daniel Mack (1):
      i2c: core: fix lockdep warning for sparsely nested adapter chain

Geert Uytterhoeven (1):
      dt-bindings: i2c: i2c-demux-pinctrl: Convert to json-schema

Heiner Kallweit (9):
      i2c: i801: fix potential race in i801_block_transaction_byte_by_byte
      i2c: i801: unregister tco_pdev in i801_probe() error path
      i2c: i801: add helper i801_restore_regs
      i2c: i801: simplify module boilerplate code
      i2c: i801: use i2c_mark_adapter_suspended/resumed
      i2c: i801: replace acpi_lock with I2C bus lock
      i2c: i801: Simplify class-based client device instantiation
      ACPI: Add helper acpi_use_parent_companion
      i2c: i801: Use new helper acpi_use_parent_companion

Ivan Orlov (1):
      i2c: dev: make i2c_dev_class a static const structure

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Birch Stream SoC

Jason Yan (1):
      i2c: s3c2410: make i2c_s3c_irq_nextbyte() void

Justin Stitt (2):
      i2c: cp2615: replace deprecated strncpy with strscpy
      i2c: powermac: replace deprecated strncpy

Kees Cook (3):
      i2c: mux: demux-pinctrl: Annotate struct i2c_demux_pinctrl_priv with __counted_by
      i2c: Annotate struct i2c_atr with __counted_by
      eeprom: at24: Annotate struct at24_data with __counted_by

Luca Weiss (1):
      dt-bindings: i2c: qcom-cci: Document SC7280 compatible

Marek Szyprowski (2):
      i2c: brcmstb: Add support for atomic transfers
      i2c: exynos5: add support for atomic transfers

Marek Vasut (2):
      dt-bindings: at24: add ST M24C32-D Additional Write lockable page
      eeprom: at24: add ST M24C32-D Additional Write lockable page support

Randy Dunlap (1):
      i2c: axxia: eliminate kernel-doc warnings

Rob Herring (1):
      i2c: Use device_get_match_data()

Sean Nyekjaer (1):
      i2c: stm32f7: Add atomic_xfer method to driver

Shawn Guo (1):
      i2c: qcom-geni: add ACPI device id for sc8180x

Wolfram Sang (16):
      i2c: rcar: avoid non-standard use of goto
      i2c: rcar: properly format a debug output
      i2c: rcar: calculate divider instead of brute-forcing it
      i2c: rcar: remove open coded DIV_ROUND_CLOSEST
      i2c: riic: avoid potential division by zero
      Merge tag 'ib-mfd-i2c-reboot-v6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into i2c/for-mergewindow
      Merge branch 'i2c/for-current' into i2c/for-mergewindow
      i2c: rcar: reset controller is mandatory for Gen3+
      i2c: rcar: improve accuracy for R-Car Gen3+
      i2c: gpio: remove error checks with debugfs
      i2c: mux: gpio: adhere to coding style
      Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"
      Merge tag 'at24-updates-for-v6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      i2c: fix memleak in i2c_new_client_device()
      MAINTAINERS: add YAML file for i2c-demux-pinctrl
      Documentation: i2c: add fault code for not supporting 10 bit addresses

Yann Sionneau (1):
      i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low

ye xingchen (1):
      i2c: mux: demux-pinctrl: Convert to use sysfs_emit_at() API


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (11):
      (Rev.) i2c: i801: Use new helper acpi_use_parent_companion
      (Rev.) ACPI: Add helper acpi_use_parent_companion
      (Rev.) i2c: axxia: eliminate kernel-doc warnings
      (Rev.) i2c: exynos5: add support for atomic transfers
      (Rev.) i2c: brcmstb: Add support for atomic transfers
      (Rev.) i2c: i801: Add support for Intel Birch Stream SoC
      (Rev.) i2c: Use device_get_match_data()
      (Rev.) i2c: gpio: remove error checks with debugfs
      (Rev.) i2c: i801: replace acpi_lock with I2C bus lock
      (Rev.) i2c: i801: use i2c_mark_adapter_suspended/resumed
      (Rev.) i2c: mt65xx: allow optional pmic clock

Andy Shevchenko (1):
      (Rev.) eeprom: at24: Drop at24_get_chip_data()

AngeloGioacchino Del Regno (1):
      (Rev.) i2c: mt65xx: allow optional pmic clock

Bryan O'Donoghue (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document SC7280 compatible

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: i2c-demux-pinctrl: Convert to json-schema

Dmitry Osipenko (5):
      (Rev.) mfd: tps6586x: Register restart handler
      (Rev.) mfd: tps6586x: Use devm-based power off handler
      (Rev.) kernel/reboot: Add device to sys_off_handler
      (Rev.) i2c: core: Run atomic i2c xfer when !preemptible
      (Rev.) kernel/reboot: emergency_restart: Set correct system_state

Florian Fainelli (1):
      (Rev.) i2c: brcmstb: Add support for atomic transfers

Geert Uytterhoeven (10):
      (Rev.) i2c: rcar: fix error code in probe()
      (Rev.) i2c: mux: gpio: adhere to coding style
      (Rev.) i2c: gpio: remove error checks with debugfs
      (Rev.) i2c: rcar: improve accuracy for R-Car Gen3+
      (Rev.) i2c: rcar: reset controller is mandatory for Gen3+
      (Rev.) i2c: riic: avoid potential division by zero
      (Rev.) i2c: rcar: remove open coded DIV_ROUND_CLOSEST
      (Rev.) i2c: rcar: calculate divider instead of brute-forcing it
      (Rev.) i2c: rcar: properly format a debug output
      (Rev.) i2c: rcar: avoid non-standard use of goto

Gustavo A. R. Silva (3):
      (Rev.) eeprom: at24: Annotate struct at24_data with __counted_by
      (Rev.) i2c: Annotate struct i2c_atr with __counted_by
      (Rev.) i2c: mux: demux-pinctrl: Annotate struct i2c_demux_pinctrl_priv with __counted_by

Jean Delvare (8):
      (Rev.) i2c: i801: Simplify class-based client device instantiation
      (Rev.) i2c: i801: Add support for Intel Birch Stream SoC
      (Rev.) i2c: i801: replace acpi_lock with I2C bus lock
      (Rev.) i2c: i801: use i2c_mark_adapter_suspended/resumed
      (Rev.) i2c: i801: simplify module boilerplate code
      (Rev.) i2c: i801: add helper i801_restore_regs
      (Rev.) i2c: i801: unregister tco_pdev in i801_probe() error path
      (Rev.) i2c: i801: fix potential race in i801_block_transaction_byte_by_byte

Kees Cook (2):
      (Rev.) i2c: powermac: replace deprecated strncpy
      (Rev.) i2c: cp2615: replace deprecated strncpy with strscpy

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
      (Rev.) dt-bindings: i2c: qcom-cci: Document SC7280 compatible

Marek Szyprowski (2):
      (Test) i2c: exynos5: Calculate t_scl_l, t_scl_h according to i2c spec
      (Rev.) i2c: exynos5: Calculate t_scl_l, t_scl_h according to i2c spec

Marek Vasut (2):
      (Rev.) eeprom: at24: add ST M24C64-D Additional Write lockable page support
      (Rev.) dt-bindings: at24: add ST M24C64-D Additional Write lockable page

Mika Westerberg (1):
      (Rev.) i2c: i801: unregister tco_pdev in i801_probe() error path

Nishanth Menon (2):
      (Test) i2c: core: Run atomic i2c xfer when !preemptible
      (Test) kernel/reboot: emergency_restart: Set correct system_state

Wolfram Sang (2):
      (Test) i2c: mux: demux-pinctrl: Convert to use sysfs_emit_at() API
      (Rev.) dt-bindings: i2c: i2c-demux-pinctrl: Convert to json-schema

 Documentation/devicetree/bindings/eeprom/at24.yaml |   4 +
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.txt  | 135 ----------------
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 172 ++++++++++++++++++++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 Documentation/i2c/fault-codes.rst                  |   4 +
 MAINTAINERS                                        |   1 +
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-at91-core.c                 |  10 +-
 drivers/i2c/busses/i2c-axxia.c                     |   8 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |  23 ++-
 drivers/i2c/busses/i2c-cp2615.c                    |   2 +-
 drivers/i2c/busses/i2c-designware-common.c         |  17 ++
 drivers/i2c/busses/i2c-designware-core.h           |   3 +
 drivers/i2c/busses/i2c-exynos5.c                   |  80 ++++++++-
 drivers/i2c/busses/i2c-gpio.c                      |   7 +-
 drivers/i2c/busses/i2c-i801.c                      | 111 +++++--------
 drivers/i2c/busses/i2c-mt65xx.c                    |  12 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |  11 +-
 drivers/i2c/busses/i2c-omap.c                      |   8 +-
 drivers/i2c/busses/i2c-powermac.c                  |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   7 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   1 +
 drivers/i2c/busses/i2c-rcar.c                      | 180 +++++++++++++--------
 drivers/i2c/busses/i2c-riic.c                      |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   7 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |  32 ++--
 drivers/i2c/busses/i2c-stm32f7.c                   |  89 ++++++----
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |   5 +
 drivers/i2c/i2c-atr.c                              |   2 +-
 drivers/i2c/i2c-core-base.c                        |  19 ++-
 drivers/i2c/i2c-core.h                             |   2 +-
 drivers/i2c/i2c-dev.c                              |  18 +--
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |  12 +-
 drivers/i2c/muxes/i2c-mux-gpio.c                   |   7 +-
 drivers/mfd/tps6586x.c                             |  50 +++++-
 drivers/misc/eeprom/at24.c                         |  42 ++---
 include/linux/acpi.h                               |   5 +
 include/linux/reboot.h                             |   3 +
 kernel/reboot.c                                    |   4 +
 40 files changed, 666 insertions(+), 435 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml

--5YVlkJaEHRS8Krcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVHnOoACgkQFA3kzBSg
Kbb10Q/9EmYd9RPE8Epx2fCKNXI2JV2De8XvSTND3g3d02rdsjt+Ii/GODl75AP9
LjaQ/wn9C8MjMHaPw/OqgxUXe5bzriOXYgWMmj54qaVp+CvuonXxKplBKdwoXWT0
OsBtZio8B6+SRRsO++9jSbC1iTMpYG0+jgPakBNGdOIqR//hv2gUXbSO52Qfo+tO
PKw0lAvH5aisq31vkQaU6kf3LCnAXonjxVKHplZ1y+FNaLWOsdpxKcBy71SwhBMZ
bTs9G7+pZBp9oMY16n8sdTB8dIkzscAx/qNSFXazOKHaL44RFyH9KxP6F8zH58zO
8503seTfpbMmBpAHFAmX84ciQCBplW27aKQIi4Ly6catMbeaUluf8en1Shz4895y
z70ABrlHbyskG3Vnt2vIBjhtP8t4i40AWLVFK1I1S7rJN497Xlk5iqc2YdR5M6zA
IDm1u2A2LOGcU2sqW9+QTIqIyx8Ac0ldtC4v2zgFcXLjDrI7aldHgbwL52qLpjnp
8WewOLjKvA5T0jHFBRP8j8hTt62nAcB8b67IhnUzuy276F3sknns94hXarE//xcs
3CPEeaz/iX47F/2u3hFj5nJpOUB+2/9pDLSyjdFY/522DGzTKImGv2veEkP/6d89
0sPu33c3yGitsvWEgd4OJnWI+teatKeDbJwp92rILhL19t2e/00=
=H1LX
-----END PGP SIGNATURE-----

--5YVlkJaEHRS8Krcp--
