Return-Path: <linux-i2c+bounces-12289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B49B25F49
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 10:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3949E6B37
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 08:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F41A2EA472;
	Thu, 14 Aug 2025 08:42:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE22E9EDE;
	Thu, 14 Aug 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160928; cv=none; b=bVqcyVzfxVRN0fnOwrt25qOJoWAKruYIrcN0kcdjjUEluCfr7VEP+1gz1SWZ44yFpy6wAeRt7MCCWQAnhSJaN2s1M6+22XHCbNkqbekCzaCmK+wvVVci7Sf8Ag1hnZo5tekaHeKrq5Y8rge2c3f9wL9w0smldKS5u+EJNN3LSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160928; c=relaxed/simple;
	bh=smK9IYCGhSxJCQknkWXC+KC4uX6gn0ta+yWgGsDGdVE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nbo4xX6aXWuRCS6iwJnDCn3AkAibP06Rx0N/M+dupwq6r6jYLPgM2aTQdrlTpeczCIY9qUYW0wM3YMQRtd0CFq12unss5zHZXVk33B9t28/rRhGgTGYDp8qpWWBBChzBHmGmx4QaJG4RR/0dRyf4m9d4LAcQyx7A4Mvb1wfIfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 16:41:56 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 14 Aug 2025 16:41:56 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add transfer-mode and global-regs properties and update example
Date: Thu, 14 Aug 2025 16:41:54 +0800
Message-ID: <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add property "aspeed,global-regs" to get phandle set global
register, for register mode selection and clock divider control.
- Add an optional property "aspeed,transfer-mode" to
allow device tree to specify the desired transfer method used
by each I2C controller instance.
- Update example to demonstrate usage of 'aspeed,global-regs' and
'aspeed,transfer-mode' for AST2600 I2C controller.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 5b9bd2feda3b..2a9f7d1d2ea1 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -44,6 +44,34 @@ properties:
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
+      Only one mode can be selected per controller.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The phandle of i2c global register node, For control the i2c register
+      define selection, clock divider mode selection and clock divider control.
+
 required:
   - reg
   - compatible
@@ -66,3 +94,14 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2c-bus";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,transfer-mode = "buffer";
+    };
-- 
2.34.1


