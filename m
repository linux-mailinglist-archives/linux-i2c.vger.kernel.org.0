Return-Path: <linux-i2c+bounces-10771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDBAA9633
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56A817A6E2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2E525E838;
	Mon,  5 May 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2L9k+WP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED025D527;
	Mon,  5 May 2025 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456371; cv=none; b=Lya4TVhU6c5gCQQF1fAhpveNb9cWGluXOOcTUcQp1fhK08VubVv4jFvs5VIKBORHrVv4Mu3wUnpdmaisdPf9lfdhTu8zMk+3MH1nDcMgcTMk4+Kp/sdETqJzlBcXA6qeKm2sXfZQ4hLiGTdoJOtX0ZCqd/X28juUAfckmU28wSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456371; c=relaxed/simple;
	bh=x7tnnriKWWyb+OOuz9Jm2Bv/3oa5SNZPvGNweMUWMIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwlFcIltw8DbJeYFJYRWiZXl0tqRiR7WEOjtU++OHack2btzzsowbZ4N665l4IKeb7iFks0cEpiukMhVvphAI4uwDHnqnyEk3UUmXY6WiVETYrZ6GLEW2CgO5dyeKiX4iWUQxJz2hlVkkyEX4EIo4ft4U8y85yboQ27migknT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2L9k+WP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC7CC4CEEF;
	Mon,  5 May 2025 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456371;
	bh=x7tnnriKWWyb+OOuz9Jm2Bv/3oa5SNZPvGNweMUWMIU=;
	h=From:To:Cc:Subject:Date:From;
	b=g2L9k+WPZ+3OvN9rVu72Dcp1LHEzvAtWshioq4cwfDRz5dhPuLGkql2COEPoTeti1
	 r6Wyz8I2gy/Rd76okDAVba4h1+yPlgChYIS6+VhXkhkZXfgMHuGPS740zXIoI1k7qG
	 +AJLi/QkoKqnk/f4Ew/DXA7Iv96yQIS/dp7Gk2oKzEE1dJhsDNThHTJL0wjBIwYGv2
	 JLPSd7yrxNnr+OXhYtLrOCstGa1Y+kIanVT5Zoh6sBPFEz8wBYu6u7JyFan7cAcc9A
	 BSJhVVLA1p6xCZZ1q5EiDISbBzSQaJU1Oamejd/CNuc4ACSFN8p/AA7NrXwPdcIZPY
	 xo9hqlVu8qB8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert aspeed,ast2400-i2c-ic to DT schema
Date: Mon,  5 May 2025 09:46:04 -0500
Message-ID: <20250505144605.1287121-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Aspeed I2C interrupt controller binding to schema format.

Drop the "#address-cells" and "#size-cells" as they are unused and
incorrect anyways.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../aspeed,ast2400-i2c-ic.txt                 | 25 ----------
 .../aspeed,ast2400-i2c-ic.yaml                | 46 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
deleted file mode 100644
index 033cc82e5684..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Device tree configuration for the I2C Interrupt Controller on the AST24XX and
-AST25XX SoCs.
-
-Required Properties:
-- #address-cells	: should be 1
-- #size-cells 		: should be 1
-- #interrupt-cells 	: should be 1
-- compatible 		: should be "aspeed,ast2400-i2c-ic"
-			  or "aspeed,ast2500-i2c-ic"
-- reg			: address start and range of controller
-- interrupts		: interrupt number
-- interrupt-controller	: denotes that the controller receives and fires
-			  new interrupts for child busses
-
-Example:
-
-i2c_ic: interrupt-controller@0 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#interrupt-cells = <1>;
-	compatible = "aspeed,ast2400-i2c-ic";
-	reg = <0x0 0x40>;
-	interrupts = <12>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
new file mode 100644
index 000000000000..6cff6a7231bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2400-i2c-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed I2C Interrupt Controller (AST24XX/AST25XX)
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-i2c-ic
+      - aspeed,ast2500-i2c-ic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@0 {
+        compatible = "aspeed,ast2400-i2c-ic";
+        reg = <0x0 0x40>;
+        #interrupt-cells = <1>;
+        interrupts = <12>;
+        interrupt-controller;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b830dfeaa05f..9e37f0c14496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2328,7 +2328,7 @@ L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
-F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
 F:	drivers/i2c/busses/i2c-aspeed.c
 F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
-- 
2.47.2


