Return-Path: <linux-i2c+bounces-4114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8990F374
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 18:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A11F1C21FD2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6886158DAE;
	Wed, 19 Jun 2024 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxaywD5m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AAF158DA8;
	Wed, 19 Jun 2024 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718812232; cv=none; b=cMnlIfQPmqAhtchjv9HiCq0Uc9ME6QkyDUaES9ai6U1HAsFlGdqIyjQlBmXWMS2fqEZCnQnbINz8WWLK9D4M5qwH8MvpcNgNUKlIOfbNOWf/jGQzrhLmEPLqjDx8LAtaMgBxac1oZu/bBK2pwFjNzmo9rLxl4JhYYLIXRNT9APg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718812232; c=relaxed/simple;
	bh=K6MWcb8JgHbFUPFbexO82Uth2bOqMvsxZPn9kppEFTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=puR8cMGs04zBsG4Zk8k+80eYmKQPSbAG7jfOQB6IjsU7NnkRo2vJXazpVkkIYULuiOvFyH2kJl5QEynxBembYDULgDvV/4VVs4FbggYk725JgUxD3ZvR3CXVweOBK+zN3FQ7fHag6jWvdGCunI1KKvxnXAA9kA9Rsznx9H3V8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxaywD5m; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70599522368so4816631b3a.2;
        Wed, 19 Jun 2024 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718812230; x=1719417030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd7wiy/VlVLvBtVtiqflRbF+ChuoP1J0JG+G7pVlywY=;
        b=PxaywD5m/Rj7vpZ92sKXz1nYiluihvQIAE0mqgA1LgpdSJ9USPh6qTOFbkAwQuUgqy
         6pdlaqy8OVgzb51tLzvgRzwqPKStwSCfZeXndgeFg72/WDWxWyfrsCqYHP+zdK5fDF3i
         s34j4gM+xkMahDhseQXMb+qKZkamBGYtScoP0zNXKnBG7XGPrf4J1BHFUb3Hb5wsHRO3
         c4Bp8MQ18Jjc/3lGiILn01+mObchfJXh72M7xKPyJxHulFWk6/n+/vbBfRJQb73w+JHZ
         tGqiHc5zYgA9d17zq/+dn6xrxuNiATkdCLvKKQKhk9gn3j7AJFRlQf9Bh5zR69o8UnZz
         Sm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812230; x=1719417030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd7wiy/VlVLvBtVtiqflRbF+ChuoP1J0JG+G7pVlywY=;
        b=k7hPaMTnZ53Q/F6kv10ckfKiCGuBtkKFojh17gii4hgXbLyFODRPsYP3xd9Di5g4Lq
         bG9lDo5c8ny2tyP+0r5ZJZ7RaTNtu8E4iv0+AAhQhB3tcWrB8+MG28BKpApJYorhc0VR
         sDz5bAqcvjhsouO5dzLpWvjxCYBkvQDQ+0yBYBiLlxTEqPhoV+By7/uXlVEUsgnAwXL3
         vxPONUi7P+lf6LK1xOy2FMrpNhyCt63hU7Sw7AzTTHUlAl/ho+wi144Qj8DyjmTSlgai
         QTF1Kkx4/xHZoW5QGYfZMMjHUVVbGgZHgyIGJ+ie/kMnSX0WhCg0meCbalZh4AxBz7pB
         yDBw==
X-Forwarded-Encrypted: i=1; AJvYcCW3gmmzLTfo1Ih/asnvjDj8T7jfE9FQNZ3z/1AKplUchVMFnorSQ/IWknkAxfkp+tqIXMqto0p4HSl+bsrHHo24A0FamLCi+NdMiH1tRQdwHoGdfBX9UipINrLSvMdxWk0OFUOTojv3QfjSpqYKZ4/6GyC0oMe1p5JDGlBjQwimbzH0TQ==
X-Gm-Message-State: AOJu0YxrjN5VfZODaEk39mM/X1yz4krCFmI0Y+JXPCEOUhBToX01UK/5
	vB9p3LmSEuPih2c1YxRDmIRNhsNjdx0gNMDb2Pj/d1ZhDMYPOjzl
X-Google-Smtp-Source: AGHT+IF5kuW0M2dM/4GTa3QjwDZqbi4zHzmHnRmjAa5S++TiLw7FT1gdA2uZD4U2FAbY0OsBzKcPdQ==
X-Received: by 2002:a05:6a00:2a6:b0:704:34a0:96c9 with SMTP id d2e1a72fcca58-70629cf6a33mr2553824b3a.30.1718812230417;
        Wed, 19 Jun 2024 08:50:30 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc8:6da5:5a28:6118:91d6:c407])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-705ccb3cdc6sm10813934b3a.138.2024.06.19.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:50:29 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: convert to dt schema
Date: Wed, 19 Jun 2024 21:19:36 +0530
Message-ID: <20240619154941.144011-2-kanakshilledar@gmail.com>
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
 .../devicetree/bindings/i2c/i2c-lpc2k.txt     | 33 ----------
 .../bindings/i2c/nxp,lpc1788-i2c.yaml         | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 33 deletions(-)
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
index 000000000000..79d6774dd54f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
@@ -0,0 +1,66 @@
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
+    description: physical address and length of the device registers
+    maxItems: 1
+
+  interrupts:
+    description: a single interrupt specifier
+    maxItems: 1
+
+  clocks:
+    description: clock for the device
+    maxItems: 1
+
+  clock-frequency:
+    description: the desired I2C bus clock frequency in Hz
+    default: 100000
+
+  resets:
+    description: reset for the device
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
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
-- 
2.45.2


