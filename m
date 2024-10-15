Return-Path: <linux-i2c+bounces-7413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6630F99FBEB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 01:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 101ED1F24F4B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 23:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35051F81BF;
	Tue, 15 Oct 2024 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="peZMS2zK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC41D95B5
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033199; cv=none; b=UvNnxBpaQdImhBUQNdqK/I/YDMNHsOmfJzZ55zLUDuOfKeuJmmjjMUniGklXMUjMAQdh5dZZXWlIml+TMwn7of6pHK7fE3V7uhfmGbWzDDUMBaGin3OSpEloP8UFOh98BnB/GiV1rchXdzKPa/SImvuDXXp+Vj9Go17FbfrZO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033199; c=relaxed/simple;
	bh=MHNNz6bVJciNmX//sIssJ7oLn0dKL19xFzYvBNSescA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyP/jvAAoREonDtwthbLsOhhOxsjf/jNQQcg0VAayY17xryeDDE8vqlHLAo28U2JaIk2RKwqC83bMt6ae3TkCeLwGCyZvRhK0aL0bWJgC07lRMlKIURSjgw6VRxW/+KTE24mZQdmr0xe04LrmJWz4S8nSMq1uLkkM+7vr4NzeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=peZMS2zK; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A685F2C03CB;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729033192;
	bh=iLrdxpyxSpR+kGhAc2KHTt5bUnwB81R9SSd8nshCHps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=peZMS2zKXZQaXlEBWMSBiiWvGhzh7f4e19eE1FtS1kmq2jxQNbRS/6cICQejbSLpq
	 UW1HWAgpVD4tRX/stJFTCEHDxdPA/p7TgDEmXC2LCJMRaXjkyHe72ZCrMyNiAa+Z9p
	 S+wf8sP0reuw6VCcRwFvbhhAC+4dA8BG7Ylko1D4gMNbe4fd764nNAnH0nh/KKYAWX
	 5TwJ71uivz+ufjf8J6IvE7tLC08BLdS5wV1OgaJvLUgEQRE01jDv8NBnEXIeBCrxf5
	 TC6XVhFlvdr3rJLAbC57PXwcEgU4yrYhMRLqoj6vCF9YzMQMzgs4fXy+y9HRmVvZ/H
	 b7rppncx7QC3Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670ef3e80001>; Wed, 16 Oct 2024 11:59:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3C38413EE85;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3927B280407; Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
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
Subject: [PATCH v6 1/6] dt-bindings: reset: syscon-reboot: Add reg property
Date: Wed, 16 Oct 2024 11:59:43 +1300
Message-ID: <20241015225948.3971924-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670ef3e8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=KKAkSRfTAAAA:8 a=8QneSPuuVenq9H3OMoEA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22
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


