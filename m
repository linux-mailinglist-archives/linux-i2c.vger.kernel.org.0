Return-Path: <linux-i2c+bounces-13828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F6C0BEC4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 07:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E03C63471F8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477C22DC788;
	Mon, 27 Oct 2025 06:12:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF952DC321;
	Mon, 27 Oct 2025 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545578; cv=none; b=NXoXDU0Rry5plhKGcP2QXupqoPne1ycfvz/c1gtS3XufBI4JAOqd4mTvvO07DzFYyGjtXyLKZviaSSgvtfkyqUEX4KLF+XVlSzfnKhTin3QcccbsXCodPcegXj00Qm2dBwAfsbeq6PsSLOf/JXtOoU8rUqqixgD6RP+uFlq3IbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545578; c=relaxed/simple;
	bh=jqpZbd4q3nUpCQlAQ+26SauJYj9DPMDchqm3y1tdd/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqWEdxTWtqJ3Yb41x41RNPePSEuH6n4ZV6Evrbd4F9gCWfLGBsBT9tsc+an1MwYkWdgm/2OQydopiGHfGWoUIzu9s7St3YOcKp2sFHtAfkQC22LrFe3WXPbEQ8w5d5w+c00lbv1bEv+m0o9U7KpGr8UWLGZFDDQv3jfkYxocQF0=
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
Subject: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs and transfer-mode properties
Date: Mon, 27 Oct 2025 14:12:38 +0800
Message-ID: <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
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

The AST2600 I2C controller supports three transfer modes: byte,
buffer, and DMA. To allow board designers and firmware to
explicitly select the preferred transfer mode for each controller
instance. "aspeed,transfer-mode" to allow device tree to specify
the desired transfer method used by each I2C controller instance.

And AST2600 i2c controller have two register mode, one is legacy
register layout which is mix controller/target register control
together, another is new mode which is separate controller/target
register control.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
index 6ddcec5decdc..9fd6976cd622 100644
--- a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
@@ -42,11 +42,39 @@ properties:
     description: frequency of the bus clock in Hz defaults to 100 kHz when not
       specified
 
+  aspeed,transfer-mode:
+    description: |
+      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
+      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
+      share a DMA engine.
+      Select I2C transfer mode for this controller. Supported values are:
+        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
+        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
+                    Better performance then byte mode.
+        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
+                 provides a single DMA engine shared for 16 I2C controllers,
+                 so only a limited number of controllers can use DMA simultaneously.
+                 Therefore, the DTS must explicitly assign which controllers are
+                 configured to use DMA.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
   - clocks
   - resets
+  - aspeed,global-regs
 
 unevaluatedProperties: false
 
@@ -57,10 +85,12 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "aspeed,ast2600-i2c-bus";
-      reg = <0x40 0x40>;
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
       clocks = <&syscon ASPEED_CLK_APB>;
       resets = <&syscon ASPEED_RESET_I2C>;
       bus-frequency = <100000>;
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
+      aspeed,transfer-mode = "buffer";
     };
-- 
2.34.1


