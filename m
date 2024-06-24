Return-Path: <linux-i2c+bounces-4304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87F914998
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 14:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F22F1C221D8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 12:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C76413C669;
	Mon, 24 Jun 2024 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu0LvQ51"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5613BAE4;
	Mon, 24 Jun 2024 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231293; cv=none; b=hJmqcNc1SBN70+2ugsx+6Uxb98Obi1M9uRs43WU1sxxZ5qvbCAyk4gYeLN8Py/4GjaAjqFns/nh35kURZUjAzP/kBXI2vsxa+PT4k2aSvZ2Pnxt/OhV7jPTzkL1XdC3u1pfV8B18t6lwA1mIHXXy9KIpnkMfBPV71nJBNIB6ZfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231293; c=relaxed/simple;
	bh=KTY7AIwYLs2PMQ+nFYfy6HqLr5vj+giUt9AYetfTWnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BEoh77Iw4egCSPrgHPmOsJoyb6e7qacw1NFH6wC0sU/MewvspWwE+RaLxj/yHrZh3egb00UpvZ6ybtPoiCzkVvBpcBPaV9gN00bTbag0G2QL+dIQoiKJS5rqRtOzeF9VHIVeKyhV9RArynKEb2vIKizCIXUJBQdzZ5alC9dMscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu0LvQ51; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7067272245aso998478b3a.1;
        Mon, 24 Jun 2024 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719231292; x=1719836092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1T1d+qL+x9N3NhGvgQQLc9S1TRtkKHtV2wtCXAE6ZM=;
        b=mu0LvQ51MbMHC020NdF9cEqL2GNSsVYDkboqMZnKtPOtLbljNf5SSAXZxXNs8IyXTf
         8jnA8HsmI50HXMGhLPmJd0Cvpkv3jTMI7AbHLH3ydyMGqfXHg1n2N6/3kObrOAYIOuHm
         /AnyPIghwB6SyKmA9wWuVFqR5gGKBthN7LTukat/ZrnQPk4B85Yh7+1sl6sTybUIHrBW
         Rs8tzWaDjW8xRWa0EE8CnjAcvmECm+rJzNhT46TV696dNg6oC/OJp4JY8L7RKTjZCQyo
         n96dLCvwKnXglBMa+T0wrWVPzlwdJhzJc4B/Uhp8dvEg3g9BYk7mOdsj9oVe/UqQu22p
         Azow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231292; x=1719836092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1T1d+qL+x9N3NhGvgQQLc9S1TRtkKHtV2wtCXAE6ZM=;
        b=nQanuALT9hZZAO8ZeVGSXrDJaMXE1644Mu4zA/XQ82TW5veRo0WNWH1c0ogRdIL9St
         FMs7R+WuzMWNmNDazQRoSwOFFcA9P+B+eeGVN+hbCWhIYst9rpqcQLaPruo2Dh23cXje
         JXUVXGdCH87Z5faHVXFKPIVuyjxh3Q5Fe8eTijShk21IcsICT9z7aQ5zRKy+ddZJe0xt
         29GYUsUXTXA60nZD6E23nJHqhHQ+0al1w7yOlbY0MV+LGyHJ146F78sI/3iW27jUTzA+
         N9fI5zUoet7FhtjsL3ETIanRmoy60IEmuCj7MaAUT6fRQ2UkNgWjoWnKhj2NqrR5dlWo
         6aHA==
X-Forwarded-Encrypted: i=1; AJvYcCXAbehJsXadrfnH/zLYWo5zCF3Ekc/5dD0IZxRYmAqu55smsuWSRoqwg4Yti4lwLkNuGQyf1rifcm1EIkzff2YMObIYf4jFNQ5nCK5zvLDanElZusst7HVBlyiwxXtfDnFNw2vC7+VR7zFzeXHw6jXd1OJORB0DLDYAF48GadDZgfOTxg==
X-Gm-Message-State: AOJu0YxM5wZP4MD4kkWdYcCLiDKrdaR1+MDSqxDAXASJvhfvZPf2HQT9
	ZgYrghTyUDN3+4PEsbicnkbCti1WKbyAJ5quD+vqry9rNh2Q6W9X
X-Google-Smtp-Source: AGHT+IGZQGm/zL2QtBi7MUQCzOJMhdVjFVj39ftHhLl2bP+nXSaA7BFv9kAwSmk88w+o6dU7EM1v6g==
X-Received: by 2002:a05:6a20:4712:b0:1b8:622a:cf76 with SMTP id adf61e73a8af0-1bcf7fc2ccfmr2613766637.48.1719231291576;
        Mon, 24 Jun 2024 05:14:51 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc8:f161:e194:b8d8:3f20:dff1])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7065107c26esm6266761b3a.11.2024.06.24.05.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:14:51 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	kernel test robot <lkp@intel.com>,
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
Date: Mon, 24 Jun 2024 17:44:17 +0530
Message-ID: <20240624121421.549010-2-kanakshilledar@gmail.com>
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406200223.QexMAKqr-lkp@intel.com/
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


