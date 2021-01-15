Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2072F8011
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 16:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732304AbhAOPw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 10:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732197AbhAOPw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jan 2021 10:52:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A77C06179B
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jan 2021 07:51:46 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0RNt-0003NK-0o; Fri, 15 Jan 2021 16:51:33 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0RNr-0008LH-RE; Fri, 15 Jan 2021 16:51:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 0/7] Remove ARM platform efm32
Date:   Fri, 15 Jan 2021 16:51:23 +0100
Message-Id: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

compared to v1 (Message-Id:
20210114151630.128830-1-u.kleine-koenig@pengutronix.de) I did the following changes:

 - add "serial" to the summary line of the patch removing the serial
   driver
 - actually remove the serial driver in the patch that claims to do this
   instead of patch 1.

On irc Arnd signalled to want to merge the first patch. As there are no
hard interdependencies between these, I think the best approach is for the
individual maintainers to pick up the patches they are responsible for.

Thanks and best regards,
Uwe

Uwe Kleine-König (7):
  ARM: drop efm32 platform
  clk: Drop unused efm32gg driver
  clocksource: Drop unused efm32 timer code
  spi: Drop unused efm32 bus driver
  i2c: Drop unused efm32 bus driver
  tty: serial: Drop unused efm32 serial driver
  MAINTAINERS: Remove deleted platform efm32

 MAINTAINERS                              |   7 -
 arch/arm/Kconfig                         |  10 +-
 arch/arm/Kconfig.debug                   |  17 -
 arch/arm/Makefile                        |   1 -
 arch/arm/boot/dts/Makefile               |   2 -
 arch/arm/boot/dts/efm32gg-dk3750.dts     |  88 ---
 arch/arm/boot/dts/efm32gg.dtsi           | 177 -----
 arch/arm/configs/efm32_defconfig         |  98 ---
 arch/arm/include/debug/efm32.S           |  45 --
 arch/arm/mach-efm32/Makefile             |   2 -
 arch/arm/mach-efm32/Makefile.boot        |   4 -
 arch/arm/mach-efm32/dtmachine.c          |  16 -
 arch/arm/mm/Kconfig                      |   1 -
 drivers/clk/Makefile                     |   1 -
 drivers/clk/clk-efm32gg.c                |  84 ---
 drivers/clocksource/Kconfig              |   9 -
 drivers/clocksource/Makefile             |   1 -
 drivers/clocksource/timer-efm32.c        | 278 --------
 drivers/i2c/busses/Kconfig               |   7 -
 drivers/i2c/busses/Makefile              |   1 -
 drivers/i2c/busses/i2c-efm32.c           | 469 -------------
 drivers/spi/Kconfig                      |   7 -
 drivers/spi/Makefile                     |   1 -
 drivers/spi/spi-efm32.c                  | 462 ------------
 drivers/tty/serial/Kconfig               |  13 -
 drivers/tty/serial/Makefile              |   1 -
 drivers/tty/serial/efm32-uart.c          | 852 -----------------------
 include/linux/platform_data/efm32-spi.h  |  15 -
 include/linux/platform_data/efm32-uart.h |  19 -
 include/uapi/linux/serial_core.h         |   3 -
 30 files changed, 1 insertion(+), 2690 deletions(-)
 delete mode 100644 arch/arm/boot/dts/efm32gg-dk3750.dts
 delete mode 100644 arch/arm/boot/dts/efm32gg.dtsi
 delete mode 100644 arch/arm/configs/efm32_defconfig
 delete mode 100644 arch/arm/include/debug/efm32.S
 delete mode 100644 arch/arm/mach-efm32/Makefile
 delete mode 100644 arch/arm/mach-efm32/Makefile.boot
 delete mode 100644 arch/arm/mach-efm32/dtmachine.c
 delete mode 100644 drivers/clk/clk-efm32gg.c
 delete mode 100644 drivers/clocksource/timer-efm32.c
 delete mode 100644 drivers/i2c/busses/i2c-efm32.c
 delete mode 100644 drivers/spi/spi-efm32.c
 delete mode 100644 drivers/tty/serial/efm32-uart.c
 delete mode 100644 include/linux/platform_data/efm32-spi.h
 delete mode 100644 include/linux/platform_data/efm32-uart.h


base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.29.2

