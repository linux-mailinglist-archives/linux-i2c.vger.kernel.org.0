Return-Path: <linux-i2c+bounces-7695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 835EF9B8411
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 21:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B432810DA
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 20:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1EC1E04BC;
	Thu, 31 Oct 2024 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MF3aSg/O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AA1CDA13
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405049; cv=none; b=OpvSp4aZJi+Pl6HeWb5iq6/Z1M9vVN4N5wqvD58SsTZTN/LfS1qv0teBZIGUfJLnFcalZDcQT4ltDgbRMRcnWQCdzzFyUogIjYzduTNoG2/SW2RFybZ76Xzqr6CKD1TxVw/rL2v0qgPmWcrC4wN+PMBB29mZHEohUTm0Hf+AQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405049; c=relaxed/simple;
	bh=PnYpBQalmJEW9pB0x3rWg+QPLKi2iQSZ9snkH0Lj0OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHNPfqqt7jTwMIuQVja6w/Y4VfX0v6aWi1ddpMGtTYFXjv1un0UbFH/dO4F6RumAGggmppp+Z3xv/VG8NNisn4/4OdFJiQ1Ldp9Nu4aZjru0p8jb7A/+MU9b6/gtgm1I8V9jLXiO98laqzD6wvh34O/lFCJ5ovmcZo1q/VSZhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MF3aSg/O; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A1C812C0747;
	Fri,  1 Nov 2024 09:03:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730405033;
	bh=vQGb3atiu9xb91HDGmWFdxz1loEnfE1omBsUrnqTRxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MF3aSg/OVdhFIprdnqPT383JnurtfRkQcyj6GNPNDehX5EdHqFD5re3tLdhyPUU1V
	 YKHX2YY2ejHYiUlZ1VPidNZyugaYxgdLIFO9CE3tz3ebEOxDLvMezv3VHpSiE1PJ0R
	 dMROcBppU2jpXEcR4Rc1+0vbY0QzM7RNev5ygfFY/UbvPcgYLKm1MHHAQhkhDaAdEj
	 diufaWdHcbC0nlY9lx6qgWrdnmD0qTJCHV1rxKgOwABDckiCjba6Nc+G30U+Yvj0OA
	 D0B0V5EByNPDho798z68Yj3onlHwdX0wtuYXOyNkJL7uQYyx0jikUjBDjEN0dGjEbi
	 vKosqK7+tkxhA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6723e2a80006>; Fri, 01 Nov 2024 09:03:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E7AC713EE83;
	Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id E4287280964; Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
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
Subject: [PATCH v8 6/7] mips: dts: realtek: Add I2C controllers
Date: Fri,  1 Nov 2024 09:03:49 +1300
Message-ID: <20241031200350.274945-7-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6723e2a9 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=PxnkKiIr6rJD_3uwCWUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v8:
    - None
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


