Return-Path: <linux-i2c+bounces-2392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48A87EC4E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F28B1C21424
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 15:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1160524AD;
	Mon, 18 Mar 2024 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SO59E6n0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB14EB50;
	Mon, 18 Mar 2024 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710776428; cv=none; b=s3hVzNgCRBw+QypXuuo3Qd6cT7n5JrdMUuumaMrgLXO+5c9iRCK8H1Sy8zmXQejT/czEm6VXCIF8HRRoxgFe0uQ4zTS8x7HdqrD1bgrcD3LSZdyI4FGRI1jbEePDP1JWrfVjBpcp42f4bzCcSOkoZ3bPIZW+W3arYs8UifmCgvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710776428; c=relaxed/simple;
	bh=/eRpQJuG4LsRNwLBbm0QTXnmISrSwsU6in96ypWB5ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWDXkQBtS+xkgBGn7f6XkQ04R5MwLQCmCorUMOv/V9+B/F0uBTTWgqNvUqPuvPya3tss6ap6tsZy/UJ8pnXtxvDdEDHx2pdz4f8E6UK13FWHiu2gG+jmFW7OoXf5wpkjhCPuILUUTBJ4fnJD5n4aSRnBmeg8QJE+qFBrq/X7HKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SO59E6n0; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e677008501so2195140a34.1;
        Mon, 18 Mar 2024 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710776426; x=1711381226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ7MzVtD5gszzcPFq8VPRHELTS+8uClWAmYrbElEuaw=;
        b=SO59E6n00CI6v72pB8D+hX4HYf1UQLqVG1HCKtJnvomW+Yr5gKnqC6YSjc/MlUFIWk
         hEbxod7RrniB27WOyPNsNs+BSurKAsMJkWJmLeXg3MoTQXzNEdTKBJ4bjI8zKqQhxHCe
         2EPGf3sjr0Zv8MR1/yHQSVDSZgAyX3h8Kd+/ahUFekasj4K93WGNw0LdYgEaIdo3yp6R
         5LHhjam3avVyhmJRimnHnGFb8Tc3Ypls+Nc8Uc4fujkMWXhnOdsFNT3PnFViS6XT9Dpx
         hHXDwY/nfv4zszxCynLXVEiO/wWJFI89jUlscWDWqrPfmjB8GqZJOjQeSTLzh3mPZa8h
         QM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776426; x=1711381226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ7MzVtD5gszzcPFq8VPRHELTS+8uClWAmYrbElEuaw=;
        b=n7j7rZCx1yMChET7xypoFtzOUB7sVl1EHSU/aYHXBuDLQW+r7WuoJBSaHYd0uNwh6I
         WSeZyJS6dd2o+l51PJ80vJe7YBJeRRC97/jJM3Gu5uVNhDm6rfD1Hj6+Iyzo14bZYv5h
         Y4VavyXaHS1QdVQgSj4kQSDQJoBZM1kThQImi7EOur20nXgJW1IeMiE42uKboYzk3OOc
         +5eSYgv7FCyceXPI5e7rC4cTJPIROl6C9U6ndu+7hTPx1/12vpMBZBFYq0SLN+fbSc/e
         +Mf0HH/WV9GNiRxgPNwXMAWL4onO8v9YjnoNIYjiYLQ7wFYcCTjRrXJ3RNBx2MBHs+1l
         QMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx1VWAsibtcZzG+k2k3lUuSgugKVw0u4pFWf+CUpoqNibuy6TUB9qSqWYxOamQFNZjyk6ZHarvzTGs5gmmIXCGz3s2GDtZNMAIyzUFeE1cqE/t/563Wq9/i+KjbVLQKgyaapv9TenGOvO5ufZrJB6qQ1uG2RRtiKb5xi+bMsJJdhGyZw==
X-Gm-Message-State: AOJu0YwH5+ZJw3T3sehrSLFR8xVwZbVEdYGHneQaMquUsYi12NJ97uq/
	99XM8ZFRKCwKcSk7NsIlYpiWENUWaTHWXShdSkaRodRlFYaJuAzA
X-Google-Smtp-Source: AGHT+IGypVRU7c1Y3fdttezh6tHIOCu0ntSwcDNrBefkzdlwCpoddPWfn8R8gdF7uR+na/H3UcQPUw==
X-Received: by 2002:a05:6870:9108:b0:221:e082:228a with SMTP id o8-20020a056870910800b00221e082228amr15354064oae.57.1710776425557;
        Mon, 18 Mar 2024 08:40:25 -0700 (PDT)
Received: from localhost.localdomain ([122.187.117.179])
        by smtp.gmail.com with ESMTPSA id t23-20020a63b257000000b005dcbb699abfsm7374105pgo.34.2024.03.18.08.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 08:40:25 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: animeshagarwal28@gmail.com,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: nxp,pnx-i2c: Convert to dtschema
Date: Mon, 18 Mar 2024 21:09:53 +0530
Message-ID: <20240318153959.30755-1-animeshagarwal28@gmail.com>
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

Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
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
index 000000000000..3125b2f5891e
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
+  - Animesh Agarwal<animeshagarwal28@gmail.com>
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


