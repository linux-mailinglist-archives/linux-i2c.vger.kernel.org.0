Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E6B5F378F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Oct 2022 23:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJCVTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Oct 2022 17:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJCVQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Oct 2022 17:16:41 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B689756B88;
        Mon,  3 Oct 2022 14:11:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CC2DECE0E6D;
        Mon,  3 Oct 2022 21:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A78C433D6;
        Mon,  3 Oct 2022 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664831468;
        bh=4vbsTgxNnxwYKn7nplDbOPxl93JbMyMLjEmXHRW5i0Q=;
        h=Date:From:To:Cc:Subject:From;
        b=N1iep6DZfGorLFhkV44BSLaXVSyDH0xB6XC38SliAZ0zAAXn0MbozAs7wKJdxXVct
         FRslUGefnO3R99EJVF2XlmkJMop1P5KmC3pIGwbKy5EnoCBbRiKGGS5/7mo88g9PTX
         b+H4vx5XD2PdrUhpk1CWSYnpJKszAclXVTEN3yTbeDRJzeZynT7ztcNsB43NdC5f6m
         JjCVz8nPQqZpk2UnlmGaDlmCSUfSnqU2A1AfNhOQCIM9PyyxpacqCeqCgXViFyj9K2
         0HwlWFOdvzSrIeHBhjEybzXZuE2bF1bolz+A2pSigPrtIiUdZasWh75e/LFH6/zDuL
         4Z91wgcgiUioA==
Date:   Mon, 3 Oct 2022 23:11:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.1-rc1
Message-ID: <YztP6CKxbM/oeNj7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qiJObAev19XtriTD"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qiJObAev19XtriTD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.1-rc1

for you to fetch changes up to 228336f50711e9f0f47352483a8501e0c598845b:

  i2c: pci1xxxx: prevent signed integer overflow (2022-10-02 00:59:24 +0200)

----------------------------------------------------------------
* 'remove' callback converted to return void. Big change with trivial
  fixes all over the tree. Other subsystems depending on this change
  have been asked to pull an immutable topic branch for this.
* new driver for Microchip PCI1xxxx switch
* heavy refactoring of the Mellanox BlueField driver
* we prefer async probe in the i801 driver now
* the rest is usual driver updates (support for more SoCs, some
  refactoring, some feature additions)

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Add GPCDMA support

Andy Shevchenko (3):
      i2c: scmi: Convert to be a platform driver
      i2c: designware-pci: Group AMD NAVI quirk parts together
      i2c: designware-pci: Use standard pattern for memory allocation

Asmaa Mnebhi (5):
      i2c: mlxbf: remove IRQF_ONESHOT
      i2c: mlxbf: support lock mechanism
      i2c: mlxbf: add multi slave functionality
      i2c: mlxbf: support BlueField-3 SoC
      i2c: mlxbf: remove device tree support

Christophe JAILLET (1):
      i2c: ismt: Remove useless DMA-32 fallback configuration

Geert Uytterhoeven (1):
      dt-bindings: i2c: renesas,rcar-i2c: Add r8a779g0 support

Gustavo A. R. Silva (1):
      i2c: acpi: Replace zero-length array with DECLARE_FLEX_ARRAY() helper

Jagan Teki (1):
      i2c: rk3x: Add rv1126 support

Jan Dabros (1):
      i2c: designware: Introduce semaphore reservation timer to AMDPSP driv=
er

Jean Delvare (1):
      i2c: muxes: Drop obsolete dependency on COMPILE_TEST

Johan Jonker (1):
      dt-bindings: i2c: rockchip: add rockchip,rk3128-i2c

Krzysztof Kozlowski (1):
      dt-bindings: i2c: qcom,i2c-cci: specify SM8450 CCI clocks

Lad Prabhakar (1):
      i2c: riic: Use devm_platform_ioremap_resource()

Li Yang (1):
      dt-bindings: i2c: imx: add SoC specific compatible strings for layers=
cape

Mani Milani (1):
      i2c: i801: Prefer async probe

Peng Fan (4):
      dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
      dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
      dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
      i2c: imx-lpi2c: use bulk clk API

Quan Nguyen (1):
      docs: i2c: slave-interface: return errno when handle I2C_SLAVE_WRITE_=
REQUESTED

Samuel Holland (1):
      dt-bindings: i2c: mv64xxx: Document DMA properties

Shubhrajyoti Datta (1):
      i2c: cadence: Add standard bus recovery support

Sudarshan Ravula (1):
      i2c: designware: Add support to get I2C related timing parameters fro=
m firmware.

Tharun Kumar P (1):
      i2c: microchip: pci1xxxx: Add driver for I2C host controller in multi=
function endpoint of pci1xxxx switch

Uwe Kleine-K=C3=B6nig (7):
      drm/i2c/sil164: Drop no-op remove function
      leds: lm3697: Remove duplicated error reporting in .remove()
      leds: lm3601x: Don't use mutex after it was destroyed
      leds: lm3601x: Improve error reporting for problems during .remove()
      gpio: pca953x: Make platform teardown callback return void
      i2c: Make remove callback return void
      macintosh/ams: Adapt declaration of ams_i2c_remove() to earlier change

Wolfram Sang (3):
      Merge tag 'v6.0-rc5' into i2c/for-mergewindow
      Merge branch 'master' into i2c/for-mergewindow
      i2c: pci1xxxx: prevent signed integer overflow


with much appreciated quality assurance from
----------------------------------------------------------------
Ajay Gupta (1):
      (Rev.) i2c: Make remove callback return void

Andy Shevchenko (3):
      (Rev.) i2c: microchip: pci1xxxx: Add driver for I2C host controller i=
n multifunction endpoint of pci1xxxx switch
      (Rev.) i2c: designware: Add support to get I2C related timing paramet=
ers from firmware.
      (Rev.) gpio: pca953x: Make platform teardown callback return void

Benjamin Mugnier (1):
      (Rev.) i2c: Make remove callback return void

Crt Mori (1):
      (Rev.) i2c: Make remove callback return void

Dmitry Osipenko (1):
      (Rev.) i2c: tegra: Add GPCDMA support

Dong Aisheng (4):
      (Rev.) i2c: imx-lpi2c: use bulk clk API
      (Rev.) dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
      (Rev.) dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
      (Rev.) dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk

Hans Verkuil (1):
      (Rev.) i2c: Make remove callback return void

Heikki Krogerus (1):
      (Rev.) i2c: Make remove callback return void

Heiko Stuebner (1):
      (Rev.) i2c: rk3x: Add rv1126 support

Jarkko Nikula (1):
      (Test) i2c: i801: Prefer async probe

Javier Martinez Canillas (1):
      (Rev.) i2c: Make remove callback return void

Jean Delvare (2):
      (Rev.) i2c: i801: Prefer async probe
      (Rev.) i2c: Make remove callback return void

Jeremy Kerr (1):
      (Rev.) i2c: Make remove callback return void

Josef Johansson (1):
      (Test) i2c: scmi: Convert to be a platform driver

Kees Cook (1):
      (Rev.) i2c: acpi: Replace zero-length array with DECLARE_FLEX_ARRAY()=
 helper

Khalil Blaiech (5):
      (Rev.) i2c: mlxbf: remove device tree support
      (Rev.) i2c: mlxbf: support BlueField-3 SoC
      (Rev.) i2c: mlxbf: add multi slave functionality
      (Rev.) i2c: mlxbf: support lock mechanism
      (Rev.) i2c: mlxbf: remove IRQF_ONESHOT

Krzysztof Kozlowski (3):
      (Rev.) dt-bindings: i2c: mv64xxx: Document DMA properties
      (Rev.) dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
      (Rev.) dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk

Luca Ceresoli (1):
      (Rev.) i2c: Make remove callback return void

Maximilian Luz (1):
      (Rev.) i2c: Make remove callback return void

Peter Senna Tschudin (1):
      (Rev.) i2c: Make remove callback return void

Petr Machata (1):
      (Rev.) i2c: Make remove callback return void

Seth Heasley (1):
      (Rev.) i2c: ismt: Remove useless DMA-32 fallback configuration

Vladimir Oltean (1):
      (Rev.) i2c: Make remove callback return void

Vladimir Zapolskiy (1):
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: specify SM8450 CCI clocks

 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   20 +-
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml |   11 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |    1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   13 +
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml           |   77 --
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |    1 +
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |    1 +
 Documentation/i2c/slave-interface.rst              |    9 +-
 Documentation/i2c/writing-clients.rst              |    2 +-
 MAINTAINERS                                        |   10 +-
 arch/arm/mach-davinci/board-da850-evm.c            |   12 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c     |    3 +-
 drivers/auxdisplay/ht16k33.c                       |    4 +-
 drivers/auxdisplay/lcd2s.c                         |    3 +-
 drivers/char/ipmi/ipmb_dev_int.c                   |    4 +-
 drivers/char/ipmi/ipmi_ipmb.c                      |    4 +-
 drivers/char/ipmi/ipmi_ssif.c                      |    6 +-
 drivers/char/tpm/st33zp24/i2c.c                    |    4 +-
 drivers/char/tpm/tpm_i2c_atmel.c                   |    3 +-
 drivers/char/tpm/tpm_i2c_infineon.c                |    4 +-
 drivers/char/tpm/tpm_i2c_nuvoton.c                 |    3 +-
 drivers/char/tpm/tpm_tis_i2c.c                     |    3 +-
 drivers/char/tpm/tpm_tis_i2c_cr50.c                |    6 +-
 drivers/clk/clk-cdce706.c                          |    3 +-
 drivers/clk/clk-cs2000-cp.c                        |    4 +-
 drivers/clk/clk-si514.c                            |    3 +-
 drivers/clk/clk-si5341.c                           |    4 +-
 drivers/clk/clk-si5351.c                           |    4 +-
 drivers/clk/clk-si570.c                            |    3 +-
 drivers/clk/clk-versaclock5.c                      |    4 +-
 drivers/crypto/atmel-ecc.c                         |    6 +-
 drivers/crypto/atmel-sha204a.c                     |    6 +-
 drivers/extcon/extcon-rt8973a.c                    |    4 +-
 drivers/gpio/gpio-adp5588.c                        |    4 +-
 drivers/gpio/gpio-max7300.c                        |    4 +-
 drivers/gpio/gpio-pca953x.c                        |   13 +-
 drivers/gpio/gpio-pcf857x.c                        |    4 +-
 drivers/gpio/gpio-tpic2810.c                       |    4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    4 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    4 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    4 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    4 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    4 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |    4 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    4 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    4 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    4 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    4 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    4 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    4 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    4 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    4 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    4 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    4 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    4 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    4 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    4 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    4 +-
 drivers/gpu/drm/i2c/sil164_drv.c                   |    7 -
 drivers/gpu/drm/i2c/tda9950.c                      |    4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    3 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |    4 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    4 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |    4 +-
 drivers/hid/i2c-hid/i2c-hid-core.c                 |    4 +-
 drivers/hid/i2c-hid/i2c-hid.h                      |    2 +-
 drivers/hwmon/adc128d818.c                         |    4 +-
 drivers/hwmon/adt7470.c                            |    3 +-
 drivers/hwmon/asb100.c                             |    6 +-
 drivers/hwmon/asc7621.c                            |    4 +-
 drivers/hwmon/dme1737.c                            |    4 +-
 drivers/hwmon/f75375s.c                            |    5 +-
 drivers/hwmon/fschmd.c                             |    6 +-
 drivers/hwmon/ftsteutates.c                        |    3 +-
 drivers/hwmon/ina209.c                             |    4 +-
 drivers/hwmon/ina3221.c                            |    4 +-
 drivers/hwmon/jc42.c                               |    3 +-
 drivers/hwmon/occ/p8_i2c.c                         |    4 +-
 drivers/hwmon/pcf8591.c                            |    3 +-
 drivers/hwmon/smm665.c                             |    3 +-
 drivers/hwmon/tps23861.c                           |    4 +-
 drivers/hwmon/w83781d.c                            |    4 +-
 drivers/hwmon/w83791d.c                            |    6 +-
 drivers/hwmon/w83792d.c                            |    6 +-
 drivers/hwmon/w83793.c                             |    6 +-
 drivers/hwmon/w83795.c                             |    4 +-
 drivers/hwmon/w83l785ts.c                          |    6 +-
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-cadence.c                   |   20 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c         |   67 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   37 +-
 drivers/i2c/busses/i2c-i801.c                      |    1 +
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   24 +-
 drivers/i2c/busses/i2c-ismt.c                      |    7 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c             | 1210 ++++++++++++++++=
++++
 drivers/i2c/busses/i2c-mlxbf.c                     |  846 +++++++-------
 drivers/i2c/busses/i2c-riic.c                      |    4 +-
 drivers/i2c/busses/i2c-rk3x.c                      |    9 +
 drivers/i2c/busses/i2c-scmi.c                      |   48 +-
 drivers/i2c/busses/i2c-tegra.c                     |   11 +-
 drivers/i2c/i2c-core-acpi.c                        |    2 +-
 drivers/i2c/i2c-core-base.c                        |    6 +-
 drivers/i2c/i2c-slave-eeprom.c                     |    4 +-
 drivers/i2c/i2c-slave-testunit.c                   |    3 +-
 drivers/i2c/i2c-smbus.c                            |    3 +-
 drivers/i2c/muxes/Kconfig                          |    6 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c                |    4 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |    3 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |    3 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c                |    2 +-
 drivers/iio/accel/bma180.c                         |    4 +-
 drivers/iio/accel/bmc150-accel-i2c.c               |    4 +-
 drivers/iio/accel/kxcjk-1013.c                     |    4 +-
 drivers/iio/accel/kxsd9-i2c.c                      |    4 +-
 drivers/iio/accel/mc3230.c                         |    4 +-
 drivers/iio/accel/mma7455_i2c.c                    |    4 +-
 drivers/iio/accel/mma7660.c                        |    4 +-
 drivers/iio/accel/mma8452.c                        |    4 +-
 drivers/iio/accel/mma9551.c                        |    4 +-
 drivers/iio/accel/mma9553.c                        |    4 +-
 drivers/iio/accel/stk8312.c                        |    4 +-
 drivers/iio/accel/stk8ba50.c                       |    4 +-
 drivers/iio/adc/ad799x.c                           |    4 +-
 drivers/iio/adc/ina2xx-adc.c                       |    4 +-
 drivers/iio/adc/ltc2497.c                          |    4 +-
 drivers/iio/adc/ti-ads1015.c                       |    4 +-
 drivers/iio/chemical/atlas-sensor.c                |    4 +-
 drivers/iio/chemical/ccs811.c                      |    4 +-
 drivers/iio/chemical/sgp30.c                       |    4 +-
 drivers/iio/dac/ad5380.c                           |    4 +-
 drivers/iio/dac/ad5446.c                           |    4 +-
 drivers/iio/dac/ad5593r.c                          |    4 +-
 drivers/iio/dac/ad5696-i2c.c                       |    4 +-
 drivers/iio/dac/ds4424.c                           |    4 +-
 drivers/iio/dac/m62332.c                           |    4 +-
 drivers/iio/dac/mcp4725.c                          |    4 +-
 drivers/iio/dac/ti-dac5571.c                       |    4 +-
 drivers/iio/gyro/bmg160_i2c.c                      |    4 +-
 drivers/iio/gyro/fxas21002c_i2c.c                  |    4 +-
 drivers/iio/gyro/itg3200_core.c                    |    4 +-
 drivers/iio/gyro/mpu3050-i2c.c                     |    4 +-
 drivers/iio/health/afe4404.c                       |    4 +-
 drivers/iio/health/max30100.c                      |    4 +-
 drivers/iio/health/max30102.c                      |    4 +-
 drivers/iio/humidity/hdc2010.c                     |    4 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |    4 +-
 drivers/iio/imu/kmx61.c                            |    4 +-
 drivers/iio/light/apds9300.c                       |    4 +-
 drivers/iio/light/apds9960.c                       |    4 +-
 drivers/iio/light/bh1750.c                         |    4 +-
 drivers/iio/light/bh1780.c                         |    4 +-
 drivers/iio/light/cm3232.c                         |    4 +-
 drivers/iio/light/cm36651.c                        |    4 +-
 drivers/iio/light/gp2ap002.c                       |    4 +-
 drivers/iio/light/gp2ap020a00f.c                   |    4 +-
 drivers/iio/light/isl29028.c                       |    4 +-
 drivers/iio/light/isl29125.c                       |    4 +-
 drivers/iio/light/jsa1212.c                        |    4 +-
 drivers/iio/light/ltr501.c                         |    4 +-
 drivers/iio/light/opt3001.c                        |    6 +-
 drivers/iio/light/pa12203001.c                     |    4 +-
 drivers/iio/light/rpr0521.c                        |    4 +-
 drivers/iio/light/stk3310.c                        |    4 +-
 drivers/iio/light/tcs3472.c                        |    4 +-
 drivers/iio/light/tsl2563.c                        |    4 +-
 drivers/iio/light/tsl2583.c                        |    4 +-
 drivers/iio/light/tsl4531.c                        |    4 +-
 drivers/iio/light/us5182d.c                        |    4 +-
 drivers/iio/light/vcnl4000.c                       |    4 +-
 drivers/iio/light/vcnl4035.c                       |    4 +-
 drivers/iio/light/veml6070.c                       |    4 +-
 drivers/iio/magnetometer/ak8974.c                  |    4 +-
 drivers/iio/magnetometer/ak8975.c                  |    4 +-
 drivers/iio/magnetometer/bmc150_magn_i2c.c         |    4 +-
 drivers/iio/magnetometer/hmc5843_i2c.c             |    4 +-
 drivers/iio/magnetometer/mag3110.c                 |    4 +-
 drivers/iio/magnetometer/yamaha-yas530.c           |    4 +-
 drivers/iio/potentiostat/lmp91000.c                |    4 +-
 drivers/iio/pressure/mpl3115.c                     |    4 +-
 drivers/iio/pressure/ms5611_i2c.c                  |    4 +-
 drivers/iio/pressure/zpa2326_i2c.c                 |    4 +-
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |    4 +-
 drivers/iio/proximity/sx9500.c                     |    4 +-
 drivers/iio/temperature/mlx90614.c                 |    4 +-
 drivers/iio/temperature/mlx90632.c                 |    4 +-
 drivers/input/joystick/as5011.c                    |    4 +-
 drivers/input/keyboard/adp5588-keys.c              |    3 +-
 drivers/input/keyboard/lm8323.c                    |    4 +-
 drivers/input/keyboard/lm8333.c                    |    4 +-
 drivers/input/keyboard/mcs_touchkey.c              |    4 +-
 drivers/input/keyboard/qt1070.c                    |    4 +-
 drivers/input/keyboard/qt2160.c                    |    4 +-
 drivers/input/keyboard/tca6416-keypad.c            |    4 +-
 drivers/input/misc/adxl34x-i2c.c                   |    4 +-
 drivers/input/misc/bma150.c                        |    4 +-
 drivers/input/misc/cma3000_d0x_i2c.c               |    4 +-
 drivers/input/misc/pcf8574_keypad.c                |    4 +-
 drivers/input/mouse/synaptics_i2c.c                |    4 +-
 drivers/input/rmi4/rmi_smbus.c                     |    4 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |    4 +-
 drivers/input/touchscreen/bu21013_ts.c             |    4 +-
 drivers/input/touchscreen/cyttsp4_i2c.c            |    4 +-
 drivers/input/touchscreen/edt-ft5x06.c             |    4 +-
 drivers/input/touchscreen/goodix.c                 |    4 +-
 drivers/input/touchscreen/migor_ts.c               |    4 +-
 drivers/input/touchscreen/s6sy761.c                |    4 +-
 drivers/input/touchscreen/stmfts.c                 |    4 +-
 drivers/input/touchscreen/tsc2004.c                |    4 +-
 drivers/leds/flash/leds-as3645a.c                  |    4 +-
 drivers/leds/flash/leds-lm3601x.c                  |   13 +-
 drivers/leds/flash/leds-rt4505.c                   |    3 +-
 drivers/leds/leds-an30259a.c                       |    4 +-
 drivers/leds/leds-aw2013.c                         |    4 +-
 drivers/leds/leds-bd2802.c                         |    4 +-
 drivers/leds/leds-blinkm.c                         |    3 +-
 drivers/leds/leds-is31fl32xx.c                     |    4 +-
 drivers/leds/leds-lm3530.c                         |    3 +-
 drivers/leds/leds-lm3532.c                         |    4 +-
 drivers/leds/leds-lm355x.c                         |    4 +-
 drivers/leds/leds-lm3642.c                         |    3 +-
 drivers/leds/leds-lm3692x.c                        |    4 +-
 drivers/leds/leds-lm3697.c                         |    8 +-
 drivers/leds/leds-lp3944.c                         |    4 +-
 drivers/leds/leds-lp3952.c                         |    4 +-
 drivers/leds/leds-lp50xx.c                         |    4 +-
 drivers/leds/leds-lp5521.c                         |    4 +-
 drivers/leds/leds-lp5523.c                         |    4 +-
 drivers/leds/leds-lp5562.c                         |    4 +-
 drivers/leds/leds-lp8501.c                         |    4 +-
 drivers/leds/leds-lp8860.c                         |    4 +-
 drivers/leds/leds-pca9532.c                        |    6 +-
 drivers/leds/leds-tca6507.c                        |    4 +-
 drivers/leds/leds-turris-omnia.c                   |    4 +-
 drivers/macintosh/ams/ams-i2c.c                    |    6 +-
 drivers/macintosh/therm_adt746x.c                  |    4 +-
 drivers/macintosh/therm_windtunnel.c               |    4 +-
 drivers/macintosh/windfarm_ad7417_sensor.c         |    4 +-
 drivers/macintosh/windfarm_fcu_controls.c          |    3 +-
 drivers/macintosh/windfarm_lm75_sensor.c           |    4 +-
 drivers/macintosh/windfarm_lm87_sensor.c           |    4 +-
 drivers/macintosh/windfarm_max6690_sensor.c        |    4 +-
 drivers/macintosh/windfarm_smu_sat.c               |    4 +-
 drivers/media/cec/i2c/ch7322.c                     |    4 +-
 drivers/media/dvb-frontends/a8293.c                |    3 +-
 drivers/media/dvb-frontends/af9013.c               |    4 +-
 drivers/media/dvb-frontends/af9033.c               |    4 +-
 drivers/media/dvb-frontends/au8522_decoder.c       |    3 +-
 drivers/media/dvb-frontends/cxd2099.c              |    4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    4 +-
 drivers/media/dvb-frontends/dvb-pll.c              |    3 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |    4 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |    3 +-
 drivers/media/dvb-frontends/mn88443x.c             |    4 +-
 drivers/media/dvb-frontends/mn88472.c              |    4 +-
 drivers/media/dvb-frontends/mn88473.c              |    4 +-
 drivers/media/dvb-frontends/mxl692.c               |    4 +-
 drivers/media/dvb-frontends/rtl2830.c              |    4 +-
 drivers/media/dvb-frontends/rtl2832.c              |    4 +-
 drivers/media/dvb-frontends/si2165.c               |    3 +-
 drivers/media/dvb-frontends/si2168.c               |    4 +-
 drivers/media/dvb-frontends/sp2.c                  |    3 +-
 drivers/media/dvb-frontends/stv090x.c              |    3 +-
 drivers/media/dvb-frontends/stv6110x.c             |    3 +-
 drivers/media/dvb-frontends/tc90522.c              |    3 +-
 drivers/media/dvb-frontends/tda10071.c             |    3 +-
 drivers/media/dvb-frontends/ts2020.c               |    3 +-
 drivers/media/i2c/ad5820.c                         |    3 +-
 drivers/media/i2c/ad9389b.c                        |    3 +-
 drivers/media/i2c/adp1653.c                        |    4 +-
 drivers/media/i2c/adv7170.c                        |    3 +-
 drivers/media/i2c/adv7175.c                        |    3 +-
 drivers/media/i2c/adv7180.c                        |    4 +-
 drivers/media/i2c/adv7183.c                        |    3 +-
 drivers/media/i2c/adv7343.c                        |    4 +-
 drivers/media/i2c/adv7393.c                        |    4 +-
 drivers/media/i2c/adv748x/adv748x-core.c           |    4 +-
 drivers/media/i2c/adv7511-v4l2.c                   |    3 +-
 drivers/media/i2c/adv7604.c                        |    3 +-
 drivers/media/i2c/adv7842.c                        |    3 +-
 drivers/media/i2c/ak7375.c                         |    4 +-
 drivers/media/i2c/ak881x.c                         |    4 +-
 drivers/media/i2c/ar0521.c                         |    3 +-
 drivers/media/i2c/bt819.c                          |    3 +-
 drivers/media/i2c/bt856.c                          |    3 +-
 drivers/media/i2c/bt866.c                          |    3 +-
 drivers/media/i2c/ccs/ccs-core.c                   |    4 +-
 drivers/media/i2c/cs3308.c                         |    3 +-
 drivers/media/i2c/cs5345.c                         |    3 +-
 drivers/media/i2c/cs53l32a.c                       |    3 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |    3 +-
 drivers/media/i2c/dw9714.c                         |    4 +-
 drivers/media/i2c/dw9768.c                         |    4 +-
 drivers/media/i2c/dw9807-vcm.c                     |    4 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    4 +-
 drivers/media/i2c/hi556.c                          |    4 +-
 drivers/media/i2c/hi846.c                          |    4 +-
 drivers/media/i2c/hi847.c                          |    4 +-
 drivers/media/i2c/imx208.c                         |    4 +-
 drivers/media/i2c/imx214.c                         |    4 +-
 drivers/media/i2c/imx219.c                         |    4 +-
 drivers/media/i2c/imx258.c                         |    4 +-
 drivers/media/i2c/imx274.c                         |    3 +-
 drivers/media/i2c/imx290.c                         |    4 +-
 drivers/media/i2c/imx319.c                         |    4 +-
 drivers/media/i2c/imx334.c                         |    4 +-
 drivers/media/i2c/imx335.c                         |    4 +-
 drivers/media/i2c/imx355.c                         |    4 +-
 drivers/media/i2c/imx412.c                         |    4 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    4 +-
 drivers/media/i2c/isl7998x.c                       |    4 +-
 drivers/media/i2c/ks0127.c                         |    3 +-
 drivers/media/i2c/lm3560.c                         |    4 +-
 drivers/media/i2c/lm3646.c                         |    4 +-
 drivers/media/i2c/m52790.c                         |    3 +-
 drivers/media/i2c/m5mols/m5mols_core.c             |    4 +-
 drivers/media/i2c/max2175.c                        |    4 +-
 drivers/media/i2c/max9286.c                        |    4 +-
 drivers/media/i2c/ml86v7667.c                      |    4 +-
 drivers/media/i2c/msp3400-driver.c                 |    3 +-
 drivers/media/i2c/mt9m001.c                        |    4 +-
 drivers/media/i2c/mt9m032.c                        |    3 +-
 drivers/media/i2c/mt9m111.c                        |    4 +-
 drivers/media/i2c/mt9p031.c                        |    4 +-
 drivers/media/i2c/mt9t001.c                        |    3 +-
 drivers/media/i2c/mt9t112.c                        |    4 +-
 drivers/media/i2c/mt9v011.c                        |    4 +-
 drivers/media/i2c/mt9v032.c                        |    4 +-
 drivers/media/i2c/mt9v111.c                        |    4 +-
 drivers/media/i2c/noon010pc30.c                    |    4 +-
 drivers/media/i2c/og01a1b.c                        |    4 +-
 drivers/media/i2c/ov02a10.c                        |    4 +-
 drivers/media/i2c/ov08d10.c                        |    4 +-
 drivers/media/i2c/ov13858.c                        |    4 +-
 drivers/media/i2c/ov13b10.c                        |    4 +-
 drivers/media/i2c/ov2640.c                         |    3 +-
 drivers/media/i2c/ov2659.c                         |    4 +-
 drivers/media/i2c/ov2680.c                         |    4 +-
 drivers/media/i2c/ov2685.c                         |    4 +-
 drivers/media/i2c/ov2740.c                         |    4 +-
 drivers/media/i2c/ov5640.c                         |    4 +-
 drivers/media/i2c/ov5645.c                         |    4 +-
 drivers/media/i2c/ov5647.c                         |    4 +-
 drivers/media/i2c/ov5648.c                         |    4 +-
 drivers/media/i2c/ov5670.c                         |    4 +-
 drivers/media/i2c/ov5675.c                         |    4 +-
 drivers/media/i2c/ov5693.c                         |    4 +-
 drivers/media/i2c/ov5695.c                         |    4 +-
 drivers/media/i2c/ov6650.c                         |    3 +-
 drivers/media/i2c/ov7251.c                         |    4 +-
 drivers/media/i2c/ov7640.c                         |    4 +-
 drivers/media/i2c/ov7670.c                         |    3 +-
 drivers/media/i2c/ov772x.c                         |    4 +-
 drivers/media/i2c/ov7740.c                         |    3 +-
 drivers/media/i2c/ov8856.c                         |    4 +-
 drivers/media/i2c/ov8865.c                         |    4 +-
 drivers/media/i2c/ov9282.c                         |    4 +-
 drivers/media/i2c/ov9640.c                         |    4 +-
 drivers/media/i2c/ov9650.c                         |    4 +-
 drivers/media/i2c/ov9734.c                         |    4 +-
 drivers/media/i2c/rdacm20.c                        |    4 +-
 drivers/media/i2c/rdacm21.c                        |    4 +-
 drivers/media/i2c/rj54n1cb0c.c                     |    4 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |    4 +-
 drivers/media/i2c/s5k4ecgx.c                       |    4 +-
 drivers/media/i2c/s5k5baf.c                        |    4 +-
 drivers/media/i2c/s5k6a3.c                         |    3 +-
 drivers/media/i2c/s5k6aa.c                         |    4 +-
 drivers/media/i2c/saa6588.c                        |    4 +-
 drivers/media/i2c/saa6752hs.c                      |    3 +-
 drivers/media/i2c/saa7110.c                        |    3 +-
 drivers/media/i2c/saa7115.c                        |    3 +-
 drivers/media/i2c/saa7127.c                        |    3 +-
 drivers/media/i2c/saa717x.c                        |    3 +-
 drivers/media/i2c/saa7185.c                        |    3 +-
 drivers/media/i2c/sony-btf-mpx.c                   |    4 +-
 drivers/media/i2c/sr030pc30.c                      |    3 +-
 drivers/media/i2c/st-mipid02.c                     |    4 +-
 drivers/media/i2c/tc358743.c                       |    4 +-
 drivers/media/i2c/tda1997x.c                       |    4 +-
 drivers/media/i2c/tda7432.c                        |    3 +-
 drivers/media/i2c/tda9840.c                        |    3 +-
 drivers/media/i2c/tea6415c.c                       |    3 +-
 drivers/media/i2c/tea6420.c                        |    3 +-
 drivers/media/i2c/ths7303.c                        |    4 +-
 drivers/media/i2c/ths8200.c                        |    4 +-
 drivers/media/i2c/tlv320aic23b.c                   |    3 +-
 drivers/media/i2c/tvaudio.c                        |    3 +-
 drivers/media/i2c/tvp514x.c                        |    3 +-
 drivers/media/i2c/tvp5150.c                        |    4 +-
 drivers/media/i2c/tvp7002.c                        |    3 +-
 drivers/media/i2c/tw2804.c                         |    3 +-
 drivers/media/i2c/tw9903.c                         |    3 +-
 drivers/media/i2c/tw9906.c                         |    3 +-
 drivers/media/i2c/tw9910.c                         |    4 +-
 drivers/media/i2c/uda1342.c                        |    3 +-
 drivers/media/i2c/upd64031a.c                      |    3 +-
 drivers/media/i2c/upd64083.c                       |    3 +-
 drivers/media/i2c/video-i2c.c                      |    4 +-
 drivers/media/i2c/vp27smpx.c                       |    3 +-
 drivers/media/i2c/vpx3220.c                        |    4 +-
 drivers/media/i2c/vs6624.c                         |    3 +-
 drivers/media/i2c/wm8739.c                         |    3 +-
 drivers/media/i2c/wm8775.c                         |    3 +-
 drivers/media/radio/radio-tea5764.c                |    3 +-
 drivers/media/radio/saa7706h.c                     |    3 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    3 +-
 drivers/media/radio/si4713/si4713.c                |    4 +-
 drivers/media/radio/tef6862.c                      |    3 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c     |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c     |    4 +-
 drivers/media/tuners/e4000.c                       |    4 +-
 drivers/media/tuners/fc2580.c                      |    3 +-
 drivers/media/tuners/m88rs6000t.c                  |    4 +-
 drivers/media/tuners/mt2060.c                      |    4 +-
 drivers/media/tuners/mxl301rf.c                    |    3 +-
 drivers/media/tuners/qm1d1b0004.c                  |    3 +-
 drivers/media/tuners/qm1d1c0042.c                  |    3 +-
 drivers/media/tuners/si2157.c                      |    4 +-
 drivers/media/tuners/tda18212.c                    |    4 +-
 drivers/media/tuners/tda18250.c                    |    4 +-
 drivers/media/tuners/tua9001.c                     |    3 +-
 drivers/media/usb/go7007/s2250-board.c             |    3 +-
 drivers/media/v4l2-core/tuner-core.c               |    3 +-
 drivers/mfd/88pm800.c                              |    4 +-
 drivers/mfd/88pm805.c                              |    4 +-
 drivers/mfd/88pm860x-core.c                        |    3 +-
 drivers/mfd/acer-ec-a500.c                         |    4 +-
 drivers/mfd/arizona-i2c.c                          |    4 +-
 drivers/mfd/axp20x-i2c.c                           |    4 +-
 drivers/mfd/da903x.c                               |    3 +-
 drivers/mfd/da9052-i2c.c                           |    3 +-
 drivers/mfd/da9055-i2c.c                           |    4 +-
 drivers/mfd/da9062-core.c                          |    4 +-
 drivers/mfd/da9150-core.c                          |    4 +-
 drivers/mfd/dm355evm_msp.c                         |    3 +-
 drivers/mfd/ene-kb3930.c                           |    4 +-
 drivers/mfd/gateworks-gsc.c                        |    4 +-
 drivers/mfd/intel_soc_pmic_core.c                  |    4 +-
 drivers/mfd/iqs62x.c                               |    4 +-
 drivers/mfd/lm3533-core.c                          |    4 +-
 drivers/mfd/lp8788.c                               |    3 +-
 drivers/mfd/madera-i2c.c                           |    4 +-
 drivers/mfd/max14577.c                             |    4 +-
 drivers/mfd/max77693.c                             |    4 +-
 drivers/mfd/max8907.c                              |    4 +-
 drivers/mfd/max8925-i2c.c                          |    3 +-
 drivers/mfd/mc13xxx-i2c.c                          |    3 +-
 drivers/mfd/menelaus.c                             |    3 +-
 drivers/mfd/ntxec.c                                |    4 +-
 drivers/mfd/palmas.c                               |    4 +-
 drivers/mfd/pcf50633-core.c                        |    4 +-
 drivers/mfd/retu-mfd.c                             |    4 +-
 drivers/mfd/rk808.c                                |    4 +-
 drivers/mfd/rn5t618.c                              |    4 +-
 drivers/mfd/rsmu_i2c.c                             |    4 +-
 drivers/mfd/rt4831.c                               |    4 +-
 drivers/mfd/si476x-i2c.c                           |    4 +-
 drivers/mfd/stmfx.c                                |    4 +-
 drivers/mfd/stmpe-i2c.c                            |    4 +-
 drivers/mfd/tc3589x.c                              |    4 +-
 drivers/mfd/tps6105x.c                             |    4 +-
 drivers/mfd/tps65010.c                             |    3 +-
 drivers/mfd/tps65086.c                             |    4 +-
 drivers/mfd/tps65217.c                             |    4 +-
 drivers/mfd/tps6586x.c                             |    3 +-
 drivers/mfd/tps65912-i2c.c                         |    4 +-
 drivers/mfd/twl-core.c                             |    3 +-
 drivers/mfd/twl6040.c                              |    4 +-
 drivers/mfd/wm8994-core.c                          |    4 +-
 drivers/misc/ad525x_dpot-i2c.c                     |    3 +-
 drivers/misc/apds9802als.c                         |    3 +-
 drivers/misc/apds990x.c                            |    3 +-
 drivers/misc/bh1770glc.c                           |    4 +-
 drivers/misc/ds1682.c                              |    3 +-
 drivers/misc/eeprom/at24.c                         |    4 +-
 drivers/misc/eeprom/ee1004.c                       |    4 +-
 drivers/misc/eeprom/eeprom.c                       |    4 +-
 drivers/misc/eeprom/idt_89hpesx.c                  |    4 +-
 drivers/misc/eeprom/max6875.c                      |    4 +-
 drivers/misc/hmc6352.c                             |    3 +-
 drivers/misc/ics932s401.c                          |    5 +-
 drivers/misc/isl29003.c                            |    3 +-
 drivers/misc/isl29020.c                            |    3 +-
 drivers/misc/lis3lv02d/lis3lv02d_i2c.c             |    3 +-
 drivers/misc/tsl2550.c                             |    4 +-
 drivers/mtd/maps/pismo.c                           |    4 +-
 drivers/net/dsa/lan9303_i2c.c                      |    6 +-
 drivers/net/dsa/microchip/ksz9477_i2c.c            |    4 +-
 drivers/net/dsa/xrs700x/xrs700x_i2c.c              |    6 +-
 drivers/net/ethernet/mellanox/mlxsw/i2c.c          |    4 +-
 drivers/net/mctp/mctp-i2c.c                        |    4 +-
 drivers/nfc/fdp/i2c.c                              |    4 +-
 drivers/nfc/microread/i2c.c                        |    4 +-
 drivers/nfc/nfcmrvl/i2c.c                          |    4 +-
 drivers/nfc/nxp-nci/i2c.c                          |    4 +-
 drivers/nfc/pn533/i2c.c                            |    4 +-
 drivers/nfc/pn544/i2c.c                            |    4 +-
 drivers/nfc/s3fwrn5/i2c.c                          |    4 +-
 drivers/nfc/st-nci/i2c.c                           |    4 +-
 drivers/nfc/st21nfca/i2c.c                         |    4 +-
 drivers/of/unittest.c                              |    6 +-
 drivers/platform/chrome/cros_ec_i2c.c              |    4 +-
 drivers/platform/surface/surface3_power.c          |    4 +-
 drivers/platform/x86/asus-tf103c-dock.c            |    4 +-
 drivers/platform/x86/intel/int3472/tps68470.c      |    4 +-
 drivers/power/supply/bq2415x_charger.c             |    4 +-
 drivers/power/supply/bq24190_charger.c             |    4 +-
 drivers/power/supply/bq24257_charger.c             |    4 +-
 drivers/power/supply/bq25890_charger.c             |    4 +-
 drivers/power/supply/bq27xxx_battery_i2c.c         |    4 +-
 drivers/power/supply/cw2015_battery.c              |    3 +-
 drivers/power/supply/ds2782_battery.c              |    4 +-
 drivers/power/supply/lp8727_charger.c              |    3 +-
 drivers/power/supply/rt5033_battery.c              |    4 +-
 drivers/power/supply/rt9455_charger.c              |    4 +-
 drivers/power/supply/smb347-charger.c              |    4 +-
 drivers/power/supply/z2_battery.c                  |    4 +-
 drivers/pwm/pwm-pca9685.c                          |    4 +-
 drivers/regulator/da9121-regulator.c               |    3 +-
 drivers/regulator/lp8755.c                         |    4 +-
 drivers/regulator/rpi-panel-attiny-regulator.c     |    4 +-
 drivers/rtc/rtc-bq32k.c                            |    4 +-
 drivers/rtc/rtc-ds1374.c                           |    4 +-
 drivers/rtc/rtc-isl12026.c                         |    3 +-
 drivers/rtc/rtc-m41t80.c                           |    4 +-
 drivers/rtc/rtc-rs5c372.c                          |    3 +-
 drivers/rtc/rtc-x1205.c                            |    3 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |    4 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |    4 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |    4 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |    3 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |    4 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |    4 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |    4 +-
 drivers/staging/media/max96712/max96712.c          |    4 +-
 drivers/staging/most/i2c/i2c.c                     |    4 +-
 drivers/staging/olpc_dcon/olpc_dcon.c              |    4 +-
 drivers/tty/serial/max310x.c                       |    4 +-
 drivers/tty/serial/sc16is7xx.c                     |    4 +-
 drivers/usb/misc/usb3503.c                         |    4 +-
 drivers/usb/phy/phy-isp1301-omap.c                 |    4 +-
 drivers/usb/phy/phy-isp1301.c                      |    4 +-
 drivers/usb/typec/anx7411.c                        |    4 +-
 drivers/usb/typec/hd3ss3220.c                      |    4 +-
 drivers/usb/typec/mux/fsa4480.c                    |    4 +-
 drivers/usb/typec/mux/pi3usb30532.c                |    3 +-
 drivers/usb/typec/rt1719.c                         |    4 +-
 drivers/usb/typec/stusb160x.c                      |    4 +-
 drivers/usb/typec/tcpm/fusb302.c                   |    4 +-
 drivers/usb/typec/tcpm/tcpci.c                     |    4 +-
 drivers/usb/typec/tcpm/tcpci_maxim.c               |    4 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             |    3 +-
 drivers/usb/typec/tipd/core.c                      |    4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |    4 +-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c              |    4 +-
 drivers/usb/typec/wusb3801.c                       |    4 +-
 drivers/video/backlight/adp8860_bl.c               |    4 +-
 drivers/video/backlight/adp8870_bl.c               |    4 +-
 drivers/video/backlight/arcxcnn_bl.c               |    4 +-
 drivers/video/backlight/bd6107.c                   |    4 +-
 drivers/video/backlight/lm3630a_bl.c               |    3 +-
 drivers/video/backlight/lm3639_bl.c                |    3 +-
 drivers/video/backlight/lp855x_bl.c                |    4 +-
 drivers/video/backlight/lv5207lp.c                 |    4 +-
 drivers/video/backlight/tosa_bl.c                  |    3 +-
 drivers/video/fbdev/matrox/matroxfb_maven.c        |    3 +-
 drivers/video/fbdev/ssd1307fb.c                    |    4 +-
 drivers/w1/masters/ds2482.c                        |    3 +-
 drivers/watchdog/ziirave_wdt.c                     |    4 +-
 include/linux/i2c.h                                |    2 +-
 include/linux/platform_data/pca953x.h              |    2 +-
 sound/aoa/codecs/onyx.c                            |    3 +-
 sound/aoa/codecs/tas.c                             |    3 +-
 sound/pci/hda/cs35l41_hda_i2c.c                    |    4 +-
 sound/ppc/keywest.c                                |    6 +-
 sound/soc/codecs/adau1761-i2c.c                    |    3 +-
 sound/soc/codecs/adau1781-i2c.c                    |    3 +-
 sound/soc/codecs/ak4375.c                          |    4 +-
 sound/soc/codecs/ak4458.c                          |    4 +-
 sound/soc/codecs/ak4641.c                          |    4 +-
 sound/soc/codecs/ak5558.c                          |    4 +-
 sound/soc/codecs/cs35l32.c                         |    4 +-
 sound/soc/codecs/cs35l33.c                         |    4 +-
 sound/soc/codecs/cs35l34.c                         |    4 +-
 sound/soc/codecs/cs35l35.c                         |    4 +-
 sound/soc/codecs/cs35l36.c                         |    4 +-
 sound/soc/codecs/cs35l41-i2c.c                     |    4 +-
 sound/soc/codecs/cs35l45-i2c.c                     |    4 +-
 sound/soc/codecs/cs4234.c                          |    4 +-
 sound/soc/codecs/cs4265.c                          |    4 +-
 sound/soc/codecs/cs4270.c                          |    4 +-
 sound/soc/codecs/cs42l42.c                         |    4 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    4 +-
 sound/soc/codecs/cs42l56.c                         |    3 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |    4 +-
 sound/soc/codecs/cs43130.c                         |    4 +-
 sound/soc/codecs/cs4349.c                          |    4 +-
 sound/soc/codecs/cs53l30.c                         |    4 +-
 sound/soc/codecs/cx2072x.c                         |    3 +-
 sound/soc/codecs/max98090.c                        |    4 +-
 sound/soc/codecs/max9860.c                         |    3 +-
 sound/soc/codecs/max98927.c                        |    4 +-
 sound/soc/codecs/mt6660.c                          |    3 +-
 sound/soc/codecs/nau8825.c                         |    6 +-
 sound/soc/codecs/pcm1789-i2c.c                     |    4 +-
 sound/soc/codecs/pcm3168a-i2c.c                    |    4 +-
 sound/soc/codecs/pcm512x-i2c.c                     |    3 +-
 sound/soc/codecs/rt274.c                           |    4 +-
 sound/soc/codecs/rt286.c                           |    4 +-
 sound/soc/codecs/rt298.c                           |    4 +-
 sound/soc/codecs/rt5616.c                          |    6 +-
 sound/soc/codecs/rt5631.c                          |    6 +-
 sound/soc/codecs/rt5645.c                          |    4 +-
 sound/soc/codecs/rt5663.c                          |    4 +-
 sound/soc/codecs/rt5670.c                          |    4 +-
 sound/soc/codecs/rt5677.c                          |    4 +-
 sound/soc/codecs/rt5682-i2c.c                      |    4 +-
 sound/soc/codecs/rt5682s.c                         |    4 +-
 sound/soc/codecs/rt9120.c                          |    3 +-
 sound/soc/codecs/sgtl5000.c                        |    4 +-
 sound/soc/codecs/sta350.c                          |    6 +-
 sound/soc/codecs/tas2552.c                         |    3 +-
 sound/soc/codecs/tas5086.c                         |    6 +-
 sound/soc/codecs/tas571x.c                         |    4 +-
 sound/soc/codecs/tas5805m.c                        |    3 +-
 sound/soc/codecs/tas6424.c                         |    4 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    3 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |    4 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    4 +-
 sound/soc/codecs/tlv320dac33.c                     |    4 +-
 sound/soc/codecs/wm1250-ev1.c                      |    4 +-
 sound/soc/codecs/wm2200.c                          |    4 +-
 sound/soc/codecs/wm5100.c                          |    4 +-
 sound/soc/codecs/wm8804-i2c.c                      |    3 +-
 sound/soc/codecs/wm8900.c                          |    6 +-
 sound/soc/codecs/wm8903.c                          |    4 +-
 sound/soc/codecs/wm8960.c                          |    6 +-
 sound/soc/codecs/wm8962.c                          |    3 +-
 sound/soc/codecs/wm8993.c                          |    4 +-
 sound/soc/codecs/wm8996.c                          |    4 +-
 sound/soc/codecs/wm9081.c                          |    6 +-
 648 files changed, 2551 insertions(+), 2321 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.yaml
 create mode 100644 drivers/i2c/busses/i2c-mchp-pci1xxxx.c

--qiJObAev19XtriTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM7T+gACgkQFA3kzBSg
KbYMtRAAr3tvxCEqIGJVKef4nO9lqeHRFM/sfhknZqKWTd3c215sqa34Sa+PFPWp
D12OOAX2h1SXFQvypa6Q+mPfhpoVCJIuwoEMqXLWXgRzz1KWbsbnDYvT7tJHKaQe
6K8sBuQyyVR2uAXHgUKbPwQ3QLNfL65wOxX9oRoEyoiGmJtyjJO3xRTh/fIJfuJx
02IXSJ4JHs3+OU+pr0sKaFFAZEx9IRZhvICHKCfxFfmsdx/ZeZ88fdA5O73iDwsc
XOE4DOoNYjj6dhkOabdwz04OdkOCpaQA6Vq/uqPu/x1xLDCBMmxs0nmSPs5BeCwD
+j+tSGUXE/86uLi0ofC1uHt0Ual9oOSZZ+8sTro0qPkPjaueKLZDwjqsekJyWyiZ
dBCJpgt3uVg/0qUwHKpLbuVat5Q6157ufUHTnnKtoXn0VVgBvPBtZJ21hJWYJtCN
JkTGtJECGQX2mDgwYF3EeY8EtFxZ/zSVJXWf0GXCmU+JLr58QOEwFceFGD5i88nc
e0oe4ING+QASVO5U6hIgP7EhiRgLNUgwCX1BHugb7J6WOJL6gIB2xnstyA987CDL
wT6s+ERK68M6Ac14dJVZqYNAlo+HXR8UCeFtEE0eSuWvCCcbr4+pa6IOIX6e4y1+
SsLPugpNdWD+NK8wYpt2vm9fwDYEYjhiWbYZ/NWm32KOwiA+tI4=
=yKT/
-----END PGP SIGNATURE-----

--qiJObAev19XtriTD--
