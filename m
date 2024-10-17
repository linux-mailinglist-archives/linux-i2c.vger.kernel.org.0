Return-Path: <linux-i2c+bounces-7442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350F9A16D1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 02:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF7F286AE6
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 00:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B6638F82;
	Thu, 17 Oct 2024 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="QOUAymL/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DE22209D
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124231; cv=none; b=punchB37YVtDu6P4pf/96oO5cqJrtH2LQfNyetcZXeOd4o3LQxuC9rbxbP7ktbGln/h0LQF8+UgtFYW4IiYvREQf8gL0MBNxrvipDiRencDDRLGkXW+EeGtXyutHZ6+7NUkJnM8yCxqWcPy87C8DSRuLtlki3mb+aKS/N5w11lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124231; c=relaxed/simple;
	bh=2p4SvagUJjaIC6BqlFtNcv0B+9ZoFZD04gn4aOjZGlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELpSk2swCPmTPlmKbRQZ+4KJvyx8n2jkJ+HIt8bWWdKibxn3aJrSVNq2o5D9tiYGp/al8K9W4mx297rlIja7cPBIGzNUomD2dBaP4hfRRf7gOWdNf7C3uJ86sOYfOcsvBN+/OCLS+WaDCn0NXJbynTeWIeXd2tIV9Juy7U4RFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=QOUAymL/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D04702C06BA;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729124217;
	bh=iHBgkodCxPnlX1/1dbU10RYNK2XUDjjwkvMMkLnVzCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOUAymL/hZIfOVUEklWumCoXBfLVdBsLoHUq2vVAX04nCBYcRMbSdqF5atibgzgD0
	 FYkcDonEpqdF5Q/eOkL1aPXsLjdWe1tf0EGW8bRA+Hy+s3LtqhgrjpEVPpSM0gSg8N
	 oBlGQzW57jZbo4bHe9MpJnZm+sSuHy40K2pEaEqXh513jOjVqWzCTsJ1p17ebaz9LM
	 BQsXfkuN2ZI6GavO97LvhBlGih/hBxFB3HfDaulY/Xd/LzpQ5kAkR1LlYhcl7BXr4k
	 560+d3FeEjl6fEe60nYYC5/kHi9fHPDbb2wCrOJ552JnezziYa9Ekro3M1cY8x+BzJ
	 sdc3X1e+Ol4KQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671057790004>; Thu, 17 Oct 2024 13:16:57 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3D65813EE32;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3C35A2807F7; Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
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
Subject: [PATCH v7 5/6] mips: dts: realtek: Add I2C controllers
Date: Thu, 17 Oct 2024 13:16:52 +1300
Message-ID: <20241017001653.178399-6-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67105779 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=PxnkKiIr6rJD_3uwCWUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v7:
    - None
    Changes in v6:
    - Drop wildcard compatible
    - Put status =3D "disabled" at the end
    Changes in v5:
    - Update compatibles
    Changes in v4:
    - Skipped due to combining patch series
    Changes in v3:
    - None
    Changes in v2:
    - Use reg property

 arch/mips/boot/dts/realtek/rtl9302c.dtsi |  8 ++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi  | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl9302c.dtsi b/arch/mips/boot/dt=
s/realtek/rtl9302c.dtsi
index ca4d347af8d3..8690433af498 100644
--- a/arch/mips/boot/dts/realtek/rtl9302c.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
@@ -5,3 +5,11 @@
 &switch0 {
 	compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
 };
+
+&i2c0 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9301-i2c";
+};
+
+&i2c1 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9301-i2c";
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 7477fae34987..6a6f3f3fe389 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -41,6 +41,22 @@ reboot@c {
 			reg =3D <0x0c 0x4>;
 			value =3D <0x01>;
 		};
+
+		i2c0: i2c@36c {
+			compatible =3D "realtek,rtl9301-i2c";
+			reg =3D <0x36c 0x14>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c1: i2c@388 {
+			compatible =3D "realtek,rtl9301-i2c";
+			reg =3D <0x388 0x14>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
 	};
 };
=20
--=20
2.47.0


