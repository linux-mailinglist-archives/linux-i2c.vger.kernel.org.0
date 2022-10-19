Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164856049C0
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 16:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbiJSOvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 10:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiJSOv3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 10:51:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8094013FAD;
        Wed, 19 Oct 2022 07:41:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B420B824AC;
        Wed, 19 Oct 2022 14:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8102C433D6;
        Wed, 19 Oct 2022 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666190494;
        bh=iDlNl4ogx++8R981eP6JWE9fuPRyNHA3V36okFzWhEc=;
        h=From:To:Cc:Subject:Date:From;
        b=K//pvl/0HAhwNbTIMYzSQi+HrigDrcdekzSm9KrP6PyJhN6Hiy4h0AbjJ2gyaxpIo
         6RNYfV3sLkz5/FWGLZSgLOpQDEeizJOkNHOzqarcpryB75ycYlCZ3x85rbmzRftocm
         royc+LiEtLujD3NEs7id4Pn/yZBnEdoKzHU3p+RCoA3xJtRQ+HFEOZGxzoEZbhiGFK
         jnB1LONT10dmczBIOvuz/NhVaLhI5sLo9fGyZ6ejymQ4eSScAJD9T9BAlBh+Jb6cUZ
         7w6XqQf1SOPmJH6mXoJKjYX4Hzy6yYSsqV2ptagxPacUCA0q0/fCyQ/q7CdSF6Pi5h
         A8IffKXOUEQXA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>,
        Helge Deller <deller@gmx.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Hubert Feurstein <hubert.feurstein@contec.at>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Sergey Lapin <slapin@ossfans.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dan Williams <dan.j.williams@intel.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-usb@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 00/17] ARM: remove old board files
Date:   Wed, 19 Oct 2022 16:40:52 +0200
Message-Id: <20221019144119.3848027-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This is the first part of the removal of old board files, addressing
all the easy cases:

cns3xxx and iop32x get removed completely, including a handful of device
driversm while ep93xx, dove, mv78xx0, orion, footbridge and omap1 all
keep basic platform support but drop support for all boards that have
no known users.

There are seven patches for other subsystems in this series. It would
be helpful to get everything merged in the same release if there are no
objections, but I don't care if I include them in the soc tree with an
Ack from the subsystem maintainers or the patches are applied directly
into the subsystem trees.

Arnd Bergmann (17):
  ARM: at91: remove stale MAINTAINER file entries
  ARM: cns3xxx: remove entire platform
  mmc: remove cns3xxx driver
  ARM: ep93xx: remove old board files
  ASoC: remove unused ep93xx files
  ARM: mv78xx0: un-deprecate Terastation WXL
  ARM: orion: remove unused board files
  ARM: orion5x: remove dsa_chip_data references
  ARM: iop32x: remove the platform
  dmaengine: remove iop-adma driver
  gpio: remove iop driver
  ARM: footbridge: remove CATS
  ARM: omap1: remove unused board files
  ARM: omap1: remove dead code
  fbdev: omapfb: remove unused board support
  spi: remove omap 100K driver
  mfd: remove htc-i2cpld driver

CC: Russell King <linux@armlinux.org.uk>
CC: Aaro Koskinen <aaro.koskinen@iki.fi>
CC: Janusz Krzysztofik <jmkrzyszt@gmail.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: Gregory Clement <gregory.clement@bootlin.com>
CC: Hartley Sweeten <hsweeten@visionengravers.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>
CC: Paul Walmsley <paul@pwsan.com>
CC: Kevin Hilman <khilman@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Lee Jones <lee@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>
CC: Bin Liu <b-liu@ti.com>
CC: Helge Deller <deller@gmx.de>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
Cc: Hubert Feurstein <hubert.feurstein@contec.at>
Cc: Krzysztof Halasa <khalasa@piap.pl>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Sergey Lapin <slapin@ossfans.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Dan Williams <dan.j.williams@intel.com>
CC: "Pali Rohár" <pali@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-omap@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: dmaengine@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: linux-spi@vger.kernel.org
CC: linux-fbdev@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-watchdog@vger.kernel.org
CC: alsa-devel@alsa-project.org

 MAINTAINERS                                  |   57 -
 arch/arm/Kconfig                             |    6 +-
 arch/arm/Kconfig.debug                       |   52 +-
 arch/arm/Makefile                            |    2 -
 arch/arm/boot/compressed/misc-ep93xx.h       |   13 +-
 arch/arm/configs/cns3420vb_defconfig         |   63 -
 arch/arm/configs/iop32x_defconfig            |  126 --
 arch/arm/configs/mv78xx0_defconfig           |    3 -
 arch/arm/configs/omap1_defconfig             |    2 -
 arch/arm/kernel/entry-common.S               |   15 -
 arch/arm/kernel/head.S                       |    2 +-
 arch/arm/mach-cns3xxx/Kconfig                |   21 -
 arch/arm/mach-cns3xxx/Makefile               |    6 -
 arch/arm/mach-cns3xxx/cns3420vb.c            |  252 ---
 arch/arm/mach-cns3xxx/cns3xxx.h              |  593 -------
 arch/arm/mach-cns3xxx/core.c                 |  410 -----
 arch/arm/mach-cns3xxx/core.h                 |   32 -
 arch/arm/mach-cns3xxx/devices.c              |  108 --
 arch/arm/mach-cns3xxx/devices.h              |   17 -
 arch/arm/mach-cns3xxx/pcie.c                 |  290 ----
 arch/arm/mach-cns3xxx/pm.c                   |  120 --
 arch/arm/mach-cns3xxx/pm.h                   |   20 -
 arch/arm/mach-dove/Kconfig                   |    8 -
 arch/arm/mach-dove/Makefile                  |    1 -
 arch/arm/mach-dove/dove-db-setup.c           |  101 --
 arch/arm/mach-ep93xx/Kconfig                 |   63 -
 arch/arm/mach-ep93xx/Makefile                |    5 -
 arch/arm/mach-ep93xx/adssphere.c             |   41 -
 arch/arm/mach-ep93xx/gesbc9312.c             |   41 -
 arch/arm/mach-ep93xx/micro9.c                |  125 --
 arch/arm/mach-ep93xx/simone.c                |  128 --
 arch/arm/mach-ep93xx/snappercl15.c           |  162 --
 arch/arm/mach-footbridge/Kconfig             |   12 -
 arch/arm/mach-footbridge/Makefile            |    2 -
 arch/arm/mach-footbridge/cats-hw.c           |   98 --
 arch/arm/mach-footbridge/cats-pci.c          |   64 -
 arch/arm/mach-footbridge/common.c            |    3 -
 arch/arm/mach-iop32x/Kconfig                 |   54 -
 arch/arm/mach-iop32x/Makefile                |   20 -
 arch/arm/mach-iop32x/adma.c                  |  163 --
 arch/arm/mach-iop32x/cp6.c                   |   48 -
 arch/arm/mach-iop32x/em7210.c                |  232 ---
 arch/arm/mach-iop32x/glantank.c              |  214 ---
 arch/arm/mach-iop32x/glantank.h              |   12 -
 arch/arm/mach-iop32x/gpio-iop32x.h           |   11 -
 arch/arm/mach-iop32x/hardware.h              |   38 -
 arch/arm/mach-iop32x/i2c.c                   |   92 --
 arch/arm/mach-iop32x/iop3xx.h                |  326 ----
 arch/arm/mach-iop32x/iq31244.c               |  333 ----
 arch/arm/mach-iop32x/iq31244.h               |   16 -
 arch/arm/mach-iop32x/iq80321.c               |  192 ---
 arch/arm/mach-iop32x/iq80321.h               |   16 -
 arch/arm/mach-iop32x/irq.c                   |   95 --
 arch/arm/mach-iop32x/irqs.h                  |   48 -
 arch/arm/mach-iop32x/n2100.c                 |  367 -----
 arch/arm/mach-iop32x/n2100.h                 |   18 -
 arch/arm/mach-iop32x/pci.c                   |  404 -----
 arch/arm/mach-iop32x/pmu.c                   |   29 -
 arch/arm/mach-iop32x/restart.c               |   17 -
 arch/arm/mach-iop32x/setup.c                 |   31 -
 arch/arm/mach-iop32x/time.c                  |  179 --
 arch/arm/mach-mv78xx0/Kconfig                |   14 +-
 arch/arm/mach-mv78xx0/Makefile               |    2 -
 arch/arm/mach-mv78xx0/db78x00-bp-setup.c     |  101 --
 arch/arm/mach-mv78xx0/rd78x00-masa-setup.c   |   86 -
 arch/arm/mach-omap1/Kconfig                  |   93 +-
 arch/arm/mach-omap1/Makefile                 |   18 -
 arch/arm/mach-omap1/board-fsample.c          |  366 -----
 arch/arm/mach-omap1/board-generic.c          |   85 -
 arch/arm/mach-omap1/board-h2-mmc.c           |   74 -
 arch/arm/mach-omap1/board-h2.c               |  448 -----
 arch/arm/mach-omap1/board-h2.h               |   38 -
 arch/arm/mach-omap1/board-h3-mmc.c           |   64 -
 arch/arm/mach-omap1/board-h3.c               |  455 -----
 arch/arm/mach-omap1/board-h3.h               |   35 -
 arch/arm/mach-omap1/board-htcherald.c        |  585 -------
 arch/arm/mach-omap1/board-innovator.c        |  481 ------
 arch/arm/mach-omap1/board-nand.c             |   33 -
 arch/arm/mach-omap1/board-palmtt.c           |  285 ----
 arch/arm/mach-omap1/board-palmz71.c          |  300 ----
 arch/arm/mach-omap1/board-perseus2.c         |  333 ----
 arch/arm/mach-omap1/clock_data.c             |   17 +-
 arch/arm/mach-omap1/common.h                 |    8 -
 arch/arm/mach-omap1/devices.c                |   58 +-
 arch/arm/mach-omap1/dma.c                    |   25 +-
 arch/arm/mach-omap1/fpga.c                   |  186 ---
 arch/arm/mach-omap1/fpga.h                   |   49 -
 arch/arm/mach-omap1/gpio7xx.c                |  272 ---
 arch/arm/mach-omap1/i2c.c                    |   14 +-
 arch/arm/mach-omap1/io.c                     |   24 -
 arch/arm/mach-omap1/irq.c                    |   20 +-
 arch/arm/mach-omap1/irqs.h                   |    9 -
 arch/arm/mach-omap1/mcbsp.c                  |   83 -
 arch/arm/mach-omap1/mtd-xip.h                |    4 -
 arch/arm/mach-omap1/mux.c                    |   52 -
 arch/arm/mach-omap1/pm.c                     |   76 +-
 arch/arm/mach-omap1/pm.h                     |   39 +-
 arch/arm/mach-omap1/serial.c                 |   15 -
 arch/arm/mach-omap1/sleep.S                  |   80 -
 arch/arm/mach-omap1/sram-init.c              |    7 +-
 arch/arm/mach-omap1/usb.c                    |   34 +-
 arch/arm/mach-orion5x/Kconfig                |   59 -
 arch/arm/mach-orion5x/Makefile               |    8 -
 arch/arm/mach-orion5x/common.c               |   10 -
 arch/arm/mach-orion5x/common.h               |    2 -
 arch/arm/mach-orion5x/db88f5281-setup.c      |  376 -----
 arch/arm/mach-orion5x/ls_hgl-setup.c         |  275 ----
 arch/arm/mach-orion5x/rd88f5181l-fxo-setup.c |  172 --
 arch/arm/mach-orion5x/rd88f5181l-ge-setup.c  |  183 ---
 arch/arm/mach-orion5x/rd88f5182-setup.c      |  288 ----
 arch/arm/mach-orion5x/rd88f6183ap-ge-setup.c |  120 --
 arch/arm/mach-orion5x/wnr854t-setup.c        |  175 --
 arch/arm/mach-orion5x/wrt350n-v2-setup.c     |  263 ---
 arch/arm/plat-orion/common.c                 |   31 -
 arch/arm/plat-orion/include/plat/common.h    |    3 -
 drivers/dma/Kconfig                          |    8 -
 drivers/dma/Makefile                         |    1 -
 drivers/dma/iop-adma.c                       | 1554 ------------------
 drivers/dma/iop-adma.h                       |  914 ----------
 drivers/gpio/Kconfig                         |   10 -
 drivers/gpio/Makefile                        |    1 -
 drivers/gpio/gpio-iop.c                      |   59 -
 drivers/i2c/busses/Kconfig                   |    8 +-
 drivers/mfd/Kconfig                          |   11 +-
 drivers/mfd/Makefile                         |    1 -
 drivers/mfd/htc-i2cpld.c                     |  627 -------
 drivers/mmc/host/Kconfig                     |   13 +-
 drivers/mmc/host/Makefile                    |    1 -
 drivers/mmc/host/sdhci-cns3xxx.c             |  113 --
 drivers/spi/Kconfig                          |    6 -
 drivers/spi/Makefile                         |    1 -
 drivers/spi/spi-omap-100k.c                  |  490 ------
 drivers/spi/spi-omap-uwire.c                 |   16 +-
 drivers/usb/gadget/udc/Kconfig               |    2 +-
 drivers/usb/gadget/udc/omap_udc.c            |   24 +-
 drivers/usb/host/Kconfig                     |   25 +-
 drivers/usb/host/ohci-omap.c                 |    6 +-
 drivers/usb/musb/musb_dma.h                  |   11 +-
 drivers/usb/phy/phy-isp1301-omap.c           |   91 +-
 drivers/video/fbdev/omap/Kconfig             |    9 -
 drivers/video/fbdev/omap/Makefile            |    6 -
 drivers/video/fbdev/omap/lcd_h3.c            |   82 -
 drivers/video/fbdev/omap/lcd_htcherald.c     |   59 -
 drivers/video/fbdev/omap/lcd_inn1510.c       |   69 -
 drivers/video/fbdev/omap/lcd_inn1610.c       |   99 --
 drivers/video/fbdev/omap/lcd_palmtt.c        |   65 -
 drivers/video/fbdev/omap/lcd_palmz71.c       |   59 -
 drivers/video/fbdev/omap/lcdc.c              |    2 -
 drivers/watchdog/wdt285.c                    |    2 -
 include/linux/htcpld.h                       |   23 -
 include/linux/platform_data/leds-omap.h      |   19 -
 include/linux/soc/ti/omap1-soc.h             |   35 -
 sound/soc/cirrus/Kconfig                     |   23 -
 sound/soc/cirrus/Makefile                    |    6 -
 sound/soc/cirrus/ep93xx-ac97.c               |  446 -----
 sound/soc/cirrus/simone.c                    |   86 -
 sound/soc/cirrus/snappercl15.c               |  134 --
 157 files changed, 60 insertions(+), 18109 deletions(-)
 delete mode 100644 arch/arm/configs/cns3420vb_defconfig
 delete mode 100644 arch/arm/configs/iop32x_defconfig
 delete mode 100644 arch/arm/mach-cns3xxx/Kconfig
 delete mode 100644 arch/arm/mach-cns3xxx/Makefile
 delete mode 100644 arch/arm/mach-cns3xxx/cns3420vb.c
 delete mode 100644 arch/arm/mach-cns3xxx/cns3xxx.h
 delete mode 100644 arch/arm/mach-cns3xxx/core.c
 delete mode 100644 arch/arm/mach-cns3xxx/core.h
 delete mode 100644 arch/arm/mach-cns3xxx/devices.c
 delete mode 100644 arch/arm/mach-cns3xxx/devices.h
 delete mode 100644 arch/arm/mach-cns3xxx/pcie.c
 delete mode 100644 arch/arm/mach-cns3xxx/pm.c
 delete mode 100644 arch/arm/mach-cns3xxx/pm.h
 delete mode 100644 arch/arm/mach-dove/dove-db-setup.c
 delete mode 100644 arch/arm/mach-ep93xx/adssphere.c
 delete mode 100644 arch/arm/mach-ep93xx/gesbc9312.c
 delete mode 100644 arch/arm/mach-ep93xx/micro9.c
 delete mode 100644 arch/arm/mach-ep93xx/simone.c
 delete mode 100644 arch/arm/mach-ep93xx/snappercl15.c
 delete mode 100644 arch/arm/mach-footbridge/cats-hw.c
 delete mode 100644 arch/arm/mach-footbridge/cats-pci.c
 delete mode 100644 arch/arm/mach-iop32x/Kconfig
 delete mode 100644 arch/arm/mach-iop32x/Makefile
 delete mode 100644 arch/arm/mach-iop32x/adma.c
 delete mode 100644 arch/arm/mach-iop32x/cp6.c
 delete mode 100644 arch/arm/mach-iop32x/em7210.c
 delete mode 100644 arch/arm/mach-iop32x/glantank.c
 delete mode 100644 arch/arm/mach-iop32x/glantank.h
 delete mode 100644 arch/arm/mach-iop32x/gpio-iop32x.h
 delete mode 100644 arch/arm/mach-iop32x/hardware.h
 delete mode 100644 arch/arm/mach-iop32x/i2c.c
 delete mode 100644 arch/arm/mach-iop32x/iop3xx.h
 delete mode 100644 arch/arm/mach-iop32x/iq31244.c
 delete mode 100644 arch/arm/mach-iop32x/iq31244.h
 delete mode 100644 arch/arm/mach-iop32x/iq80321.c
 delete mode 100644 arch/arm/mach-iop32x/iq80321.h
 delete mode 100644 arch/arm/mach-iop32x/irq.c
 delete mode 100644 arch/arm/mach-iop32x/irqs.h
 delete mode 100644 arch/arm/mach-iop32x/n2100.c
 delete mode 100644 arch/arm/mach-iop32x/n2100.h
 delete mode 100644 arch/arm/mach-iop32x/pci.c
 delete mode 100644 arch/arm/mach-iop32x/pmu.c
 delete mode 100644 arch/arm/mach-iop32x/restart.c
 delete mode 100644 arch/arm/mach-iop32x/setup.c
 delete mode 100644 arch/arm/mach-iop32x/time.c
 delete mode 100644 arch/arm/mach-mv78xx0/db78x00-bp-setup.c
 delete mode 100644 arch/arm/mach-mv78xx0/rd78x00-masa-setup.c
 delete mode 100644 arch/arm/mach-omap1/board-fsample.c
 delete mode 100644 arch/arm/mach-omap1/board-generic.c
 delete mode 100644 arch/arm/mach-omap1/board-h2-mmc.c
 delete mode 100644 arch/arm/mach-omap1/board-h2.c
 delete mode 100644 arch/arm/mach-omap1/board-h2.h
 delete mode 100644 arch/arm/mach-omap1/board-h3-mmc.c
 delete mode 100644 arch/arm/mach-omap1/board-h3.c
 delete mode 100644 arch/arm/mach-omap1/board-h3.h
 delete mode 100644 arch/arm/mach-omap1/board-htcherald.c
 delete mode 100644 arch/arm/mach-omap1/board-innovator.c
 delete mode 100644 arch/arm/mach-omap1/board-nand.c
 delete mode 100644 arch/arm/mach-omap1/board-palmtt.c
 delete mode 100644 arch/arm/mach-omap1/board-palmz71.c
 delete mode 100644 arch/arm/mach-omap1/board-perseus2.c
 delete mode 100644 arch/arm/mach-omap1/fpga.c
 delete mode 100644 arch/arm/mach-omap1/fpga.h
 delete mode 100644 arch/arm/mach-omap1/gpio7xx.c
 delete mode 100644 arch/arm/mach-orion5x/db88f5281-setup.c
 delete mode 100644 arch/arm/mach-orion5x/ls_hgl-setup.c
 delete mode 100644 arch/arm/mach-orion5x/rd88f5181l-fxo-setup.c
 delete mode 100644 arch/arm/mach-orion5x/rd88f5181l-ge-setup.c
 delete mode 100644 arch/arm/mach-orion5x/rd88f5182-setup.c
 delete mode 100644 arch/arm/mach-orion5x/rd88f6183ap-ge-setup.c
 delete mode 100644 arch/arm/mach-orion5x/wnr854t-setup.c
 delete mode 100644 arch/arm/mach-orion5x/wrt350n-v2-setup.c
 delete mode 100644 drivers/dma/iop-adma.c
 delete mode 100644 drivers/dma/iop-adma.h
 delete mode 100644 drivers/gpio/gpio-iop.c
 delete mode 100644 drivers/mfd/htc-i2cpld.c
 delete mode 100644 drivers/mmc/host/sdhci-cns3xxx.c
 delete mode 100644 drivers/spi/spi-omap-100k.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_h3.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_htcherald.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_inn1510.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_inn1610.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_palmtt.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_palmz71.c
 delete mode 100644 include/linux/htcpld.h
 delete mode 100644 include/linux/platform_data/leds-omap.h
 delete mode 100644 sound/soc/cirrus/ep93xx-ac97.c
 delete mode 100644 sound/soc/cirrus/simone.c
 delete mode 100644 sound/soc/cirrus/snappercl15.c

-- 
2.29.2

