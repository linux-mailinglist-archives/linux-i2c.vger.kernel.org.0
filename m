Return-Path: <linux-i2c+bounces-7160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E598CD85
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160AC1C211EC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9511193437;
	Wed,  2 Oct 2024 07:02:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0B16F27E;
	Wed,  2 Oct 2024 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727852547; cv=none; b=B89EsnWDm17n+r/YAFJ+aSlbIw3rTDlYPWjQT38ydUQlkU19ANjCo4vRyOhBU0AlLjag0leYwjdmbni1XKMTmCP8ds2jKFbXl2uOw4SO7biOPwZk/zYXFSubU7w0gAzmssHLqvd9cwPaNbyC6Aa+GHdxhYQCRDCLWh7SwrY47GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727852547; c=relaxed/simple;
	bh=gL5P2LFCy9cfkiLJQvYGwMfghJDL7YYWnVxa6R6505A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zz3dpETIET5EPFqOLwzaHpGpO3w2HQOwasNmig9p6kQlvol93XUWDuYXUJGkDteFeLplXeMhqJeQ5DFmititjRs6QSbyhnXC3XJFvZVwFzi4qFPlt5UjqwzHpE+lFEbzqS8oX3MIcsqCLc2zZyMIPDowc5yZw/UQUXOHfsvymZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 2 Oct
 2024 15:02:14 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 2 Oct 2024 15:02:14 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<ryan_chen@aspeedtech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 1/3] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date: Wed, 2 Oct 2024 15:02:11 +0800
Message-ID: <20241002070213.1165263-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
and description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index 6df27b47b922..6c16fc76c978 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -9,9 +9,6 @@ title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
     enum:
@@ -49,12 +46,50 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,enable-dma:
+    type: boolean
+    description: |
+      I2C bus enable dma mode transfer.
+
+      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
+      single DMA engine. DTS files can specify the data transfer mode to/from
+      the device, either DMA or programmed I/O. However, hardware limitations
+      may require a DTS to manually allocate which controller can use DMA mode.
+      The "aspeed,enable-dma" property allows control of this.
+
+      In cases where one the hardware design results in a specific
+      controller handling a larger amount of data, a DTS would likely
+      enable DMA mode for that one controller.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
 required:
   - reg
   - compatible
   - clocks
   - resets
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-i2cv2
+
+    then:
+      properties:
+        reg:
+          minItems: 2
+      required:
+        - aspeed,global-regs
+    else:
+      properties:
+        aspeed,global-regs: false
+        aspeed,enable-dma: false
+
 unevaluatedProperties: false
 
 examples:
@@ -71,3 +106,13 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1


