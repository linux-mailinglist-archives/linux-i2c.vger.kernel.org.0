Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1661F265157
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 22:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgIJUwm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 16:52:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10168 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730500AbgIJO6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 10:58:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a2ce20002>; Thu, 10 Sep 2020 06:40:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 06:43:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 10 Sep 2020 06:43:06 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 13:43:06 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 13:43:06 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.219]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5a2d680002>; Thu, 10 Sep 2020 06:43:05 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/5] arm64: tegra: Add label properties for EEPROMs
Date:   Thu, 10 Sep 2020 14:42:38 +0100
Message-ID: <20200910134239.192030-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134239.192030-1-jonathanh@nvidia.com>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599745250; bh=TmFIrEhD/r+lnGd7gZPolkozi/diWzcIkACJ6iIO42g=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=LFm5fyixUUN/5Lc9Ix7kMM8WLtunmR3y7Evl9sIaanXTMG3BdpbjcNHSjcErRZ1az
         YDGY5MjLo83dn+VX5N6nTwgPi43Ve3eIySDAZVFbgxU+9RU8YbKwA9EvUKIv8vIFu+
         doMQVWIYEiMDnmoFonAOIVWNyMPfdnabXg2SXrHMlYVl+4mNs6sh3dLmPnEwXWwc6L
         khHDW3rMKDI/oSy6ulYe09vBrQMM3zKJ8GeH+/sDmsFnUzt13Etv1BPVBR5b6+79uG
         K1yBsgISr9sJs2zIlOb2W0UvQKvCQ0mVriLi/oSxzJyPx6d4hiaHSVodAZDhGpP9tR
         Q78o4RMqMeRnA==
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

