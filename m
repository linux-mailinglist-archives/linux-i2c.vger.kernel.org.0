Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E444E26C112
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgIPJur (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:50:47 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13204 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgIPJuU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61dfcf0001>; Wed, 16 Sep 2020 02:50:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 02:50:20 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:19 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfda0000>; Wed, 16 Sep 2020 02:50:19 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 4/5] arm64: tegra: Add label properties for EEPROMs
Date:   Wed, 16 Sep 2020 10:49:51 +0100
Message-ID: <20200916094952.458003-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249807; bh=TmFIrEhD/r+lnGd7gZPolkozi/diWzcIkACJ6iIO42g=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ReeME8RtZtPMumY4O4wtcUqh3pQpokCJNsp4ODkjCsosYoehsRzTKgoR1oJA41XgZ
         PDq5U5VvO4B+ZTQbTaRJMks2y11up5zn2CIFzh6TG6SkYkCxvefPjgv0ZGHL6+OPzU
         fZeBuELYpBAxeThKVHgq1b8r0FZRlb7vt/3xxwraQagR+dP2QxU3Od0w+mj3uCc3Zw
         XK1P0qMFusro2nOcHDo/eVQ+1Rh6k3QJqqsbR2jkaiwNZXsXPTLp5qQypUjhrXFjk4
         gjA99ob5JYSc2yzHMPCZ9GDJxgUnwta2+zx8bjPSUZYSldbSBTOyFqIbHpS/QX+GOd
         EvUxODu2r2oeA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Populate the label property for the AT24 EEPROMs on the various Jetson
platforms. Note that the name 'module' is used to identify the EEPROM
on the processor module board and the name 'system' is used to identify
the EEPROM on the main base board (which is sometimes referred to as
the carrier board).

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 ++
 7 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm6=
4/boot/dts/nvidia/tegra186-p2771-0000.dts
index 802b8c52489a..381a84912ba8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -222,6 +222,7 @@ eeprom@57 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x57>;
=20
+			label =3D "system";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra186-p3310.dtsi
index 53d92fdd7f06..fd9177447711 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -173,6 +173,7 @@ eeprom@50 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x50>;
=20
+			label =3D "module";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194-p2888.dtsi
index 0ea0bd83cb8e..d71b7a1140fe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -64,6 +64,7 @@ eeprom@50 {
 				compatible =3D "atmel,24c02";
 				reg =3D <0x50>;
=20
+				label =3D "module";
 				vcc-supply =3D <&vdd_1v8ls>;
 				address-width =3D <8>;
 				pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm6=
4/boot/dts/nvidia/tegra194-p2972-0000.dts
index 4d8a0e10250f..54d057beec59 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -28,6 +28,7 @@ eeprom@56 {
 				compatible =3D "atmel,24c02";
 				reg =3D <0x56>;
=20
+				label =3D "system";
 				vcc-supply =3D <&vdd_1v8ls>;
 				address-width =3D <8>;
 				pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210-p2180.dtsi
index 85ee7e6b71ac..6077d572d828 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -273,6 +273,7 @@ eeprom@50 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x50>;
=20
+			label =3D "module";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2371-2180.dts
index 56adf287a82c..4c9c2a054642 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -86,6 +86,7 @@ eeprom@57 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x57>;
=20
+			label =3D "system";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm6=
4/boot/dts/nvidia/tegra210-p3450-0000.dts
index ba892cd4b5a9..859241db4b4d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -144,6 +144,7 @@ eeprom@50 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x50>;
=20
+			label =3D "module";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
@@ -155,6 +156,7 @@ eeprom@57 {
 			compatible =3D "atmel,24c02";
 			reg =3D <0x57>;
=20
+			label =3D "system";
 			vcc-supply =3D <&vdd_1v8>;
 			address-width =3D <8>;
 			pagesize =3D <8>;
--=20
2.25.1

