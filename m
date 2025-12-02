Return-Path: <linux-i2c+bounces-14355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822EC9A0A9
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 05:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C742034656E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 04:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A4D2F746A;
	Tue,  2 Dec 2025 04:57:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA692F6193;
	Tue,  2 Dec 2025 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651473; cv=none; b=ZRRDLjYtd3pg54mpSrpl+dkDIw3nSHXilLmatfEda5SWMOE6zckPkG05KDXeN5SrJXwzej2uMGjgfj76ZdcPHfMYc8Sj7nKJjlZr1j7w1cwky5bw7LHbaD/XdWaM8YMADiETqm61RZNUrIILQBhQMSrXFxoViO4qk4MxWkT33EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651473; c=relaxed/simple;
	bh=3gJx3AhjLbLSc9eyOBa9zSe8FYvXzVGl+bX5klhjaKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6WyQtojNE4hkyUw+sNdTNZDyvr3iopZQjj2EV1DxVrplGFUCktF8ereq1TQrk96H36Owr2qSgay6MVqEAyOkSIVxfuPQsKyowghSen95AnaDg+JTMyCnIufIqXdfQaf/AaAL23H0sF7AtlQDq1+t67hQcxyJpucZynNj2RRD8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B24uxmJ007827;
	Tue, 2 Dec 2025 13:57:03 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add EEPROMs for Radxa boards
Date: Tue,  2 Dec 2025 04:56:55 +0000
Message-ID: <20251202045655.154543-5-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202045655.154543-1-naoki@radxa.com>
References: <20251202045655.154543-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BL24C16A EEPROM is found in the schematics for Radxa CM3I, Radxa
ROCK 3A, 3B, 5B+, and 5T. [1] [2] [3] [4] [5]

The BL24C16F EEPROM is found in the schematic for Radxa ROCK 4D. [6]

Add these eeprom nodes.

These are designed to have data written during factory programming
(regardless of whether data is actually written or not), and we at
Radxa permit users to read the data but not write to it. [8]
Therefore, we will add a read-only property to the eeprom node.

[1] https://dl.radxa.com/cm3i/docs/hw/radxa_cm3i_v1310_schematic.pdf p.8
[2] https://dl.radxa.com/rock3/docs/hw/3a/radxa_rock_3a_v1310_schematic.pdf p.7
[3] https://dl.radxa.com/rock3/docs/hw/3b/Radxa_ROCK_3B_V1.51_SCH.pdf p.35
[4] https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf p.29
[5] https://dl.radxa.com/rock5/5t/docs/hw/radxa_rock5t_schematic_v1.2_20250109.pdf p.36
[6] https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.12.pdf p.23
[7] https://github.com/radxa/u-boot/blob/next-dev-v2024.10/drivers/misc/radxa-i2c-eeprom.c

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 14 ++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 10 ++++++++++
 6 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
index 729e38b9f620..f97a0eb7f7c0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi
@@ -321,7 +321,7 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3: SWITCH_REG1 {
+			gpio_vref: vcc_3v3: SWITCH_REG1 {
 				regulator-name = "vcc_3v3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -340,6 +340,14 @@ regulator-state-mem {
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&gpio_vref>;
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
index 44cfdfeed668..9214e38648f2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts
@@ -532,6 +532,14 @@ regulator-state-mem {
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc3v3_pmu>;
+	};
 };
 
 &i2c3 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfaa79..69001e453732 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -480,6 +480,14 @@ regulator-state-mem {
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc3v3_sys>;
+	};
 };
 
 &i2c5 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 7023dc326d0e..899a84b1fbf9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -682,6 +682,20 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6m3_xfer>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v3_s3>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
index 07a840d9b385..30d15c7e860a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
@@ -69,6 +69,16 @@ wwan-wake-n-hog {
 	};
 };
 
+&i2c1 {
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v3_s3>;
+	};
+};
+
 &pcie30phy {
 	data-lanes = <1 1 2 2>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 0dd90c744380..425036146b6d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -60,6 +60,16 @@ &hdmi_receiver {
 	status = "okay";
 };
 
+&i2c1 {
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v3_s3>;
+	};
+};
+
 &pcie2x1l1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
-- 
2.43.0


