Return-Path: <linux-i2c+bounces-7693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF99B8407
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 21:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BCD61F2386C
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 20:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EF01CDFAC;
	Thu, 31 Oct 2024 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jWoEYC7C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8C1C9ED4
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405046; cv=none; b=YfnGJm/cEUequNYzCA++BuXg7Dz9zR2KQ15wSBOCxPLZT6QmZrogNaK9rxiCtXo5Nu0V77H4E65QB/6DeZJ4hXvKf5KDFeNPrjFB/W3VlmODWWKDnFYvCCUbsxhOm8eri9xhhQoBHtpxMaoc2PHefJBIxsGl5McZusqUvur+uO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405046; c=relaxed/simple;
	bh=vymfZDYu8mord0jv02IfQO4vP9ljC+O+1t4/Q47T0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leRcZQIQQRZuZpr6Dlr6vZ/T2fteIgahtTvBmsAopmvdmOOzhcEKKDrwV9uWzDzh7vts+xYtaLrMj/UAMnioEKQRQvvDykmS7hOpDbgyCcMYb29uGmba8dBqrhokF5jmLcUqvW7PCRQOnLvHGNVxjZsIWaMDZlgMplAkSnKahaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jWoEYC7C; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7A1D32C0526;
	Fri,  1 Nov 2024 09:03:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730405033;
	bh=oppBd4w3EekvX+V8L144O4lFLlVDXZS0zRJys2fNpAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWoEYC7CR2vYp9p6A0ywdB31MrQjt8zYSbkCxG5KR19+RdOxXWAEQgaWyOnulLbRj
	 m5/aa187cWH++FSHRIoWtoBhHH4dGw/YWZPWbNWTrrkTMTmIeoSzdaldnnkBnjWBKE
	 I+fmDv0gh2W9fyjeB3EabV1u6Cgzfa4K3J1MufVsLfd9OZjdKbOsmUT331oz6nO8rM
	 xV6UfLEV9KLrPtM7szrBvwiCSJzrzUSUV7aIo8rJDjHbeSmdYSxcAC0hQiVOOuykoH
	 YFdGWLH1lNgRNtIgHsDihv1n3HcMaICfAwFrfqYbCcABr4U6GPT0f/m8NV34k9TrWp
	 OZ64ZaiBdikXg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6723e2a80003>; Fri, 01 Nov 2024 09:03:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id DD5F113EE32;
	Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id D72FB280964; Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
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
Subject: [PATCH v8 3/7] dt-bindings: i2c: Add Realtek RTL I2C Controller
Date: Fri,  1 Nov 2024 09:03:46 +1300
Message-ID: <20241031200350.274945-4-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6723e2a9 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=LzV1YipphZs-ZdUuF_wA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dt-schema for the I2C controller on the RTL9300 Ethernet switch
with integrated SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v8:
    - New(ish). At Lee's request I've moved the i2c binding into a separa=
te
      patch so the mfd change can be taken via Lee's tree. I've added a r=
-by
      from Krzysztof from the v7 ov the combined patch, I hope that's OK.

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301=
-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
new file mode 100644
index 000000000000..eddfd329c67b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/realtek,rtl9301-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL I2C Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line=
 (which
+  if not-used for SCL can be a GPIO). There are 8 common SDA lines that =
can be
+  assigned to either I2C controller.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl9302b-i2c
+              - realtek,rtl9302c-i2c
+              - realtek,rtl9303-i2c
+          - const: realtek,rtl9301-i2c
+      - const: realtek,rtl9301-i2c
+
+  reg:
+    description: Register offset and size this I2C controller.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^i2c@[0-7]$':
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: The SDA pin associated with the I2C bus.
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c@36c {
+      compatible =3D "realtek,rtl9301-i2c";
+      reg =3D <0x36c 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@2 {
+        reg =3D <2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+      };
+    };
--=20
2.47.0


