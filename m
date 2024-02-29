Return-Path: <linux-i2c+bounces-2061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7586D192
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FADCB249D6
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0020E7A122;
	Thu, 29 Feb 2024 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AnGjFFU5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697416063E;
	Thu, 29 Feb 2024 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230257; cv=none; b=NeAjAltCKbmqh4jsMVpetfvCyTWUmYAxMxmADdzaKvVXve8yg2VrQ1QnbO72RfZ+B8umgy6LQoxqwyQMR1cc3oRuY+LySJjBAUFBDSX5WSpOsCvk+bigkjuTKdyMOWQKp4guWcPoEUjYRYqvb8+PFTFKUb+fgGBXq1C93K5kofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230257; c=relaxed/simple;
	bh=LpFcuLraRe7BWVqNKjqBpF37d0hNa+NEq3AANyBCH1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTyk7sbyA/0y1VAt/zlJ/Vh8wFyw388tJsqmaUJq0vWnjgGI5IG325xkACE5xAJpGeh3HcU4dd+o2zDpvI6dbv3hFD5N5cxilMOb0kzOKPRSy+52OPnqd+2lSLICIxjy68lmn7h4X5ivUuBXX59hUV1yQD0Pu0EWpOJ0mI1o478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AnGjFFU5; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AC7960005;
	Thu, 29 Feb 2024 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3ykZDJuu5yB2cRXMdYcgz6EH3xu6RTNJDgFxtnNhQg=;
	b=AnGjFFU5zZr3ArMGU/5d4Enuu9hYz1+7wRNU1/Prf4Nv+2jOwLj1XOcolR7kjGHFZw63BU
	/pSVN9IOVRi8Ehkpultv1rt3p+iavsRMwKLm2YBQC1P9iuxF/ZfC+mXilEV+ytZMkwZKuf
	tGhDJpdndAF/p/kORhg1Zecv9jbGFLSlGX+rGr5247PUQuUhzOl2SEBaroz6VF5ITZKeu4
	WIbxdrM7zYiWSjh0PgO8M2aQE0Q1/sEsRAYZDhg9cF42zXSl4wDw3ebf5MXe5ivIBOoAsp
	AzqZUyytLV3djNYFz53Sbc3dqSSgdlVtR9U+pmpsveZ01HJlvrqqlF0jsjIKhg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:49 +0100
Subject: [PATCH v2 01/11] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-1-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the
EyeQ5-specific property behind a conditional. Add an example for this
compatible.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 48 ++++++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 16024415a4a7..2d9d5b276762 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -14,9 +14,6 @@ description: The Nomadik I2C host controller began its life in the ST
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
   properties:
@@ -24,6 +21,7 @@ select:
       contains:
         enum:
           - st,nomadik-i2c
+          - mobileye,eyeq5-i2c
   required:
     - compatible
 
@@ -39,6 +37,10 @@ properties:
           - const: stericsson,db8500-i2c
           - const: st,nomadik-i2c
           - const: arm,primecell
+      # The variant found on Mobileye EyeQ5
+      - items:
+          - const: mobileye,eyeq5-i2c
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -55,7 +57,7 @@ properties:
       - items:
           - const: mclk
           - const: apb_pclk
-      # Clock name in DB8500
+      # Clock name in DB8500 or EyeQ5
       - items:
           - const: i2cclk
           - const: apb_pclk
@@ -70,6 +72,16 @@ properties:
     minimum: 1
     maximum: 400000
 
+  mobileye,olb:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to OLB system controller node.
+          - description: Platform-wide controller ID (integer starting from zero).
+    description:
+      The phandle pointing to OLB system controller node, with the I2C
+      controller index.
+
 required:
   - compatible
   - reg
@@ -79,6 +91,20 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mobileye,eyeq5-i2c
+    then:
+      required:
+        - mobileye,olb
+    else:
+      properties:
+        mobileye,olb: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -111,5 +137,19 @@ examples:
       clocks = <&i2c0clk>, <&pclki2c0>;
       clock-names = "mclk", "apb_pclk";
     };
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    i2c@300000 {
+      compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+      reg = <0x300000 0x1000>;
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&i2c_ser_clk>, <&i2c_clk>;
+      clock-names = "i2cclk", "apb_pclk";
+      mobileye,olb = <&olb 0>;
+    };
 
 ...

-- 
2.44.0


