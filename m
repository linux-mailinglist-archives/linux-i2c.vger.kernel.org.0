Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88EF2607FA4
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 22:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiJUUXT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 16:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJUUXS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 16:23:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A5027B09F;
        Fri, 21 Oct 2022 13:23:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61AFE61E8F;
        Fri, 21 Oct 2022 20:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5A6C433C1;
        Fri, 21 Oct 2022 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666383794;
        bh=g7A2VpgVEu9eNaRIdcG9Vj9IMR86Ju3eo5pz21hUM5Q=;
        h=From:To:Cc:Subject:Date:From;
        b=vPIc8HmOB3nx3BuAxPiTQsbGmA0strzuRTCtYL8tHK9+eCm0Pi7KrxGmQ9EzU6jzj
         KA+QQDEa/qw1Md0nvIW2IfkYdxeHPuNT5if5eZZa9ZYoV+Y0O4UgqOx3rGlzMrrDe0
         VuqL1VxSL5A5EvQZO+DblzRfqACvwh2KOe0bu44M4OHV3QeUArcvdTza7t2wyYjD8c
         8VI7KpPx5fmefpcUuqkHUhqiBX6YZ173dnyyXvJVO2g3kkINEKlONH8ZdZW8MtQyAw
         VS007jMGGZcXas6GJNA8aypbPv6RJ/7hGZ8OQ7+04hoUfsW7TUbpqbgjxnVsQtDgN+
         0JzvjAggCY+5w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org
Subject: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Date:   Fri, 21 Oct 2022 22:22:28 +0200
Message-Id: <20221021202254.4142411-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The s3c24xx platform was marked as deprecated a while ago,
and for the s3c64xx platform, we marked all except one legacy
board file as unused.

This series removes all of those, leaving only s3c64xx support
for DT based boots as well as the cragg6410 board file.

About half of the s3c specific drivers were only used on
the now removed machines, so these drivers can be retired
as well. I can either merge the driver removal patches through
the soc tree along with the board file patches, or subsystem
maintainers can pick them up into their own trees, whichever
they prefer.

Arnd Bergmann (21):
  ARM: s3c: remove all s3c24xx support
  ARM: s3c: remove s3c24xx specific hacks
  ARM: s3c: remove most s3c64xx board support
  ARM: s3c: remove adc.c
  ARM: s3c: simplify platform code
  ARM: s3c: remove s3c6400 support
  power: remove s3c adc battery driver
  hwmon: remove s3c driver
  pata: remove samsung_cf driver
  mmc: remove s3cmci driver
  clk: remove s3c24xx driver
  leds: remove s3c24xx driver
  usb: gadget: remove s3c24xx drivers
  dmaengine: remove s3c24xx driver
  cpufreq: remove s3c24xx drivers
  fbdev: remove s3c2410 framebuffer
  input: remove s3c24xx touchscreen driver
  pinctrl: remove s3c24xx driver
  spi: remove s3c24xx driver
  soc: s3c: remove pm-debug hack
  ASoC: samsung: remove unused drivers

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Simtec Linux Team <linux@simtec.co.uk>
Bcc: Alim Akhtar <alim.akhtar@samsung.com>
Bcc: Rob Herring <robh+dt@kernel.org>
Bcc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Bcc: Sergey Shtylyov <s.shtylyov@omp.ru>
Bcc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Bcc: Tomasz Figa <tomasz.figa@gmail.com>
Bcc: Chanwoo Choi <cw00.choi@samsung.com>
Bcc: Michael Turquette <mturquette@baylibre.com>
Bcc: Stephen Boyd <sboyd@kernel.org>
Bcc: Daniel Lezcano <daniel.lezcano@linaro.org>
Bcc: Thomas Gleixner <tglx@linutronix.de>
Bcc: "Rafael J. Wysocki" <rafael@kernel.org>
Bcc: Viresh Kumar <viresh.kumar@linaro.org>
Bcc: Vinod Koul <vkoul@kernel.org>
Bcc: Jean Delvare <jdelvare@suse.com>
Bcc: Guenter Roeck <linux@roeck-us.net>
Bcc: Jonathan Cameron <jic23@kernel.org>
Bcc: Lars-Peter Clausen <lars@metafoo.de>
Bcc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Bcc: Pavel Machek <pavel@ucw.cz>
Bcc: Mauro Carvalho Chehab <mchehab@kernel.org>
Bcc: Ulf Hansson <ulf.hansson@linaro.org>
Bcc: Miquel Raynal <miquel.raynal@bootlin.com>
Bcc: Richard Weinberger <richard@nod.at>
Bcc: Vignesh Raghavendra <vigneshr@ti.com>
Bcc: Linus Walleij <linus.walleij@linaro.org>
Bcc: Sebastian Reichel <sre@kernel.org>
Bcc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Bcc: Mark Brown <broonie@kernel.org>
Bcc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Bcc: Jiri Slaby <jirislaby@kernel.org>
Bcc: Felipe Balbi <balbi@kernel.org>
Bcc: Helge Deller <deller@gmx.de>
Bcc: Wim Van Sebroeck <wim@linux-watchdog.org>
Bcc: Liam Girdwood <lgirdwood@gmail.com>
Bcc: Thierry Reding <thierry.reding@gmail.com>
Bcc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-ide@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-watchdog@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-pwm@vger.kernel.org

 Documentation/arm/index.rst                   |    1 -
 Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
 .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
 Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
 Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
 Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
 Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
 .../arm/samsung-s3c24xx/overview.rst          |  311 ---
 Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
 Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
 .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
 Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
 .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
 Documentation/arm/samsung/overview.rst        |   13 -
 MAINTAINERS                                   |   31 -
 arch/arm/Kconfig                              |    3 +-
 arch/arm/Kconfig.debug                        |   58 +-
 arch/arm/Makefile                             |    2 -
 arch/arm/boot/dts/Makefile                    |    2 -
 arch/arm/boot/dts/s3c2410-pinctrl.h           |   19 -
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  172 --
 arch/arm/boot/dts/s3c2416-smdk2416.dts        |   77 -
 arch/arm/boot/dts/s3c2416.dtsi                |  124 --
 arch/arm/boot/dts/s3c24xx.dtsi                |   92 -
 arch/arm/configs/mini2440_defconfig           |  338 ---
 arch/arm/configs/s3c2410_defconfig            |  437 ----
 arch/arm/configs/tct_hammer_defconfig         |   58 -
 arch/arm/include/debug/s3c24xx.S              |   10 -
 arch/arm/mach-s3c/Kconfig                     |   92 +-
 arch/arm/mach-s3c/Kconfig.s3c24xx             |  604 -----
 arch/arm/mach-s3c/Kconfig.s3c64xx             |  212 --
 arch/arm/mach-s3c/Makefile                    |   12 -
 arch/arm/mach-s3c/Makefile.s3c24xx            |  102 -
 arch/arm/mach-s3c/Makefile.s3c64xx            |   15 -
 arch/arm/mach-s3c/adc-core.h                  |   24 -
 arch/arm/mach-s3c/adc.c                       |  510 -----
 arch/arm/mach-s3c/anubis.h                    |   50 -
 arch/arm/mach-s3c/ata-core-s3c64xx.h          |   24 -
 arch/arm/mach-s3c/backlight-s3c64xx.h         |   22 -
 arch/arm/mach-s3c/bast-ide.c                  |   82 -
 arch/arm/mach-s3c/bast-irq.c                  |  137 --
 arch/arm/mach-s3c/bast.h                      |  194 --
 arch/arm/mach-s3c/common-smdk-s3c24xx.c       |  228 --
 arch/arm/mach-s3c/common-smdk-s3c24xx.h       |   11 -
 arch/arm/mach-s3c/cpu.h                       |   47 -
 arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c     |   94 -
 arch/arm/mach-s3c/dev-audio-s3c64xx.c         |  127 --
 arch/arm/mach-s3c/dev-backlight-s3c64xx.c     |  137 --
 arch/arm/mach-s3c/devs.c                      |  726 ------
 arch/arm/mach-s3c/devs.h                      |   37 -
 arch/arm/mach-s3c/dma-s3c24xx.h               |   51 -
 arch/arm/mach-s3c/dma-s3c64xx.h               |   57 -
 arch/arm/mach-s3c/dma.h                       |    9 -
 arch/arm/mach-s3c/fb-core-s3c24xx.h           |   24 -
 arch/arm/mach-s3c/gpio-cfg-helpers.h          |  124 --
 arch/arm/mach-s3c/gpio-cfg.h                  |   19 -
 arch/arm/mach-s3c/gpio-core.h                 |    3 -
 arch/arm/mach-s3c/gpio-samsung-s3c24xx.h      |  103 -
 arch/arm/mach-s3c/gpio-samsung.c              |  443 +---
 arch/arm/mach-s3c/gpio-samsung.h              |    7 -
 arch/arm/mach-s3c/gta02.h                     |   20 -
 arch/arm/mach-s3c/h1940-bluetooth.c           |  140 --
 arch/arm/mach-s3c/h1940.h                     |   52 -
 arch/arm/mach-s3c/hardware-s3c24xx.h          |   14 -
 arch/arm/mach-s3c/iic-core.h                  |    7 -
 arch/arm/mach-s3c/init.c                      |   26 +-
 arch/arm/mach-s3c/iotiming-s3c2410.c          |  472 ----
 arch/arm/mach-s3c/iotiming-s3c2412.c          |  278 ---
 arch/arm/mach-s3c/irq-pm-s3c24xx.c            |  115 -
 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c   |    9 -
 arch/arm/mach-s3c/irq-s3c24xx-fiq.S           |  112 -
 arch/arm/mach-s3c/irq-s3c24xx.c               | 1352 -----------
 arch/arm/mach-s3c/irqs-s3c24xx.h              |  219 --
 arch/arm/mach-s3c/irqs.h                      |    7 -
 arch/arm/mach-s3c/mach-amlm5900.c             |  248 ---
 arch/arm/mach-s3c/mach-anubis.c               |  422 ----
 arch/arm/mach-s3c/mach-anw6410.c              |  230 --
 arch/arm/mach-s3c/mach-at2440evb.c            |  233 --
 arch/arm/mach-s3c/mach-bast.c                 |  583 -----
 arch/arm/mach-s3c/mach-crag6410.c             |    1 -
 arch/arm/mach-s3c/mach-gta02.c                |  588 -----
 arch/arm/mach-s3c/mach-h1940.c                |  809 -------
 arch/arm/mach-s3c/mach-hmt.c                  |  282 ---
 arch/arm/mach-s3c/mach-jive.c                 |  693 ------
 arch/arm/mach-s3c/mach-mini2440.c             |  804 -------
 arch/arm/mach-s3c/mach-mini6410.c             |  365 ---
 arch/arm/mach-s3c/mach-n30.c                  |  682 ------
 arch/arm/mach-s3c/mach-ncp.c                  |  100 -
 arch/arm/mach-s3c/mach-nexcoder.c             |  162 --
 arch/arm/mach-s3c/mach-osiris-dvs.c           |  178 --
 arch/arm/mach-s3c/mach-osiris.c               |  405 ----
 arch/arm/mach-s3c/mach-otom.c                 |  124 --
 arch/arm/mach-s3c/mach-qt2410.c               |  375 ----
 arch/arm/mach-s3c/mach-real6410.c             |  333 ---
 arch/arm/mach-s3c/mach-rx1950.c               |  884 --------
 arch/arm/mach-s3c/mach-rx3715.c               |  213 --
 arch/arm/mach-s3c/mach-s3c2416-dt.c           |   48 -
 arch/arm/mach-s3c/mach-smartq.c               |  424 ----
 arch/arm/mach-s3c/mach-smartq.h               |   16 -
 arch/arm/mach-s3c/mach-smartq5.c              |  154 --
 arch/arm/mach-s3c/mach-smartq7.c              |  170 --
 arch/arm/mach-s3c/mach-smdk2410.c             |  112 -
 arch/arm/mach-s3c/mach-smdk2413.c             |  169 --
 arch/arm/mach-s3c/mach-smdk2416.c             |  248 ---
 arch/arm/mach-s3c/mach-smdk2440.c             |  180 --
 arch/arm/mach-s3c/mach-smdk2443.c             |  126 --
 arch/arm/mach-s3c/mach-smdk6400.c             |   90 -
 arch/arm/mach-s3c/mach-smdk6410.c             |  706 ------
 arch/arm/mach-s3c/mach-tct_hammer.c           |  157 --
 arch/arm/mach-s3c/mach-vr1000.c               |  364 ---
 arch/arm/mach-s3c/mach-vstms.c                |  166 --
 arch/arm/mach-s3c/map-s3c.h                   |   37 -
 arch/arm/mach-s3c/map-s3c24xx.h               |  159 --
 arch/arm/mach-s3c/map.h                       |    7 -
 arch/arm/mach-s3c/nand-core-s3c24xx.h         |   24 -
 arch/arm/mach-s3c/onenand-core-s3c64xx.h      |   32 -
 arch/arm/mach-s3c/osiris.h                    |   50 -
 arch/arm/mach-s3c/otom.h                      |   25 -
 arch/arm/mach-s3c/pll-s3c2410.c               |   83 -
 arch/arm/mach-s3c/pll-s3c2440-12000000.c      |   95 -
 arch/arm/mach-s3c/pll-s3c2440-16934400.c      |  122 -
 arch/arm/mach-s3c/pm-core-s3c24xx.h           |   96 -
 arch/arm/mach-s3c/pm-core-s3c64xx.h           |   17 -
 arch/arm/mach-s3c/pm-core.h                   |    7 -
 arch/arm/mach-s3c/pm-h1940.S                  |   19 -
 arch/arm/mach-s3c/pm-s3c2410.c                |  170 --
 arch/arm/mach-s3c/pm-s3c2412.c                |  126 --
 arch/arm/mach-s3c/pm-s3c2416.c                |   81 -
 arch/arm/mach-s3c/pm-s3c24xx.c                |  121 -
 arch/arm/mach-s3c/pm-s3c64xx.c                |   83 -
 arch/arm/mach-s3c/pm.c                        |    7 +-
 arch/arm/mach-s3c/pm.h                        |   12 -
 arch/arm/mach-s3c/regs-adc.h                  |   64 -
 arch/arm/mach-s3c/regs-clock-s3c24xx.h        |  146 --
 arch/arm/mach-s3c/regs-clock.h                |    7 -
 arch/arm/mach-s3c/regs-dsc-s3c24xx.h          |   22 -
 arch/arm/mach-s3c/regs-gpio-s3c24xx.h         |  608 -----
 arch/arm/mach-s3c/regs-gpio.h                 |    7 -
 arch/arm/mach-s3c/regs-irq-s3c24xx.h          |   51 -
 arch/arm/mach-s3c/regs-irq.h                  |    7 -
 arch/arm/mach-s3c/regs-mem-s3c24xx.h          |   53 -
 arch/arm/mach-s3c/regs-s3c2443-clock.h        |  238 --
 arch/arm/mach-s3c/regs-srom-s3c64xx.h         |   55 -
 arch/arm/mach-s3c/rtc-core-s3c24xx.h          |   23 -
 arch/arm/mach-s3c/s3c2410.c                   |  130 --
 arch/arm/mach-s3c/s3c2412-power.h             |   34 -
 arch/arm/mach-s3c/s3c2412.c                   |  175 --
 arch/arm/mach-s3c/s3c2412.h                   |   25 -
 arch/arm/mach-s3c/s3c2416.c                   |  132 --
 arch/arm/mach-s3c/s3c2440.c                   |   71 -
 arch/arm/mach-s3c/s3c2442.c                   |   62 -
 arch/arm/mach-s3c/s3c2443.c                   |  112 -
 arch/arm/mach-s3c/s3c244x.c                   |  128 --
 arch/arm/mach-s3c/s3c24xx.c                   |  687 ------
 arch/arm/mach-s3c/s3c24xx.h                   |  124 --
 arch/arm/mach-s3c/s3c6400.c                   |   90 -
 arch/arm/mach-s3c/s3c6410.c                   |    9 -
 arch/arm/mach-s3c/s3c64xx.c                   |    8 -
 arch/arm/mach-s3c/sdhci.h                     |   25 -
 arch/arm/mach-s3c/setup-i2c-s3c24xx.c         |   23 -
 arch/arm/mach-s3c/setup-ide-s3c64xx.c         |   40 -
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c  |   31 -
 arch/arm/mach-s3c/setup-spi-s3c24xx.c         |   27 -
 arch/arm/mach-s3c/setup-ts-s3c24xx.c          |   29 -
 arch/arm/mach-s3c/simtec-audio.c              |   76 -
 arch/arm/mach-s3c/simtec-nor.c                |   74 -
 arch/arm/mach-s3c/simtec-pm.c                 |   60 -
 arch/arm/mach-s3c/simtec-usb.c                |  125 --
 arch/arm/mach-s3c/simtec.h                    |   17 -
 arch/arm/mach-s3c/sleep-s3c2410.S             |   54 -
 arch/arm/mach-s3c/sleep-s3c2412.S             |   53 -
 arch/arm/mach-s3c/sleep-s3c24xx.S             |   69 -
 arch/arm/mach-s3c/sleep-s3c64xx.S             |   27 -
 arch/arm/mach-s3c/spi-core-s3c24xx.h          |   21 -
 arch/arm/mach-s3c/vr1000.h                    |  113 -
 drivers/ata/Kconfig                           |   10 -
 drivers/ata/Makefile                          |    1 -
 drivers/ata/pata_samsung_cf.c                 |  662 ------
 drivers/clk/samsung/Kconfig                   |   32 -
 drivers/clk/samsung/Makefile                  |    4 -
 drivers/clk/samsung/clk-s3c2410-dclk.c        |  440 ----
 drivers/clk/samsung/clk-s3c2410.c             |  446 ----
 drivers/clk/samsung/clk-s3c2412.c             |  254 ---
 drivers/clk/samsung/clk-s3c2443.c             |  438 ----
 drivers/clocksource/Kconfig                   |    2 +-
 drivers/cpufreq/Kconfig.arm                   |   78 -
 drivers/cpufreq/Makefile                      |    6 -
 drivers/cpufreq/s3c2410-cpufreq.c             |  155 --
 drivers/cpufreq/s3c2412-cpufreq.c             |  240 --
 drivers/cpufreq/s3c2416-cpufreq.c             |  492 ----
 drivers/cpufreq/s3c2440-cpufreq.c             |  321 ---
 drivers/cpufreq/s3c24xx-cpufreq-debugfs.c     |  163 --
 drivers/cpufreq/s3c24xx-cpufreq.c             |  648 ------
 drivers/dma/Kconfig                           |   12 -
 drivers/dma/Makefile                          |    1 -
 drivers/dma/s3c24xx-dma.c                     | 1428 ------------
 drivers/hwmon/Kconfig                         |   17 -
 drivers/hwmon/Makefile                        |    1 -
 drivers/hwmon/s3c-hwmon.c                     |  379 ----
 drivers/i2c/busses/Kconfig                    |    3 +-
 drivers/i2c/busses/i2c-s3c2410.c              |   72 -
 drivers/iio/adc/Kconfig                       |    6 +-
 drivers/input/touchscreen/Kconfig             |   12 -
 drivers/input/touchscreen/Makefile            |    1 -
 drivers/input/touchscreen/s3c2410_ts.c        |  464 ----
 drivers/leds/Kconfig                          |    8 -
 drivers/leds/Makefile                         |    1 -
 drivers/leds/leds-s3c24xx.c                   |   83 -
 .../media/platform/samsung/s3c-camif/Kconfig  |    8 +-
 drivers/mmc/host/Kconfig                      |   48 +-
 drivers/mmc/host/Makefile                     |    1 -
 drivers/mmc/host/s3cmci.c                     | 1777 ---------------
 drivers/mmc/host/s3cmci.h                     |   75 -
 drivers/mtd/nand/raw/Kconfig                  |    2 +-
 drivers/mtd/nand/raw/s3c2410.c                |   60 -
 drivers/pinctrl/samsung/Kconfig               |    5 -
 drivers/pinctrl/samsung/Makefile              |    1 -
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c     |  653 ------
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   10 -
 drivers/power/supply/Kconfig                  |    6 -
 drivers/power/supply/Makefile                 |    1 -
 drivers/power/supply/s3c_adc_battery.c        |  453 ----
 drivers/rtc/Kconfig                           |    8 +-
 drivers/soc/samsung/Kconfig                   |   26 +-
 drivers/soc/samsung/Makefile                  |    1 -
 drivers/soc/samsung/s3c-pm-debug.c            |   79 -
 drivers/spi/Kconfig                           |   18 -
 drivers/spi/Makefile                          |    2 -
 drivers/spi/spi-s3c24xx-regs.h                |   41 -
 drivers/spi/spi-s3c24xx.c                     |  596 -----
 drivers/tty/serial/Kconfig                    |    8 +-
 drivers/tty/serial/samsung_tty.c              |  199 --
 drivers/usb/gadget/udc/Kconfig                |   25 -
 drivers/usb/gadget/udc/Makefile               |    2 -
 drivers/usb/gadget/udc/s3c-hsudc.c            | 1319 -----------
 drivers/usb/gadget/udc/s3c2410_udc.c          | 1980 -----------------
 drivers/usb/gadget/udc/s3c2410_udc.h          |   99 -
 drivers/usb/gadget/udc/s3c2410_udc_regs.h     |  146 --
 drivers/usb/host/Kconfig                      |    8 +-
 drivers/video/fbdev/Kconfig                   |   33 +-
 drivers/video/fbdev/Makefile                  |    1 -
 drivers/video/fbdev/s3c2410fb-regs-lcd.h      |  143 --
 drivers/video/fbdev/s3c2410fb.c               | 1142 ----------
 drivers/video/fbdev/s3c2410fb.h               |   48 -
 drivers/watchdog/Kconfig                      |    9 +-
 drivers/watchdog/s3c2410_wdt.c                |   84 +-
 include/dt-bindings/clock/s3c2410.h           |   59 -
 include/dt-bindings/clock/s3c2412.h           |   70 -
 include/dt-bindings/clock/s3c2443.h           |   91 -
 include/linux/amba/pl093.h                    |   77 -
 include/linux/clk/samsung.h                   |   32 -
 .../linux/platform_data/asoc-s3c24xx_simtec.h |   30 -
 include/linux/platform_data/ata-samsung_cf.h  |   31 -
 include/linux/platform_data/clk-s3c2410.h     |   19 -
 include/linux/platform_data/dma-s3c24xx.h     |   48 -
 include/linux/platform_data/fb-s3c2410.h      |   99 -
 include/linux/platform_data/leds-s3c24xx.h    |   18 -
 include/linux/platform_data/media/s5p_hdmi.h  |   32 -
 include/linux/platform_data/mmc-s3cmci.h      |   51 -
 include/linux/platform_data/s3c-hsudc.h       |   33 -
 include/linux/platform_data/usb-s3c2410_udc.h |   33 -
 include/linux/s3c_adc_battery.h               |   39 -
 include/linux/soc/samsung/s3c-adc.h           |   32 -
 include/linux/soc/samsung/s3c-cpufreq-core.h  |  299 ---
 include/linux/soc/samsung/s3c-pm.h            |   58 -
 include/linux/spi/s3c24xx-fiq.h               |   33 -
 include/linux/spi/s3c24xx.h                   |   20 -
 include/sound/s3c24xx_uda134x.h               |   14 -
 sound/soc/samsung/Kconfig                     |   93 -
 sound/soc/samsung/Makefile                    |   26 -
 sound/soc/samsung/h1940_uda1380.c             |  224 --
 sound/soc/samsung/jive_wm8750.c               |  143 --
 sound/soc/samsung/neo1973_wm8753.c            |  360 ---
 sound/soc/samsung/regs-i2s-v2.h               |  111 -
 sound/soc/samsung/regs-iis.h                  |   66 -
 sound/soc/samsung/rx1950_uda1380.c            |  245 --
 sound/soc/samsung/s3c-i2s-v2.c                |  670 ------
 sound/soc/samsung/s3c-i2s-v2.h                |  108 -
 sound/soc/samsung/s3c2412-i2s.c               |  251 ---
 sound/soc/samsung/s3c2412-i2s.h               |   22 -
 sound/soc/samsung/s3c24xx-i2s.c               |  463 ----
 sound/soc/samsung/s3c24xx-i2s.h               |   31 -
 sound/soc/samsung/s3c24xx_simtec.c            |  372 ----
 sound/soc/samsung/s3c24xx_simtec.h            |   18 -
 sound/soc/samsung/s3c24xx_simtec_hermes.c     |  112 -
 .../soc/samsung/s3c24xx_simtec_tlv320aic23.c  |  100 -
 sound/soc/samsung/s3c24xx_uda134x.c           |  257 ---
 sound/soc/samsung/smartq_wm8987.c             |  224 --
 sound/soc/samsung/smdk_wm8580.c               |  211 --
 289 files changed, 48 insertions(+), 48148 deletions(-)
 delete mode 100644 Documentation/arm/samsung-s3c24xx/cpufreq.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/eb2410itx.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/gpio.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/h1940.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/index.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/nand.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/overview.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/s3c2412.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/s3c2413.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/smdk2440.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/suspend.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/usb-host.rst
 delete mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 delete mode 100644 arch/arm/boot/dts/s3c2416-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/s3c2416-smdk2416.dts
 delete mode 100644 arch/arm/boot/dts/s3c2416.dtsi
 delete mode 100644 arch/arm/boot/dts/s3c24xx.dtsi
 delete mode 100644 arch/arm/configs/mini2440_defconfig
 delete mode 100644 arch/arm/configs/s3c2410_defconfig
 delete mode 100644 arch/arm/configs/tct_hammer_defconfig
 delete mode 100644 arch/arm/mach-s3c/Kconfig.s3c24xx
 delete mode 100644 arch/arm/mach-s3c/Makefile.s3c24xx
 delete mode 100644 arch/arm/mach-s3c/adc-core.h
 delete mode 100644 arch/arm/mach-s3c/adc.c
 delete mode 100644 arch/arm/mach-s3c/anubis.h
 delete mode 100644 arch/arm/mach-s3c/ata-core-s3c64xx.h
 delete mode 100644 arch/arm/mach-s3c/backlight-s3c64xx.h
 delete mode 100644 arch/arm/mach-s3c/bast-ide.c
 delete mode 100644 arch/arm/mach-s3c/bast-irq.c
 delete mode 100644 arch/arm/mach-s3c/bast.h
 delete mode 100644 arch/arm/mach-s3c/common-smdk-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/common-smdk-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/dev-backlight-s3c64xx.c
 delete mode 100644 arch/arm/mach-s3c/dma-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/dma-s3c64xx.h
 delete mode 100644 arch/arm/mach-s3c/dma.h
 delete mode 100644 arch/arm/mach-s3c/fb-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/gpio-samsung-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/gta02.h
 delete mode 100644 arch/arm/mach-s3c/h1940-bluetooth.c
 delete mode 100644 arch/arm/mach-s3c/h1940.h
 delete mode 100644 arch/arm/mach-s3c/hardware-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/iotiming-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/iotiming-s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/irq-pm-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx-fiq.S
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/irqs-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/mach-amlm5900.c
 delete mode 100644 arch/arm/mach-s3c/mach-anubis.c
 delete mode 100644 arch/arm/mach-s3c/mach-anw6410.c
 delete mode 100644 arch/arm/mach-s3c/mach-at2440evb.c
 delete mode 100644 arch/arm/mach-s3c/mach-bast.c
 delete mode 100644 arch/arm/mach-s3c/mach-gta02.c
 delete mode 100644 arch/arm/mach-s3c/mach-h1940.c
 delete mode 100644 arch/arm/mach-s3c/mach-hmt.c
 delete mode 100644 arch/arm/mach-s3c/mach-jive.c
 delete mode 100644 arch/arm/mach-s3c/mach-mini2440.c
 delete mode 100644 arch/arm/mach-s3c/mach-mini6410.c
 delete mode 100644 arch/arm/mach-s3c/mach-n30.c
 delete mode 100644 arch/arm/mach-s3c/mach-ncp.c
 delete mode 100644 arch/arm/mach-s3c/mach-nexcoder.c
 delete mode 100644 arch/arm/mach-s3c/mach-osiris-dvs.c
 delete mode 100644 arch/arm/mach-s3c/mach-osiris.c
 delete mode 100644 arch/arm/mach-s3c/mach-otom.c
 delete mode 100644 arch/arm/mach-s3c/mach-qt2410.c
 delete mode 100644 arch/arm/mach-s3c/mach-real6410.c
 delete mode 100644 arch/arm/mach-s3c/mach-rx1950.c
 delete mode 100644 arch/arm/mach-s3c/mach-rx3715.c
 delete mode 100644 arch/arm/mach-s3c/mach-s3c2416-dt.c
 delete mode 100644 arch/arm/mach-s3c/mach-smartq.c
 delete mode 100644 arch/arm/mach-s3c/mach-smartq.h
 delete mode 100644 arch/arm/mach-s3c/mach-smartq5.c
 delete mode 100644 arch/arm/mach-s3c/mach-smartq7.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2410.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2413.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2416.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2440.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2443.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk6400.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk6410.c
 delete mode 100644 arch/arm/mach-s3c/mach-tct_hammer.c
 delete mode 100644 arch/arm/mach-s3c/mach-vr1000.c
 delete mode 100644 arch/arm/mach-s3c/mach-vstms.c
 delete mode 100644 arch/arm/mach-s3c/map-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/nand-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/onenand-core-s3c64xx.h
 delete mode 100644 arch/arm/mach-s3c/osiris.h
 delete mode 100644 arch/arm/mach-s3c/otom.h
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2440-12000000.c
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2440-16934400.c
 delete mode 100644 arch/arm/mach-s3c/pm-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/pm-h1940.S
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/regs-adc.h
 delete mode 100644 arch/arm/mach-s3c/regs-clock-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-dsc-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-gpio-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-irq-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-mem-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-s3c2443-clock.h
 delete mode 100644 arch/arm/mach-s3c/regs-srom-s3c64xx.h
 delete mode 100644 arch/arm/mach-s3c/rtc-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/s3c2412-power.h
 delete mode 100644 arch/arm/mach-s3c/s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/s3c2412.h
 delete mode 100644 arch/arm/mach-s3c/s3c2416.c
 delete mode 100644 arch/arm/mach-s3c/s3c2440.c
 delete mode 100644 arch/arm/mach-s3c/s3c2442.c
 delete mode 100644 arch/arm/mach-s3c/s3c2443.c
 delete mode 100644 arch/arm/mach-s3c/s3c244x.c
 delete mode 100644 arch/arm/mach-s3c/s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/s3c6400.c
 delete mode 100644 arch/arm/mach-s3c/setup-i2c-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-ide-s3c64xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-spi-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-ts-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/simtec-audio.c
 delete mode 100644 arch/arm/mach-s3c/simtec-nor.c
 delete mode 100644 arch/arm/mach-s3c/simtec-pm.c
 delete mode 100644 arch/arm/mach-s3c/simtec-usb.c
 delete mode 100644 arch/arm/mach-s3c/simtec.h
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c2410.S
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c2412.S
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c24xx.S
 delete mode 100644 arch/arm/mach-s3c/spi-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/vr1000.h
 delete mode 100644 drivers/ata/pata_samsung_cf.c
 delete mode 100644 drivers/clk/samsung/clk-s3c2410-dclk.c
 delete mode 100644 drivers/clk/samsung/clk-s3c2410.c
 delete mode 100644 drivers/clk/samsung/clk-s3c2412.c
 delete mode 100644 drivers/clk/samsung/clk-s3c2443.c
 delete mode 100644 drivers/cpufreq/s3c2410-cpufreq.c
 delete mode 100644 drivers/cpufreq/s3c2412-cpufreq.c
 delete mode 100644 drivers/cpufreq/s3c2416-cpufreq.c
 delete mode 100644 drivers/cpufreq/s3c2440-cpufreq.c
 delete mode 100644 drivers/cpufreq/s3c24xx-cpufreq-debugfs.c
 delete mode 100644 drivers/cpufreq/s3c24xx-cpufreq.c
 delete mode 100644 drivers/dma/s3c24xx-dma.c
 delete mode 100644 drivers/hwmon/s3c-hwmon.c
 delete mode 100644 drivers/input/touchscreen/s3c2410_ts.c
 delete mode 100644 drivers/leds/leds-s3c24xx.c
 delete mode 100644 drivers/mmc/host/s3cmci.c
 delete mode 100644 drivers/mmc/host/s3cmci.h
 delete mode 100644 drivers/pinctrl/samsung/pinctrl-s3c24xx.c
 delete mode 100644 drivers/power/supply/s3c_adc_battery.c
 delete mode 100644 drivers/soc/samsung/s3c-pm-debug.c
 delete mode 100644 drivers/spi/spi-s3c24xx-regs.h
 delete mode 100644 drivers/spi/spi-s3c24xx.c
 delete mode 100644 drivers/usb/gadget/udc/s3c-hsudc.c
 delete mode 100644 drivers/usb/gadget/udc/s3c2410_udc.c
 delete mode 100644 drivers/usb/gadget/udc/s3c2410_udc.h
 delete mode 100644 drivers/usb/gadget/udc/s3c2410_udc_regs.h
 delete mode 100644 drivers/video/fbdev/s3c2410fb-regs-lcd.h
 delete mode 100644 drivers/video/fbdev/s3c2410fb.c
 delete mode 100644 drivers/video/fbdev/s3c2410fb.h
 delete mode 100644 include/dt-bindings/clock/s3c2410.h
 delete mode 100644 include/dt-bindings/clock/s3c2412.h
 delete mode 100644 include/dt-bindings/clock/s3c2443.h
 delete mode 100644 include/linux/amba/pl093.h
 delete mode 100644 include/linux/platform_data/asoc-s3c24xx_simtec.h
 delete mode 100644 include/linux/platform_data/ata-samsung_cf.h
 delete mode 100644 include/linux/platform_data/clk-s3c2410.h
 delete mode 100644 include/linux/platform_data/dma-s3c24xx.h
 delete mode 100644 include/linux/platform_data/fb-s3c2410.h
 delete mode 100644 include/linux/platform_data/leds-s3c24xx.h
 delete mode 100644 include/linux/platform_data/media/s5p_hdmi.h
 delete mode 100644 include/linux/platform_data/mmc-s3cmci.h
 delete mode 100644 include/linux/platform_data/s3c-hsudc.h
 delete mode 100644 include/linux/platform_data/usb-s3c2410_udc.h
 delete mode 100644 include/linux/s3c_adc_battery.h
 delete mode 100644 include/linux/soc/samsung/s3c-adc.h
 delete mode 100644 include/linux/soc/samsung/s3c-cpufreq-core.h
 delete mode 100644 include/linux/spi/s3c24xx-fiq.h
 delete mode 100644 include/linux/spi/s3c24xx.h
 delete mode 100644 include/sound/s3c24xx_uda134x.h
 delete mode 100644 sound/soc/samsung/h1940_uda1380.c
 delete mode 100644 sound/soc/samsung/jive_wm8750.c
 delete mode 100644 sound/soc/samsung/neo1973_wm8753.c
 delete mode 100644 sound/soc/samsung/regs-i2s-v2.h
 delete mode 100644 sound/soc/samsung/regs-iis.h
 delete mode 100644 sound/soc/samsung/rx1950_uda1380.c
 delete mode 100644 sound/soc/samsung/s3c-i2s-v2.c
 delete mode 100644 sound/soc/samsung/s3c-i2s-v2.h
 delete mode 100644 sound/soc/samsung/s3c2412-i2s.c
 delete mode 100644 sound/soc/samsung/s3c2412-i2s.h
 delete mode 100644 sound/soc/samsung/s3c24xx-i2s.c
 delete mode 100644 sound/soc/samsung/s3c24xx-i2s.h
 delete mode 100644 sound/soc/samsung/s3c24xx_simtec.c
 delete mode 100644 sound/soc/samsung/s3c24xx_simtec.h
 delete mode 100644 sound/soc/samsung/s3c24xx_simtec_hermes.c
 delete mode 100644 sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
 delete mode 100644 sound/soc/samsung/s3c24xx_uda134x.c
 delete mode 100644 sound/soc/samsung/smartq_wm8987.c
 delete mode 100644 sound/soc/samsung/smdk_wm8580.c

-- 
2.29.2

