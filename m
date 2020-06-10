Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F2D1F4D8C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgFJGDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:03:30 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11256 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgFJGC5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:57 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee077320000>; Tue, 09 Jun 2020 23:01:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 09 Jun 2020 23:02:54 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:53 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee0778d0000>; Tue, 09 Jun 2020 23:02:53 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 17/18] arm64: tegra: jetson-tx1: Add camera supplies
Date:   Tue, 9 Jun 2020 23:02:39 -0700
Message-ID: <1591768960-31648-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768882; bh=znV249BjYdNn7v2dlbamoh4NYD4Ln2Jw53yQHV98OCI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=U+bufTyGxeZZq+0bzplTJ2AIZQ47lCPR4aro1JIT/l3vC3/9FuW3NZmP4kNnFGJ8N
         h++CmUN6qMesNXfxY24aFmDVMLVvYk2YlenD/6KcNBXhtWUbA7yL0XNfiRqsjNqiM3
         dRTVLciclWXclOzdO2Vcal++QSLAMLK2izQ96fVM7lsgWpoztnTk7WA4w3lSsSktf9
         Asd0cRJIYtDkSTAfPx9zlJVkadeaJYz/iuiKnw5dgcAmL/Tas/6CBLorUrNfDaX017
         DMosSZd2psfQxVMSVTp7qoXQREDxBqgWg2en83ocE/X1KPCNAfMFjs3FR/IkCJjduw
         FXnSzBV5HlWBw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jetson TX1 development board has a camera expansion connector which
has 2V8, 1V8 and 1V2 supplies to power up the camera sensor on the
supported camera modules.

Camera module designed as per Jetson TX1 camera expansion connector
may use these supplies for camera sensor avdd 2V8, digital core 1V8,
and digital interface 1V2 voltages.

These supplies are from fixed regulators on TX1 carrier board with
enable control signals from I2C GPIO expanders.

This patch adds these camera supplies to Jetson TX1 device tree to
allow using these when a camera module is used.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b57d837..5e24d7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1323,6 +1323,14 @@
 			#gpio-cells = <2>;
 			gpio-controller;
 		};
+
+		exp2: gpio@77 {
+			compatible = "ti,tca9539";
+			reg = <0x77>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
 	};
 
 	/* HDMI DDC */
@@ -1667,6 +1675,39 @@
 			enable-active-high;
 			vin-supply = <&vdd_5v0_sys>;
 		};
+
+		vdd_cam_1v2: regulator@12 {
+			compatible = "regulator-fixed";
+			reg = <12>;
+			regulator-name = "vdd-cam-1v2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&exp2 10 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+
+		vdd_cam_2v8: regulator@13 {
+			compatible = "regulator-fixed";
+			reg = <13>;
+			regulator-name = "vdd-cam-2v8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&exp1 13 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+
+		vdd_cam_1v8: regulator@14 {
+			compatible = "regulator-fixed";
+			reg = <14>;
+			regulator-name = "vdd-cam-1v8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&exp2 9 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
 	};
 
 	gpio-keys {
-- 
2.7.4

