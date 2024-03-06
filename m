Return-Path: <linux-i2c+bounces-2225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AB873DF4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50A4BB23F11
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A129B13EFF3;
	Wed,  6 Mar 2024 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mqPB3YpA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2DE1361C1;
	Wed,  6 Mar 2024 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747975; cv=none; b=fRsW4Ft+ym+UrYri6+CufcyGzqt6epASpyOuspWHqd8y6rGGqp259jw8M03TH4J4Wzqn1gd1zAS7q186UpeiCEiQ+WNz0Yfj2bNuCOzBMtuLV6xjOPe4gQFHU/jbMpalOsQjuf1awb2MgOKSMpFavIOk1d5ysCvA93KWC2Ukj/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747975; c=relaxed/simple;
	bh=db/EhOo99keFp7glvvPrWzruTiq2FzpZdxxWEEzc3Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/JJDiEhnkuvI7J8OgpWs3pQlAEmFMZl4jm3rFKheHfSLBA6qod2x1U1vprpyWyDPK7PkTAk8QQ3LpBHcxbnuzjQY/drwYWYk8NtaoSjMi5ubRmyysXaZRBvwpWuAOYh1yZzXUOgJ/lSe3YmOH2Z67puy0AaCmYVIp70TJrLjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mqPB3YpA; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BB4F40007;
	Wed,  6 Mar 2024 17:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40IK1rIa0NCsanKJIItd4Iag1sxSHlN8ItGNUBkuB1c=;
	b=mqPB3YpAemlMQxiVfvmr6lvD+gYCHUvoXOf5+p/AhmQ9K+wtnWE8gGYsspwKVyl2+r/2Yf
	/COgKEpiKlIAqykj1/ErDrv57lEfxsDWovDOcEPxzwYgrAwtrjaj7M3SreO9CellKj0/WA
	Qxdw8OhTdZjNT31QvjAjhqpoD4JwwIopES8iLTu3jRgUioaXYYGBRd1kP1b3H67HOq4tLU
	bfb5F6JHrDNAqmPcBkqISq4K6aDHJnzAiBwZtA9w5GFNCicQBuduqhFUE4uJGYRm6euRPE
	ls+Dx0NDunKhop8pmMtXUy5SrMK5Bzh6wmYxIapTGwyMKFd37MRWhJ1SttL2Lw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:21 +0100
Subject: [PATCH v3 01/11] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-1-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
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
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 49 +++++++++++++++++++---
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 16024415a4a7..44c54b162bb1 100644
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
@@ -24,21 +21,23 @@ select:
       contains:
         enum:
           - st,nomadik-i2c
+          - mobileye,eyeq5-i2c
   required:
     - compatible
 
 properties:
   compatible:
     oneOf:
-      # The variant found in STn8815
       - items:
           - const: st,nomadik-i2c
           - const: arm,primecell
-      # The variant found in DB8500
       - items:
           - const: stericsson,db8500-i2c
           - const: st,nomadik-i2c
           - const: arm,primecell
+      - items:
+          - const: mobileye,eyeq5-i2c
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -55,7 +54,7 @@ properties:
       - items:
           - const: mclk
           - const: apb_pclk
-      # Clock name in DB8500
+      # Clock name in DB8500 or EyeQ5
       - items:
           - const: i2cclk
           - const: apb_pclk
@@ -70,6 +69,16 @@ properties:
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
@@ -79,6 +88,20 @@ required:
 
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
@@ -111,5 +134,19 @@ examples:
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


