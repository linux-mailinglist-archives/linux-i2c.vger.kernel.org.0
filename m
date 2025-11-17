Return-Path: <linux-i2c+bounces-14100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBAC6225C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 03:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1423E34A72C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 02:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8B25B687;
	Mon, 17 Nov 2025 02:50:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7816253F05;
	Mon, 17 Nov 2025 02:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347855; cv=none; b=OJsJIJMg6FcWiCJ+VAmAf/y8stCQEBuvd7/830m5QktsAeqF3BSsmxVsztJjC7q0WZdw5PyyT7p8pfLg58i9Ga/cZIxToT5WQq7oR2AFiQe2BgyB3EYnyFLp3s+4BRXx/x+VBAHKL+YXZvg2XbRsg5x/5+eb1Frx85ZsizTBPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347855; c=relaxed/simple;
	bh=ORqC5ZkvkX9YGsALHU6QY72k+qsGTd3lt+Iou5gCTes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lapiAI9StfhWIHSpXj1nJ5Hebkg1710wHVM1sDx8dCblpKIThzziLykvr1fpIdFZYXALjaRPIHes7n4XED9MT1s4fuu/bCOmuiJ/sADwmZOQxratJtsHljJLTMuG/G8+aPwV1gHief05ZtVHCa3dNuCqtEL1Zp3Lz2aKTZEseD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 10:50:41 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 10:50:41 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<andriy.shevchenko@linux.intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <jk@codeconstruct.com.au>,
	<andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v23 1/4] dt-bindings: i2c: Split AST2600 binding into a new YAML
Date: Mon, 17 Nov 2025 10:50:37 +0800
Message-ID: <20251117025040.3622984-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117025040.3622984-1-ryan_chen@aspeedtech.com>
References: <20251117025040.3622984-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The AST2600 I2C controller introduces a completely new register
map and Separate control/target register sets, unlike the mixed
layout used in AST2400/AST2500.

In addition, at new AST2600 configuration registers and transfer
modes require new DT properties, which are incompatible with
existing bindings. Therefore, this creates a dedicated binding
file for AST2600 to properly describe these new hardware
capabilities.

A subsequent change will modify this new binding to properly
describe the AST2600 hardware.

The example section updated to reflect the actual AST2600 SoC
register layout and interrupt configuration.
Reference: aspeed-g6.dtsi (lines 885-897)

-I2C bus and buffer register offsets
 - AST2600 I2C controller register base starts from 0x80, and the
   buffer region is located at 0xc00, as defined in AST2600 SOC
   register map.

-Interrupt configuration
 - AST2600 I2C controller are connected to ARM GIC interrupt
   controller rather than the legacy internal interrupt controller.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 66 +++++++++++++++++++
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
 2 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
new file mode 100644
index 000000000000..c98deab6a977
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED I2C on the AST26XX SoCs
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-i2c-bus
+
+  reg:
+    items:
+      - description: controller registers
+      - description: controller buffer space
+
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      root clock of bus, should reference the APB
+      clock in the second cell
+
+  clock-frequency:
+    description: Desired operating frequency of the I2C bus in Hz.
+    minimum: 500
+    maximum: 4000000
+    default: 100000
+
+  resets:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@80 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      clock-frequency = <100000>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..d4e4f412feba 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
+title: ASPEED I2C on the AST24XX, AST25XX SoCs
 
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
@@ -17,7 +17,6 @@ properties:
     enum:
       - aspeed,ast2400-i2c-bus
       - aspeed,ast2500-i2c-bus
-      - aspeed,ast2600-i2c-bus
 
   reg:
     minItems: 1
-- 
2.34.1


