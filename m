Return-Path: <linux-i2c+bounces-3639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2B8CC718
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9CFE283C83
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3999F14A629;
	Wed, 22 May 2024 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hAeSDr1d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1F1487EB;
	Wed, 22 May 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406009; cv=none; b=Bgl2b3uTfJRGYTkPmsJrKRQh0Jwk3hPFAdDozzk2btY7dNASp0sl3zfCMk+y0cez2A37kYN2D7M6R3rqbGCk/4tCwdyWgEhDaYOTMMkdZfysR7dBmRJ2OxObgjfAxR6eLP/8KV6DD4GdMJbbtAsqonTWP5uJKF83PGy7f/xsYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406009; c=relaxed/simple;
	bh=MGxeuPRO/OJgl+CAX+7C3uuaeQcwOBeZ4Ge6GnOWTYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g335VUc5HO6g11H2qpqT/gy3auYd+qOpoAnmut5+ZfRIDEufQpokKQEOkhArLq2q1bQDeC6ohY235InMR0XyDwOiKxb4yXe+MmdurC8RAyZdAQTz3x0Oy1Cpn+5ijTj2oHoZ7KImH5wh8v+lvlfGujQgq5skxgXckRiZg02WytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hAeSDr1d; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJL6O5009061;
	Wed, 22 May 2024 19:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HfOVDIOpIP7luJ7in3N4eAJsiPCtNKTM8xu0FI1LPB0=;
 b=hAeSDr1dUwsh/Mm7yAhWCJU+CdxXOjDPbwwI+y9oweDcBGwavAX7rbGh7ND1zhiw792k
 zwxmSMXfMAZQF8K1V2VKVoJ+g1vE2YXeZYF7O3gNDWIFplxUaAFoy1YCgyLiOP8VVl+k
 ReGV1sBujut8ktH500mcFV2ZbOhbN4E4hTawqg2Xey2q7Cb5zSXF8R3i/+yTjnxJCbfD
 5qjZVwubrMiQLMpJ1ErvGty2ZRF5+5RpTmw+u1jsyoZf1aTmBs5zuMtpVw7kMmxs1QWf
 eJ61hItW7DsirIwxhq+Ol4/qBufCOGj8dBp0dT3ss76+D7XYdQoStLVXwbjwlZc0IdPm Hg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9mrx09k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGxqI8023460;
	Wed, 22 May 2024 19:25:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npdqqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:33 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPUpn44892450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:32 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49C1158058;
	Wed, 22 May 2024 19:25:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEA3258067;
	Wed, 22 May 2024 19:25:29 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 14/20] ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
Date: Wed, 22 May 2024 14:25:18 -0500
Message-Id: <20240522192524.3286237-15-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4p5Nkchy4jcnKqqg0wB7EWOP1zZiE5NN
X-Proofpoint-ORIG-GUID: 4p5Nkchy4jcnKqqg0wB7EWOP1zZiE5NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Add the device tree for the new BMC system. The Blueridge is a
P11 system with four processors.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v5:
 - Change model from "Blueridge" to "Blueridge 2U"

 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1691 +++++++++++++++++
 2 files changed, 1692 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index e51c6d2037255..f3db9ee156429 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-facebook-yosemite4.dtb \
+	aspeed-bmc-ibm-blueridge.dtb \
 	aspeed-bmc-ibm-bonnell.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
new file mode 100644
index 0000000000000..a170b4b7c0fb7
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
@@ -0,0 +1,1691 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 IBM Corp.
+/dts-v1/;
+
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include "aspeed-g6.dtsi"
+#include "ibm-power11-quad.dtsi"
+
+/ {
+	model = "Blueridge 2U";
+	compatible = "ibm,blueridge-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+		i2c16 = &i2c2mux0;
+		i2c17 = &i2c2mux1;
+		i2c18 = &i2c2mux2;
+		i2c19 = &i2c2mux3;
+		i2c20 = &i2c4mux0chn0;
+		i2c21 = &i2c4mux0chn1;
+		i2c22 = &i2c4mux0chn2;
+		i2c23 = &i2c5mux0chn0;
+		i2c24 = &i2c5mux0chn1;
+		i2c25 = &i2c6mux0chn0;
+		i2c26 = &i2c6mux0chn1;
+		i2c27 = &i2c6mux0chn2;
+		i2c28 = &i2c6mux0chn3;
+		i2c29 = &i2c11mux0chn0;
+		i2c30 = &i2c11mux0chn1;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		event_log: region@b3d00000 {
+			reg = <0xb3d00000 0x100000>;
+			no-map;
+		};
+
+		ramoops@b3e00000 {
+			compatible = "ramoops";
+			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x8000>;
+			pmsg-size = <0x8000>;
+			max-reason = <3>; /* KMSG_DUMP_EMERG */
+		};
+
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b4000000 {
+			reg = <0xb4000000 0x04000000>; /* 64M */
+			no-map;
+		};
+
+		/* VGA region is dictated by hardware strapping */
+		vga_memory: region@bf000000 {
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+			no-map;
+		};
+	};
+
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c2>;
+		idle-state = <0>;
+		mux-gpios = <&gpio0 ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>,
+			    <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
+
+		i2c2mux0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2mux1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2mux2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2mux3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* BMC Card fault LED at the back */
+		led-bmc-ingraham0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure ID LED at the back */
+		led-rear-enc-id0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure fault LED at the back */
+		led-rear-enc-fault0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		/* PCIE slot power LED */
+		led-pcieslot-power {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <1000>;
+
+		event-fan0-presence {
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			label = "fan0-presence";
+			linux,code = <6>;
+		};
+
+		event-fan1-presence {
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			label = "fan1-presence";
+			linux,code = <7>;
+		};
+
+		event-fan2-presence {
+			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
+			label = "fan2-presence";
+			linux,code = <8>;
+		};
+
+		event-fan3-presence {
+			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
+			label = "fan3-presence";
+			linux,code = <9>;
+		};
+
+		event-fan4-presence {
+			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
+			label = "fan4-presence";
+			linux,code = <10>;
+		};
+
+		event-fan5-presence {
+			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
+			label = "fan5-presence";
+			linux,code = <11>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc1 7>;
+	};
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"bmc-management-ready","","","","","","checkstop","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","",
+			"factory-reset-toggle","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","usb-power","","","","",
+	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
+	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","",
+			"",
+	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
+			"power-ffs-sync-history","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+
+	i2c3-mux-oe-n-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
+		line-name = "I2C3_MUX_OE_N";
+		output-high;
+	};
+
+	usb-power-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&pinctrl_emmc_default {
+	bias-disable;
+};
+
+&emmc {
+	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
+};
+
+&ibt {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	gpio@20 {
+		compatible = "ti,tca9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "",
+			"RUSSEL_FW_I2C_ENABLE_N",
+			"RUSSEL_OPPANEL_PRESENCE_N",
+			"BLYTH_OPPANEL_PRESENCE_N",
+			"CPU_TPM_CARD_PRESENT_N",
+			"DASD_BP2_PRESENT_N",
+			"DASD_BP1_PRESENT_N",
+			"DASD_BP0_PRESENT_N";
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	power-supply@68 {
+		compatible = "ibm,cffps";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps";
+		reg = <0x69>;
+	};
+
+	led-controller@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"SLOT0_PRSNT_EN_RSVD", "SLOT1_PRSNT_EN_RSVD",
+			"SLOT2_PRSNT_EN_RSVD", "SLOT3_PRSNT_EN_RSVD",
+			"SLOT4_PRSNT_EN_RSVD", "SLOT0_EXPANDER_PRSNT_N",
+			"SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
+			"SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
+			"", "", "", "", "", "";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+	temperature-sensor@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+
+			led-controller@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					reg = <0>;
+					default-state = "keep";
+					label = "cablecard0-cxp-top";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					reg = <1>;
+					default-state = "keep";
+					label = "cablecard0-cxp-bot";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0chn0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+
+			led-controller@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					reg = <0>;
+					default-state = "keep";
+					label = "cablecard3-cxp-top";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					reg = <1>;
+					default-state = "keep";
+					label = "cablecard3-cxp-bot";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
+		};
+
+		i2c5mux0chn1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+
+			led-controller@61 {
+				compatible = "nxp,pca9551";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					reg = <0>;
+					default-state = "keep";
+					label = "cablecard4-cxp-top";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					reg = <1>;
+					default-state = "keep";
+					label = "cablecard4-cxp-bot";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp275";
+		reg = <0x4b>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c7 {
+	multi-master;
+	status = "okay";
+
+	led-controller@30 {
+		compatible = "ibm,pca9552";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "pcieslot0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "pcieslot1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "pcieslot2";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "pcieslot3";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "pcieslot4";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "cpu1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "cpu-vrm1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			reg = <8>;
+			default-state = "keep";
+			label = "lcd-russel";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	led-controller@31 {
+		compatible = "ibm,pca9552";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "ddimm0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "ddimm1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "ddimm2";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "ddimm3";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "ddimm4";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "ddimm5";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "ddimm6";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "ddimm7";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			reg = <8>;
+			default-state = "keep";
+			label = "ddimm8";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			reg = <9>;
+			default-state = "keep";
+			label = "ddimm9";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			reg = <10>;
+			default-state = "keep";
+			label = "ddimm10";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			reg = <11>;
+			default-state = "keep";
+			label = "ddimm11";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			reg = <12>;
+			default-state = "keep";
+			label = "ddimm12";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			default-state = "keep";
+			label = "ddimm13";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			reg = <14>;
+			default-state = "keep";
+			label = "ddimm14";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			reg = <15>;
+			default-state = "keep";
+			label = "ddimm15";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	led-controller@32 {
+		compatible = "ibm,pca9552";
+		reg = <0x32>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "ddimm16";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "ddimm17";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "ddimm18";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "ddimm19";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "ddimm20";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "ddimm21";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "ddimm22";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "ddimm23";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			reg = <8>;
+			default-state = "keep";
+			label = "ddimm24";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			reg = <9>;
+			default-state = "keep";
+			label = "ddimm25";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			reg = <10>;
+			default-state = "keep";
+			label = "ddimm26";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			reg = <11>;
+			default-state = "keep";
+			label = "ddimm27";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			reg = <12>;
+			default-state = "keep";
+			label = "ddimm28";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			default-state = "keep";
+			label = "ddimm29";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			reg = <14>;
+			default-state = "keep";
+			label = "ddimm30";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			reg = <15>;
+			default-state = "keep";
+			label = "ddimm31";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	led-controller@33 {
+		compatible = "ibm,pca9552";
+		reg = <0x33>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "planar";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "cpu0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "dasd-pyramid0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "dasd-pyramid1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "dasd-pyramid2";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "cpu0-vrm0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "rtc-battery";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			reg = <8>;
+			default-state = "keep";
+			label = "base-blyth";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			reg = <9>;
+			default-state = "keep";
+			label = "pcieslot6";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			reg = <10>;
+			default-state = "keep";
+			label = "pcieslot7";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			reg = <11>;
+			default-state = "keep";
+			label = "pcieslot8";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			reg = <12>;
+			default-state = "keep";
+			label = "pcieslot9";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			default-state = "keep";
+			label = "pcieslot10";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			reg = <14>;
+			default-state = "keep";
+			label = "pcieslot11";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			reg = <15>;
+			default-state = "keep";
+			label = "tpm-wilson";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	humidity-sensor@40 {
+		compatible = "silabs,si7020";
+		reg = <0x40>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	pwm@52 {
+		compatible = "maxim,max31785a";
+		reg = <0x52>;
+	};
+
+	led-controller@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "front-sys-id0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "front-check-log0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "front-enc-fault1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "front-sys-pwron0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	pca0: led-controller@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "fan0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "fan1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "fan2";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "fan3";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "fan4";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "fan5";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	lcd-controller@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	pressure-sensor@76 {
+		compatible = "infineon,dps310";
+		reg = <0x76>;
+		#io-channel-cells = <0>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	pmic@11 {
+		compatible = "ti,ucd90320";
+		reg = <0x11>;
+	};
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"", "", "", "", "", "", "", "",
+			"", "", "", "", "", "", "power-config-full-load", "";
+	};
+
+	led-controller@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
+			"SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
+			"SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
+			"SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
+			"SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
+			"SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
+			"", "", "", "";
+	};
+
+};
+
+&i2c9 {
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	temperature-sensor@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	temperature-sensor@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+
+			led-controller@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					reg = <0>;
+					default-state = "keep";
+					label = "cablecard10-cxp-top";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					reg = <1>;
+					default-state = "keep";
+					label = "cablecard10-cxp-bot";
+					retain-state-shutdown;
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c12 {
+	status = "okay";
+
+	tpm@2e {
+		compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		memory-region = <&event_log>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "nvme0";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "nvme1";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "nvme2";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "nvme3";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "nvme4";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "nvme5";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "nvme6";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "nvme7";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+};
+
+&i2c14 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "nvme8";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "nvme9";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "nvme10";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "nvme11";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "nvme12";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "nvme13";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "nvme14";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "nvme15";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+};
+
+&i2c15 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			reg = <0>;
+			default-state = "keep";
+			label = "nvme16";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			default-state = "keep";
+			label = "nvme17";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			default-state = "keep";
+			label = "nvme18";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			reg = <3>;
+			default-state = "keep";
+			label = "nvme19";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			default-state = "keep";
+			label = "nvme20";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			reg = <5>;
+			default-state = "keep";
+			label = "nvme21";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			reg = <6>;
+			default-state = "keep";
+			label = "nvme22";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			reg = <7>;
+			default-state = "keep";
+			label = "nvme23";
+			retain-state-shutdown;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&vuart1 {
+	status = "okay";
+};
+
+&vuart2 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
+		 <&syscon ASPEED_CLK_MAC4RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.39.3


