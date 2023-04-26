Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B31C6EF3AA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 13:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240591AbjDZLve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 07:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbjDZLvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 07:51:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE009422D;
        Wed, 26 Apr 2023 04:51:31 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900CFC81;
        Wed, 26 Apr 2023 13:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682509878;
        bh=81HGjweft5pwVjnqXNa6QvnE/hug7iJI6XuCB8189Os=;
        h=From:To:Cc:Subject:Date:From;
        b=IdDSO2ct4izk6gFfkwRkD9TLNGFQsioydCaInw2/dyMD9441zmKwa2SPUcTmknfQS
         ZECtDoe/7bVXkfHLR1j6/z97NTnnjjmknTcm05kN6FcB82fc/8FYIp6YBrj8Zi+/dj
         /YSNHBiez+8/NurHNm1GJbt54S5h6STiTKT366HY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v13 0/8] i2c-atr and FPDLink
Date:   Wed, 26 Apr 2023 14:51:06 +0300
Message-Id: <20230426115114.156696-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

You can find v12 from:

https://lore.kernel.org/all/20230425072601.51031-1-tomi.valkeinen@ideasonboard.com/

Diff to v12 is included below.

The changes are:

- Change the i2c-alias-pool to u32 array. The i2c-atr.c will reject any
  addresses that have bits in the upper 16 bits. This could be changed
  later if those bits are needed.

- Add maxItems to ub960's i2c-alias-pool. ub960 has 4 rx ports, and each
  can have 8 aliases, so the absolute maximum is 32.

 Tomi

Luca Ceresoli (1):
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (7):
  dt-bindings: i2c: Add I2C Address Translator (ATR)
  dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../devicetree/bindings/i2c/i2c-atr.yaml      |   34 +
 .../bindings/media/i2c/ti,ds90ub913.yaml      |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  427 ++
 Documentation/i2c/i2c-address-translators.rst |   96 +
 Documentation/i2c/index.rst                   |    1 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  710 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  906 ++++
 drivers/media/i2c/ds90ub953.c                 | 1400 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4049 +++++++++++++++++
 include/linux/i2c-atr.h                       |  116 +
 include/media/i2c/ds90ub9xx.h                 |   22 +
 17 files changed, 8104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/i2c-address-translators.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

Interdiff against v12:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
index 470cc6c9af35..1939ab339bfc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i2c/i2c-atr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Common i2c address translator properties.
+title: Common i2c address translator properties
 
 maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
@@ -20,7 +20,7 @@ description:
 
 properties:
   i2c-alias-pool:
-    $ref: /schemas/types.yaml#/definitions/uint16-array
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description:
       I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
       used to access the remote peripherals on the serializer's I2C bus. The
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 1d5362bea09a..289737721c2c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -13,6 +13,9 @@ description:
   The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
   forwarding.
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
 properties:
   compatible:
     enum:
@@ -37,7 +40,8 @@ properties:
       Specifier for the GPIO connected to the PDB pin.
 
   i2c-alias-pool:
-    $ref: /schemas/i2c/i2c-atr.yaml#/properties/i2c-alias-pool
+    minItems: 1
+    maxItems: 32
 
   links:
     type: object
@@ -225,7 +229,7 @@ required:
   - clock-names
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -245,7 +249,7 @@ examples:
 
         powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
 
-        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+        i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
 
         ports {
           #address-cells = <1>;
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 402182a04efd..8ca1daadec93 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -428,10 +428,12 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 	struct device *dev = atr->dev;
 	unsigned long *alias_use_mask;
 	size_t num_aliases;
-	u16 *aliases;
+	unsigned int i;
+	u32 *aliases32;
+	u16 *aliases16;
 	int ret;
 
-	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
+	ret = fwnode_property_count_u32(dev_fwnode(dev), "i2c-alias-pool");
 	if (ret < 0) {
 		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
 			ret);
@@ -443,32 +445,56 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 	if (!num_aliases)
 		return 0;
 
-	aliases = kcalloc(num_aliases, sizeof(*aliases), GFP_KERNEL);
-	if (!aliases)
+	aliases32 = kcalloc(num_aliases, sizeof(*aliases32), GFP_KERNEL);
+	if (!aliases32)
 		return -ENOMEM;
 
-	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
-					     aliases, num_aliases);
+	ret = fwnode_property_read_u32_array(dev_fwnode(dev), "i2c-alias-pool",
+					     aliases32, num_aliases);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
 			ret);
-		kfree(aliases);
-		return ret;
+		goto err_free_aliases32;
+	}
+
+	aliases16 = kcalloc(num_aliases, sizeof(*aliases16), GFP_KERNEL);
+	if (!aliases16) {
+		ret = -ENOMEM;
+		goto err_free_aliases32;
+	}
+
+	for (i = 0; i < num_aliases; i++) {
+		if (!(aliases32[i] & 0xffff0000)) {
+			aliases16[i] = aliases32[i];
+			continue;
+		}
+
+		dev_err(dev, "Failed to parse 'i2c-alias-pool' property: I2C flags are not supported\n");
+		ret = -EINVAL;
+		goto err_free_aliases16;
 	}
 
 	alias_use_mask = bitmap_zalloc(num_aliases, GFP_KERNEL);
 	if (!alias_use_mask) {
-		kfree(aliases);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_aliases16;
 	}
 
+	kfree(aliases32);
+
 	atr->num_aliases = num_aliases;
-	atr->aliases = aliases;
+	atr->aliases = aliases16;
 	atr->alias_use_mask = alias_use_mask;
 
 	dev_dbg(dev, "i2c-alias-pool has %zu aliases", atr->num_aliases);
 
 	return 0;
+
+err_free_aliases16:
+	kfree(aliases16);
+err_free_aliases32:
+	kfree(aliases32);
+	return ret;
 }
 
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-- 
2.34.1

