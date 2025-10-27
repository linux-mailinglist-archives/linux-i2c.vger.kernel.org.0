Return-Path: <linux-i2c+bounces-13827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438FC0BEC1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 07:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F133BA98C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375AA2DAFDD;
	Mon, 27 Oct 2025 06:12:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6694D2DA750;
	Mon, 27 Oct 2025 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545576; cv=none; b=bp233lxsV673/JqwYL/FKQSzPS9CrIF1mGU59vidCJ1qSvne2Tmr6LwdBKoJYysRMCJ+0Q4kKSPuZQFYJiv9j9S9VxzQKdVpNf2vjTeEzjlaOQOO6K9JfJLv2lXuPF4AmdqG1ou37oLjf39BH3ZOVxiOlZmdaQ4C+ESq//O/OnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545576; c=relaxed/simple;
	bh=wNCCoJlJgNS22jCXvv/2NpL73TJfN1paDppLIvXMvkQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkrS2kSVM676F1GppTg02isyzSy7qYmUhhdMtPea7tRz6ToEFQNcjAODNa0Yu1+/onLkG+gZcxhBvfL+baIrVIL7qm+Ndy8l6MHSX6cqJzgDBXLxQlM97GVYhKPb1wFBwc5F658KEhMLox9/uNMOQWBgjKENFLgrCvBNCuGiBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 14:12:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 14:12:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<benh@kernel.crashing.org>, <joel@jms.id.au>, <andi.shyti@kernel.org>,
	<jk@codeconstruct.com.au>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a new YAML
Date: Mon, 27 Oct 2025 14:12:37 +0800
Message-ID: <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
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
existing bindings. Therefore, this patch creates a dedicated
binding file for AST2600 to properly describe these new
hardware capabilities.

A subsequent change will modify this new binding to properly
describe the AST2600 hardware.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
 .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml

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
diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
new file mode 100644
index 000000000000..6ddcec5decdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
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
+    minItems: 1
+    items:
+      - description: address offset and range of bus
+      - description: address offset and range of bus buffer
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
+  resets:
+    maxItems: 1
+
+  bus-frequency:
+    minimum: 500
+    maximum: 4000000
+    default: 100000
+    description: frequency of the bus clock in Hz defaults to 100 kHz when not
+      specified
+
+required:
+  - reg
+  - compatible
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    i2c@40 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x40 0x40>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      bus-frequency = <100000>;
+      interrupts = <0>;
+      interrupt-parent = <&i2c_ic>;
+    };
-- 
2.34.1


