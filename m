Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E878BE2D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbfHMQVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:46047 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727221AbfHMQVT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713257;
        bh=7S5djWQzn2gDxYQ9YkU8zVyRZfcicTOF31rfB/MWxIE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lC99sWYasat5GSmf9Co3iMrcdjlWo+GBid3HTTIC8GJNuu9V15EpH584z2qaCS5Ar
         nUhzFlT64/M1PuQo1ycgtyIPFHW3nBesXGzh44HlvAePUH7PFM+2n31H1xRL91sWE/
         PopoEU91uHkK8hI7KUPC7vM3AxGnUnfdnOsp945w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N9dwd-1iKj3k1bYj-015WJV; Tue, 13 Aug 2019 18:20:57 +0200
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
Subject: [PATCH V2 02/13] ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
Date:   Tue, 13 Aug 2019 18:20:37 +0200
Message-Id: <1565713248-4906-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:3kXe+yEkDGjZ2SVm7wmv+qrZ8kqqw8MimzfhpGvfDZbO84rjxEu
 +lAcLfQ8Uk2IGhsGyIi62nXEIgxHLzI85yUDA3if6GTKhNOj1lDVyO9QcGapz9+lq3ImBkL
 jR80bTg1cpFa4zyfGXArTgOVmXB1WunNTl5cXjIIQDBChVatmhkVNvvBmDHbvFKdTVpWp4K
 P10UqXZcwisEgGRHVlEIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hilN8USRaf4=:OkO8R8/IIDI5dSLHKpmLGp
 v1aaDRHSB6H8dswXbC6aWI5pTXBELgr1Xqf6X1eGa0QRaR+mI+dC3AToS4nQUidlABA1CuWIN
 Tg22TX+2O4fV+GBltMAKeN0dOM+BWR4zi2dpWWnM+DpuiX8kx+dkY6SUENjIrOpSCnUBd6lKS
 2FWuGbIUHOIRYmK58JWa9rpRFK5Vs2uRZqkzxLc1AOv25ovLOn7tLP2jBBWOdTLvqM4kXyPyx
 +vOgj4GxhahttP6PmEQ/ZF0piSWjM/AQtRssqJddzDSlYvp/4FJow94Rca+Wq7tGOUi0X81f9
 uzMJAeyJcsfn2D4Hw5X/XzRZq8tnP96RnMdGk3rn94htwlpSRVUIXOOmcTJOJoPgbaWwUJWX9
 LjowQz35EUHDWgd10QJSiXFTGe7VkrB+msvxgZUOnEfZfXAXQ2sFBiwDijMWaXpuudCQWa6vc
 mBV6ekjOalBjtvCzHpaGuzrBE/ufrhukIhGN2vgIwIZX4QLdbZfQyonn8MIfWVFCN+rqvU8U6
 NIbnAOfYS/fcjqRumAofI5VLHfq2Q46ncs5cnrZDpRlHig1mXHZRGP97wWkH2WsT8OaOByAaZ
 /VtbTih+pDX+qQXVsz1+xK7KYgTjs6sbUWRcOmdwND9cxgrdXGQCHH/z0+gP1hRQVoN9qyXsd
 m2Qd6/dBW+1Xgolxv1vSgi4pPPJRMDsT0E9vftb7NXABiIqvXaAuEKLdn8Q6TGVQjhR22Zuoo
 BMkxo6wkXO13XtieKMha8OeozSCGOu23yvX2vgVpb8IaMFvvRx8T7WohsjWf3LjLSgmnurDo0
 36bwafm9sZfC3yeXxjCCtGC8fsIC1fl8Ea29uuMU0BBqFk6bwmXhdxH5ijN33csy9ZQFIIInG
 fFSn095tuuxxSXrphJNKPRzQeTIa2x2i7SnRkqPQ22S0XN/FEHoY/mnbacZ02vwlbuA1krQyC
 fPtkEevJ6o8PW5WF/uUlRzTZNNpybkyrsbUfcwYU39HvH8+OjDG7/4Yc22U/WLU1Ut04XLx3p
 lClX1l/gV8WT5iXd8Vg6F4onYrNnNE4GDpvFSuxECZcn8j7/xgkkYa7ker72gyrch8sK+pRgk
 FN8LfKJ072t48luDur8ONEKxlYxULC/fypcNTJsniXaPUqp3LJ9+oet3w==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As preparation we want all common BCM2711 + BCM2835/6/7 functions in
bcm283x.dtsi and all BCM2835/6/7 specific in the new
bcm2835-common.dtsi.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 arch/arm/boot/dts/bcm2835-common.dtsi | 183 +++++++++++++++++++++++++++++=
+++++
 arch/arm/boot/dts/bcm2835.dtsi        |   1 +
 arch/arm/boot/dts/bcm2836.dtsi        |   1 +
 arch/arm/boot/dts/bcm2837.dtsi        |   1 +
 arch/arm/boot/dts/bcm283x.dtsi        | 164 +----------------------------=
-
 5 files changed, 187 insertions(+), 163 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-common.dtsi

diff --git a/arch/arm/boot/dts/bcm2835-common.dtsi b/arch/arm/boot/dts/bcm=
2835-common.dtsi
new file mode 100644
index 0000000..003bbb6
=2D-- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-common.dtsi
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* This include file covers the common peripherals and configuration betw=
een
+ * bcm2835, bcm2836 and bcm2837 implementations.
+ */
+
+/ {
+	interrupt-parent =3D <&intc>;
+
+	soc {
+		dma: dma@7e007000 {
+			compatible =3D "brcm,bcm2835-dma";
+			reg =3D <0x7e007000 0xf00>;
+			interrupts =3D <1 16>,
+				     <1 17>,
+				     <1 18>,
+				     <1 19>,
+				     <1 20>,
+				     <1 21>,
+				     <1 22>,
+				     <1 23>,
+				     <1 24>,
+				     <1 25>,
+				     <1 26>,
+				     /* dma channel 11-14 share one irq */
+				     <1 27>,
+				     <1 27>,
+				     <1 27>,
+				     <1 27>,
+				     /* unused shared irq for all channels */
+				     <1 28>;
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
+					  "dma10",
+					  "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14",
+					  "dma-shared-all";
+			#dma-cells =3D <1>;
+			brcm,dma-channel-mask =3D <0x7f35>;
+		};
+
+		intc: interrupt-controller@7e00b200 {
+			compatible =3D "brcm,bcm2835-armctrl-ic";
+			reg =3D <0x7e00b200 0x200>;
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+		};
+
+		pm: watchdog@7e100000 {
+			compatible =3D "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
+			#power-domain-cells =3D <1>;
+			#reset-cells =3D <1>;
+			reg =3D <0x7e100000 0x114>,
+			      <0x7e00a000 0x24>;
+			clocks =3D <&clocks BCM2835_CLOCK_V3D>,
+				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+				 <&clocks BCM2835_CLOCK_H264>,
+				 <&clocks BCM2835_CLOCK_ISP>;
+			clock-names =3D "v3d", "peri_image", "h264", "isp";
+			system-power-controller;
+		};
+
+		pixelvalve@7e206000 {
+			compatible =3D "brcm,bcm2835-pixelvalve0";
+			reg =3D <0x7e206000 0x100>;
+			interrupts =3D <2 13>; /* pwa0 */
+		};
+
+		pixelvalve@7e207000 {
+			compatible =3D "brcm,bcm2835-pixelvalve1";
+			reg =3D <0x7e207000 0x100>;
+			interrupts =3D <2 14>; /* pwa1 */
+		};
+
+		thermal: thermal@7e212000 {
+			compatible =3D "brcm,bcm2835-thermal";
+			reg =3D <0x7e212000 0x8>;
+			clocks =3D <&clocks BCM2835_CLOCK_TSENS>;
+			#thermal-sensor-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		pixelvalve@7e807000 {
+			compatible =3D "brcm,bcm2835-pixelvalve2";
+			reg =3D <0x7e807000 0x100>;
+			interrupts =3D <2 10>; /* pixelvalve */
+		};
+
+		hdmi: hdmi@7e902000 {
+			compatible =3D "brcm,bcm2835-hdmi";
+			reg =3D <0x7e902000 0x600>,
+			      <0x7e808000 0x100>;
+			interrupts =3D <2 8>, <2 9>;
+			ddc =3D <&i2c2>;
+			clocks =3D <&clocks BCM2835_PLLH_PIX>,
+				 <&clocks BCM2835_CLOCK_HSM>;
+			clock-names =3D "pixel", "hdmi";
+			dmas =3D <&dma 17>;
+			dma-names =3D "audio-rx";
+			status =3D "disabled";
+		};
+
+		v3d: v3d@7ec00000 {
+			compatible =3D "brcm,bcm2835-v3d";
+			reg =3D <0x7ec00000 0x1000>;
+			interrupts =3D <1 10>;
+		};
+
+		vc4: gpu {
+			compatible =3D "brcm,bcm2835-vc4";
+		};
+	};
+};
+
+&cpu_thermal {
+	thermal-sensors =3D <&thermal>;
+};
+
+&gpio {
+	i2c_slave_gpio18: i2c_slave_gpio18 {
+		brcm,pins =3D <18 19 20 21>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+
+	jtag_gpio4: jtag_gpio4 {
+		brcm,pins =3D <4 5 6 12 13>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+
+	pwm0_gpio12: pwm0_gpio12 {
+		brcm,pins =3D <12>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_gpio18: pwm0_gpio18 {
+		brcm,pins =3D <18>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm0_gpio40: pwm0_gpio40 {
+		brcm,pins =3D <40>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio13: pwm1_gpio13 {
+		brcm,pins =3D <13>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio19: pwm1_gpio19 {
+		brcm,pins =3D <19>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm1_gpio41: pwm1_gpio41 {
+		brcm,pins =3D <41>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio45: pwm1_gpio45 {
+		brcm,pins =3D <45>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+};
+
+&i2s {
+	dmas =3D <&dma 2>, <&dma 3>;
+	dma-names =3D "tx", "rx";
+};
+
+&sdhost {
+	dmas =3D <&dma 13>;
+	dma-names =3D "rx-tx";
+};
+
+&spi {
+	dmas =3D <&dma 6>, <&dma 7>;
+	dma-names =3D "tx", "rx";
+};
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dt=
si
index a5c3824..53bf457 100644
=2D-- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2835";
diff --git a/arch/arm/boot/dts/bcm2836.dtsi b/arch/arm/boot/dts/bcm2836.dt=
si
index c933e84..82d6c46 100644
=2D-- a/arch/arm/boot/dts/bcm2836.dtsi
+++ b/arch/arm/boot/dts/bcm2836.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2836";
diff --git a/arch/arm/boot/dts/bcm2837.dtsi b/arch/arm/boot/dts/bcm2837.dt=
si
index beb6c50..9e95fee 100644
=2D-- a/arch/arm/boot/dts/bcm2837.dtsi
+++ b/arch/arm/boot/dts/bcm2837.dtsi
@@ -1,4 +1,5 @@
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2837";
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dt=
si
index 2d191fc..cbc9422 100644
=2D-- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -18,7 +18,6 @@
 / {
 	compatible =3D "brcm,bcm2835";
 	model =3D "BCM2835";
-	interrupt-parent =3D <&intc>;
 	#address-cells =3D <1>;
 	#size-cells =3D <1>;

@@ -36,8 +35,6 @@
 			polling-delay-passive =3D <0>;
 			polling-delay =3D <1000>;

-			thermal-sensors =3D <&thermal>;
-
 			trips {
 				cpu-crit {
 					temperature	=3D <80000>;
@@ -73,68 +70,6 @@
 			interrupts =3D <1 11>;
 		};

-		dma: dma@7e007000 {
-			compatible =3D "brcm,bcm2835-dma";
-			reg =3D <0x7e007000 0xf00>;
-			interrupts =3D <1 16>,
-				     <1 17>,
-				     <1 18>,
-				     <1 19>,
-				     <1 20>,
-				     <1 21>,
-				     <1 22>,
-				     <1 23>,
-				     <1 24>,
-				     <1 25>,
-				     <1 26>,
-				     /* dma channel 11-14 share one irq */
-				     <1 27>,
-				     <1 27>,
-				     <1 27>,
-				     <1 27>,
-				     /* unused shared irq for all channels */
-				     <1 28>;
-			interrupt-names =3D "dma0",
-					  "dma1",
-					  "dma2",
-					  "dma3",
-					  "dma4",
-					  "dma5",
-					  "dma6",
-					  "dma7",
-					  "dma8",
-					  "dma9",
-					  "dma10",
-					  "dma11",
-					  "dma12",
-					  "dma13",
-					  "dma14",
-					  "dma-shared-all";
-			#dma-cells =3D <1>;
-			brcm,dma-channel-mask =3D <0x7f35>;
-		};
-
-		intc: interrupt-controller@7e00b200 {
-			compatible =3D "brcm,bcm2835-armctrl-ic";
-			reg =3D <0x7e00b200 0x200>;
-			interrupt-controller;
-			#interrupt-cells =3D <2>;
-		};
-
-		pm: watchdog@7e100000 {
-			compatible =3D "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
-			#power-domain-cells =3D <1>;
-			#reset-cells =3D <1>;
-			reg =3D <0x7e100000 0x114>,
-			      <0x7e00a000 0x24>;
-			clocks =3D <&clocks BCM2835_CLOCK_V3D>,
-				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
-				 <&clocks BCM2835_CLOCK_H264>,
-				 <&clocks BCM2835_CLOCK_ISP>;
-			clock-names =3D "v3d", "peri_image", "h264", "isp";
-			system-power-controller;
-		};
-
 		clocks: cprman@7e101000 {
 			compatible =3D "brcm,bcm2835-cprman";
 			#clock-cells =3D <1>;
@@ -184,8 +119,7 @@
 			interrupt-controller;
 			#interrupt-cells =3D <2>;

-			/* Defines pin muxing groups according to
-			 * BCM2835-ARM-Peripherals.pdf page 102.
+			/* Defines common pin muxing groups
 			 *
 			 * While each pin can have its mux selected
 			 * for various functions individually, some
@@ -263,15 +197,7 @@
 				brcm,pins =3D <44 45>;
 				brcm,function =3D <BCM2835_FSEL_ALT2>;
 			};
-			i2c_slave_gpio18: i2c_slave_gpio18 {
-				brcm,pins =3D <18 19 20 21>;
-				brcm,function =3D <BCM2835_FSEL_ALT3>;
-			};

-			jtag_gpio4: jtag_gpio4 {
-				brcm,pins =3D <4 5 6 12 13>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
 			jtag_gpio22: jtag_gpio22 {
 				brcm,pins =3D <22 23 24 25 26 27>;
 				brcm,function =3D <BCM2835_FSEL_ALT4>;
@@ -286,35 +212,6 @@
 				brcm,function =3D <BCM2835_FSEL_ALT2>;
 			};

-			pwm0_gpio12: pwm0_gpio12 {
-				brcm,pins =3D <12>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm0_gpio18: pwm0_gpio18 {
-				brcm,pins =3D <18>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
-			pwm0_gpio40: pwm0_gpio40 {
-				brcm,pins =3D <40>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio13: pwm1_gpio13 {
-				brcm,pins =3D <13>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio19: pwm1_gpio19 {
-				brcm,pins =3D <19>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
-			pwm1_gpio41: pwm1_gpio41 {
-				brcm,pins =3D <41>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio45: pwm1_gpio45 {
-				brcm,pins =3D <45>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-
 			sdhost_gpio48: sdhost_gpio48 {
 				brcm,pins =3D <48 49 50 51 52 53>;
 				brcm,function =3D <BCM2835_FSEL_ALT0>;
@@ -410,8 +307,6 @@
 			reg =3D <0x7e202000 0x100>;
 			interrupts =3D <2 24>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
-			dmas =3D <&dma 13>;
-			dma-names =3D "rx-tx";
 			status =3D "disabled";
 		};

@@ -419,10 +314,6 @@
 			compatible =3D "brcm,bcm2835-i2s";
 			reg =3D <0x7e203000 0x24>;
 			clocks =3D <&clocks BCM2835_CLOCK_PCM>;
-
-			dmas =3D <&dma 2>,
-			       <&dma 3>;
-			dma-names =3D "tx", "rx";
 			status =3D "disabled";
 		};

@@ -431,8 +322,6 @@
 			reg =3D <0x7e204000 0x200>;
 			interrupts =3D <2 22>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
-			dmas =3D <&dma 6>, <&dma 7>;
-			dma-names =3D "tx", "rx";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			status =3D "disabled";
@@ -448,18 +337,6 @@
 			status =3D "disabled";
 		};

-		pixelvalve@7e206000 {
-			compatible =3D "brcm,bcm2835-pixelvalve0";
-			reg =3D <0x7e206000 0x100>;
-			interrupts =3D <2 13>; /* pwa0 */
-		};
-
-		pixelvalve@7e207000 {
-			compatible =3D "brcm,bcm2835-pixelvalve1";
-			reg =3D <0x7e207000 0x100>;
-			interrupts =3D <2 14>; /* pwa1 */
-		};
-
 		dpi: dpi@7e208000 {
 			compatible =3D "brcm,bcm2835-dpi";
 			reg =3D <0x7e208000 0x8c>;
@@ -490,14 +367,6 @@

 		};

-		thermal: thermal@7e212000 {
-			compatible =3D "brcm,bcm2835-thermal";
-			reg =3D <0x7e212000 0x8>;
-			clocks =3D <&clocks BCM2835_CLOCK_TSENS>;
-			#thermal-sensor-cells =3D <0>;
-			status =3D "disabled";
-		};
-
 		aux: aux@7e215000 {
 			compatible =3D "brcm,bcm2835-aux";
 			#clock-cells =3D <1>;
@@ -605,26 +474,6 @@
 			status =3D "disabled";
 		};

-		pixelvalve@7e807000 {
-			compatible =3D "brcm,bcm2835-pixelvalve2";
-			reg =3D <0x7e807000 0x100>;
-			interrupts =3D <2 10>; /* pixelvalve */
-		};
-
-		hdmi: hdmi@7e902000 {
-			compatible =3D "brcm,bcm2835-hdmi";
-			reg =3D <0x7e902000 0x600>,
-			      <0x7e808000 0x100>;
-			interrupts =3D <2 8>, <2 9>;
-			ddc =3D <&i2c2>;
-			clocks =3D <&clocks BCM2835_PLLH_PIX>,
-				 <&clocks BCM2835_CLOCK_HSM>;
-			clock-names =3D "pixel", "hdmi";
-			dmas =3D <&dma 17>;
-			dma-names =3D "audio-rx";
-			status =3D "disabled";
-		};
-
 		usb: usb@7e980000 {
 			compatible =3D "brcm,bcm2835-usb";
 			reg =3D <0x7e980000 0x10000>;
@@ -636,17 +485,6 @@
 			phys =3D <&usbphy>;
 			phy-names =3D "usb2-phy";
 		};
-
-		v3d: v3d@7ec00000 {
-			compatible =3D "brcm,bcm2835-v3d";
-			reg =3D <0x7ec00000 0x1000>;
-			interrupts =3D <1 10>;
-			power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
-		};
-
-		vc4: gpu {
-			compatible =3D "brcm,bcm2835-vc4";
-		};
 	};

 	clocks {
=2D-
2.7.4

