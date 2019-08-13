Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F9A8BE46
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfHMQV1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:27 -0400
Received: from mout.gmx.net ([212.227.15.19]:41043 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728433AbfHMQV1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713262;
        bh=rp/naLDBhmmYzDn4d28m8/eGPm+36qzZ3wawdGFFltg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=JIiwkqmnElks6g5IGPrVSJX3p0Igci/hRECL19fculccqKF7J6g8ORW+1I7DZgL1b
         5rBwxUWYNcyz0xUAX5ujGv8VcFbEtxiCMh5S2gVNvamT/BB3aMZrosSirXjXlZHrUh
         VQ8RGOf09vva7UbGmWzbIZYkmPlw9Xt90gJX+gMI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M26vL-1i03Rn1pof-002axJ; Tue, 13 Aug 2019 18:21:02 +0200
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
Subject: [PATCH V2 12/13] ARM: dts: Add minimal Raspberry Pi 4 support
Date:   Tue, 13 Aug 2019 18:20:47 +0200
Message-Id: <1565713248-4906-13-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:F+CPRg4RpumVp2Pb7sk2u5PCpHuv7SQI0mvFuoqtY5NcO11f+T1
 3kvOo3Ha4IWsuCM6xOGoHL67cgNmOIGOGBRxKYLl4jI8x7io0q7SzDB7Kazatus73J0aZYv
 Pykw3lBqUPQdvE8TnvOI/jvQkexWbx61OHFljzMu/ojr2QOrH938dJUeZRLUFry1SaF1TRd
 4asBiODNFHz3/E+8fAbfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2C2kKJMszRQ=:t93GAt+IKkCE9VMfl/OUnq
 OORNhlgT2XDzosY99eHGl5GUHd8EgT9AtZHNRA/hJWViWBzHox9YWYUmBsgaT0/oxWli6vfP+
 u2HVaY+wrcK+7+Ozf6SwBmRRJ9TzUKDVcbmUIORTK4eicWaOzmNs6qWiILCX4uYeF83ts//2y
 ktypA+14RQGB57DQi2t3b9AnnyGS+v1R46KUmq4y30K6O3fqONJvNkzuJOJcvSZAd8n+ZftsH
 tv1cQnzlX5Fau3TH2yZSiaS6kapyMZqfFTAA0PEha3IjH29CCqkJyYdGmHyRRiAy2AD67JcTR
 UaSSw1fUC6ncr37uhaxPKA35iY9fRRVX0bXkSuuBKadAf1CWGOM0hoKwqY7IY+gu52XEAkCYU
 XUjmcDb+pVjiTAq9hDvwwhm6WBL3dij2IhhwILnzTNtPmouWr3+VP+aZFUdH8A2+DbWLnogII
 rao6Bh71NOp2bvJ0rL6DL3zDjaWf/hrXhiCtVzOxygU/CVCnrylGgyL9uZJM6UMe0su2JdFv8
 IvBrZo1uG5Ub6z2GEIIHXouH6hI3u4IIwL9OTSTRNIjs4woUAOBT8WfBFDxyaL6CDdJgW64KM
 VPyJVy/DM3KyZAxJlOm6CINGSUtgzfObWWdHHIoEzHjFv4eGIg8RR90W0Ecok/2N7FAqyWTkf
 xOijo62C5cjNj4jt8o4QoSlgPx1SXZAZXFrWfS8+GF1sLQJ/9LVVkxvFcdU/ElPaa+POHCki9
 tLhzVk6/a83YwZ1/X1kPNRtSu7eu1wArvOGNErarJNoRK2zZqFlXMFXdg2v2r4s6kDu9RXVHk
 rbHmLlByFt4ZBPFpSntfhzuyKxH3Y5OtxV2MlNzmEf2W8BRJ5hZZ8U8kVcBRmzfi4DdAFmcwR
 8AMmzygqPD+OoMALdZhPSrFxhHgc8r/JbXZVVp1lG1DP9lbhOt9ww9rw1sfGWZjkMRI4TYwod
 +2yc0bKeF9WtLUE+TAjKFVRamwPau80rpbKp0E21KcxiKxqra0SFfUXNDjEjFnZXyMtqOdPPw
 aDQYFpHrsRu5fmwuJjAt9shU4RDh6zkUIUj6Sg4Cjf+eHFSY3CmarjBndloJzyAKTkjRovqu2
 Ba36s2e9ZIsyxmKJ+ZVclvyrJXpr4MNyNqkuY6RScF8180NjrzYut5ChQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds minimal support for the new Raspberry Pi 4 without the
fancy stuff like GENET, PCIe, xHCI, 40 bit DMA and V3D. The RPi 4 is
available in 3 different variants (1, 2 and 4 GB RAM), so leave the memory
size to zero and let the bootloader take care of it. The DWC2 is still
usable as peripheral via the USB-C port.

Other differences to the Raspberry Pi 3:
- additional GIC 400 Interrupt controller
- new thermal IP and HWRNG
- additional MMC interface (emmc2)
- additional UART, I2C, SPI and PWM interfaces
- clock stretching bug in I2C IP has been fixed

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts             | 121 ++++
 arch/arm/boot/dts/bcm2711.dtsi                    | 662 +++++++++++++++++=
+++++
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi |   7 +
 arch/arm/boot/dts/bcm283x.dtsi                    |   4 +-
 5 files changed, 793 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b.dts
 create mode 100644 arch/arm/boot/dts/bcm2711.dtsi
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9159fa2..031ca32 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
+	bcm2711-rpi-4-b.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) +=3D \
diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm=
2711-rpi-4-b.dts
new file mode 100644
index 0000000..3825273
=2D-- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711.dtsi"
+#include "bcm2835-rpi.dtsi"
+#include "bcm283x-rpi-usb-peripheral.dtsi"
+
+/ {
+	compatible =3D "raspberrypi,4-model-b", "brcm,bcm2711";
+	model =3D "Raspberry Pi 4 Model B";
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path =3D "serial1:115200n8";
+	};
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0 0x00000000>;
+	};
+
+	leds {
+		act {
+			gpios =3D <&gpio 42 GPIO_ACTIVE_HIGH>;
+		};
+
+		pwr {
+			label =3D "PWR";
+			gpios =3D <&expgpio 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible =3D "mmc-pwrseq-simple";
+		reset-gpios =3D <&expgpio 1 GPIO_ACTIVE_LOW>;
+	};
+
+	sd_io_1v8_reg: sd_io_1v8_reg {
+		compatible =3D "regulator-gpio";
+		regulator-name =3D "vdd-sd-io";
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us =3D <5000>;
+		gpios =3D <&expgpio 4 GPIO_ACTIVE_HIGH>;
+		states =3D <1800000 0x1
+			  3300000 0x0>;
+		status =3D "okay";
+	};
+};
+
+&firmware {
+	expgpio: gpio {
+		compatible =3D "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells =3D <2>;
+		gpio-line-names =3D "BT_ON",
+				  "WL_ON",
+				  "PWR_LED_OFF",
+				  "GLOBAL_RESET",
+				  "VDD_SD_IO_SEL",
+				  "CAM_GPIO",
+				  "",
+				  "";
+		status =3D "okay";
+	};
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwm1_0_gpio40 &pwm1_1_gpio41>;
+	status =3D "okay";
+};
+
+/* SDHCI is used to control the SDIO for wireless */
+&sdhci {
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&emmc_gpio34>;
+	bus-width =3D <4>;
+	non-removable;
+	mmc-pwrseq =3D <&wifi_pwrseq>;
+	status =3D "okay";
+
+	brcmf: wifi@1 {
+		reg =3D <1>;
+		compatible =3D "brcm,bcm4329-fmac";
+	};
+};
+
+/* EMMC2 is used to drive the SD card */
+&emmc2 {
+	vqmmc-supply =3D <&sd_io_1v8_reg>;
+	broken-cd;
+	status =3D "okay";
+};
+
+/* uart0 communicates with the BT module */
+&uart0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart0_ctsrts_gpio30 &uart0_gpio32 &gpclk2_gpio43>;
+	status =3D "okay";
+
+	bluetooth {
+		compatible =3D "brcm,bcm43438-bt";
+		max-speed =3D <2000000>;
+		shutdown-gpios =3D <&expgpio 0 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* uart1 is mapped to the pin header */
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart1_gpio14>;
+	status =3D "okay";
+};
+
+&vchiq {
+	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dt=
si
new file mode 100644
index 0000000..023ff27
=2D-- /dev/null
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -0,0 +1,662 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "bcm283x.dtsi"
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/bcm2835-pm.h>
+
+/ {
+	compatible =3D "brcm,bcm2711";
+
+	#address-cells =3D <2>;
+	#size-cells =3D <1>;
+
+	interrupt-parent =3D <&gicv2>;
+
+	soc {
+		ranges =3D <0x7e000000  0x0 0xfe000000  0x01800000>,
+			 <0x7c000000  0x0 0xfc000000  0x02000000>,
+			 <0x40000000  0x0 0xff800000  0x00800000>;
+		/* Emulate a contiguous 30-bit address range for DMA */
+		dma-ranges =3D <0xc0000000  0x0 0x00000000  0x3c000000>;
+
+		local_intc: local_intc@40000000 {
+			compatible =3D "brcm,bcm2836-l1-intc";
+			reg =3D <0x40000000 0x100>;
+		};
+
+		gicv2: gic400@40041000 {
+			interrupt-controller;
+			#interrupt-cells =3D <3>;
+			compatible =3D "arm,gic-400";
+			reg =3D	<0x40041000 0x1000>,
+				<0x40042000 0x2000>,
+				<0x40044000 0x2000>,
+				<0x40046000 0x2000>;
+			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		dma: dma@7e007000 {
+			compatible =3D "brcm,bcm2835-dma";
+			reg =3D <0x7e007000 0xb00>;
+			interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     /* DMA lite 7 - 10 */
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "dma0",
+					  "dma1",
+					  "dma2",
+					  "dma3",
+					  "dma4",
+					  "dma5",
+					  "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10";
+			#dma-cells =3D <1>;
+			brcm,dma-channel-mask =3D <0x07f5>;
+		};
+
+		pm: watchdog@7e100000 {
+			compatible =3D "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
+			#power-domain-cells =3D <1>;
+			#reset-cells =3D <1>;
+			reg =3D <0x7e100000 0x114>,
+			      <0x7e00a000 0x24>,
+			      <0x7ec11000 0x20>;
+			clocks =3D <&clocks BCM2835_CLOCK_V3D>,
+				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+				 <&clocks BCM2835_CLOCK_H264>,
+				 <&clocks BCM2835_CLOCK_ISP>;
+			clock-names =3D "v3d", "peri_image", "h264", "isp";
+			system-power-controller;
+		};
+
+		rng@7e104000 {
+			interrupts =3D <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+
+			/* RNG is incompatible to brcm,bcm2835-rng */
+			status =3D "disabled";
+		};
+
+		uart2: serial@7e201400 {
+			compatible =3D "arm,pl011", "arm,primecell";
+			reg =3D <0x7e201400 0x200>;
+			interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_UART>,
+				 <&clocks BCM2835_CLOCK_VPU>;
+			clock-names =3D "uartclk", "apb_pclk";
+			arm,primecell-periphid =3D <0x00241011>;
+			status =3D "disabled";
+		};
+
+		uart3: serial@7e201600 {
+			compatible =3D "arm,pl011", "arm,primecell";
+			reg =3D <0x7e201600 0x200>;
+			interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_UART>,
+				 <&clocks BCM2835_CLOCK_VPU>;
+			clock-names =3D "uartclk", "apb_pclk";
+			arm,primecell-periphid =3D <0x00241011>;
+			status =3D "disabled";
+		};
+
+		uart4: serial@7e201800 {
+			compatible =3D "arm,pl011", "arm,primecell";
+			reg =3D <0x7e201800 0x200>;
+			interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_UART>,
+				 <&clocks BCM2835_CLOCK_VPU>;
+			clock-names =3D "uartclk", "apb_pclk";
+			arm,primecell-periphid =3D <0x00241011>;
+			status =3D "disabled";
+		};
+
+		uart5: serial@7e201a00 {
+			compatible =3D "arm,pl011", "arm,primecell";
+			reg =3D <0x7e201a00 0x200>;
+			interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_UART>,
+				 <&clocks BCM2835_CLOCK_VPU>;
+			clock-names =3D "uartclk", "apb_pclk";
+			arm,primecell-periphid =3D <0x00241011>;
+			status =3D "disabled";
+		};
+
+		spi@7e204000 {
+			reg =3D <0x7e204000 0x0200>;
+			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		spi3: spi@7e204600 {
+			compatible =3D "brcm,bcm2835-spi";
+			reg =3D <0x7e204600 0x0200>;
+			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		spi4: spi@7e204800 {
+			compatible =3D "brcm,bcm2835-spi";
+			reg =3D <0x7e204800 0x0200>;
+			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		spi5: spi@7e204a00 {
+			compatible =3D "brcm,bcm2835-spi";
+			reg =3D <0x7e204a00 0x0200>;
+			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		spi6: spi@7e204c00 {
+			compatible =3D "brcm,bcm2835-spi";
+			reg =3D <0x7e204c00 0x0200>;
+			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c3: i2c@7e205600 {
+			compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+			reg =3D <0x7e205600 0x200>;
+			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c4: i2c@7e205800 {
+			compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+			reg =3D <0x7e205800 0x200>;
+			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c5: i2c@7e205a00 {
+			compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+			reg =3D <0x7e205a00 0x200>;
+			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c6: i2c@7e205c00 {
+			compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+			reg =3D <0x7e205c00 0x200>;
+			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		pwm1: pwm@7e20c800 {
+			compatible =3D "brcm,bcm2835-pwm";
+			reg =3D <0x7e20c800 0x28>;
+			clocks =3D <&clocks BCM2835_CLOCK_PWM>;
+			assigned-clocks =3D <&clocks BCM2835_CLOCK_PWM>;
+			assigned-clock-rates =3D <10000000>;
+			#pwm-cells =3D <2>;
+			status =3D "disabled";
+		};
+
+		emmc2: emmc2@7e340000 {
+			compatible =3D "brcm,bcm2711-emmc2";
+			reg =3D <0x7e340000 0x100>;
+			interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clocks BCM2711_CLOCK_EMMC2>;
+			status =3D "disabled";
+		};
+
+		hvs@7e400000 {
+			interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	arm-pmu {
+		compatible =3D "arm,cortex-a72-pmu", "arm,armv8-pmuv3";
+		interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	timer {
+		compatible =3D "arm,armv8-timer";
+		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+		/* This only applies to the ARMv7 stub */
+		arm,cpu-registers-not-fw-configured;
+
+		/* The ARM cores doesn't enter deep enough states */
+		always-on;
+	};
+
+	cpus: cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		enable-method =3D "brcm,bcm2836-smp"; // for ARM 32-bit
+
+		cpu0: cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a72";
+			reg =3D <0>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x000000d8>;
+		};
+
+		cpu1: cpu@1 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a72";
+			reg =3D <1>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x000000e0>;
+		};
+
+		cpu2: cpu@2 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a72";
+			reg =3D <2>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x000000e8>;
+		};
+
+		cpu3: cpu@3 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a72";
+			reg =3D <3>;
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x000000f0>;
+		};
+	};
+};
+
+&clk_osc {
+	clock-frequency =3D <54000000>;
+};
+
+&clocks {
+	compatible =3D "brcm,bcm2711-cprman";
+};
+
+&cpu_thermal {
+	coefficients =3D <(-487) 410040>;
+};
+
+&dsi0 {
+	interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&dsi1 {
+	interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio {
+	compatible =3D "brcm,bcm2711-gpio";
+	interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+
+	gpclk0_gpio49: gpclk0_gpio49 {
+		brcm,pins =3D <49>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+		brcm,pull =3D <BCM2835_PUD_OFF>;
+	};
+	gpclk1_gpio50: gpclk1_gpio50 {
+		brcm,pins =3D <50>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+		brcm,pull =3D <BCM2835_PUD_OFF>;
+	};
+	gpclk2_gpio51: gpclk2_gpio51 {
+		brcm,pins =3D <51>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+		brcm,pull =3D <BCM2835_PUD_OFF>;
+	};
+
+	i2c0_gpio46: i2c0_gpio46 {
+		brcm,pins =3D <46 47>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	i2c1_gpio46: i2c1_gpio46 {
+		brcm,pins =3D <46 47>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+	};
+	i2c3_gpio2: i2c3_gpio2 {
+		brcm,pins =3D <2 3>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c3_gpio4: i2c3_gpio4 {
+		brcm,pins =3D <4 5>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c4_gpio6: i2c4_gpio6 {
+		brcm,pins =3D <6 7>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c4_gpio8: i2c4_gpio8 {
+		brcm,pins =3D <8 9>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c5_gpio10: i2c5_gpio10 {
+		brcm,pins =3D <10 11>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c5_gpio12: i2c5_gpio12 {
+		brcm,pins =3D <12 13>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c6_gpio0: i2c6_gpio0 {
+		brcm,pins =3D <0 1>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c6_gpio22: i2c6_gpio22 {
+		brcm,pins =3D <22 23>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	i2c_slave_gpio8: i2c_slave_gpio8 {
+		brcm,pins =3D <8 9 10 11>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+
+	jtag_gpio48: jtag_gpio48 {
+		brcm,pins =3D <48 49 50 51 52 53>;
+		brcm,function =3D <BCM2835_FSEL_ALT4>;
+	};
+
+	mii_gpio28: mii_gpio28 {
+		brcm,pins =3D <28 29 30 31>;
+		brcm,function =3D <BCM2835_FSEL_ALT4>;
+	};
+	mii_gpio36: mii_gpio36 {
+		brcm,pins =3D <36 37 38 39>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+
+	pcm_gpio50: pcm_gpio50 {
+		brcm,pins =3D <50 51 52 53>;
+		brcm,function =3D <BCM2835_FSEL_ALT2>;
+	};
+
+	pwm0_0_gpio12: pwm0_0_gpio12 {
+		brcm,pins =3D <12>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_0_gpio18: pwm0_0_gpio18 {
+		brcm,pins =3D <18>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm1_0_gpio40: pwm1_0_gpio40 {
+		brcm,pins =3D <40>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_1_gpio13: pwm0_1_gpio13 {
+		brcm,pins =3D <13>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_1_gpio19: pwm0_1_gpio19 {
+		brcm,pins =3D <19>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm1_1_gpio41: pwm1_1_gpio41 {
+		brcm,pins =3D <41>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_1_gpio45: pwm0_1_gpio45 {
+		brcm,pins =3D <45>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_0_gpio52: pwm0_0_gpio52 {
+		brcm,pins =3D <52>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+		brcm,pull =3D <BCM2835_PUD_OFF>;
+	};
+	pwm0_1_gpio53: pwm0_1_gpio53 {
+		brcm,pins =3D <53>;
+		brcm,function =3D <BCM2835_FSEL_ALT1>;
+		brcm,pull =3D <BCM2835_PUD_OFF>;
+	};
+
+	/* The following group consists of:
+	 *  RGMII_START_STOP
+	 *  RGMII_RX_OK
+	 */
+	rgmii_gpio35: rgmii_gpio35 {
+		brcm,pins =3D <35 36>;
+		brcm,function =3D <BCM2835_FSEL_ALT4>;
+	};
+	rgmii_irq_gpio34: rgmii_irq_gpio34 {
+		brcm,pins =3D <34>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	rgmii_irq_gpio39: rgmii_irq_gpio39 {
+		brcm,pins =3D <39>;
+		brcm,function =3D <BCM2835_FSEL_ALT4>;
+	};
+	rgmii_mdio_gpio28: rgmii_mdio_gpio28 {
+		brcm,pins =3D <28 29>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	rgmii_mdio_gpio37: rgmii_mdio_gpio37 {
+		brcm,pins =3D <37 38>;
+		brcm,function =3D <BCM2835_FSEL_ALT4>;
+	};
+
+	spi0_gpio46: spi0_gpio46 {
+		brcm,pins =3D <46 47 48 49>;
+		brcm,function =3D <BCM2835_FSEL_ALT2>;
+	};
+	spi2_gpio46: spi2_gpio46 {
+		brcm,pins =3D <46 47 48 49 50>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	spi3_gpio0: spi3_gpio0 {
+		brcm,pins =3D <0 1 2 3>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+	spi4_gpio4: spi4_gpio4 {
+		brcm,pins =3D <4 5 6 7>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+	spi5_gpio12: spi5_gpio12 {
+		brcm,pins =3D <12 13 14 15>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+	spi6_gpio18: spi6_gpio18 {
+		brcm,pins =3D <18 19 20 21>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+
+	uart2_gpio0: uart2_gpio0 {
+		pin-tx {
+			brcm,pins =3D <0>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+		pin-rx {
+			brcm,pins =3D <1>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+	};
+	uart2_ctsrts_gpio2: uart2_ctsrts_gpio2 {
+		pin-cts {
+			brcm,pins =3D <2>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+		pin-rts {
+			brcm,pins =3D <3>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+	};
+	uart3_gpio4: uart3_gpio4 {
+		pin-tx {
+			brcm,pins =3D <4>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+		pin-rx {
+			brcm,pins =3D <5>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+	};
+	uart3_ctsrts_gpio6: uart3_ctsrts_gpio6 {
+		pin-cts {
+			brcm,pins =3D <6>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+		pin-rts {
+			brcm,pins =3D <7>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+	};
+	uart4_gpio8: uart4_gpio8 {
+		pin-tx {
+			brcm,pins =3D <8>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+		pin-rx {
+			brcm,pins =3D <9>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+	};
+	uart4_ctsrts_gpio10: uart4_ctsrts_gpio10 {
+		pin-cts {
+			brcm,pins =3D <10>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+		pin-rts {
+			brcm,pins =3D <11>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+	};
+	uart5_gpio12: uart5_gpio12 {
+		pin-tx {
+			brcm,pins =3D <12>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+		pin-rx {
+			brcm,pins =3D <13>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+	};
+	uart5_ctsrts_gpio14: uart5_ctsrts_gpio14 {
+		pin-cts {
+			brcm,pins =3D <14>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_UP>;
+		};
+		pin-rts {
+			brcm,pins =3D <15>;
+			brcm,function =3D <BCM2835_FSEL_ALT4>;
+			brcm,pull =3D <BCM2835_PUD_OFF>;
+		};
+	};
+};
+
+&i2c0 {
+	compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+	interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c1 {
+	compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+	interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c2 {
+	compatible =3D "brcm,bcm2711-i2c", "brcm,bcm2835-i2c";
+	interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&mailbox {
+	interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&sdhci {
+	interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&sdhost {
+	interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi1 {
+	interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi2 {
+	interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&system_timer {
+	interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&txp {
+	interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart0 {
+	interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart1 {
+	interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&usb {
+	interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&vec {
+	interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi b/arch/arm/=
boot/dts/bcm283x-rpi-usb-peripheral.dtsi
new file mode 100644
index 0000000..0ff0e9e
=2D-- /dev/null
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+&usb {
+	dr_mode =3D "peripheral";
+	g-rx-fifo-size =3D <256>;
+	g-np-tx-fifo-size =3D <32>;
+	g-tx-fifo-size =3D <256 256 512 512 512 768 768>;
+};
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dt=
si
index cbc9422..5655ae4 100644
=2D-- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -53,7 +53,7 @@
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;

-		timer@7e003000 {
+		system_timer: timer@7e003000 {
 			compatible =3D "brcm,bcm2835-system-timer";
 			reg =3D <0x7e003000 0x1000>;
 			interrupts =3D <1 0>, <1 1>, <1 2>, <1 3>;
@@ -64,7 +64,7 @@
 			clock-frequency =3D <1000000>;
 		};

-		txp@7e004000 {
+		txp: txp@7e004000 {
 			compatible =3D "brcm,bcm2835-txp";
 			reg =3D <0x7e004000 0x20>;
 			interrupts =3D <1 11>;
=2D-
2.7.4

