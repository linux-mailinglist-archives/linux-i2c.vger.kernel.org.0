Return-Path: <linux-i2c+bounces-162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F27EBC78
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 04:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7C5D1C20B1E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 03:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B1023D5;
	Wed, 15 Nov 2023 03:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="HTiTsnjB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B93EECA
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 03:58:04 +0000 (UTC)
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79CD8E1
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 19:58:02 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AE1BA2C04EC;
	Wed, 15 Nov 2023 16:58:00 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1700020680;
	bh=nuXpiTc5KMpjZuPeua6pFPuqtUeESCBp8Bsq5TMv/zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTiTsnjBRTpO1kHK8Er+ewHNb1qLDldNdo1MZw1o2NC2shsZST2/I9A8G4bWxupD6
	 g6zHS66yUo+NeDI/XK/IAYEdFA289XW5ZIGvy61tiJ8EtINa5s85k9T/26dLNM7SAp
	 gdLs/UWHUEuMO7nxFFPlLh920rHCTb65HK7Qwul969gDuYJremElHOmwm4nM9YDQq1
	 RH8TfUmsAEGYymH3d5EMjyHp/OEKRK3qsqQvVoVXGj3H2yHwKSYmM4X2cFj3ae0C3z
	 X2nJ/crrzmzZ5U+HIF2bGmXU0zFY8aCEfQsqu7Zhb3VrS6h5DuQbEc/3e07KMLWoyH
	 7+RntO4QVgKng==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B655441c80007>; Wed, 15 Nov 2023 16:58:00 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6267F13EE3F;
	Wed, 15 Nov 2023 16:58:00 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 5F8D3280590; Wed, 15 Nov 2023 16:58:00 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: wsa@kernel.org,
	andi.shyti@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Date: Wed, 15 Nov 2023 16:57:52 +1300
Message-ID: <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=BNY50KLci1gA:10 a=k44-534mOdnrxw8nBDMA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add bus-reset-gpios and bus-reset-duration-us properties to the binding
description for i2c busses. These can be used to describe hardware where
a common reset GPIO is connected to all downstream devices on and I2C
bus. This reset will be asserted then released before the downstream
devices on the bus are probed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    I expect the first reaction to this will be a request to convert the
    binding to dtschema. I can attempt such a conversion but given it's o=
ne
    of the more core bindings I expect others may have strong opinions. I
    didn't want to start a conversion without hearing those opinions (or =
if
    I could get away without doing the conversion). It's also likely to s=
pin
    off a whole lot of work to bring existing device trees into line.
   =20
    Changes in v6:
    - Retarget changes at the i2c core instead of an individual driver
    Changes in v5:
    - Rename reset-gpios and reset-duration-us to bus-reset-gpios and
      bus-reset-duration-us as requested by Wolfram
    Changes in v4:
    - Add r-by from Krzysztof
    Changes in v3:
    - Rename reset-delay-us to reset-duration-us to better reflect its
      purpose
    - Add default: for reset-duration-us
    - Add description: for reset-gpios
    Changes in v2:
    - Update commit message
    - Add reset-delay-us property

 Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentatio=
n/devicetree/bindings/i2c/i2c.txt
index fc3dd7ec0445..3f95d71b9985 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -99,6 +99,14 @@ wants to support one of the below features, it should =
adapt these bindings.
 	indicates that the system is accessible via this bus as an endpoint for
 	MCTP over I2C transport.
=20
+- bus-reset-gpios:
+	GPIO pin providing a common reset for all downstream devices. This GPIO
+	will be asserted then released before the downstream devices are probed=
.
+
+- bus-reset-duration-us:
+	Reset duration in us.
+	default: 1
+
 Required properties (per child device)
 --------------------------------------
=20
--=20
2.42.0


