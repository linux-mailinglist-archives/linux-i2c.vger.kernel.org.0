Return-Path: <linux-i2c+bounces-6884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7B97CF78
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 02:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70A3285B88
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 00:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F8F1B85FC;
	Fri, 20 Sep 2024 00:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="EyXvBI25"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC48EC4
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790978; cv=none; b=hgPwJFL099TnqHGLcKMhVANpvUlIOw6peKSHkk+YPRhAb/8NZ/qwhtjmp3CDz11dWOw0iG5LSdHL8fZIjYmAlT4yN1Nz53ouzY3B5ixoPWgWGpr5het7puM5NEsAo6Lku9NQ5KHbMkoOqx2/N2Wz0xMx4dB8UW67xtvmMIFOX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790978; c=relaxed/simple;
	bh=kb+FOPL0rVZM1kDeaqCOMHkMt+9wNGouZDUALNbJokk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUMyzZ1U0eAAs8HFhGyhAtFltEe8uovNzClPc58tb2mFDm7jgzSUgSH24hhQmMXknGx6QX54LpmWCJxUJhY3Bk2/AAJzxFOjq9/+zNpZCKksMRKD2lRbW9/L3QgWjTDz6Avk8EsZqqcUPpFnDK6xOVocUL97lTnfTOgYRSOterE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=EyXvBI25; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3DFFF2C062F;
	Fri, 20 Sep 2024 12:09:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726790973;
	bh=ssv1KJPv6dWn/2WAVO6iLtBa790Hqw+lnh3qp5W5NL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EyXvBI259PyhwUB/ld3XDdc8jPOpGkfPGe6g4MBZF1WAW+4NJIrCNqLa+YKTs7uTV
	 jfnPDkhqjPAjOoMPOEXYK6z1oCWQm4K2TkKtYH2UadKlFlxJQI8K1g5gpSnnNk2f+l
	 wFAb8mUfcd+2W+1cOGQGftdKfwmE7vz8mKdAlR2mPXn+FTxwx49/m7eE2YIbtJp78c
	 aauvYsefokAJ2UtuvGIf/JQSf+4QxAAB0JPnK8kKziRySmlgjhGwU6VF4Rg1FUiHua
	 z6w38jytq7//ufo+jmXaaoNRRt3dgV3HmhzBgguXJJ3sL/7L7q9aE0LgAEGwa9v+3S
	 Czh3PlwBcuv1A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ecbd3c0003>; Fri, 20 Sep 2024 12:09:32 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id D426F13ED56;
	Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id D159C280968; Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
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
Subject: [PATCH v2 3/3] mips: dts: realtek: Add I2C controllers
Date: Fri, 20 Sep 2024 12:09:30 +1200
Message-ID: <20240920000930.1828086-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ecbd3c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=fm45MGwkAfgIEXGqLe4A:9 a=3ZKOabzyN94A:10
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


