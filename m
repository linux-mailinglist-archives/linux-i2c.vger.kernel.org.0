Return-Path: <linux-i2c+bounces-4324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87327915F31
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 09:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6A8BB2185E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 06:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5C7146596;
	Tue, 25 Jun 2024 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afJKxH+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAC1459E5;
	Tue, 25 Jun 2024 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719298794; cv=none; b=Z+8aPZp/Y1kZijQg9DqB/n3oLlRcyF9ofsI3tNC7dj9DXSBCk9r5dZoclwwpZF09G7AjC2zebpEEc2RDZQB2KBqJJ0bVBT0k/LafCXS1J2G9toisANXkiESD95/ibTbE4lYdihp2oRPNqNhJ5iJnv4m0mJceFTL+M2HxeqqP/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719298794; c=relaxed/simple;
	bh=IGNTzHHHcO2fQKpOgRnMv9Qr0WY0XbCxh81+BADNmSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRDB3jg0+mu1vh9K2arM7J0VySlGZJ7Vmuv821Tukzk23eGe3+jdKGoqpgBom6zUlxgX9RVThtEnep58ymMWe8rEogXq9r7iYzMGMkf8Wcatz/G1DCrb7V4YkxgTqzJMULj3ldy7cJQSrALjMTLalUBiQI+Hoz0H+Ez0X+ygpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afJKxH+W; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fa2782a8ccso15005985ad.2;
        Mon, 24 Jun 2024 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719298792; x=1719903592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw+JuciPmVPvxL173XrvRPex6ZJzB6ISGkebILK54mY=;
        b=afJKxH+WIObQG3tDsuwIJcNNFOR9pX5E6dokPGj7zf67u4lMJ4ykjMYI/uycGLHF8l
         m0qBEU5yvwFbBVQns9h8MthFm1G7WCGDuxUZZ8PRZ3cgD0ACWUYQo7uKpochAf0jQIkK
         t+0Kq4JMaLpU979trAIZFVfDuXk2CVhPAvbqRWS83k5gsNmNVLWdruYr00H96LP0v9mV
         pDIzCHvW0Xh999H9HzNTlT2SU2DVfuK2e4cumIzMvJHQNgmlF8gD0geOv71ErG24UZqg
         nxVF2qqZp/UtqJn3XHQ55HpXDFTEZQNIeMLcE5eZaaLnDxnw6mMas0NblWbp5VTyDfoq
         lvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719298792; x=1719903592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw+JuciPmVPvxL173XrvRPex6ZJzB6ISGkebILK54mY=;
        b=McVDKHbx3E/1fI7K1sLailZYZuC/QyAeqMjDwh8jHfXkkSLWy6tQAMt81I74DLfRL0
         qlZyF5/7ytHIOO5yT2gRo6aSwyOMndYMhyNl2XqqBzL0Cy5cvTHi8svaEAILAfGT63kj
         lD76nGFbGUg5YowFmHO1RhFwWP6fVve6MTZQguKxQy9OcWThQe5YMhJrTVooRLdGQjNB
         Ix2vuuW6OLGr+eVefH+Lw/GRlMaRaHXjjNHWtXK3ie/F2kxgkZ1LjIZEfyxDcn7XBpgj
         Ia+9AnEyT2TV6KfjLoabICloKMYxkykiJ1pmzmP7Or/XnKs5RJvXucttQH3M93qvL5HD
         oa2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/D6XS7mRVd9htU03dPbnB0QkH8n+rAtT3Nx4wR77N1QXF/WCyDMD86HDkWsjZ7GXb7p4r7FVDR0alDgBnnGtwMSJ8w04TUveGS2XAhSMe8fboHwUPKZBHLI11RmuvjtiwlHYItyl46w0Rg0vG5FQPtjDr6Y+9J2qZlalz74UizWny8w==
X-Gm-Message-State: AOJu0Yy8o9HdErQiCsxCFOQY4v/JhWBNn1Y204sAGZdUYrZjmuCllpLN
	JCVujX8S8iFcFHTIuX9pzOD3mvdfMkiz6R4xZ35tsVOw/y1Bhtge
X-Google-Smtp-Source: AGHT+IG6L8tRjyFldqQM5owIqKHxJ6YI3PpEsCoaVkIWstg5l1QolFRdaUa+/mFWitIadxYiqj94TQ==
X-Received: by 2002:a17:902:c943:b0:1f9:f6e6:5ace with SMTP id d9443c01a7336-1fa23f159cemr76844995ad.48.1719298791618;
        Mon, 24 Jun 2024 23:59:51 -0700 (PDT)
Received: from ga401ii.SRMIST.EDU.IN ([14.96.13.220])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f9eb2f0318sm74041615ad.2.2024.06.24.23.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 23:59:51 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema
Date: Tue, 25 Jun 2024 12:29:32 +0530
Message-ID: <20240625065939.6146-1-kanakshilledar@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v3:
- removed "address-cells" and "size-cells" as per feedback.
Changes in v2:
- updated subject line to include device name.
- changed removed description from properties except `clock-frequency`.
- updated MAINTAINERS to track this file.
---
 .../devicetree/bindings/i2c/i2c-lpc2k.txt     | 33 ------------
 .../bindings/i2c/nxp,lpc1788-i2c.yaml         | 54 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 55 insertions(+), 34 deletions(-)
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
index 000000000000..9a1b95c2d03c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
@@ -0,0 +1,54 @@
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


