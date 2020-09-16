Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E767926C10C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIPJu3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:50:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13210 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgIPJuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:23 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61dfd20000>; Wed, 16 Sep 2020 02:50:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 16 Sep 2020 02:50:23 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:22 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:22 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfdc0000>; Wed, 16 Sep 2020 02:50:22 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 5/5] arm64: tegra: Populate EEPROMs for Jetson Xavier NX
Date:   Wed, 16 Sep 2020 10:49:52 +0100
Message-ID: <20200916094952.458003-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249810; bh=yUbtCK0PckeSjkBV0tkSuiBjwH6LDZxGlJ3jgLQJf/4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ifJYXSqOFu/vd0NYGRn7reC4OS/5vHtLcOqNPdaj/3uTGR6PvEHEmLvVcvH50WAae
         191urDggHofrNN1IJHAeZuILwY869lQv1an/P2Ksj8eHcxIiPWYO2FCc/iU7j7H/Ij
         ZNSDb/R2yoMlEnp6C0EfxJWTy/+O16Zqu9W/uo0tz+SKbSgG/aC5rOH+JxWZrgRseJ
         fC99Fd1pv9Th36heHiF8Ot5VraOSQTuABdd0KEcUuTttH5d0Vzfg6IcrNB7fmyy0mh
         nG99qj8dnCyjJLCZ0V96+nEfcibyxH/uw5YcRY9uwfWiXbJEWGUsUGxGK7pLM6YLbe
         oRYh3pMDQeMSQ==
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

