Return-Path: <linux-i2c+bounces-7696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 718489B8413
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 21:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C88D1F21C46
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDB71E0E03;
	Thu, 31 Oct 2024 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="epMHaxxp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB61CDA05
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405049; cv=none; b=KJT4spmowjz5HUu6GkGDn9FOUrrYrVhr9cKNrTKlwEU9mqam5JI/kj6umRI6I8w7QgVhNaX3rsBehPNWrFz5aQKd1TxNSD5LJmoo/Y4Ye02f4MHyVyww30Uza4Br+RZUqPANKmekuXMkLC5QziDXKuG7oHgKKlTX7uToYd+5F54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405049; c=relaxed/simple;
	bh=tEsDZKWfEUfZ78RvVil889R0Lk5j2J1AZL95rnpcNf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUktgNIFeTBaTKA4aXwL2lRYIIFK/4aPEWKu2CP4uB3Xl4pW+RUABLPON/PxEnOg5oTpYUHoh8bE544JfRgF8stY9VZDNIsx3+tEsZGtnJ8VGJGh0pNnuAhqVu/6vjdmouaEDXLo9idjDbjLTOPVwWQEk2TdHGbyFlfd4JvQrgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=epMHaxxp; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A6E9C2C074C;
	Fri,  1 Nov 2024 09:03:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730405033;
	bh=YBKOaHo4KlgAZWy8040cNm6UG4xiGZDQ94AljVLKNzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epMHaxxp3BAgAo5+uAYZBlczR7vaVBp1ELEDCR07hJ+ZhEyqfDGQGQZCnv7qmDsYh
	 Q3YNN9ipeOcyyYHRvZql+aOYRbZ10XoNX37uSMxLrbVz3aq6cLkfe5okRBxjn3O4rc
	 xPlQSBhf52OfXHgtplF01odfUxnpPbnGbESwzIk0+iN/0IHWuT0BafPb0BTdUE8AbO
	 qdLYUe2zqZnaI2Bm0LXYIExR6ymj5LxLabVloDO3+Hkw3iBQamHLjeAgACO7guTrd9
	 WxCe0+iakhhJoDs2rka4K0x0lxwGQeyzD6ZPnNLiE6AgCrSyjb9KKBZVHtOBijH+ja
	 IlrcU362JMsfw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6723e2a80005>; Fri, 01 Nov 2024 09:03:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E353B13EE6D;
	Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id DFC29280964; Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
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
Subject: [PATCH v8 5/7] mips: dts: realtek: Add syscon-reboot node
Date: Fri,  1 Nov 2024 09:03:48 +1300
Message-ID: <20241031200350.274945-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6723e2a8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=wvvtYBgb9FI6sUgW-XsA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The board level reset on systems using the RTL9302 can be driven via the
switch. Use a syscon-reboot node to represent this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v8:
    - None
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


