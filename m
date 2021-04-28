Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFCB36D8A6
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 15:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbhD1Ntc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 09:49:32 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:41978 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239304AbhD1Nta (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 09:49:30 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id EDA42B9FF2;
        Wed, 28 Apr 2021 21:48:03 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2750T140649007400704S1619617681633012_;
        Wed, 28 Apr 2021 21:48:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9f4b7bf97fe250e292465ec654eab734>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 30
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   <cl@rock-chips.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: [PATCH v3 00/10] arm64: dts: rockchip: add basic dtsi/dts files for RK3568 SoC
Date:   Wed, 28 Apr 2021 21:47:49 +0800
Message-Id: <20210428134759.22076-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

v1:
1. add some dt-bindings for RK3568 devices.
2. add core dtsi for RK3568 SoC.
3. add basic dts for RK3568 EVB

v2:
1. sort device nodes by some rules.

v3:
1. make ARCH=arm64 dtbs_check, then fix some errors and add some documents.

Liang Chen (10):
  dt-bindings: i2c: i2c-rk3x: add description for rk3568
  dt-bindings: serial: snps-dw-apb-uart: add description for rk3568
  dt-bindings: mmc: rockchip-dw-mshc: add description for rk3568
  dt-bindings: watchdog: dw-wdt: add description for rk3568
  dt-bindings: pwm: rockchip: add description for rk3568
  dt-bindings: gpio: change items restriction of clock for
    rockchip,gpio-bank
  dt-bindings: soc: rockchip: Convert grf.txt to YAML
  arm64: dts: rockchip: add generic pinconfig settings used by most
    Rockchip socs
  arm64: dts: rockchip: add core dtsi for RK3568 SoC
  arm64: dts: rockchip: add basic dts for RK3568 EVB

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../bindings/gpio/rockchip,gpio-bank.yaml     |    3 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    9 +-
 .../devicetree/bindings/pwm/pwm-rockchip.yaml |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.txt  |   61 -
 .../devicetree/bindings/soc/rockchip/grf.yaml |   58 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   80 +
 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3111 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  789 +++++
 .../boot/dts/rockchip/rockchip-pinconf.dtsi   |  344 ++
 14 files changed, 4395 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi

-- 
2.17.1



