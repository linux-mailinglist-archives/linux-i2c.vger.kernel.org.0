Return-Path: <linux-i2c+bounces-2381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FF87E58F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 10:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34FE281F92
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5A32C684;
	Mon, 18 Mar 2024 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfwgfKUy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F092C1A5;
	Mon, 18 Mar 2024 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753591; cv=none; b=MW8TTwzAv1DLIqNvxEpGORxSjiXJbZUPzmtmUeAlrYaEMH3jvj0gkXatbLza3eviMXgZ1POWQIpI9zi+dlRs2lTWMNssx8lwhN9TpdIL2Pbn39OLFql6oRvEmn4u+kuPT5cGbY7qjDxlfXKfs90rEKU7fjgZ/vScIIss8dCp894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753591; c=relaxed/simple;
	bh=0/bH2v1SxnlMvU1gNmRHoh/bUh7CS6a4DhRrchxagAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z6K37FZejsxaHz1jZb8NKa2JAjC4kC2VBkLn9bi3EYvhW9d/O2sSW6MCDaSIwoWcvc7XpUKtOnD4ZGLsJUccxmS5+kal9jz7UxJU+D4j6Wo9nqI4ah14XQR8GhgW+SjRxoGwgcck3FlhDyRw82tJg6QudMujvgzxS8D7xB+EK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfwgfKUy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29dee60302fso1901040a91.1;
        Mon, 18 Mar 2024 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710753589; x=1711358389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5KrBHzMj0MJ+9ueUnX5Wp5wwIc33dtSo5xG4fIvxfRI=;
        b=mfwgfKUyjqOv/caqbpeVbrZZ/zF0VazNs4Q4g9KCLn+QUVYcdMkCDup7Z15RdiP47V
         AsucfenBcJ+L01yMU8WiUIJ9kQpQ2OGKDcQaiJ0B5AognXIdnryfQiYgjsZeDJp0hBha
         Q+iFJ1mLrBuw1Gp7cJ/1h7LAMaDguux8u2w8cJEZmlU/NIEX6TmcTPZ67iPchMFSi0n7
         zCI/T96+TQLfMBUNTu9XpaVj+NynHkrfEqgwa9bwYIESrRheFRz3vBVZqJhHllkou/Zm
         CVuBPyweuiVPnZUH5V3YDX+2WmdJBYrN1xFTcGUZuXbMLiGcLrGFs12jM7MGxJAliJTd
         7O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753589; x=1711358389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KrBHzMj0MJ+9ueUnX5Wp5wwIc33dtSo5xG4fIvxfRI=;
        b=ZuvKCXH2yft2mCAfM38dQf9JDvvuhfo4/THDofuk6MS9uEVaVjejCh+vV5y6modjdZ
         QsfpjJNYlNZDU6m+urDQyDXsypkNaSImonzypnCeXKK4340PvqwCvsbCoaPx3uqi45KZ
         blLpIZsBluHz6z2SaR+jm6qIXX9yG/cOR/vjokgblDMvmHDu743OUYLQRaii6qpvCw17
         i5rn7G5/3sFkF8R90+TFwjyaE3lXDSQSYxZ8RZzxcVjLkcfe6QnDn+f2ubsCSZ0n3KZG
         ZCoOTO5gddZTW6b8LGpNcayeCgi4Vz1YWGPnHCq/aor5xbRWAIJFr6232gfCQwD68a+z
         o4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD6f8Mj1f/mRaoh16j4Vd4KzveVUXKZaZuYsOo9DOoJWiNsGjZsvFayPmZ5Qp/+mZFypxI7lzJ1GXplFZT1rz72GMg0MfiQyQDb72iHKsVpJq8/LkIKOXNlGkz2k+gjdATtumqdwRZMWlhRBPQ20EcgmcxI3kXzTkpp9/0xyKL6fmjqw==
X-Gm-Message-State: AOJu0Yw8BIbUHoFddOww6PKzHSSJBjDuOI71ggscMxEOr3Jq4PX4tbb/
	kywx17PrDtbCuRZr5yAwmZw44KWWk/dX0ZrAn6gVdyXkO3P1AlUK
X-Google-Smtp-Source: AGHT+IHxe5taQmN4p+oWcyEX3XvgTtq3vfnZc/v/1M/WCqshdn8lhwKji+zC2ZGKKhGioVvuVzv76g==
X-Received: by 2002:a17:90b:4f90:b0:29f:b10b:5fc1 with SMTP id qe16-20020a17090b4f9000b0029fb10b5fc1mr2581170pjb.8.1710753589200;
        Mon, 18 Mar 2024 02:19:49 -0700 (PDT)
Received: from localhost.localdomain ([122.187.117.179])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090abe0a00b0029c61521eb5sm7076532pjs.43.2024.03.18.02.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 02:19:48 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: nxp,i2c-pnx: Convert to dtschema
Date: Mon, 18 Mar 2024 14:49:05 +0530
Message-ID: <20240318091911.13426-1-animeshagarwal28@gmail.com>
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
 .../devicetree/bindings/i2c/i2c-pnx.txt       | 34 ------------
 .../devicetree/bindings/i2c/nxp,i2c-pnx.yaml  | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml

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
diff --git a/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml b/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml
new file mode 100644
index 000000000000..b44e4f995b73
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,i2c-pnx.yaml#
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+    i2c1: i2c@400a0000 {
+        compatible = "nxp,pnx-i2c";
+        reg = <0x400a0000 0x100>;
+        interrupt-parent = <&mic>;
+        interrupts = <51 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.44.0


