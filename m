Return-Path: <linux-i2c+bounces-7893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46B9C209A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 16:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E470285378
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A224421B423;
	Fri,  8 Nov 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EmgdkVTX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998F21A6FE;
	Fri,  8 Nov 2024 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080233; cv=none; b=mTT4D+Hq2nE5aPWfESuSjcYJgbtr4VHRzF1GKx4JkjL0OPO63rmO9PWT6hHvceMXxDiaurLGVmLYZsx3K4EkPXvgQ+b1IXIgienzXC/9BDHsse2mlQTjvq2oljiNkbfGfSYIEPUmAHl95JxrZYpGCOF4ak8BCfmcSX2P619HB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080233; c=relaxed/simple;
	bh=MTY9xEopYlaJ6Ma5ORg47HpjVWl/mUkPHEg2+gJWYy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dz/bXiE5y6aMgyeH7+8Y7aYzwXknTWuyBlR7aFQ2l6jRCESOzZw1LvQNcK355zmHJYLszFgGxO2ldJ0oCWeY9eXV6wqf0JPLTNP8/QpPlXSbR3Wh0pTV5PbeYNU+rgKGKZUKdB2iCFF4whN1sKNqN6gjJtHgBx+x7F/B+1ZGGFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EmgdkVTX; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 557F020002;
	Fri,  8 Nov 2024 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731080229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hhy3CLpNo/bicvB34YCbZy2/E3Zufk2BHGhPhGi+xEM=;
	b=EmgdkVTXDftgSfRZZDCFp2Vv2CsV8UsOjg6VWe4AkPD1iIFccrHAWkUi/oZiS+mQhUoV37
	kCrWIf74JeqpjNRltXIPUMwwn6mwebjDO70ZTshQsoY1I0yXKOVBTXzbcJe+JMiVy3ggCm
	hwFo1hHNAoc8Hwiy2elcH2Vu78/YUq5PoEvut2fiV1HfPrJibxygz8CzZdLjhjZvWAJUIn
	IcLPFYUtKgyJZCKpxyDUqwOis76d4qALsxHDBnfFJZaip9KVDd+M6vSIQ7hSF6czz4h/n3
	tSdXiUShe2Oh+FIn4v6XKLZ/1Y0Y9nalUdHuV9oRFto999fKj+TbNqBDhCZgqg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 08 Nov 2024 16:36:53 +0100
Subject: [PATCH 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fpc202-v1-1-fe42c698bc92@bootlin.com>
References: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
In-Reply-To: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

The FPC202 dual port controller serves as a low speed signal aggregator for
common port types, notably SFP. It provides access to I2C and low-speed
GPIO signals of a downstream device through a single upstream control
interface.

Up to two logical I2C addresses can be accessed on each of the FPC202's
ports. The port controller acts as an I2C translator (ATR). It converts
addresses of incoming and outgoing I2C transactions. One use case of this
is accessing two SFP modules at logical address 0x50 from the same upstream
I2C controller, using two different client aliases.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/misc/ti,fpc202.yaml        | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ad11abe11e68aa266acdd6b43a5b425340bbbba8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/ti,fpc202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI FPC202 dual port controller with expanded IOs
+
+maintainers:
+  - Romain Gantois <romain.gantois@bootlin.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+properties:
+  compatible:
+    const: ti,fpc202
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  enable-gpios:
+    description:
+      Specifier for the GPIO connected to the EN pin.
+    maxItems: 1
+
+  port0:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    description:
+      Device port 0, accessible over I2C.
+
+  port1:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    description:
+      Device port 1, accessible over I2C.
+
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fpc202: i2c-mux@f {
+            compatible = "ti,fpc202";
+            reg = <0xf>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            port0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+
+            port1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
+...

-- 
2.47.0


