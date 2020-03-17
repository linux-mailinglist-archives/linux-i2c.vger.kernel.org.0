Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02664187C28
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgCQJjf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:39:35 -0400
Received: from v6.sk ([167.172.42.174]:49946 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgCQJjf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:39:35 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id D181F60EC2;
        Tue, 17 Mar 2020 09:39:31 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 00/28] DT: Improve validation for Marvell SoCs
Date:   Tue, 17 Mar 2020 10:38:54 +0100
Message-Id: <20200317093922.20785-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello World,

chained to this message is a set of patches that improve coverage of Device
Tree validation for devices typically found on Marvell SoCs. It converts most
of the peripheral binding documentation to YAML and fixes up validation issues
in the SoC device trees.

It starts with fixing the issues:

  [PATCH 01/28] ARM: dts: kirkwood: Fix interrupt controller node name
  [PATCH 02/28] ARM: dts: dove: Fix interrupt controller node name
  [PATCH 03/28] ARM: dts: pxa168: Add missing address/size cells to i2c
  [PATCH 04/28] ARM: dts: pxa168: Fix the gpio interrupt cell number
  [PATCH 05/28] ARM: dts: pxa3xx: Fix up encoding of the /gpio
  [PATCH 06/28] ARM: dts: pxa910: Fix the gpio interrupt cell number
  [PATCH 07/28] ARM: dts: pxa*: Fix up encoding of the /rtc interrupts
  [PATCH 08/28] ARM: dts: mmp*: Fix up encoding of the /rtc interrupts
  [PATCH 09/28] ARM: dts: mmp3: fix L2 cache controller node name
  [PATCH 10/28] ARM: dts: mmp3: fix USB & USB PHY node names
  [PATCH 11/28] ARM: dts: berlin*: Fix up the SDHCI node names

Then the binding fixes follow.

When converting .txt binding files that were not written by myself,
I didn't include the SPDX license tag and set the maintaners: to the
devicetree@ list. The reason is that the original binding files don't
contain the information and I didn't want to speak for anyone else and
make it up.

If this is not the correct thing to do, or the respective binding
contributors want to clarify the licensing or be listed as maintainers,
please respond and I'll send an updated patch set. I'm also happy to
maintain any of these bindings.

  [PATCH 12/28] spi: dt-bindings: spi-controller: Slaves have no
  [PATCH 13/28] dt-bindings: serial: move Marvell compatible string to
  [PATCH 14/28] dt-bindings: arm: l2x0: Tauros 3 is PL310 compatible
  [PATCH 15/28] dt-bindings: arm: mrvl: Add missing compatible strings
  [PATCH 16/28] dt-bindings: Add "mrvl", a legacy vendor prefix for
  [PATCH 17/28] dt-bindings: mmc: Fix up clk-phase-sd-hs in an example
  [PATCH 18/28] dt-bindings: mmc: Fix node name in an example
  [PATCH 19/28] dt-bindings: mmc: Convert sdhci-pxa to json-schema
  [PATCH 20/28] dt-bindings: phy: Convert phy-mmp3-usb to json-schema
  [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
  [PATCH 22/28] dt-bindings: i2c: Convert i2c-pxa to json-schema
  [PATCH 23/28] dt-bindings: interrupt-controller: Convert mrvl,intc to
  [PATCH 24/28] dt-bindings: media: Convert marvell,mmp2-ccic to
  [PATCH 25/28] dt-bindings: rtc: Convert sa1100-rtc to json-schema
  [PATCH 26/28] dt-bindings: spi: Convert spi-pxa2xx to json-schema
  [PATCH 27/28] dt-bindings: timer: Convert mrvl,mmp-timer to
  [PATCH 28/28] dt-bindings: usb: Convert ehci-mv to json-schema

None of the patches depends on any other and they can be applied in any
order.

Love,
Lubo


