Return-Path: <linux-i2c+bounces-7438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32D9A16BB
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 02:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2ED01F23DD0
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 00:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91752DF71;
	Thu, 17 Oct 2024 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ZSIKBM12"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86B79C0
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124228; cv=none; b=GbpyQWjdT2/oPTZjd3ljt2IevQJOvV8AFOXW26GMS2+PCBpZGN8Dv1MILyLsOIK7+8bIs8ujErFZ8HP6WZ/YddhXJdGuo8wwpLNoFE83yfHIIMKp3bLycm9Wxy9WT3XxrBg3cLYzPx4zTWrq/Bu2vT5dlxEwih0wDYLzJZh2BxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124228; c=relaxed/simple;
	bh=FzbLQXy4rtHhw3iczDHJWDrHPqWFijbi00lnPhFqfjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=salNYtL6g5opcxr1t6scuOe9iycNao9XGwDh+x5+uDnG/qJGM8B+n0ykEBKniyoq8y+OfidcOj2x5oFX94DFNzTnDQqhBshcHJVqf+BNVzvO4jC2IqqeNKZMMypikNvLcvoKTw3T/n792qpJfidCKKEFf42A2QJJsLZH1UTFjvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ZSIKBM12; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7C9342C0372;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729124217;
	bh=pXivVa3uMTlSLow2XPCpywJmuaSDrGL7ajThDd/6yjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZSIKBM126jEyMy0KenO306SpF9bEgT61Dqxaw56x0rxT/PSWBenl2AO5Y0jNI5CnK
	 o7/LQQ1mL/STfbqX7yC+T+deMrGGqvVDZWHoJAs/3vbnMZiHQPwrANFXH4ElqJIEMQ
	 pYaBrD4G4HolGLIrOMbjvIOvow59WehMF8l+T+ChhziQMgqIj5vZB3LQHNp9ryA2Zo
	 rmD4igoVjt3TZyGjyFVe59vWekc6O1XY0+U5VO+JrOFqZVgZY9Lw5LMrEA4VFXYZfW
	 YEYoDPYMLEagXCqlXwlbUk9/OWeaQXzGamuSFQmyQJHLJ3sLe809K82tU7PR4bM+jF
	 lNBLPIIdbQSNA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671057790001>; Thu, 17 Oct 2024 13:16:57 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 301E813EE85;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2BC762802E6; Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
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
Subject: [PATCH v7 1/6] dt-bindings: reset: syscon-reboot: Add reg property
Date: Thu, 17 Oct 2024 13:16:48 +1300
Message-ID: <20241017001653.178399-2-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67105779 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=KKAkSRfTAAAA:8 a=8QneSPuuVenq9H3OMoEA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The syscon-reboot binding used 'offset' for historical reasons. Having a
reg property is appropriate when these nodes are children of a MMIO bus.
Add a reg property and modify the constraints so that one of 'reg' or
'offset' is expected.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v7:
    - None. This has been applied to by Sebastian, I've just kept it in t=
he
      series so that others can see the complete picutre
    Changes in v6:
    - Add r-by from Krzysztof
    Changes in v5:
    - New, suggested by Krzysztof

 .../bindings/power/reset/syscon-reboot.yaml           | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.=
yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index 75061124d9a8..19d3093e6cd2 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -31,6 +31,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Offset in the register map for the reboot register (in =
bytes).
=20
+  reg:
+    maxItems: 1
+    description: Base address and size for the reboot register.
+
   regmap:
     $ref: /schemas/types.yaml#/definitions/phandle
     deprecated: true
@@ -45,9 +49,14 @@ properties:
   priority:
     default: 192
=20
+oneOf:
+  - required:
+      - offset
+  - required:
+      - reg
+
 required:
   - compatible
-  - offset
=20
 additionalProperties: false
=20
--=20
2.47.0


