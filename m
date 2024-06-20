Return-Path: <linux-i2c+bounces-4123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380290FC3D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 07:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B921F24BB0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 05:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D96364A9;
	Thu, 20 Jun 2024 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mySVW1cx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93421EA71;
	Thu, 20 Jun 2024 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718862086; cv=none; b=Dm+r+eQNAl1gor7DNg2wlYVqT/gChv46yprMJh4Zo674IeOUvpLialKgo3KZY+DDiX2hJ8FGRGcNaqdc4mOWowPCQ8v1BTHUUDMOyH3MZNQBI7eMmQSWmxg6oWAz08S1CKU303/92VvThR1nx0Z+n8J57iCvJPlA1vplas3+5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718862086; c=relaxed/simple;
	bh=5PbD/NUrILlrkSj1u/WhdhVs9SOw6kDNC9L98HbJnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV6kW4PihW4eL95hTq52eQat7+6xjcux6PA/nlbMZnR1RBvgOQLlsc4ql8Z2wJRh2KGJWHQ3E77s9hTaUDyVKZ4N/lqEBCyORHzllstd4ynDaqyx1wf7LhPJI6t0NVDCDEBaDyW0GCY+yanoQpEWCz7//dgtjaLKAZvtL3qAWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mySVW1cx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70131063cso4350045ad.2;
        Wed, 19 Jun 2024 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718862084; x=1719466884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUCkBVDNqTCYli0tHuV20EHuXsuSalyg9yJLDBT4Mrs=;
        b=mySVW1cxWtTNzPJH5HbWJUDHZ5WUWQa6EOBq0HtplJxEbyuRrzzQR2P7eOWdi4COhB
         5DhEu3Didvroq/WwHfSWjFuMb6/HVH7B+3mgu5iVu9X+mVN8Z4ZSg6cidx+54KhxSK+n
         fy9AYKCu6zHj8AU5/pU9Z7mYGAF5G3Qq02VFM3WzKIpW3XQMneCYqsz7pVY3eqyWFoCE
         YT6Gw62p/5a/oh2mhwNc5QMNMJO8hVHgrS1nXDxO/BAMMw5LG0GCW/mH8KbmLMuTYip7
         QjsS/qR5KKKYf9JvK6bxQ/EVhPuj1Qpq9SyJnoLNCnMSmJQrz6Kwxi2ZG9ApGuQ7W6/W
         01Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718862084; x=1719466884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUCkBVDNqTCYli0tHuV20EHuXsuSalyg9yJLDBT4Mrs=;
        b=jbniHeMP09Wq9VrzWKJ0Boq03Xee7q6SSxLhnefndHq0J/TovHKcxI3AIVvUu9z9YN
         aygkyuATrzUzGsrMcNjiEj4LZYyJ+gAmOxsTcJNQ7IJW3WnvBC15+pRuBV6ma5+D00X5
         WeIdac4xXy3McKQc0NKxxbiJD6My9Oxq0n1fVvuByqkupAPQIANPX/d8JB7JMCJczvo3
         8hEsqWTyvr+6OxD5WBIok9oWILSYqJX/c4+f9hxyspRolhSl1OtmATQTs15PtNGzM2ie
         +0zoapkYk0HbN3M+6WRny5x1U8S0hAGGwta+L068HM/pal0nfW48ikOUte8uEmZJjNTk
         pvdg==
X-Forwarded-Encrypted: i=1; AJvYcCWvPp2YhnpaLpg2qJsXfpSjkpk7n6fYOEqI2sT/YpE2gm5XOtT/JxFgn3noD1l65s9rR0d+12ieO7zacPAf83Zm2eMqcgeE55hfnsIJ880l0Yr8HaBdu4EHJbpsO1Zdc0cUSv+6la2UlfpliL005lQFNHuxGmINNEEbauYdcGI3/vuEnA==
X-Gm-Message-State: AOJu0YxV2Au3qTaqn5Wy1/iS+0wfiU36bztkhmeNTagkSEomNYGBsGKB
	bB2wP+dPX9cO/elS8zu+TIEIEk1efvjRn4fznUf1053NzxStpeDS
X-Google-Smtp-Source: AGHT+IFicQsd0bCNrGNVn8OY/A2pZ3wyoEByUh12CbH4nmjbSka2gCDSl2i8xqZ7q1ZkR6ASqUH9ag==
X-Received: by 2002:a17:902:e74e:b0:1f6:ef5a:7740 with SMTP id d9443c01a7336-1f9aa3f821cmr48603365ad.34.1718862084172;
        Wed, 19 Jun 2024 22:41:24 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc8:6da5:5a28:6118:91d6:c407])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f9c68077a0sm7845555ad.98.2024.06.19.22.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 22:41:23 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema
Date: Thu, 20 Jun 2024 11:10:20 +0530
Message-ID: <20240620054024.43627-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP I2C controller for LPC2xxx/178x/18xx/43xx
to newer DT schema. Created DT schema based on the .txt file
which had `compatible`, `reg`, `interrupts`, `clocks`,
`#address-cells` and `#size-cells` as required properties.

Additional changes to the original .txt binding
- added maintainer from the MAINTAINERS file.
- added resets property required by the corresponding DTS files.

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v2:
- updated subject line to include device name.
- changed removed description from properties except `clock-frequency`.
- updated MAINTAINERS to track this file.
---
 .../devicetree/bindings/i2c/i2c-lpc2k.txt     | 33 -----------
 .../bindings/i2c/nxp,lpc1788-i2c.yaml         | 56 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 57 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt b/Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
deleted file mode 100644
index 4101aa621ad4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NXP I2C controller for LPC2xxx/178x/18xx/43xx
-
-Required properties:
- - compatible: must be "nxp,lpc1788-i2c"
- - reg: physical address and length of the device registers
- - interrupts: a single interrupt specifier
- - clocks: clock for the device
- - #address-cells: should be <1>
- - #size-cells: should be <0>
-
-Optional properties:
-- clock-frequency: the desired I2C bus clock frequency in Hz; in
-  absence of this property the default value is used (100 kHz).
-
-Example:
-i2c0: i2c@400a1000 {
-	compatible = "nxp,lpc1788-i2c";
-	reg = <0x400a1000 0x1000>;
-	interrupts = <18>;
-	clocks = <&ccu1 CLK_APB1_I2C0>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	lm75@48 {
-		compatible = "nxp,lm75";
-		reg = <0x48>;
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml b/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
new file mode 100644
index 000000000000..8caafe48edb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,lpc1788-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP I2C controller for LPC2xxx/178x/18xx/43xx
+
+maintainers:
+  - Vladimir Zapolskiy <vz@mleia.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc1788-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: the desired I2C bus clock frequency in Hz
+    default: 100000
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/lpc18xx-ccu.h"
+
+    i2c@400a1000 {
+        compatible = "nxp,lpc1788-i2c";
+        reg = <0x400a1000 0x1000>;
+        interrupts = <18>;
+        clocks = <&ccu1 CLK_APB1_I2C0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf9c9221c388..920e4f28b5ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2374,7 +2374,7 @@ ARM/LPC18XX ARCHITECTURE
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
+F:	Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
 F:	arch/arm/boot/dts/nxp/lpc/lpc43*
 F:	drivers/i2c/busses/i2c-lpc2k.c
 F:	drivers/memory/pl172.c
-- 
2.45.2


