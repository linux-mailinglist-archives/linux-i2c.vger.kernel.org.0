Return-Path: <linux-i2c+bounces-2440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899B880DA9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08351B2363B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 08:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6FB3A267;
	Wed, 20 Mar 2024 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buZaTYKI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF6481A0;
	Wed, 20 Mar 2024 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710924440; cv=none; b=BEyGJNSsjw703Uiso3/TtAXqDdp/3n/+QqB3Kfb/BJIWtmfmNfuqvnHyYV1mNSNn0T5cj19Eur0JKBC/Ceo5rc8+fZqniITPNLt/IBc1p6JGqfy6idPyIkIYFKDSom/jQFXAH5KVB01jTWt4FWyhh42OEq28AaX8AM8LOUsZlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710924440; c=relaxed/simple;
	bh=0YKEkgypwgch25SP6MvI0cxNHNU2GFwhWtjZ1AP0+fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rK6TtFdZQk4+RtU9qOstOcwUb1/2YlhHMU/1F6rHK6k/u1FTlWTGgt4RCsqiLEp06EZQvkHZEMet4ORY/L0ZCHt0er0gYESyDdUnFvxRiZQYg1WXaD1xvD7bAYpJA2OSKcUkI24v1L4igW4qFJ23QA/EMlXVrXgLKm//vu+NEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buZaTYKI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso45764415ad.1;
        Wed, 20 Mar 2024 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710924439; x=1711529239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmEZR0TZIkomRjFeSaPJAkhIKg2H/Yce/rgiIixVy2k=;
        b=buZaTYKIQOouIBhPKCvNVj62BjrLCjjsxRXrosamb/XML2+ka1GCdrFcflAXQG2VnH
         AXBR92FYWIEVcEApET/rYb5jJAwYeX88nnbcAvqx9iop1zGrMewYBLr/Kr9rivckt2AS
         T3QG63EcdTuTLrkFLt/r61pYP8JpyBChQqmDZ0E4bU9i/xiEz+OpVsrJlliGY4pOwqnx
         MrgCUhlYN/+L/98YPj6K35Of1lQRMSRLPALHyTEoo2UsGX/q26vWk+YlQ7kO3XsXaaWQ
         xRaPMyjPX+1fp4mtz6APQ6CD17RR1680WiwHTv/+jpb+Iq4cH2/ZrX2F0/otwEHXXs5O
         KasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710924439; x=1711529239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmEZR0TZIkomRjFeSaPJAkhIKg2H/Yce/rgiIixVy2k=;
        b=KAtCbN8TfY+OOZiECXazBF2T3slfPX5OMzZ4U/WefA6xr8ngqbNHzZucT3Rxo9dR+9
         u+oLqmyKBfiNzu05ajIRSB8cE1rc+rpiV8txUKkZhyrpo2OpW1ehVU3eMmYYl5SWz9pB
         N5Zp7LQQciOyF+QGTdyCYrCHNgYNkAzAeT4npBBUhlVe5Wiz/uANg11TBDti6e+/auEF
         8DFxnvUKCjk5kWb32UnBPhPS9c/UQlRLSuIXHp7hF2o7hKO3AHvkAGUQP3mj54c1NnEr
         Q0FgrY6qtqh+QgEs/k6d47J79gD/IlSNntGDvcUpACz6ScYvCbUlMyf/SWO+14VifXEX
         D/uA==
X-Forwarded-Encrypted: i=1; AJvYcCWOezXwoUayUuBMq5UMUedIkTsruoFgxcAQgT67YUgH8iL6jk4J4trEnoowsccU6bAhu1wSUzRr/rA90800PvLMyIen7z6FirWb96Dqm6B2QcBndvlFjD4x6tqkSA1ttBTHVUru7E40qFWefzz2OytFMDV/0qtvcg/k/fMIQ6ABpA0ToQ==
X-Gm-Message-State: AOJu0YyqId/NiHCupAKx9P8UuAhvoWjDEsJnD32rODSRFYgK2ui6EJUD
	xp59T5c8ESdSa5SOWS0GKhbO+TDHDgFgRYHpozyd8jSaLJfI1Y7a
X-Google-Smtp-Source: AGHT+IGlcuR5ZnxZUBeNvUcBhE0/p/PPIX2gmZEeCtKUIaJ7LbM8JSisiCYiBT45KMUL11ck+H0/PQ==
X-Received: by 2002:a17:902:ec89:b0:1e0:73d:9196 with SMTP id x9-20020a170902ec8900b001e0073d9196mr12960958plg.46.1710924438602;
        Wed, 20 Mar 2024 01:47:18 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f4:a4:a590:2a15:ea77:7177:18e3])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b001dee4bd73e0sm11768854pla.59.2024.03.20.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 01:47:18 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: animeshagarwal28@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema
Date: Wed, 20 Mar 2024 14:16:20 +0530
Message-ID: <20240320084623.82248-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP PNX I2C Controller bindings to DT schema.
Keep only one example in DT schema to remove redundancy.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
Changes in v3:
- Added a missing whitespace character in maintainers.
- Added parent directory in subject prefix.

Changes in v2:
- Changed the file name from nxp,i2c-pnx.yaml to nxp,pnx-i2c.yaml.
- Dropped properties which were already defined in the top level $ref.
- Dropped unused labels in example.
---
 .../devicetree/bindings/i2c/i2c-pnx.txt       | 34 --------------
 .../devicetree/bindings/i2c/nxp,pnx-i2c.yaml  | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-pnx.txt b/Documentation/devicetree/bindings/i2c/i2c-pnx.txt
deleted file mode 100644
index 2a59006cf79e..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-pnx.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* NXP PNX I2C Controller
-
-Required properties:
-
- - reg: Offset and length of the register set for the device
- - compatible: should be "nxp,pnx-i2c"
- - interrupts: configure one interrupt line
- - #address-cells: always 1 (for i2c addresses)
- - #size-cells: always 0
-
-Optional properties:
-
- - clock-frequency: desired I2C bus clock frequency in Hz, Default: 100000 Hz
-
-Examples:
-
-	i2c1: i2c@400a0000 {
-		compatible = "nxp,pnx-i2c";
-		reg = <0x400a0000 0x100>;
-		interrupt-parent = <&mic>;
-		interrupts = <51 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	i2c2: i2c@400a8000 {
-		compatible = "nxp,pnx-i2c";
-		reg = <0x400a8000 0x100>;
-		interrupt-parent = <&mic>;
-		interrupts = <50 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clock-frequency = <100000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
new file mode 100644
index 000000000000..798a6939b894
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,pnx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PNX I2C Controller
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nxp,pnx-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@400a0000 {
+        compatible = "nxp,pnx-i2c";
+        reg = <0x400a0000 0x100>;
+        interrupt-parent = <&mic>;
+        interrupts = <51 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.44.0


