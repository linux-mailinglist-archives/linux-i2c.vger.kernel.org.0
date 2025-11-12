Return-Path: <linux-i2c+bounces-14065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F0C513D4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 09:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07FD1899438
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 08:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479B02FE589;
	Wed, 12 Nov 2025 08:57:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754C2FE045;
	Wed, 12 Nov 2025 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937825; cv=none; b=DR2OkreEhaEjXNIFONix5ykdnHphzHl0anUr5tuprJ8dp0f3LKjm4XDomMdcGJblEQzaxmSeJQ2UUc/7UmzxkVVAMjGtXl6sISt/x/sgStAW2w34Fw4FkYwj46LivEzW2hONphcXGzuKbcBBvfrYkrUXSh05gO21Q4awu9sVkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937825; c=relaxed/simple;
	bh=D/rnsmXBdLdXxUTIwgzfX880utKKS+SBQBA+QXiy44Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huDdjlkR18e3LdebE0s9KSLr7CRYZXyihp2EIIoITu4ReEsLcKxCNx2s/hfdRzuJnK0XYFK29JJCmGn2a71CRzMt7qtmRMStjPM5aE7p3yYhhbB9J2q29zhACVczPS8mkZX1lmgACjfNTVm7uWscK5Z7QtNl9EqGBORCXKiKHus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 12 Nov
 2025 16:56:50 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 12 Nov 2025 16:56:50 +0800
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
Subject: [PATCH v22 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs and transfer-mode properties
Date: Wed, 12 Nov 2025 16:56:47 +0800
Message-ID: <20251112085649.1903631-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112085649.1903631-1-ryan_chen@aspeedtech.com>
References: <20251112085649.1903631-1-ryan_chen@aspeedtech.com>
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
 .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index e6ed84c53639..89ae7cb2c772 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -42,6 +42,33 @@ properties:
   resets:
     maxItems: 1
 
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
@@ -64,4 +91,6 @@ examples:
       resets = <&syscon ASPEED_RESET_I2C>;
       clock-frequency = <100000>;
       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,global-regs = <&i2c_global>;
+      aspeed,transfer-mode = "buffer";
     };
-- 
2.34.1


