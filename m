Return-Path: <linux-i2c+bounces-9740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2939A55080
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 17:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59A91892813
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 16:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9500213E73;
	Thu,  6 Mar 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I4zUO+hG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E4212D7D;
	Thu,  6 Mar 2025 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278219; cv=none; b=WwZEmf5A7iRkNIS9STRg+Z5YHq74h+gy8i6LXTnkYm5i0uW4Sh46DxXL5iAijTiuIlnyTyXSbELFTiosQT2y7mmbtqATNtUnjG/3V+vS3ROFlP8dWSC/ILclHNjYElk+pldJITCk906GSXKRYLvh+IJZ/vT4EBnxFA4Bm43vZmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278219; c=relaxed/simple;
	bh=RWqPCbickcf3NeEvAFuVv/cebJHAevvYYSffWUo/kxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mdt4pphUVoAlJG5dCLx6JEHaelus6AekFpZmFi9Ao8wu9PqbdC+o0m1yYcJkNQrBfHAk8FkESrwPFk4cS2v/m3lpfaq8DTkm/KhRwJFp97gBwAUVmLovZCz/fWg6luYEzMCMduJ/15OWPsKgXaaZUh5lqpPEPqe1fqffPAfSfmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I4zUO+hG; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E27B44405;
	Thu,  6 Mar 2025 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741278215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9Dw8MEw6E4S3LOI35bfz6vBrtEq+quc3+6ULKl0+OY=;
	b=I4zUO+hGTe5CQ5tU0DxGmkHBoPFfp55F+XgS4+FriXo9RUIIq7FgHRs2kjvhnEUe1Mc07I
	ZYiJAfZrJgEoCYTOj7k0ozJeRLfljpYg+YOEZdWCBEtCNpBlhbj/8WC/GC/Z9vasyGBwIJ
	l10+6ttDLF7o/O/cK5bFpetfiNMhoU8IWp5DeZ/kQu2mvkSzttJa0x6DbDCoW0aLYZAAFA
	1mmRTaeI60YTDjt0ugulZII7MqXqAhK8v4fcU1POSkj3jBJypMvsT62DBilApBLYMlvj+P
	NgAMHeEXclFHI3Qan5YP2BLZ1NsvYdAP2ndU7Hb7MieVFsPFxsDS/jYKcBn8jw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 06 Mar 2025 17:23:22 +0100
Subject: [PATCH v9 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-fpc202-v9-1-2779af6780f6@bootlin.com>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
In-Reply-To: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitefhjeeljeeuudelffevjeelfeekieehfffffeekgfettdeivddvtdefteeghfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguv
 gdprhgtphhtthhopeguvghmohhnshhinhhguhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/misc/ti,fpc202.yaml        | 94 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a8cb10f2d0df3fa5224f95f6f87467a8bce253bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -0,0 +1,94 @@
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^i2c@[0-1]$":
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    description: Downstream device ports 0 and 1
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Downstream port ID
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-atr@f {
+            compatible = "ti,fpc202";
+            reg = <0xf>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            i2c@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+            };
+
+            i2c@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..4bb13de2b8ebad5180e2bde607dac40f35c51782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23709,6 +23709,12 @@ F:	drivers/misc/tifm*
 F:	drivers/mmc/host/tifm_sd.c
 F:	include/linux/tifm.h
 
+TI FPC202 DUAL PORT CONTROLLER
+M:	Romain Gantois <romain.gantois@bootlin.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/ti,fpc202.yaml
+
 TI FPD-LINK DRIVERS
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	linux-media@vger.kernel.org

-- 
2.48.1


