Return-Path: <linux-i2c+bounces-11514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB5ADE571
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 10:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F9DC7A1ECD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 08:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393ED27F4CB;
	Wed, 18 Jun 2025 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cV6ccwfM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48C27EFF9;
	Wed, 18 Jun 2025 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235010; cv=none; b=AK73U41o0//Sqbc44qADrM1Y7h9cgSyWheA0OqPFlYUNqEra+CZKH1KU4GsZ2L+HiHPnZ+IQhc2vZBvXo0tVga1HSdJWOEFScnE3APCkYkxAoed41ifyMdFsLy/rLO8Di6KkxAKeUDFExAWCQ0iIK+sZcxtUQnLRLEy5L/Hsmz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235010; c=relaxed/simple;
	bh=hgfpYcsEljxEd1bZa0sO5OOQlAVcZKWfL9Eh6kUTjRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ny3nPUr6KZnmzjPBtKwuMEBoha9NXBADAzdXAot7u62057fpS936iyrR0Nx7p14F+rHOMmjiJcu4ZWSFYK4ARayS21BvVXUb2yB7vFv5WP4iv2FvvnDQC0TovIkLOuaDt+t4CBVfR2AYuV9dJdB8CoX6GPSm+L6tXWTTEDST/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cV6ccwfM; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id BA65844339;
	Wed, 18 Jun 2025 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750235005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eWbuIkx1HJ3sxkyzCu4pbFxB8FyTj9ryw6j6Dn+ZMk=;
	b=cV6ccwfM2IEVSAzdLuSOS5XZ0XTMjSp0yq5SGgdxrkZuE5yCLxWq/A/BRU+SZOjvKAfqT8
	nV4B6gqB+kJFltF3yIIZ5Tx0TKv9bo2+LEflxYDrNZNS0ieXIw4/E5C+wzxOZI3I4F370x
	J+41GwfiSSTg75uFkCO1CYhbF3stGX+MApWoCwr1oyiKYpJM9JWD1tjuReQi7o8YvxZ0VD
	hhJcPdnJjnL/wC4PjM4N3Yif25iaowPF2bdOOb5rQWlk8HYoWjlodGuFh4NjgtR2Qfi2z/
	0UYTX2W8xb49ado+LRSk4HRyWN4Ffl90Y9AixkOodWvlk2Fkgn6h0zJpyMEuRw==
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Date: Wed, 18 Jun 2025 10:23:12 +0200
Message-ID: <20250618082313.549140-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618082313.549140-1-herve.codina@bootlin.com>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

An I2C bus can be wired to the connector and allows an add-on board to
connect additional I2C devices to this bus.

Those additional I2C devices could be described as sub-nodes of the I2C
bus controller node however for hotplug connectors described via device
tree overlays there is additional level of indirection, which is needed
to decouple the overlay and the base tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 {
      compatible = "xyz,foo";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_ctrl>;
      };
      ...
  };

  i2c5: i2c@cafe0000 {
      compatible = "xyz,bar";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_sensors>;
      };
      ...
  };

  connector {
      i2c_ctrl: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };

      i2c_sensors: i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

  --- device tree overlay ---

  ...
  // This node will overlay on the i2c-ctrl node of the base tree
  i2c-ctrl {
      eeprom@50 { compatible = "atmel,24c64"; ... };
  };
  ...

  --- resulting device tree ---

  i2c1: i2c@abcd0000 {
      compatible = "xyz,foo";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_ctrl>;
      };
      ...
  };

  i2c5: i2c@cafe0000 {
      compatible = "xyz,bar";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_sensors>;
      };
      ...
  };

  connector {
      i2c_ctrl: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;

          eeprom@50 { compatible = "atmel,24c64"; ... };
      };

      i2c_sensors: i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
that is on the hot-pluggable add-on. On hot-plugging it will physically
connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
node an "extension node".

In order to decouple the overlay from the base tree, the I2C adapter
(i2c@abcd0000) and the extension node (i2c-ctrl) are separate nodes.

The extension node is linked to the I2C bus controller in two ways. The
first one with the i2c-bus-extension available in I2C controller
sub-node and the second one with the i2c-parent property available in
the extension node itself.

The purpose of those two links is to provide the link in both direction
from the I2C controller to the I2C extension and from the I2C extension
to the I2C controller.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Ayush Singh <ayush@beagleboard.org>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 8488edd..8ab7fec 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -30,6 +30,13 @@ properties:
     minimum: 1
     maximum: 5000000
 
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      In case of an I2C bus extension, reference to the I2C bus controller
+      this extension is connected to. In other word, reference the I2C bus
+      controller on the fixed side that drives the bus extension.
+
   i2c-scl-falling-time-ns:
     description:
       Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
@@ -159,6 +166,25 @@ allOf:
         - i2c-scl-has-clk-low-timeout
 
 patternProperties:
+  'i2c-bus-extension@[0-9a-f]+$':
+    type: object
+    description:
+      An I2C bus extension connected to an I2C bus. Those extensions allow to
+      decouple I2C busses when they are wired to connectors.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      i2c-bus:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Reference to the extension bus.
+
+    required:
+      - reg
+      - i2c-bus
+
   '@[0-9a-f]+$':
     type: object
 
@@ -221,3 +247,44 @@ dependentRequired:
   i2c-digital-filter-width-ns: [ i2c-digital-filter ]
 
 additionalProperties: true
+
+examples:
+  # I2C bus extension example involving an I2C bus controller and a connector.
+  #
+  #  +--------------+     +-------------+     +-------------+
+  #  | i2c@abcd0000 |     |  Connector  |     | Addon board |
+  #  |    (i2c1)    +-----+ (i2c-addon) +-----+ (device@10) |
+  #  |              |     |             |     |             |
+  #  +--------------+     +-------------+     +-------------+
+  #
+  # The i2c1 I2C bus is wired from a I2C controller to a connector. It is
+  # identified at connector level as i2c-addon bus.
+  # An addon board can be connected to this connector and connects a device
+  # (device@10) to this i2c-addon extension bus.
+  - |
+    i2c1: i2c@abcd0000 {
+        compatible = "xyz,i2c-ctrl";
+        reg = <0xabcd0000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-bus-extension@0 {
+            reg = <0>;
+            i2c-bus = <&i2c_addon>;
+        };
+    };
+
+    connector {
+        i2c_addon: i2c-addon {
+            i2c-parent = <&i2c1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            device@10 {
+                compatible = "xyz,foo";
+                reg = <0x10>;
+            };
+        };
+    };
+
+...
-- 
2.49.0


