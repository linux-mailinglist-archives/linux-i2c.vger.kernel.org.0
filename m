Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7C18BE33
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfHMQVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:20 -0400
Received: from mout.gmx.net ([212.227.15.18]:55761 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbfHMQVT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713256;
        bh=dUBlT9Xxrn/3cLif2R6aatleNAWiZ7l31/AxHu5ssns=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=MztWCiiBtmdH4Sb0M3d5URvOceAhk5qSPqzBKjKjgQkYRkShQJ8BlvBfZE1UCO1yJ
         ibQy0NYozhSm+yVsGLbR76/l0OOLttQ/KLQokUqKSRjMcp40D09NwjYbuJ+19ecpA8
         cmXO0fQ1dxQBXIAYYOmnh4PdTQKh1VFnkEP0ewp0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MSt8W-1hrQiE1GHO-00UGxW; Tue, 13 Aug 2019 18:20:56 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 00/13] ARM: Add minimal Raspberry Pi 4 support
Date:   Tue, 13 Aug 2019 18:20:35 +0200
Message-Id: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:omgWgWBXYFvuPOX6q9fI7KNy5K8f42ZRB+xeRxWYdkKzXFVCQ1l
 MqXRbXyZh0HlU14WNpWih9FJIyCoqS89MysLx6bguRh5tkxToeMCOtc8cPokyn1q/T9lFug
 AUTGI5tp2nmtUNhujij/sI89MaOSREKci6JFVdkwSoeyNCkXqZTyjqmES4VDNnGIznakzSc
 BkYiYhHSgXf0i+c6wgFCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sx08nM0KaTc=:/5FhSM3w71RuIBd5P052cY
 I2adqVoXok+QKFpL76+25Cv4drVurWMR0MhQm3v2sqGKMbY5FEVaE/V5LNaFsT7Bi/Okuu8dk
 3wHKlXF140nlPUeuNwd3pYnFaC2BheayNkd/xiqE0hQEYSd2baMi8ycW8MfKuFQmiZI77zP7g
 pMScfRjs4p3Nh40CMjrFCOut0NmLOQtI7bROUfzEVw5r3A51Mrp1/iys447a46TiFnPdRiDSQ
 BkjASIFHMTuxSkO7ahuFs/+3QGZfhtlu+TuwwvTzPLN0iQkNqM/Cd9V2sVpSu6rV7kADb7V4/
 R+xTxVPWuo45byw/g0AKJFX4yLDdwnNH7Ii/Tp1ByqsL8Rdic5lZW69KmUpeV704VxPWyUHpI
 1mdLo5QhQ0HwI1OGiaNoESLvwDeegn/Kx1RyskKTxK6vuDcjx8txVRpBNcUoi3h0DiAV9aycA
 JR2tM/nUowQEUHG+3CYRIufU1XDLf+ZPgLwkrDLL6YKENvgGGPPypbuc4RSNIZrBHaOwE4oHW
 9YL+aaGWPTZUn7EuEYD1WxJcnSB4+LkKzsj/Sunp0NoiQBa08kR1Hj268TLmdI1JAWDkw8vOz
 NLX8V6K3vBQfj14bRf/BeoRtsTDlLPe1hmlG5bFgxowYv9GGmRwagA6aigx6XmR4PxsHIzxF8
 eVn4NM+7lCUs2MDq4bqn3I+yua7DDQ8itpbVAoveQ1mj5ANFhpUVY9c7YH1xw0MiD0iBjCsG4
 Kv+OZyKqeB91VhKVCtNC+lNb/J1VrT4WpAAgHpghdLHW5t5eb54ECWlERJQVQqU6wSkq6XTwr
 eFbMz4iBMIADTI+S3M44wWesDQWJ1tMD12r/NdAn+/VaxncIdNPccDh1uV1lRO3HMmvdwiDAz
 cEWsuMCDXpLNNRkjEZDvi9GAYNpx/hZ6zSuXa6jhTQQCo332S+FSay2fv5SAISzAVGEGsyfIA
 dByFeJr1T89V+nvMhp94TVyGQohzNuKt9TCugVAHtFpy++ad52mm9BEf1XLYF62//IQ03DB1D
 JdmRgAedBUFqlJ/1f4t07AGL0mPXZGtg+rkKdNnRKBm8LLJjpZ187LlxQAWlMPvdWoWPo7JH1
 2ekdj8HwzycljYzcd6fJrP5WXazZVfyDh34hghS/4o3zELCRi2KxZE/1hzVIpMW27txwERHji
 QJAFzjdQhAZFg4fPzdNoTafC5hEbqzdiSxNvJTx3qx2NsJtw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds minimal support for the new Raspberry Pi 4, so we are abl=
e
to login via debug UART.

Patch 1-2:   Prepare platform and DTS for the new SoC BMC2711
Patch 3-6:   Enable clock support for BCM2711
Patch 7-8:   Add I2C support for BCM2711
Patch 9-12:  Add Raspberry Pi 4 DTS support
Patch 13:    Update MAINTAINERS

Unfortunately the Raspberry Pi Foundation didn't released a
peripheral documentation for the new SoC yet. So we only have a preliminar=
y
datasheet [1] and reduced schematics [2].

Known issues:
Since Linux 5.3-rc1 DMA doesn't work properly on that platform.
Nicolas Saenz Julienne investigates on that issue. As a temporary workarou=
nd
i reverted the following patch to test this series:

79a98672 "dma-mapping: remove dma_max_pfn"
7559d612 "mmc: core: let the dma map ops handle bouncing"

Changes in V2:
- use separate board file for BCM2711
- enable ARM_GIC for ARCH_BCM2835
- add Acked-by and Reviewed-by
- fix arm-pmu and timer nodes for BCM2711 reported by Marc Zyngier
- enable HDMI at board level
- move HDMI and pixelvalve into bcm2835-common.dtsi as suggested by Eric A=
nholt
- fix DWC2 probing warning by setting USB role to peripheral
- fix order of node references in bcm2711.dtsi
- disable I2C clock stretching quirk for BCM2711
- mark PLLD_PER as critical clock
- make PLLH clock unavailable on BCM2711
- fix compile warning in clk-bcm2835 for arm64

Changes since RFC:
- change BCM2838 -> BCM2711 as discussed in RFC
- update MAINTAINERS accordingly
- drop "spi: bcm2835: enable shared interrupt support" from series
- squash all pinctrl-bcm2835 changes into one patch
- introduce SoC specific clock registration as suggested by Florian
- fix watchdog probing for Raspberry Pi 4
- convert brcm,bcm2835.txt to json-schema
- move VC4 node to bcm2835-common.dtsi
- fallback to legacy pull config for Raspberry Pi 4
- revert unintended change of mailbox in bcm283x.dtsi
- add reference for arm64

[1] - https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm27=
11/rpi_DATA_2711_1p0_preliminary.pdf
[2] - https://www.raspberrypi.org/documentation/hardware/raspberrypi/schem=
atics/rpi_SCH_4b_4p0_reduced.pdf

Stefan Wahren (13):
  ARM: dts: bcm283x: Enable HDMI at board level
  ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
  dt-bindings: bcm2835-cprman: Add bcm2711 support
  clk: bcm2835: Introduce SoC specific clock registration
  clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
  clk: bcm2835: Mark PLLD_PER as CRITICAL
  dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible
  i2c: bcm2835: Avoid clk stretch quirk for BCM2711
  dt-bindings: arm: Convert BCM2835 board/soc bindings to json-schema
  dt-bindings: arm: bcm2835: Add Raspberry Pi 4 to DT schema
  ARM: bcm: Add support for BCM2711 SoC
  ARM: dts: Add minimal Raspberry Pi 4 support
  MAINTAINERS: Add BCM2711 to BCM2835 ARCH

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |  51 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |  67 ---
 .../bindings/clock/brcm,bcm2835-cprman.txt         |   4 +-
 .../devicetree/bindings/i2c/brcm,bcm2835-i2c.txt   |   4 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              | 121 ++++
 arch/arm/boot/dts/bcm2711.dtsi                     | 662 ++++++++++++++++=
+++++
 arch/arm/boot/dts/bcm2835-common.dtsi              | 183 ++++++
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |   2 +
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |   2 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |   2 +
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |   2 +
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |   2 +
 arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts          |   2 +
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |   2 +
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |   2 +
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   5 -
 arch/arm/boot/dts/bcm2835.dtsi                     |   1 +
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |   2 +
 arch/arm/boot/dts/bcm2836.dtsi                     |   1 +
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |   2 +
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |   2 +
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |   2 +
 arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts          |   2 +
 arch/arm/boot/dts/bcm2837.dtsi                     |   1 +
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi  |   7 +
 arch/arm/boot/dts/bcm283x.dtsi                     | 168 +-----
 arch/arm/mach-bcm/Kconfig                          |   3 +-
 arch/arm/mach-bcm/Makefile                         |   3 +-
 arch/arm/mach-bcm/bcm2711.c                        |  22 +
 drivers/clk/bcm/clk-bcm2835.c                      | 133 ++++-
 drivers/i2c/busses/i2c-bcm2835.c                   |  16 +-
 include/dt-bindings/clock/bcm2835.h                |   2 +
 34 files changed, 1221 insertions(+), 263 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835=
.txt
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b.dts
 create mode 100644 arch/arm/boot/dts/bcm2711.dtsi
 create mode 100644 arch/arm/boot/dts/bcm2835-common.dtsi
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
 create mode 100644 arch/arm/mach-bcm/bcm2711.c

=2D-
2.7.4

