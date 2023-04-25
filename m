Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3DA6EDC6D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 09:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbjDYH0d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 03:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbjDYH0a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 03:26:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1940DA248;
        Tue, 25 Apr 2023 00:26:23 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B59D8814;
        Tue, 25 Apr 2023 09:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682407570;
        bh=5H0OwXbshXmp/wfYVq5nPVdyfVVWklEKsADyZpAI2Ic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wUAfIPQCDfhAQBpeFu1JJI411g0+FVFrbHW8b2hC3uY+6Y+OrruRLEdFNtPM4uyjW
         wOmTss11qf4q7Tcdf6o9DoJKl59rBFJbnkd69DLxvIEHpo471Q/A09Gf4ujZu1Zd8D
         ewaJPYwK+pSOM2oUTKJthWd5PoMRyVJyL1To47CI=
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
Subject: [PATCH v12 1/8] dt-bindings: i2c: Add I2C Address Translator (ATR)
Date:   Tue, 25 Apr 2023 10:25:54 +0300
Message-Id: <20230425072601.51031-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
References: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
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
---
 .../devicetree/bindings/i2c/i2c-atr.yaml      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
new file mode 100644
index 000000000000..470cc6c9af35
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-atr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common i2c address translator properties.
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
+    $ref: /schemas/types.yaml#/definitions/uint16-array
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

