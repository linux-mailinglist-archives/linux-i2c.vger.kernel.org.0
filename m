Return-Path: <linux-i2c+bounces-7003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042C9868FF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 00:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54A21F26038
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4EF17D34D;
	Wed, 25 Sep 2024 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="uOeyXgw1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BFF15C121
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301615; cv=none; b=i2TbvCbgDKBWCodnxSrVdgnnD8fVV/McVqFGGiC6PLYNzPhUJo1da9Kqe6+gpBR79RaBka+1h9QNZ6tM+3OYTOEnlB7gIJmgiwDGoZMqjXlmMrOKDVqcoCuYTSfQ5yUGEyr3uH/yyAUyLNiN1YQR6bVUyxdH9YP0svEEVfJJxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301615; c=relaxed/simple;
	bh=a8e87PAzFf0cbE/cQriNWQpzrXU54uLCeBwkMiHvOoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN5DSEC0wAF8ydjoEjd7qf6+p9blCelLZFrKx1wLTWfQBiUb7qO7jC3vGW03ze34tXIbgU9d175DW8FaZft24X4LdGTozxgz6mLXfYLzoDqu9dC88vyxbjlEqOyRrxBM6jL2x6Rgfrmn0iDqdV/r6+DWi/mqewBaggyOHq2y5TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=uOeyXgw1; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 742512C012B;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727301602;
	bh=Iz/5Wmx6vYq4KfW4FdtZTS8j0NRcbAdMtTuLit7NagI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOeyXgw1KDFB4S5e8F4KOrJwjXyMXiXW9YGUoQEq/pKbb5wwKbM8lhPYdyCfJkRmd
	 gMzt50r8MByjd4shuffV1K/ZWmFyMal/gXfp6Lp9DDN2S3Op7bTDW6j0vy0VZjwgEl
	 KpYx8yleHQcbnYsonqaojXp2JnguEcxCg/O96FDluhENtiEKfX4Nzd0pX8+TckVW+a
	 SfTYiCWrSvpCQDI9tf9S9oF/JoRCALf9hndL6H2q8PXstmWaECT1vOM9JwrvnKYCJ0
	 hkE5t9ks+BARdJbcec0hRXLRM9UOBGrqRjufx74+78W7zktCxcNyvo6IDwIS4tDQ91
	 TYfftQBk2aItw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f487e20005>; Thu, 26 Sep 2024 10:00:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1ACC213EE87;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 19894280532; Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
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
Subject: [PATCH v5 5/6] mips: dts: realtek: Add I2C controllers
Date: Thu, 26 Sep 2024 09:58:46 +1200
Message-ID: <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f487e2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=8-27D3ImJB-g1dBfIooA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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
index 80d9f407e758..56c35e8b8b62 100644
--- a/arch/mips/boot/dts/realtek/rtl9302c.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
@@ -5,3 +5,11 @@
 &switch0 {
 	compatible =3D "realtek,rtl9302c-switch", "realtek,rtl9300-switch", "sy=
scon", "simple-mfd";
 };
+
+&i2c0 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+};
+
+&i2c1 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 89b8854596cd..2fb8461af575 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -41,6 +41,22 @@ reboot@c {
 			reg =3D <0x0c 0x4>;
 			value =3D <0x01>;
 		};
+
+		i2c0: i2c@36c {
+			compatible =3D "realtek,rtl9300-i2c";
+			reg =3D <0x36c 0x14>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		i2c1: i2c@388 {
+			compatible =3D "realtek,rtl9300-i2c";
+			reg =3D <0x388 0x14>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
 	};
 };
=20
--=20
2.46.2


