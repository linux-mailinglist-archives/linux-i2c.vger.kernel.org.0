Return-Path: <linux-i2c+bounces-6999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892EB9868DD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 00:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0956E1F253DE
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B381816C6B7;
	Wed, 25 Sep 2024 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ctgJpC6M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6015886D
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301612; cv=none; b=IOsGB3iytQ6TzEN7/E7Sltmdct2rqk72C4tsYzVXXGbEG5oj7MxidTkApMMj0b3a/P3lqsB6QAQAW4PbgFaB/ah0PvsYuC1UuWMVmMWeYflg+oMVLShbDoTNnkYRwBj6eaN2bmwgKRtXpVN4QwvzEDTcTJuH9D41Bp2IXxvetYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301612; c=relaxed/simple;
	bh=F2P+ohYGp93QxNyi2S7crC8h83jU2nxmGlbtFFBqFmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5NEboKDLkYDVxuqxqPRR1hXi9+UJLqumNNt5nNiv6+PoZRWCAYk5rgZ9JeJm1fO2nAbTeQ72kE3hH2neZgz2nPgFWcsYBPYpbGySNzs5YyGZ4T88vycPfge7ZY+pG0qCO2kPUAN3Ni9ROz+TUk+U0bNvnL8CNzFTmZwLgz2vms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ctgJpC6M; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 985832C0362;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727301602;
	bh=eCWCvALzZIe/c7GsZzUhAGEnwDZr6bpNwKlvZjiQP4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ctgJpC6MY1337YU9gTsDS2SaLp+YB5hrxNlFUurq7iEgVBvT+ZzMovo6Qm4gCztC7
	 Sr62aFX/jZK85cW5p6PpeRZBCBmE8Kjt8B5eoy6N6hxD2l6+r1MSzU54KonNXWwuce
	 BzvS/eqTw9il4Zm0x9PeST7ZTpGxHJyJRUy9BORPIv4af/snq4JFqzC+WCzMVSP1Rf
	 6tEjOvgdqyJkjwbZtyKdVl+OWRD/CtOLnqoJf4DzNWVH/Fbdz8K9q4oHIfNcXbz7fT
	 xjMeBn9IpWjdNEqSln4Wyrj9Gc7U5QVbbY/QnI3d+PVtzzQVIexu8XSoHB9AfN529f
	 0snCqaQFw3AiA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f487e20004>; Thu, 26 Sep 2024 10:00:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 170FA13EE36;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1569C280532; Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 4/6] mips: dts: realtek: Add syscon-reboot node
Date: Thu, 26 Sep 2024 09:58:45 +1200
Message-ID: <20240925215847.3594898-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f487e2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=wvvtYBgb9FI6sUgW-XsA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The board level reset on systems using the RTL9302 can be driven via the
switch. Use a syscon-reboot node to represent this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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
index 000000000000..80d9f407e758
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+#include "rtl930x.dtsi"
+
+&switch0 {
+	compatible =3D "realtek,rtl9302c-switch", "realtek,rtl9300-switch", "sy=
scon", "simple-mfd";
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f271940f82be..89b8854596cd 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -29,6 +29,19 @@ lx_clk: clock-175mhz {
 		#clock-cells =3D <0>;
 		clock-frequency  =3D <175000000>;
 	};
+
+	switch0: switch@1b000000 {
+		compatible =3D "realtek,rtl9300-switch", "syscon", "simple-mfd";
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
2.46.2


