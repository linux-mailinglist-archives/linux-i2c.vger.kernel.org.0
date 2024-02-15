Return-Path: <linux-i2c+bounces-1752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28B856A0A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39BAB2847DE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4F71369A8;
	Thu, 15 Feb 2024 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l50vrPRP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5DB135A7D;
	Thu, 15 Feb 2024 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015959; cv=none; b=Fkt+jCbyJCI/frz5WQXJxrY+KBSWmnMGqbxSj3fZNCWLBOgDqISlUGflEEK1uMSR2gfuUTBl2eY+KEpbygtfObuckjbAkDjHIZU/n/mG8ZiWHn0LpcIkQSWlWVSKa3Fw8TMSX62Z2OhIz2keZvC+ea4dTk0WrgEyu6livClQg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015959; c=relaxed/simple;
	bh=sAOP0dGKvvj+4A9Ryzv3I0eEEQk5PDGf6mivtXPGRFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsxIdKWxF36NL6TtBpMHR8maK3UH3vwoUpTnSGtpeGmYEMiWMuaP2rqA3niH0SY4hHUCSf3gMtneBRusXfurAsGEedxfLNCLzQpVHjdcC29jeb+5LmKTznTRYh4LdfmalBWkooB3OjAgCiwvncQZ3vOXWCo8Zu6Xn05zm5HGKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l50vrPRP; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0D07E000D;
	Thu, 15 Feb 2024 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cLPcJTMJ7JxzGdy5rlF5zI68DecSO20reEkIrekyHo=;
	b=l50vrPRPj0n5yakq096garlZj22Yam4gfE7JxPoei3WBEOqIEPeo9GYdhiQKJqukq+LgmI
	uQ8jerdAEg2uJnLIbvOzwz9ETiDCjaLtlwkcp4kaGmYOlQ7epTBI0YYc+57pvTucbBOU3n
	k/rsShn7ujuo0XRBseBrQ2cuTKy2RaH63zQnOs2nzD/Nk2/l6qWEvRbH2pGqRI6l1r1kM6
	nmDxo/Y/Xs4nr7MY6a7dtGJdXS3DvDZF3m78Jr37NsuHag71yAXmYSO9i3Sn0F+4i4Ac+3
	wNZixGWyPElqSGHQeLnrocczYIxk/UEmG24Bha2KaiUECWg0P8/zuf5a5E4e5Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:09 +0100
Subject: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
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
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the two
EyeQ5-specific properties behind a conditional. Add an example for this
compatible.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 44 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index e6b95e3765ac..eaade14b6d4c 100644
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
@@ -83,6 +85,25 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mobileye,eyeq5-i2c
+    then:
+      properties:
+        mobileye,olb:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: A phandle to the OLB syscon.
+        mobileye,id:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: Platform-wide controller ID (integer starting from zero).
+      required:
+        - mobileye,olb
+        - mobileye,id
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -116,5 +137,20 @@ examples:
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
+      mobileye,olb = <&olb>;
+      mobileye,id = <0>;
+    };
 
 ...

-- 
2.43.1


