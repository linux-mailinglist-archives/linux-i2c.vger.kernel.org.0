Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38053265070
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 22:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgIJUO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 16:14:56 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10301 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731055AbgIJO7R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 10:59:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a2ce40001>; Thu, 10 Sep 2020 06:40:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 06:43:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 10 Sep 2020 06:43:08 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 13:43:08 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 13:43:08 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.219]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5a2d6a0002>; Thu, 10 Sep 2020 06:43:08 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/5] arm64: tegra: Populate EEPROMs for Jetson Xavier NX
Date:   Thu, 10 Sep 2020 14:42:39 +0100
Message-ID: <20200910134239.192030-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134239.192030-1-jonathanh@nvidia.com>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599745252; bh=yUbtCK0PckeSjkBV0tkSuiBjwH6LDZxGlJ3jgLQJf/4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=EsqOhFI0RyLoudnJKCMysoRtwISSB5x3SrUmaCJzk171m0z3z5GV7r+Uz/ZNobu0M
         tVUIX/4LOveouGLU8dxAlrdlPm2UVJkSux6SofGS9ke27KI79W0Taf98lH4y8GPLf0
         HPr/wqddBYwS1iFjKXwkD6T1MkJ5K8HxJCosciqNrY7/7umP8STCMqZ/WJiaMV1G5U
         ub2wiEr6A3WmxcN+598qoj/z3+nacN3uVWZ7Qryj365g1+xVDx/FgdGaVgQE1caOhg
         U3CH+LTSchQ60oG2MZBq3ISNOhMClcSi+HMGrzbRfAlI3pKTyGfNFktqO4F9NfLeOF
         InCXE2dH+y8Xw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Populate the EEPROMs that are present on the Jetson Xavier NX developer
platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts    | 14 ++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi     | 16 ++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts =
b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
index c1c589805d6b..7f97b34216a0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
@@ -27,6 +27,20 @@ ddc: i2c@3190000 {
 			status =3D "okay";
 		};
=20
+		i2c@3160000 {
+			eeprom@57 {
+				compatible =3D "atmel,24c02";
+				reg =3D <0x57>;
+
+				label =3D "system";
+				vcc-supply =3D <&vdd_1v8>;
+				address-width =3D <8>;
+				pagesize =3D <8>;
+				size =3D <256>;
+				read-only;
+			};
+		};
+
 		hda@3510000 {
 			nvidia,model =3D "jetson-xavier-nx-hda";
 			status =3D "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
index 10cb836aea7e..a2893be80507 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -58,6 +58,22 @@ serial@c280000 {
 			status =3D "okay";
 		};
=20
+		i2c@3160000 {
+			status =3D "okay";
+
+			eeprom@50 {
+				compatible =3D "atmel,24c02";
+				reg =3D <0x50>;
+
+				label =3D "module";
+				vcc-supply =3D <&vdd_1v8ls>;
+				address-width =3D <8>;
+				pagesize =3D <8>;
+				size =3D <256>;
+				read-only;
+			};
+		};
+
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			status =3D "okay";
--=20
2.25.1

