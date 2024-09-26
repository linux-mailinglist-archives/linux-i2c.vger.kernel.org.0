Return-Path: <linux-i2c+bounces-7036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD40987A40
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 22:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FA8A1F26428
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 20:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BB8185928;
	Thu, 26 Sep 2024 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="yxBNyHeb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6291C183CC8
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727384306; cv=none; b=b1bFHix4Irepeg9qZ4AedIqcGCbg4kQ0Idk/5Y+DMxcn6pBjIYJDKHarLjWCE1HpinbtXqyKs5vxzxVaFp3G9RWMRWciwyDq+L7q87r0ElYLW4b9WuWHJXcqAfWBPDkxdkQ3Jq5j58Y9Dzk770hfEJArwafWiMP99lv98/gUkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727384306; c=relaxed/simple;
	bh=zVQjJkDISCom5VPCemNeeMBPNoi++T+4/isRXOQJThM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBirHiIA9heZ02aeOMC+/584/sBaO4gH+i7lIHvqowX5mvm2b2wXSQSJg+NHs2xDwgkuAYwcgh3B0DO339do3BstQ6+4192JFpiW9CvELWxN3+9WCqmPx/xMRo3cK2CjxN9ReNea6JEqLAQyIaXdBUL8U0qLL4XlG8QC/RTvcLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=yxBNyHeb; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4C4E82C057F;
	Fri, 27 Sep 2024 08:58:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727384301;
	bh=uzCg5ewSLi9x3Br9Z0HsxtvvSLMm/lsnAcYlP4vwApY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yxBNyHebSVCAGaPBA0l4WDYd0oxns/VqlFvAwWhzUeUufDG6gss25m5gIXJxRHHj4
	 2M4cxI2pYS1IbC4VESDYMaXI9EtQ02teO4U0gwJrE5Bb+7XjxsP5mbmvfGv9C31G/L
	 VeBYGHr6DxA3A2wVpZ+EnQAgelWzj26MlzK3IrEPpx67UbtmtNwyIuCWdP+HUIcTD7
	 lwIYkm9Ij2LhTLuvb66pSY94S8We0pQuCJuMK8W5XVJIkhShG4T/q6cJTWzZFPJ2D6
	 94km31+Uc04LnMJwMEJT2xwu8LpP/4h+SIJA5SSTgK+SbOpQt26HTkIAZJPJM3DyZY
	 uHQEjDAr8Ugug==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f5caed0000>; Fri, 27 Sep 2024 08:58:21 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1B7EE13EDA9;
	Fri, 27 Sep 2024 08:58:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 17675280B65; Fri, 27 Sep 2024 08:58:21 +1200 (NZST)
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
Subject: [PATCH v5] fixup! i2c: Add driver for the RTL9300 I2C controller
Date: Fri, 27 Sep 2024 08:58:15 +1200
Message-ID: <20240926205815.124872-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>
References: <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f5caed a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=HSetc5oJXW78giV3FPcA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 2fb8461af575..eae059540cec 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -45,17 +45,17 @@ reboot@c {
 		i2c0: i2c@36c {
 			compatible =3D "realtek,rtl9300-i2c";
 			reg =3D <0x36c 0x14>;
-			status =3D "disabled";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			status =3D "disabled";
 		};
=20
 		i2c1: i2c@388 {
 			compatible =3D "realtek,rtl9300-i2c";
 			reg =3D <0x388 0x14>;
-			status =3D "disabled";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			status =3D "disabled";
 		};
 	};
 };
--=20
2.46.2


