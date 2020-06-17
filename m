Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334C21FC38A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFQBkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:40:10 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13831 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgFQBjs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:48 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee974570000>; Tue, 16 Jun 2020 18:39:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jun 2020 18:39:48 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:48 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:47 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee974620000>; Tue, 16 Jun 2020 18:39:47 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 17/18] arm64: tegra: jetson-tx1: Add camera supplies
Date:   Tue, 16 Jun 2020 18:41:33 -0700
Message-ID: <1592358094-23459-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357975; bh=znV249BjYdNn7v2dlbamoh4NYD4Ln2Jw53yQHV98OCI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=B78BNEdEhma+JJIXI1olkcFc5mO1WRnqG7fcCWN2YbJCxK+Q7zDYnaWlDFW0PqSjb
         iqZvTdk3PkZMeP1lLGMvulzbYeYZMxw/zk0bKY94tJ9tcJkADhJglxxHIlMvH2f+Mr
         GQcWR+Ujrl04AvF+wFew4Fzbl2KQkQvBZHDfzevhcCGNp+L4LC3p7Zgc2vWgDKs/bR
         1oTm5oOmpBV4Qr84uXvlumaIvt39P2E/kxS32JaMM7e86g90FR51KmduzLP+62XrU0
         6TvLs/cbB7bZfDndjDDSqg2lGcc5jCpfdz8Ur50xw+96XVhTCPCSqAW8KkocdsrEIU
         2SYrOpkw9b+IA==
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

