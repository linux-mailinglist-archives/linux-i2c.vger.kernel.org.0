Return-Path: <linux-i2c+bounces-14368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13BC9AC19
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 271E134685E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14623074BA;
	Tue,  2 Dec 2025 08:50:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E526D4DE;
	Tue,  2 Dec 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665419; cv=none; b=uYMvxJPVOqXYygvclAoYmcaCQlX64F0agrlrW+LDDu2PLzNPpHiERdXOYvXURmNqlnJf+LBWG+vMPZ4aM7rFm2KyOCj1TejNCfllpyvO32C0oEuznCobualhXwnZDNjoz40jyepaEEFDlrd3AfOkZhWFwIX4zoxNqLqn7EgA5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665419; c=relaxed/simple;
	bh=4z7lNTUvlnxI7Ski28jxzKEnAdfDpugJWdI5DtPveaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRFdHOvWeyZBolBghckkl8TijzE+B9ilNinqe4Z34/GrdefPc0ZSQSPTYpkg/Xc6eidjD4P3SQZfwWf4UJHO3n2NU2J6rpashGjXnGC1cyeFtCDDr+W/ampTbYXlqaD60xntU6KvbwM6ycXaTSOqSg3EYuUsWEq+1p6l/MdSCNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B28noM5008635;
	Tue, 2 Dec 2025 17:49:52 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [RESEND PATCH 2/3] arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
Date: Tue,  2 Dec 2025 08:49:40 +0000
Message-ID: <20251202084941.1785-3-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202084941.1785-1-naoki@radxa.com>
References: <20251202084941.1785-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BL24C04A EEPROM is found in the schematics for Radxa ROCK Pi 4A+
and 4B+. [1] [2]

The BL24C16A EEPROM is found in the schematics for Radxa ROCK 4C+, 4SE,
Radxa ROCK Pi 4A, 4B, and 4C. [3] [4] [5] [6] [7]

However, newer boards/batches should have the BL24C16A, but older ones
may have the BL24C04A. (the ROCK Pi 4B+ I own has a 16Kb EEPROM)

For the ROCK Pi 4s (except the relatively new ROCK 4SE), add the
BL24C04A eeprom node for backward compatibility.
For the ROCK 4SE, add the BL24C16A eeprom node.

These are designed to have data written during factory programming
(regardless of whether data is actually written or not), and we at
Radxa permit users to read the data but not write to it. [8]
Therefore, we will add a read-only property to the eeprom node.

[1] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4ap/radxa_rock_4ap_v1730_schematic.pdf p.17
[2] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4bp/radxa_rock_4bp_v1730_schematic.pdf p.17
[3] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/ROCK-4C+-V1.411-SCH.pdf p.22
[4] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/ROCK-4-SE-V1.53-SCH.pdf p.17
[5] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4a/ROCK_4A_V1.52_SCH.pdf p.17
[6] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4b/ROCK_4B_v1.52_SCH.pdf p.17
[7] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/rockpi4c_v12_sch_20200620.pdf p.17
[8] https://github.com/radxa/u-boot/blob/next-dev-v2024.10/drivers/misc/radxa-i2c-eeprom.c

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts     | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi   |  8 ++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index 74160cf89188..f95fd92d58ba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -453,6 +453,14 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	eeprom@50 {
+		compatible = "belling,bl24c04a", "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v0_s0>;
+	};
 };
 
 &i2c3 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts
index a8b8d4acc337..c0b931b3c640 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts
@@ -8,6 +8,8 @@
 #include "rk3399-t.dtsi"
 #include "rk3399-rock-pi-4.dtsi"
 
+/delete-node/ &eeprom;
+
 / {
 	model = "Radxa ROCK 4SE";
 	compatible = "radxa,rock-4se", "rockchip,rk3399";
@@ -17,6 +19,16 @@ aliases {
 	};
 };
 
+&i2c0 {
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v0>;
+	};
+};
+
 &sdio0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 046dbe329017..a8ab043e4062 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -456,6 +456,14 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	eeprom: eeprom@50 {
+		compatible = "belling,bl24c04a", "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v0>;
+	};
 };
 
 &i2c1 {
-- 
2.43.0


