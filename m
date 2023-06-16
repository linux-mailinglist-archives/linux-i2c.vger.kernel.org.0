Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C807332BD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbjFPOAM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241049AbjFPOAL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017E53592;
        Fri, 16 Jun 2023 07:00:09 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 476D5D51;
        Fri, 16 Jun 2023 15:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923976;
        bh=BFIupWS4CVXEqMxoTUIQ4cTSs9SkNGSf7BOw6gildpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pF2O0kca9l8tuNGLwfMQXRQLe3TJkn7rrajGHouRa7VqOWchqzm/CYvFYD594ooXd
         15cN3pxpdnKHTDGq+ZUV9lBy4tT+4vKhg9dbgsMIO1G/rRrXJwwSy4G4sOvqCpRI4p
         Yx6WJdo/itle2T4q2MqkOoRDj2fax+0g08sJUxno=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 01/18] dt-bindings: i2c: Add I2C Address Translator (ATR)
Date:   Fri, 16 Jun 2023 16:59:05 +0300
Message-Id: <20230616135922.442979-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
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

Add bindings for I2C Address Translator. Only one property is added,
'i2c-alias-pool', which can be used in the bindings for the device that
supports ATR.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Wolfram Sang <wsa@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-atr.yaml      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
new file mode 100644
index 000000000000..1939ab339bfc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-atr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common i2c address translator properties
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  An I2C Address Translator (ATR) is a device with an I2C slave parent
+  ("upstream") port and N I2C master child ("downstream") ports, and
+  forwards transactions from upstream to the appropriate downstream port
+  with a modified slave address. The address used on the parent bus is
+  called the "alias" and is (potentially) different from the physical
+  slave address of the child bus. Address translation is done by the
+  hardware.
+
+properties:
+  i2c-alias-pool:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
+      used to access the remote peripherals on the serializer's I2C bus. The
+      addresses must be available, not used by any other peripheral. Each
+      remote peripheral is assigned an alias from the pool, and transactions to
+      that address will be forwarded to the remote peripheral, with the address
+      translated to the remote peripheral's real address. This property is not
+      needed if there are no I2C addressable remote peripherals.
+
+additionalProperties: true
+...
-- 
2.34.1

