Return-Path: <linux-i2c+bounces-7440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E31369A16C9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 02:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8BE1F24512
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 00:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916A524B29;
	Thu, 17 Oct 2024 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="d7wkuwBv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF2BC147
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 00:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124229; cv=none; b=nEB8eLgKwzQWkR3iyUbNF9Ja0+bprFnZjLdrRqhxmosxEgPSCaYkkj2aZjBKIhCwDwQxIhhiub0lQ0X994LdaFkiL4ANE4geikkC19JEsVFGRpqqwz7hsOg1s4XYGOYZVquk53WLs1Yx4a6Qb4Cj12fDpYdsWTMHYTzwkZ9I7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124229; c=relaxed/simple;
	bh=zA53EbyCaV87/9DN858W1pZUYkQPxez+t3fOUBfXgUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VM+IQ8ewh5dAATJkhwj/2YBC5VozLTOKN1SLu31JPkTcsV9UFJErAEcNO5FZrQOfRdPAyf6aMusGou6/9tpHf5R1lsWJCU19HqJfGCgW7mN7kV1caqrb3OHyHHkTDQ85zuHlMZgJlbJIleqr3BdfkDpALvl4qB8ECyVKxZBYw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=d7wkuwBv; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BD53C2C0692;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729124217;
	bh=QYqEGL/RJ/YRcYUJ2diph+d3ohRbz8L6XTRRO9eHTCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7wkuwBvgoBQYhe9yZR22xp8Y0PQHjeYsK/hgZQ+QP3LguEp1WYNPYHPPBIeF3xLL
	 dBEj9dFxTcsV/w9RPrpaMHz7K4xAS24C+m5qzeU5oG0wiIdcmd9sGawMobCPSWlTvi
	 jws7/dIKLuJq8S3WYp7ySISawxZRo07FEihGq0dQpHFFxv0KJl/Yfl8g6KXAZ3AAol
	 UNfFPzdh7/Sq55A/SOts3gBiBGP6Sf7pWDcYGIT86eQANoQ1WASU01U0TWCH51vjWI
	 D5gbtVRG7i3nNjugMlfqlNP9uFQwdQSZe+stmim/PEIiiHat6ceEBgLPCUwIGOnB0N
	 0fKuU7+IFFzbg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671057790005>; Thu, 17 Oct 2024 13:16:57 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3A00513EEA1;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 37CF528080C; Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de,
	markus.stockhausen@gmx.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 4/6] mips: dts: realtek: Add syscon-reboot node
Date: Thu, 17 Oct 2024 13:16:51 +1300
Message-ID: <20241017001653.178399-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
References: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67105779 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=wvvtYBgb9FI6sUgW-XsA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The board level reset on systems using the RTL9302 can be driven via the
switch. Use a syscon-reboot node to represent this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v7:
    - None
    Changes in v6:
    - Drop wildcard compatible
    Changes in v5:
    - Krzysztof did technically give a r-by on v4 but given the changes t=
o
      the rest of the series I haven't included it.
    - Use reg instead of offset
    - Add a rtl9302c.dtsi for the specific chip which pulls in the generi=
c
      rtl930x.dtsi and updates a few of the compatibles on the way throug=
h.
    - Update Cameo board to use rtl9302c.dtsi
    Changes in v4:
    - None
    Changes in v3:
    - None
    Changes in v2:
    - drop redundant status =3D "okay"

 .../dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts  |  2 +-
 arch/mips/boot/dts/realtek/rtl9302c.dtsi            |  7 +++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi             | 13 +++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi

diff --git a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dt=
s b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
index 77d2566545f2..6789bf374044 100644
--- a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
+++ b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /dts-v1/;
=20
-#include "rtl930x.dtsi"
+#include "rtl9302c.dtsi"
=20
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/mips/boot/dts/realtek/rtl9302c.dtsi b/arch/mips/boot/dt=
s/realtek/rtl9302c.dtsi
new file mode 100644
index 000000000000..ca4d347af8d3
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+#include "rtl930x.dtsi"
+
+&switch0 {
+	compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f271940f82be..7477fae34987 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -29,6 +29,19 @@ lx_clk: clock-175mhz {
 		#clock-cells =3D <0>;
 		clock-frequency  =3D <175000000>;
 	};
+
+	switch0: switch@1b000000 {
+		compatible =3D "realtek,rtl9301-switch", "syscon", "simple-mfd";
+		reg =3D <0x1b000000 0x10000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		reboot@c {
+			compatible =3D "syscon-reboot";
+			reg =3D <0x0c 0x4>;
+			value =3D <0x01>;
+		};
+	};
 };
=20
 &soc {
--=20
2.47.0


