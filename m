Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6913121E8AB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 08:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgGNGzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jul 2020 02:55:54 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:54969 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725778AbgGNGzx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jul 2020 02:55:53 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07630626|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0607517-0.000518279-0.93873;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03303;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=31;RT=31;SR=0;TI=SMTPD_---.I1TOQkU_1594709738;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I1TOQkU_1594709738)
          by smtp.aliyun-inc.com(10.147.41.121);
          Tue, 14 Jul 2020 14:55:44 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        Yangtao Li <frank@allwinnertech.com>
Subject: [PATCH v4 00/16] Allwinner A100 Initial support
Date:   Tue, 14 Jul 2020 14:55:22 +0800
Message-Id: <cover.1594708863.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

This patch set adds initial support for allwinner a100 soc,
which is a 64-bit tablet chip.

v4:
-drop "dt-bindings: pinctrl: sunxi: make gpio banks supplies required"
-fix dcdc1 regulator name
-get rid of underscore in dts node name
-Some trivial things in yaml files

v3:
-Add pmu and nmi support
-Add read data mask for calibration
-Code style
-Some trivial things in yaml files

v2:
-Some naming consistency
-Repair email address
-Fix mmc clock
-Don't export system clock
-Fix checkpatch warning
-Drop unneeded pin function, convert to jtag_gpu and i2s_x

Yangtao Li (16):
  dt-bindings: clk: sunxi-ccu: add compatible string for A100 CCU and
    R-CCU
  clk: sunxi-ng: add support for the Allwinner A100 CCU
  dt-bindings: pinctrl: sunxi: Get rid of continual nesting
  dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
  pinctrl: sunxi: add support for the Allwinner A100 pin controller
  dt-bindings: nvmem: SID: add binding for A100's SID controller
  dt-bindings: thermal: sun8i: Add binding for A100's THS controller
  thermal: sun8i: add TEMP_CALIB_MASK for calibration data in
    sun50i_h6_ths_calibrate
  thermal: sun8i: Add A100's THS controller support
  mfd: axp20x: Allow the AXP803 to be probed by I2C
  dt-bindings: irq: sun7i-nmi: fix dt-binding for a80 nmi
  dt-bindings: irq: sun7i-nmi: Add binding for A100's NMI controller
  dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.
  arm64: allwinner: A100: add the basical Allwinner A100 DTSI file
  dt-bindings: arm: sunxi: Add Allwinner A100 Perf1 Board bindings
  arm64: allwinner: A100: add support for Allwinner Perf1 board

 .../devicetree/bindings/arm/sunxi.yaml        |    5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |    7 +-
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |    3 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |    5 +-
 .../nvmem/allwinner,sun4i-a10-sid.yaml        |   19 +-
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  139 +-
 .../thermal/allwinner,sun8i-a83t-ths.yaml     |    6 +-
 arch/arm64/boot/dts/allwinner/Makefile        |    1 +
 .../allwinner/sun50i-a100-allwinner-perf1.dts |  180 +++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  364 +++++
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    2 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c      |  214 +++
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h      |   21 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c        | 1276 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a100.h        |   56 +
 drivers/mfd/axp20x-i2c.c                      |    2 +
 drivers/pinctrl/sunxi/Kconfig                 |   10 +
 drivers/pinctrl/sunxi/Makefile                |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c |  105 ++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   |  708 +++++++++
 drivers/thermal/sun8i_thermal.c               |   16 +-
 include/dt-bindings/clock/sun50i-a100-ccu.h   |  116 ++
 include/dt-bindings/clock/sun50i-a100-r-ccu.h |   23 +
 include/dt-bindings/reset/sun50i-a100-ccu.h   |   68 +
 include/dt-bindings/reset/sun50i-a100-r-ccu.h |   18 +
 26 files changed, 3308 insertions(+), 68 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
 create mode 100644 include/dt-bindings/clock/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/clock/sun50i-a100-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-r-ccu.h

-- 
2.24.0

