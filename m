Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66390490665
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238821AbiAQLFz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:05:55 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:7917 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiAQLFz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417555; x=1673953555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gWCB2jSI8ZbCAofIfIvhZNSEbC/cw4Yx/YGwRjsWNEQ=;
  b=2CWEJkskCIoHgFNxlRAlvvY8TfmuCKW/8hftcg1Et7vcYxLs6BjuIsgd
   imBEcvOIPpOWhwtK/sPwDg9oFDa0KA3b6x9IRcXIohS5DyX8n4u9mb4ZS
   uGFWLLy7SAAGCjsHFK1REkhCmPt5Z2OUKBriJezJD3Nxtx7TEBbE1n19E
   mjN27E9k7jvEfrH+w12LtIyDspdEsaSF2w7HwSGiCHNiS/NcMGd6NzhIK
   oWTDpcENr3cPeD1cijLQm7hZboyVni43MvA95t4XG1uHDviNWpJ1o4dda
   UsnUfIn4tnkixP/NyIuAxIvSiKurcOjUycEenBU/ZhQ5JU4qR4cSYc9uJ
   Q==;
IronPort-SDR: AfRy/Y5tMEri9D+SlVeOwzlpEo33GD+ODIq9O2nmTIUR3aeUAgeqyoBpBhGw444MilL5dYe7ji
 LbvwvGAOlLG4gMz6bs4gUuCi1XlX+jkZ/RAhcTeHkD9og86LIFz/JQB9Dkhl+H+B9c8xQBRJ3v
 fuiFdj4x1zC80djpIGaEujzpTWMGFLi7EAScLOhYF0qlz+GN5XV1rP1wapcWSEHAJPAjAqKTZ2
 Eww8JPdnydDOisFWeylOtDFOD7ftsJ1ll89be4nI8au6OF/s/8Zb/acd2CxkwOmQc/pR2uY2VQ
 anLH9qaEbvQjVQmuqX4gfdi+
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="150422938"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:05:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:05:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:05:41 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>
Subject: [PATCH v4 00/14] Update the Icicle Kit device tree
Date:   Mon, 17 Jan 2022 11:07:41 +0000
Message-ID: <20220117110755.3433142-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

This series updates the Microchip Icicle Kit device tree by adding a
host of peripherals, and some updates to the memory map. In addition,
the device tree has been split into a third part, which contains "soft"
peripherals that are in the fpga fabric.

Several of the entries are for peripherals that have not get had their
drivers upstreamed, so in those cases the dt bindings are included where
appropriate in order to avoid the many "DT compatible string <x> appears
un-documented" errors.

Depends on mpfs clock driver series [1] to provide:
dt-bindings/clock/microchip,mpfs-clock.h
and on the other changes to the icicle/mpfs device tree from geert
that are already in linux/riscv/for-next.

Additionally, the interrupt-extended warnings on the plic/clint are 
cleared by [2] & [3].

[1] https://lore.kernel.org/linux-clk/20211216140022.16146-1-conor.dooley@microchip.com/T/
[2] https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/
[3] https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/

Changes from v3:
- drop "mailbox: change mailbox-mpfs compatible string", already upstream:
  commit f10b1fc0161cd99e
- fix copy paste error in microchip,mpfs-mailbox dt-binding
- remove whitespace in syscontroller dt entry

Changes from v2:
- dropped plic int header & corresponding defines in dts{,i}
- use $ref to drmode in mpfs-musb binding
- split changes to dts{,i} again: functional changes to existing
  elements now are in a new patch
- drop num-cs property in mpfs-spi binding
- dont make the system controller a simple-mfd
- move the separate bindings for rng/generic system services into the 
  system controller binding
- added an instance corei2c as i2c2 in the fabric dtsi
- add version numbering to corepwm and corei2c compat string (-rtl-vN)

Conor Dooley (14):
  dt-bindings: soc/microchip: update syscontroller compatibles
  dt-bindings: soc/microchip: add services as children of sys ctrlr
  dt-bindings: i2c: add bindings for microchip mpfs i2c
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: spi: add bindings for microchip mpfs spi
  dt-bindings: usb: add bindings for microchip mpfs musb
  dt-bindings: pwm: add microchip corepwm binding
  riscv: dts: microchip: use clk defines for icicle kit
  riscv: dts: microchip: add fpga fabric section to icicle kit
  riscv: dts: microchip: refactor icicle kit device tree
  riscv: dts: microchip: update peripherals in icicle kit device tree
  riscv: dts: microchip: add new peripherals to icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  80 ++++++
 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  55 ++++
 ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../bindings/pwm/microchip,corepwm.yaml       |  75 +++++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  63 +++++
 .../microchip,mpfs-sys-controller.yaml        |  73 +++++
 ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
 .../bindings/spi/microchip,mpfs-spi.yaml      |  52 ++++
 .../bindings/usb/microchip,mpfs-musb.yaml     |  59 ++++
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 262 +++++++++++++++---
 arch/riscv/configs/icicle_kit_defconfig       | 134 +++++++++
 14 files changed, 932 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
 create mode 100644 arch/riscv/configs/icicle_kit_defconfig

-- 
2.32.0

