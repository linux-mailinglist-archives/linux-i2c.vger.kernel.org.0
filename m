Return-Path: <linux-i2c+bounces-6945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A7983A0A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 01:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39ECF2832BD
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 23:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA512C49B;
	Mon, 23 Sep 2024 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="y8+j2qGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22B126BF0
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132559; cv=none; b=WrfqqpS32VB3AxOwMbVZLqFspAcQWcLUjyMfvZZEGlnYB2Ddw1ybQQWwTZEPzCnl7a2+K2RA5UwWy6pIWr4W+2XiiY18PZo7Xd/z31KGh/E+DluwpHEf0QbJylWTl8o36NF05Ib0ISUwKdMneflcOMOD1sov30nrd7FnNv/fhBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132559; c=relaxed/simple;
	bh=kb+FOPL0rVZM1kDeaqCOMHkMt+9wNGouZDUALNbJokk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9L0OzlF43Be8AklPwqzUFJs4pcbY4F0ARVrYX0iquGaKOmP9t217rCSzmb7j6F+ebeLgNdH85J3PTJyetQ9IxPaILPfkr1++WCqNJb6SDbg4E5A/YLskhfRGoroSqOZTEkdaysXonQk3be1KJFk0uW0I+9LdFu4Yowz1P2IcE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=y8+j2qGo; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DCC502C0613;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727132554;
	bh=ssv1KJPv6dWn/2WAVO6iLtBa790Hqw+lnh3qp5W5NL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y8+j2qGoXf8ulvwRtRgivHf3XUNFQ5nvx69ThhXGcT/JAFRJ6tF5ZgnJ3VgRgUJGl
	 qWFlkzVm5BR7BQaw4vCFuwG2NcWgd8XyrIIy1BNBhh6nql7Achzy+X5KM8bm4BoIxn
	 Ub672rlvtKH/LdOZs+TrDkIcI12rwSkusc5uvoz5zka/mB1gxb17p19Bl8gA3ez1m0
	 Px6TsCQAmHTTG6fuRv7Sxh7U4IpNa1dn7YRn7knRHSWpx7UUv0r5ZrLkWQedFO5OVG
	 +oU6FSDeLOFTNB9NVyMZKULDYsDgk/MUNhcZF8YMIPEUTGsfa5oCbohSkRwUGI7zo/
	 ClOWuhC1uTWug==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1f38a0003>; Tue, 24 Sep 2024 11:02:34 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9DCCD13EE36;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9A4FE28044A; Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/3] mips: dts: realtek: Add I2C controllers
Date: Tue, 24 Sep 2024 11:02:30 +1200
Message-ID: <20240923230230.3001657-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1f38a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=fm45MGwkAfgIEXGqLe4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Use reg property

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index cf1b38b6c353..cc43025cd46c 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -33,12 +33,30 @@ lx_clk: clock-175mhz {
 	switch0: switch@1b000000 {
 		compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
 		reg =3D <0x1b000000 0x10000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
=20
 		reboot {
 			compatible =3D "syscon-reboot";
 			offset =3D <0x0c>;
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
2.46.1


