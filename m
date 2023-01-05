Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5617F65EE57
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jan 2023 15:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjAEOGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Jan 2023 09:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbjAEOGZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Jan 2023 09:06:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3126E60CC7;
        Thu,  5 Jan 2023 06:05:08 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1274A49C;
        Thu,  5 Jan 2023 15:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672927505;
        bh=L+7PyR3ErftQl8RYx3RRI8/pj3oH7oBHSuKpP+YSjZw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CLTHm1Q3PLwy+0D8RB416QNIG7xcs+25q8VLW/Cgp3SFrO1rfmRwS3vC/DgSVgrCH
         KLcjST9rw6/3oLZYtrmz4Vd7sKAwG/ADUWSD2ChCNRZkY70gb9xMjc7q6FOoQvbw0l
         3koBye0My96AJhHO4PqqoLEtE/V/47wARrq/gOW0=
Message-ID: <c4152e28-7624-37f4-1109-fcc8e916ef6c@ideasonboard.com>
Date:   Thu, 5 Jan 2023 16:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/8] i2c-atr and FPDLink
Content-Language: en-US
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/01/2023 16:02, Tomi Valkeinen wrote:
> Hi,
> 
> You can find the v5 from:
> 
> https://lore.kernel.org/all/20221208104006.316606-1-tomi.valkeinen@ideasonboard.com/
> 
> There has again been quite a lot of changes. I will send a diff of v5 to
> v6 separately to give a better idea of the changes. Here's are some of
> the changes:

And here's the diff:

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
index 3a5b34c6bb64..f6612bb0f667 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
@@ -4,13 +4,13 @@
  $id: http://devicetree.org/schemas/media/i2c/ti,ds90ub913.yaml#
  $schema: http://devicetree.org/meta-schemas/core.yaml#
  
-title: Texas Instruments DS90UB913 FPD-Link 3 Serializer
+title: Texas Instruments DS90UB913 FPD-Link III Serializer
  
  maintainers:
    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  
  description:
-  The TI DS90UB913 is an FPD-Link 3 video serializer for parallel video.
+  The TI DS90UB913 is an FPD-Link III video serializer for parallel video.
  
  properties:
    compatible:
@@ -19,6 +19,10 @@ properties:
  
    '#gpio-cells':
      const: 2
+    description:
+      First cell is the GPO pin number, second cell is the flags. The GPO pin
+      number must be in range of [0, 3]. Note that GPOs 2 and 3 are not
+      available in external oscillator mode.
  
    gpio-controller: true
  
@@ -41,17 +45,24 @@ properties:
        port@0:
          $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
-        description: CSI-2 input port
+        description: Parallel input port
  
          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
              unevaluatedProperties: false
  
+            required:
+              - pclk-sample
+
        port@1:
          $ref: /schemas/graph.yaml#/properties/port
          unevaluatedProperties: false
-        description: FPD-Link 3 output port
+        description: FPD-Link III output port
+
+    required:
+      - port@0
+      - port@1
  
    i2c:
      $ref: /schemas/i2c/i2c-controller.yaml#
@@ -89,6 +100,7 @@ examples:
            reg = <0>;
            ub913_in: endpoint {
              remote-endpoint = <&sensor_out>;
+            pclk-sample = <1>;
            };
          };
  
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index fd7d25d93e2c..2030366994d1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -4,13 +4,13 @@
  $id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953.yaml#
  $schema: http://devicetree.org/meta-schemas/core.yaml#
  
-title: Texas Instruments DS90UB953 FPD-Link 3 Serializer
+title: Texas Instruments DS90UB953 FPD-Link III Serializer
  
  maintainers:
    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  
  description:
-  The TI DS90UB953 is an FPD-Link 3 video serializer for MIPI CSI-2.
+  The TI DS90UB953 is an FPD-Link III video serializer for MIPI CSI-2.
  
  properties:
    compatible:
@@ -20,9 +20,21 @@ properties:
  
    '#gpio-cells':
      const: 2
+    description:
+      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
+      number must be in range of [0, 3].
  
    gpio-controller: true
  
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock connected to the CLKIN pin.
+
+  clock-names:
+    items:
+      - const: clkin
+
    '#clock-cells':
      const: 0
  
@@ -40,10 +52,17 @@ properties:
              $ref: /schemas/media/video-interfaces.yaml#
              unevaluatedProperties: false
  
+            required:
+              - data-lanes
+
        port@1:
          $ref: /schemas/graph.yaml#/properties/port
          unevaluatedProperties: false
-        description: FPD-Link 3 output port
+        description: FPD-Link III output port
+
+    required:
+      - port@0
+      - port@1
  
    i2c:
      $ref: /schemas/i2c/i2c-controller.yaml#
@@ -101,6 +120,9 @@ examples:
  
            reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
  
+          clocks = <&serializer>;
+          clock-names = "inck";
+
            port {
              sensor_out: endpoint {
                remote-endpoint = <&ub953_in>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index d8b5e219d420..664799ae55be 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -21,8 +21,6 @@ properties:
  
    reg:
      maxItems: 1
-    description:
-      i2c addresses for the deserializer and the serializers
  
    clocks:
      maxItems: 1
@@ -41,12 +39,13 @@ properties:
    i2c-alias-pool:
      $ref: /schemas/types.yaml#/definitions/uint16-array
      description:
-      i2c alias pool is a pool of i2c addresses on the main i2c bus that can be
-      used to access the remote peripherals. The addresses must be available,
-      not used by any other peripheral. Each remote peripheral is assigned an
-      alias from the pool, and transactions to that address will be forwarded
-      to the remote peripheral, with the address translated to the remote
-      peripheral's real address.
+      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
+      used to access the remote peripherals on the serializer's I2C bus. The
+      addresses must be available, not used by any other peripheral. Each
+      remote peripheral is assigned an alias from the pool, and transactions to
+      that address will be forwarded to the remote peripheral, with the address
+      translated to the remote peripheral's real address. This property is not
+      needed if there are no I2C addressable remote peripherals.
  
    links:
      type: object
@@ -65,7 +64,7 @@ properties:
            Enable manual strobe position and EQ level
  
      patternProperties:
-      '^link@[0-9a-f]+$':
+      '^link@[0-3]$':
          type: object
          additionalProperties: false
          properties:
@@ -75,8 +74,8 @@ properties:
  
            i2c-alias:
              description:
-              The i2c address used for the serializer. Transactions to this
-              address on the i2c bus where the deserializer resides are
+              The I2C address used for the serializer. Transactions to this
+              address on the I2C bus where the deserializer resides are
                forwarded to the serializer.
  
            ti,rx-mode:
@@ -87,14 +86,18 @@ properties:
                - 2 # RAW12 LF
                - 3 # CSI2 SYNC
                - 4 # CSI2 NON-SYNC
-            description: FPD-Link Input Mode
+            description:
+              FPD-Link Input Mode. This should reflect the hardware and the
+              default mode of the connected camera module.
  
            ti,cdr-mode:
              $ref: /schemas/types.yaml#/definitions/uint32
              enum:
-              - 0 # FPD3
-              - 1 # FPD4
-            description: FPD-Link CDR Mode
+              - 0 # FPD-Link III
+              - 1 # FPD-Link IV
+            description:
+              FPD-Link CDR Mode. This should reflect the hardware and the
+              default mode of the connected camera module.
  
            ti,strobe-pos:
              $ref: /schemas/types.yaml#/definitions/int32
@@ -122,25 +125,57 @@ properties:
  
      properties:
        port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
          description: FPD-Link input 0
  
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
        port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
          description: FPD-Link input 1
  
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
        port@2:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
          description: FPD-Link input 2
  
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
        port@3:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
          description: FPD-Link input 3
  
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description:
+              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+              hsync-active and vsync-active must be defined.
+
        port@4:
          $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
@@ -156,6 +191,9 @@ properties:
                  minItems: 1
                  maxItems: 4
  
+            required:
+              - data-lanes
+
        port@5:
          $ref: /schemas/graph.yaml#/$defs/port-base
          unevaluatedProperties: false
@@ -171,6 +209,9 @@ properties:
                  minItems: 1
                  maxItems: 4
  
+            required:
+              - data-lanes
+
  required:
    - compatible
    - reg
@@ -219,6 +260,8 @@ examples:
  
              ub960_fpd3_2_in: endpoint {
                remote-endpoint = <&ub913_2_out>;
+              hsync-active = <0>;
+              vsync-active = <1>;
              };
            };
  
@@ -321,6 +364,7 @@ examples:
                    reg = <0>;
                    ub913_2_in: endpoint {
                      remote-endpoint = <&sensor_2_out>;
+                    pclk-sample = <1>;
                    };
                  };
  
diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxes/i2c-atr.rst
index 14597c9ec19b..c7e060ca682d 100644
--- a/Documentation/i2c/muxes/i2c-atr.rst
+++ b/Documentation/i2c/muxes/i2c-atr.rst
@@ -76,3 +76,8 @@ Usage:
      alias_id parameter
   3. When the detach callback is called, deconfigure the alias from
      your chip and put it back in the pool for later usage
+
+I2C ATR functions and data structures
+-------------------------------------
+
+.. kernel-doc:: include/linux/i2c-atr.h
diff --git a/MAINTAINERS b/MAINTAINERS
index ba716f2861cf..d0dc8572191d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20626,6 +20626,14 @@ F:	drivers/misc/tifm*
  F:	drivers/mmc/host/tifm_sd.c
  F:	include/linux/tifm.h
  
+TI FPD-LINK DRIVERS
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ti,ds90*
+F:	drivers/media/i2c/ds90*
+F:	include/media/i2c/ds90*
+
  TI KEYSTONE MULTICORE NAVIGATOR DRIVERS
  M:	Nishanth Menon <nm@ti.com>
  M:	Santosh Shilimkar <ssantosh@kernel.org>
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 1d3b25a6550f..0668c98886ad 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -3,6 +3,7 @@
   * I2C Address Translator
   *
   * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
   *
   * Originally based on i2c-mux.c
   */
@@ -19,7 +20,7 @@
  #define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */
  
  /**
- * struct i2c_atr_cli2alias_pair - Hold the alias assigned to a client.
+ * struct i2c_atr_cli2alias_pair - Holds the alias assigned to a client.
   * @node:   List node
   * @client: Pointer to the client on the child bus
   * @alias:  I2C alias address assigned by the driver.
@@ -32,7 +33,17 @@ struct i2c_atr_cli2alias_pair {
  	u16 alias;
  };
  
-/* Data for each channel (child bus) */
+/**
+ * struct i2c_atr_chan - Data for a channel.
+ * @adap:            The &struct i2c_adapter for the channel
+ * @atr:             The parent I2C ATR
+ * @chan_id:         The ID of this channel
+ * @alias_list:      List of @struct i2c_atr_cli2alias_pair containing the
+ *                   assigned aliases
+ * @orig_addrs_lock: Mutex protecting @orig_addrs
+ * @orig_addrs:      Buffer used to store the original addresses during transmit
+ * @orig_addrs_size: Size of @orig_addrs
+ */
  struct i2c_atr_chan {
  	struct i2c_adapter adap;
  	struct i2c_atr *atr;
@@ -40,9 +51,36 @@ struct i2c_atr_chan {
  
  	struct list_head alias_list;
  
+	/* Lock orig_addrs during xfer */
+	struct mutex orig_addrs_lock;
  	u16 *orig_addrs;
  	unsigned int orig_addrs_size;
-	struct mutex orig_addrs_lock; /* Lock orig_addrs during xfer */
+};
+
+/**
+ * struct i2c_atr - The I2C ATR instance
+ * @parent:    The parent &struct i2c_adapter
+ * @dev:       The device that owns the I2C ATR instance
+ * @ops:       &struct i2c_atr_ops
+ * @priv:      Private driver data, set with i2c_atr_set_driver_data()
+ * @algo:      The &struct i2c_algorithm for adapters
+ * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
+ * @max_adapters: Maximum number of adapters this I2C ATR can have
+ * @adapter:   Array of adapters
+ */
+struct i2c_atr {
+	struct i2c_adapter *parent;
+	struct device *dev;
+	const struct i2c_atr_ops *ops;
+
+	void *priv;
+
+	struct i2c_algorithm algo;
+	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
+	struct mutex lock;
+	int max_adapters;
+
+	struct i2c_adapter *adapter[];
  };
  
  static struct i2c_atr_cli2alias_pair *
@@ -90,8 +128,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
  	if (unlikely(chan->orig_addrs_size < num)) {
  		u16 *new_buf;
  
-		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
-					GFP_KERNEL);
+		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
  		if (!new_buf)
  			return -ENOMEM;
  
@@ -252,10 +289,6 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
  				      &alias_id);
  	if (ret)
  		goto err_free;
-	if (alias_id == 0) {
-		ret = -EINVAL;
-		goto err_free;
-	}
  
  	c2a->client = client;
  	c2a->alias = alias_id;
@@ -265,6 +298,7 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
  
  err_free:
  	kfree(c2a);
+
  	return ret;
  }
  
@@ -289,27 +323,45 @@ static const struct i2c_attach_operations i2c_atr_attach_ops = {
  	.detach_client = i2c_atr_detach_client,
  };
  
-/**
- * i2c_atr_add_adapter - Create a child ("downstream") I2C bus.
- * @atr:        The I2C ATR
- * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
- *              passed to the callbacks in `struct i2c_atr_ops`.
- * @bus_handle: The fwnode handle that points to the adapter's i2c
- *              peripherals, or NULL.
- *
- * After calling this function a new i2c bus will appear. Adding and
- * removing devices on the downstream bus will result in calls to the
- * `attach_client` and `detach_client` callbacks for the driver to assign
- * an alias to the device.
- *
- * The adapter's fwnode is set to 'bus_handle', or if 'bus_handle' is NULL the
- * function looks for a child node whose 'reg' property matches the chan_id
- * under the i2c-atr device's 'i2c-atr' node.
+struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
+			    const struct i2c_atr_ops *ops, int max_adapters)
+{
+	struct i2c_atr *atr;
+
+	if (max_adapters > ATR_MAX_ADAPTERS)
+		return ERR_PTR(-EINVAL);
+
+	if (!ops || !ops->attach_client || !ops->detach_client)
+		return ERR_PTR(-EINVAL);
+
+	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
+			   GFP_KERNEL);
+	if (!atr)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&atr->lock);
+
+	atr->parent = parent;
+	atr->dev = dev;
+	atr->ops = ops;
+	atr->max_adapters = max_adapters;
+
+	if (parent->algo->master_xfer)
+		atr->algo.master_xfer = i2c_atr_master_xfer;
+	if (parent->algo->smbus_xfer)
+		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
+	atr->algo.functionality = i2c_atr_functionality;
+
+	return atr;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_new, I2C_ATR);
+
+void i2c_atr_delete(struct i2c_atr *atr)
+{
+	mutex_destroy(&atr->lock);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
  
- * Call i2c_atr_del_adapter() to remove the adapter.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
  int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
  			struct fwnode_handle *bus_handle)
  {
@@ -375,7 +427,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
  	if (ret) {
  		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
  			chan_id, ret);
-		goto err_mutex_destroy;
+		goto err_fwnode_put;
  	}
  
  	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
@@ -391,22 +443,17 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
  	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
  
  	atr->adapter[chan_id] = &chan->adap;
+
  	return 0;
  
-err_mutex_destroy:
+err_fwnode_put:
  	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
  	mutex_destroy(&chan->orig_addrs_lock);
  	kfree(chan);
  	return ret;
  }
-EXPORT_SYMBOL_GPL(i2c_atr_add_adapter);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, I2C_ATR);
  
-/**
- * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
- * i2c_atr_del_adapter().
- * @atr:     The I2C ATR
- * @chan_id: Index of the `adapter to be removed (0 .. max_adapters-1)
- */
  void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
  {
  	char symlink_name[ATR_MAX_SYMLINK_LEN];
@@ -416,10 +463,8 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
  	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
  	struct device *dev = atr->dev;
  
-	if (!atr->adapter[chan_id]) {
-		dev_err(dev, "Adapter %d does not exist\n", chan_id);
+	if (!adap)
  		return;
-	}
  
  	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
  
@@ -436,68 +481,21 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
  	kfree(chan->orig_addrs);
  	kfree(chan);
  }
-EXPORT_SYMBOL_GPL(i2c_atr_del_adapter);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_del_adapter, I2C_ATR);
  
-/**
- * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
- * @parent:       The parent (upstream) adapter
- * @dev:          The device acting as an ATR
- * @ops:          Driver-specific callbacks
- * @max_adapters: Maximum number of child adapters
- *
- * The new ATR helper is connected to the parent adapter but has no child
- * adapters. Call i2c_atr_add_adapter() to add some.
- *
- * Call i2c_atr_delete() to remove.
- *
- * Return: pointer to the new ATR helper object, or ERR_PTR
- */
-struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters)
+void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
  {
-	struct i2c_atr *atr;
-
-	if (max_adapters > ATR_MAX_ADAPTERS)
-		return ERR_PTR(-EINVAL);
-
-	if (!ops || !ops->attach_client || !ops->detach_client)
-		return ERR_PTR(-EINVAL);
-
-	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
-			   GFP_KERNEL);
-	if (!atr)
-		return ERR_PTR(-ENOMEM);
-
-	mutex_init(&atr->lock);
-
-	atr->parent = parent;
-	atr->dev = dev;
-	atr->ops = ops;
-	atr->max_adapters = max_adapters;
-
-	if (parent->algo->master_xfer)
-		atr->algo.master_xfer = i2c_atr_master_xfer;
-	if (parent->algo->smbus_xfer)
-		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
-	atr->algo.functionality = i2c_atr_functionality;
-
-	return atr;
+	atr->priv = data;
  }
-EXPORT_SYMBOL_GPL(i2c_atr_new);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
  
-/**
- * i2c_atr_delete - Delete an I2C ATR helper.
- * @atr: I2C ATR helper to be deleted.
- *
- * Precondition: all the adapters added with i2c_atr_add_adapter() mumst be
- * removed by calling i2c_atr_del_adapter().
- */
-void i2c_atr_delete(struct i2c_atr *atr)
+void *i2c_atr_get_driver_data(struct i2c_atr *atr)
  {
-	mutex_destroy(&atr->lock);
+	return atr->priv;
  }
-EXPORT_SYMBOL_GPL(i2c_atr_delete);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);
  
-MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
  MODULE_DESCRIPTION("I2C Address Translator");
  MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 1bb60f256a1e..8a0888ba89e5 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -916,6 +916,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
  struct i2c_client *
  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
  {
+	const struct i2c_attach_operations *attach_ops;
  	struct i2c_client	*client;
  	int			status;
  
@@ -967,9 +968,10 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
  		}
  	}
  
-	if (adap->attach_ops &&
-	    adap->attach_ops->attach_client &&
-	    adap->attach_ops->attach_client(adap, info, client) != 0)
+	attach_ops = adap->attach_ops;
+
+	if (attach_ops && attach_ops->attach_client &&
+	    attach_ops->attach_client(adap, info, client))
  		goto out_remove_swnode;
  
  	status = device_register(&client->dev);
@@ -982,8 +984,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
  	return client;
  
  out_detach_client:
-	if (adap->attach_ops && adap->attach_ops->detach_client)
-		adap->attach_ops->detach_client(adap, client);
+	if (attach_ops && attach_ops->detach_client)
+		attach_ops->detach_client(adap, client);
  out_remove_swnode:
  	device_remove_software_node(&client->dev);
  out_err_put_of_node:
@@ -1005,16 +1007,17 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
   */
  void i2c_unregister_device(struct i2c_client *client)
  {
+	const struct i2c_attach_operations *attach_ops;
  	struct i2c_adapter *adap;
  
  	if (IS_ERR_OR_NULL(client))
  		return;
  
  	adap = client->adapter;
+	attach_ops = adap->attach_ops;
  
-	if (adap->attach_ops &&
-	    adap->attach_ops->detach_client)
-		adap->attach_ops->detach_client(adap, client);
+	if (attach_ops && attach_ops->detach_client)
+		attach_ops->detach_client(adap, client);
  
  	if (client->dev.of_node) {
  		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index b24f89f58807..29594c724307 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1596,13 +1596,13 @@ config VIDEO_THS7303
  endmenu
  
  #
-# Video serializers and deserializers (e.g. FPDLink)
+# Video serializers and deserializers (e.g. FPD-Link)
  #
  
  menu "Video serializers and deserializers"
  
-config VIDEO_DS90UB960
-	tristate "TI DS90UB960 Deserializer"
+config VIDEO_DS90UB913
+	tristate "TI DS90UB913 Serializer"
  	depends on OF && I2C && VIDEO_DEV
  	select MEDIA_CONTROLLER
  	select VIDEO_V4L2_SUBDEV_API
@@ -1611,11 +1611,11 @@ config VIDEO_DS90UB960
  	select OF_GPIO
  	select I2C_ATR
  	help
-	  Device driver for the Texas Instruments DS90UB960
-	  FPD-Link III Deserializer
+	  Device driver for the Texas Instruments DS90UB913
+	  FPD-Link III Serializer.
  
-config VIDEO_DS90UB913
-	tristate "TI DS90UB913 Serializer"
+config VIDEO_DS90UB953
+	tristate "TI DS90UB953 Serializer"
  	depends on OF && I2C && VIDEO_DEV
  	select MEDIA_CONTROLLER
  	select VIDEO_V4L2_SUBDEV_API
@@ -1624,11 +1624,11 @@ config VIDEO_DS90UB913
  	select OF_GPIO
  	select I2C_ATR
  	help
-	  Device driver for the Texas Instruments DS90UB913
-	  FPD-Link III Serializer.
+	  Device driver for the Texas Instruments DS90UB953
+	  FPD-Link III Serializer and DS90UB971 FPD-Link IV Serializer.
  
-config VIDEO_DS90UB953
-	tristate "TI DS90UB953 Serializer"
+config VIDEO_DS90UB960
+	tristate "TI DS90UB960 Deserializer"
  	depends on OF && I2C && VIDEO_DEV
  	select MEDIA_CONTROLLER
  	select VIDEO_V4L2_SUBDEV_API
@@ -1637,8 +1637,8 @@ config VIDEO_DS90UB953
  	select OF_GPIO
  	select I2C_ATR
  	help
-	  Device driver for the Texas Instruments DS90UB953
-	  FPD-Link III Serializer.
+	  Device driver for the Texas Instruments DS90UB960
+	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
  
  endmenu
  
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 377cdf6fa30b..efd5f717a5f7 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -142,6 +142,6 @@ obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
  obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
  obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
  obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
-obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
  obj-$(CONFIG_VIDEO_DS90UB913)	+= ds90ub913.o
  obj-$(CONFIG_VIDEO_DS90UB953)	+= ds90ub953.o
+obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6001a622e622..0a60afb09cd3 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -37,7 +37,12 @@
  #define UB913_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
  
  #define UB913_REG_GENERAL_CFG			0x03
+#define UB913_REG_GENERAL_CFG_CRC_ERR_RESET	BIT(5)
+#define UB913_REG_GENERAL_CFG_PCLK_RISING	BIT(0)
+
  #define UB913_REG_MODE_SEL			0x05
+#define UB913_REG_MODE_SEL_MODE_UP_TO_DATE	BIT(4)
+#define UB913_REG_MODE_SEL_MODE_OVERRIDE	BIT(5)
  
  #define UB913_REG_CRC_ERRORS_LSB		0x0a
  #define UB913_REG_CRC_ERRORS_MSB		0x0b
@@ -61,8 +66,6 @@ struct ub913_data {
  	struct regmap		*regmap;
  	struct clk		*clkin;
  
-	u32			gpio_func[UB913_NUM_GPIOS];
-
  	struct gpio_chip	gpio_chip;
  	char			gpio_chip_name[64];
  
@@ -81,8 +84,7 @@ struct ub913_data {
  
  	struct ds90ub9xx_platform_data *plat_data;
  
-	/* Have we succefully called i2c_atr_add_adapter() */
-	bool			has_i2c_adapter;
+	u32			pclk_polarity;
  };
  
  static inline struct ub913_data *sd_to_ub913(struct v4l2_subdev *sd)
@@ -200,26 +202,6 @@ static void ub913_gpiochip_remove(struct ub913_data *priv)
  	gpiochip_remove(&priv->gpio_chip);
  }
  
-static int ub913_parse_dt(struct ub913_data *priv)
-{
-	struct device_node *np = priv->client->dev.of_node;
-	struct device *dev = &priv->client->dev;
-	int ret;
-
-	if (!np) {
-		dev_err(dev, "OF: no device tree node!\n");
-		return -ENOENT;
-	}
-
-	/* optional, if absent all GPIO pins are unused */
-	ret = of_property_read_u32_array(np, "gpio-functions", priv->gpio_func,
-					 ARRAY_SIZE(priv->gpio_func));
-	if (ret && ret != -EINVAL)
-		dev_err(dev, "DT: invalid gpio-functions property (%d)", ret);
-
-	return 0;
-}
-
  static const struct regmap_config ub913_regmap_config = {
  	.name = "ds90ub913",
  	.reg_bits = 8,
@@ -290,7 +272,7 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
  			      struct v4l2_subdev_state *state,
  			      struct v4l2_subdev_krouting *routing)
  {
-	const struct v4l2_mbus_framefmt format = {
+	static const struct v4l2_mbus_framefmt format = {
  		.width = 640,
  		.height = 480,
  		.code = MEDIA_BUS_FMT_UYVY8_2X8,
@@ -361,9 +343,9 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  	struct v4l2_mbus_frame_desc source_fd;
  	struct v4l2_subdev_route *route;
  	struct v4l2_subdev_state *state;
-	int ret = 0;
+	int ret;
  
-	if (pad != 1) /* first tx pad */
+	if (pad != UB913_PAD_SOURCE)
  		return -EINVAL;
  
  	ret = ub913_get_source_frame_desc(priv, &source_fd);
@@ -379,16 +361,16 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
  
  	for_each_active_route(routing, route) {
-		unsigned int j;
+		unsigned int i;
  
  		if (route->source_pad != pad)
  			continue;
  
-		for (j = 0; j < source_fd.num_entries; ++j)
-			if (source_fd.entry[j].stream == route->sink_stream)
+		for (i = 0; i < source_fd.num_entries; ++i)
+			if (source_fd.entry[i].stream == route->sink_stream)
  				break;
  
-		if (j == source_fd.num_entries) {
+		if (i == source_fd.num_entries) {
  			dev_err(&priv->client->dev,
  				"Failed to find stream from source frame desc\n");
  			ret = -EPIPE;
@@ -396,12 +378,10 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  		}
  
  		fd->entry[fd->num_entries].stream = route->source_stream;
-
-		fd->entry[fd->num_entries].flags =
-			V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
-		fd->entry[fd->num_entries].length = source_fd.entry[j].length;
+		fd->entry[fd->num_entries].flags = source_fd.entry[i].flags;
+		fd->entry[fd->num_entries].length = source_fd.entry[i].length;
  		fd->entry[fd->num_entries].pixelcode =
-			source_fd.entry[j].pixelcode;
+			source_fd.entry[i].pixelcode;
  
  		fd->num_entries++;
  	}
@@ -424,7 +404,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
  		return -EBUSY;
  
  	/* No transcoding, source and sink formats must match. */
-	if (format->pad == 1)
+	if (format->pad == UB913_PAD_SOURCE)
  		return v4l2_subdev_get_fmt(sd, state, format);
  
  	/* Set sink format */
@@ -451,9 +431,9 @@ static int ub913_init_cfg(struct v4l2_subdev *sd,
  {
  	struct v4l2_subdev_route routes[] = {
  		{
-			.sink_pad = 0,
+			.sink_pad = UB913_PAD_SINK,
  			.sink_stream = 0,
-			.source_pad = 1,
+			.source_pad = UB913_PAD_SOURCE,
  			.source_stream = 0,
  			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
  		},
@@ -488,7 +468,7 @@ static int ub913_log_status(struct v4l2_subdev *sd)
  
  	/* clear CRC errors */
  	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
-	ub913_write(priv, UB913_REG_GENERAL_CFG, v | BIT(5));
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
  	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
  
  	return 0;
@@ -526,8 +506,6 @@ static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
  	unsigned int src_pad;
  	int ret;
  
-	dev_dbg(dev, "Bind %s\n", source_subdev->name);
-
  	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
  					  source_subdev->fwnode,
  					  MEDIA_PAD_FL_SOURCE);
@@ -541,7 +519,7 @@ static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
  	src_pad = ret;
  
  	ret = media_create_pad_link(&source_subdev->entity, src_pad,
-				    &priv->sd.entity, 0,
+				    &priv->sd.entity, UB913_PAD_SINK,
  				    MEDIA_LNK_FL_ENABLED |
  				    MEDIA_LNK_FL_IMMUTABLE);
  	if (ret) {
@@ -550,26 +528,11 @@ static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
  		return ret;
  	}
  
-	dev_dbg(dev, "Bound %s:%u\n", source_subdev->name, src_pad);
-
-	dev_dbg(dev, "All subdevs bound\n");
-
  	return 0;
  }
  
-static void ub913_notify_unbind(struct v4l2_async_notifier *notifier,
-				struct v4l2_subdev *source_subdev,
-				struct v4l2_async_subdev *asd)
-{
-	struct ub913_data *priv = sd_to_ub913(notifier->sd);
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unbind %s\n", source_subdev->name);
-}
-
  static const struct v4l2_async_notifier_operations ub913_notify_ops = {
  	.bound = ub913_notify_bound,
-	.unbind = ub913_notify_unbind,
  };
  
  static int ub913_v4l2_notifier_register(struct ub913_data *priv)
@@ -579,8 +542,6 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
  	struct device_node *ep_node;
  	int ret;
  
-	dev_dbg(dev, "register async notif\n");
-
  	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
  	if (!ep_node) {
  		dev_err(dev, "No graph endpoint\n");
@@ -615,10 +576,6 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
  
  static void ub913_v4l2_nf_unregister(struct ub913_data *priv)
  {
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unregister async notif\n");
-
  	v4l2_async_nf_unregister(&priv->notifier);
  	v4l2_async_nf_cleanup(&priv->notifier);
  }
@@ -691,16 +648,37 @@ static int ub913_add_i2c_adapter(struct ub913_data *priv)
  	if (ret)
  		return ret;
  
-	priv->has_i2c_adapter = true;
-
  	return 0;
  }
  
-static void ub913_remove_i2c_adapter(struct ub913_data *priv)
+static int ub913_parse_dt(struct ub913_data *priv)
  {
-	if (priv->has_i2c_adapter)
-		i2c_atr_del_adapter(priv->plat_data->atr,
-				    priv->plat_data->port);
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	int ret;
+	struct device_node *ep_np;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (!ep_np) {
+		dev_err(dev, "OF: no endpoint\n");
+		return -ENOENT;
+	}
+
+	ret = of_property_read_u32(ep_np, "pclk-sample", &priv->pclk_polarity);
+
+	of_node_put(ep_np);
+
+	if (ret) {
+		dev_err(dev, "OF: failed to parse pclk-sample: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
  }
  
  static int ub913_probe(struct i2c_client *client)
@@ -712,8 +690,6 @@ static int ub913_probe(struct i2c_client *client)
  	bool mode_override;
  	u8 mode;
  
-	dev_dbg(dev, "probing, addr 0x%02x\n", client->addr);
-
  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
  	if (!priv)
  		return -ENOMEM;
@@ -749,12 +725,12 @@ static int ub913_probe(struct i2c_client *client)
  	if (ret)
  		return ret;
  
-	if (!(v & BIT(4))) {
+	if (!(v & UB913_REG_MODE_SEL_MODE_UP_TO_DATE)) {
  		dev_err(dev, "Mode value not stabilized\n");
  		return -ENODEV;
  	}
  
-	mode_override = v & BIT(5);
+	mode_override = v & UB913_REG_MODE_SEL_MODE_OVERRIDE;
  	mode = v & 0xf;
  
  	dev_dbg(dev, "mode from %s: %#x\n",
@@ -778,6 +754,11 @@ static int ub913_probe(struct i2c_client *client)
  		goto err_gpiochip_remove;
  	}
  
+	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
+	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
+	v |= priv->pclk_polarity ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
+	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
+
  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub913_subdev_ops);
  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -818,8 +799,6 @@ static int ub913_probe(struct i2c_client *client)
  		goto err_unreg_async_subdev;
  	}
  
-	dev_dbg(dev, "Successfully probed\n");
-
  	return 0;
  
  err_unreg_async_subdev:
@@ -844,9 +823,8 @@ static void ub913_remove(struct i2c_client *client)
  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
  	struct ub913_data *priv = sd_to_ub913(sd);
  
-	dev_dbg(&client->dev, "Removing\n");
-
-	ub913_remove_i2c_adapter(priv);
+	i2c_atr_del_adapter(priv->plat_data->atr,
+			    priv->plat_data->port);
  
  	v4l2_async_unregister_subdev(&priv->sd);
  
@@ -890,3 +868,4 @@ MODULE_LICENSE("GPL");
  MODULE_DESCRIPTION("Texas Instruments DS90UB913 serializer driver");
  MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
  MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
+MODULE_IMPORT_NS(I2C_ATR);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index c7f5d08e07ef..251dc8e8adfa 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -38,7 +38,16 @@
  #define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
  
  #define UB953_REG_GENERAL_CFG			0x02
+#define UB953_REG_GENERAL_CFG_CONT_CLK		BIT(6)
+#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT	4
+#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_MASK	GENMASK(5, 4)
+#define UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE	BIT(1)
+#define UB953_REG_GENERAL_CFG_I2C_STRAP_MODE	BIT(0)
+
  #define UB953_REG_MODE_SEL			0x03
+#define UB953_REG_MODE_SEL_MODE_DONE		BIT(3)
+#define UB953_REG_MODE_SEL_MODE_OVERRIDE	BIT(4)
+#define UB953_REG_MODE_SEL_MODE_MASK		GENMASK(2, 0)
  
  #define UB953_REG_CLKOUT_CTRL0			0x06
  #define UB953_REG_CLKOUT_CTRL1			0x07
@@ -105,13 +114,13 @@
  
  /* Note: Only sync mode supported for now */
  enum ub953_mode {
-	/* FPD-Link 3 CSI-2 synchronous mode */
+	/* FPD-Link III CSI-2 synchronous mode */
  	UB953_MODE_SYNC,
-	/* FPD-Link 3 CSI-2 non-synchronous mode, external ref clock */
+	/* FPD-Link III CSI-2 non-synchronous mode, external ref clock */
  	UB953_MODE_NONSYNC_EXT,
-	/* FPD-Link 3 CSI-2 non-synchronous mode, internal ref clock */
+	/* FPD-Link III CSI-2 non-synchronous mode, internal ref clock */
  	UB953_MODE_NONSYNC_INT,
-	/* FPD-Link 3 DVP mode */
+	/* FPD-Link III DVP mode */
  	UB953_MODE_DVP,
  };
  
@@ -154,9 +163,6 @@ struct ub953_data {
  	enum ub953_mode		mode;
  
  	struct ds90ub9xx_platform_data *plat_data;
-
-	/* Have we succefully called i2c_atr_add_adapter() */
-	bool			has_i2c_adapter;
  };
  
  static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
@@ -439,10 +445,10 @@ static int _ub953_set_routing(struct v4l2_subdev *sd,
  			      struct v4l2_subdev_state *state,
  			      struct v4l2_subdev_krouting *routing)
  {
-	const struct v4l2_mbus_framefmt format = {
+	static const struct v4l2_mbus_framefmt format = {
  		.width = 640,
  		.height = 480,
-		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
  		.field = V4L2_FIELD_NONE,
  		.colorspace = V4L2_COLORSPACE_SRGB,
  		.ycbcr_enc = V4L2_YCBCR_ENC_601,
@@ -510,9 +516,9 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  	struct v4l2_mbus_frame_desc source_fd;
  	struct v4l2_subdev_route *route;
  	struct v4l2_subdev_state *state;
-	int ret = 0;
+	int ret;
  
-	if (pad != 1) /* first tx pad */
+	if (pad != UB953_PAD_SOURCE)
  		return -EINVAL;
  
  	ret = ub953_get_source_frame_desc(priv, &source_fd);
@@ -529,14 +535,14 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  
  	for_each_active_route(routing, route) {
  		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
-		unsigned int j;
+		unsigned int i;
  
  		if (route->source_pad != pad)
  			continue;
  
-		for (j = 0; j < source_fd.num_entries; ++j)
-			if (source_fd.entry[j].stream == route->sink_stream) {
-				source_entry = &source_fd.entry[j];
+		for (i = 0; i < source_fd.num_entries; ++i)
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
  				break;
  			}
  
@@ -548,9 +554,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  		}
  
  		fd->entry[fd->num_entries].stream = route->source_stream;
-
-		fd->entry[fd->num_entries].flags =
-			V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
  		fd->entry[fd->num_entries].length = source_entry->length;
  		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
  		fd->entry[fd->num_entries].bus.csi2.vc =
@@ -579,7 +583,7 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
  		return -EBUSY;
  
  	/* No transcoding, source and sink formats must match. */
-	if (format->pad == 1)
+	if (format->pad == UB953_PAD_SOURCE)
  		return v4l2_subdev_get_fmt(sd, state, format);
  
  	/* Set sink format */
@@ -606,9 +610,9 @@ static int ub953_init_cfg(struct v4l2_subdev *sd,
  {
  	struct v4l2_subdev_route routes[] = {
  		{
-			.sink_pad = 0,
+			.sink_pad = UB953_PAD_SINK,
  			.sink_stream = 0,
-			.source_pad = 1,
+			.source_pad = UB953_PAD_SOURCE,
  			.source_stream = 0,
  			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
  		},
@@ -784,7 +788,7 @@ static const char *const ub953_tpg_qmenu[] = {
  	"8 vertical color bars",
  };
  
-static void ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
+static int ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
  {
  	struct v4l2_subdev *sd = &priv->sd;
  	struct v4l2_subdev_state *state;
@@ -812,7 +816,15 @@ static void ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
  
  	state = v4l2_subdev_get_locked_active_state(sd);
  
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
  	fmt = v4l2_subdev_state_get_stream_format(state, UB953_PAD_SOURCE, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	if (fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
+		return -EINVAL;
  
  	width = fmt->width;
  	height = fmt->height;
@@ -846,6 +858,8 @@ static void ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
  			vbp);
  	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
  			vfp);
+
+	return 0;
  }
  
  static void ub953_disable_tpg(struct ub953_data *priv)
@@ -858,17 +872,18 @@ static int ub953_s_ctrl(struct v4l2_ctrl *ctrl)
  {
  	struct ub953_data *priv =
  		container_of(ctrl->handler, struct ub953_data, ctrl_handler);
+	int ret = 0;
  
  	switch (ctrl->id) {
  	case V4L2_CID_TEST_PATTERN:
  		if (ctrl->val == 0)
  			ub953_disable_tpg(priv);
  		else
-			ub953_enable_tpg(priv, ctrl->val);
+			ret = ub953_enable_tpg(priv, ctrl->val);
  		break;
  	}
  
-	return 0;
+	return ret;
  }
  
  static const struct v4l2_ctrl_ops ub953_ctrl_ops = {
@@ -884,8 +899,6 @@ static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
  	unsigned int src_pad;
  	int ret;
  
-	dev_dbg(dev, "Bind %s\n", source_subdev->name);
-
  	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
  					  source_subdev->fwnode,
  					  MEDIA_PAD_FL_SOURCE);
@@ -907,26 +920,11 @@ static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
  		return ret;
  	}
  
-	dev_dbg(dev, "Bound %s:%u\n", source_subdev->name, src_pad);
-
-	dev_dbg(dev, "All subdevs bound\n");
-
  	return 0;
  }
  
-static void ub953_notify_unbind(struct v4l2_async_notifier *notifier,
-				struct v4l2_subdev *source_subdev,
-				struct v4l2_async_subdev *asd)
-{
-	struct ub953_data *priv = sd_to_ub953(notifier->sd);
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unbind %s\n", source_subdev->name);
-}
-
  static const struct v4l2_async_notifier_operations ub953_notify_ops = {
  	.bound = ub953_notify_bound,
-	.unbind = ub953_notify_unbind,
  };
  
  static int ub953_v4l2_notifier_register(struct ub953_data *priv)
@@ -936,8 +934,6 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
  	struct device_node *ep_node;
  	int ret;
  
-	dev_dbg(dev, "register async notif\n");
-
  	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
  	if (!ep_node) {
  		dev_err(dev, "No graph endpoint\n");
@@ -972,10 +968,6 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
  
  static void ub953_v4l2_notifier_unregister(struct ub953_data *priv)
  {
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unregister async notif\n");
-
  	v4l2_async_nf_unregister(&priv->notifier);
  	v4l2_async_nf_cleanup(&priv->notifier);
  }
@@ -1006,48 +998,6 @@ static int ub953_i2c_master_init(struct ub953_data *priv)
  	return 0;
  }
  
-static int ub953_parse_dt(struct ub953_data *priv)
-{
-	struct device_node *np = priv->client->dev.of_node;
-	struct device *dev = &priv->client->dev;
-	struct device_node *ep_np;
-	int ret;
-
-	if (!np) {
-		dev_err(dev, "OF: no device tree node!\n");
-		return -ENOENT;
-	}
-
-	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
-	if (!ep_np) {
-		dev_err(dev, "OF: no endpoint\n");
-		return -ENOENT;
-	}
-
-	ret = of_property_count_u32_elems(ep_np, "data-lanes");
-	if (ret <= 0) {
-		dev_err(dev, "OF: failed to parse data-lanes: %d\n", ret);
-		return ret;
-	}
-
-	if (ret != 1 && ret != 2 && ret != 4) {
-		dev_err(dev, "OF: bad number of data-lanes: %d\n", ret);
-		return -EINVAL;
-	}
-
-	priv->num_data_lanes = ret;
-
-	return 0;
-}
-
-static const struct regmap_config ub953_regmap_config = {
-	.name = "ds90ub953",
-	.reg_bits = 8,
-	.val_bits = 8,
-	.reg_format_endian = REGMAP_ENDIAN_DEFAULT,
-	.val_format_endian = REGMAP_ENDIAN_DEFAULT,
-};
-
  static u64 ub953_get_fc_rate(struct ub953_data *priv)
  {
  	if (priv->hw_data->ub971) {
@@ -1322,16 +1272,52 @@ static int ub953_add_i2c_adapter(struct ub953_data *priv)
  	if (ret)
  		return ret;
  
-	priv->has_i2c_adapter = true;
-
  	return 0;
  }
  
-static void ub953_remove_i2c_adapter(struct ub953_data *priv)
+static const struct regmap_config ub953_regmap_config = {
+	.name = "ds90ub953",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_format_endian = REGMAP_ENDIAN_DEFAULT,
+	.val_format_endian = REGMAP_ENDIAN_DEFAULT,
+};
+
+static int ub953_parse_dt(struct ub953_data *priv)
  {
-	if (priv->has_i2c_adapter)
-		i2c_atr_del_adapter(priv->plat_data->atr,
-				    priv->plat_data->port);
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	struct device_node *ep_np;
+	int ret;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (!ep_np) {
+		dev_err(dev, "OF: no endpoint\n");
+		return -ENOENT;
+	}
+
+	ret = of_property_count_u32_elems(ep_np, "data-lanes");
+
+	of_node_put(ep_np);
+
+	if (ret <= 0) {
+		dev_err(dev, "OF: failed to parse data-lanes: %d\n", ret);
+		return ret;
+	}
+
+	if (ret != 1 && ret != 2 && ret != 4) {
+		dev_err(dev, "OF: bad number of data-lanes: %d\n", ret);
+		return -EINVAL;
+	}
+
+	priv->num_data_lanes = ret;
+
+	return 0;
  }
  
  static int ub953_probe(struct i2c_client *client)
@@ -1342,8 +1328,6 @@ static int ub953_probe(struct i2c_client *client)
  	u8 v;
  	bool mode_override;
  
-	dev_dbg(dev, "probing, addr 0x%02x\n", client->addr);
-
  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
  	if (!priv)
  		return -ENOMEM;
@@ -1383,15 +1367,15 @@ static int ub953_probe(struct i2c_client *client)
  	if (ret)
  		goto err_mutex_destroy;
  
-	if (!(v & BIT(3))) {
+	if (!(v & UB953_REG_MODE_SEL_MODE_DONE)) {
  		dev_err(dev, "Mode value not stabilized\n");
  		ret = -ENODEV;
  		goto err_mutex_destroy;
  	}
  
-	mode_override = v & BIT(4);
+	mode_override = v & UB953_REG_MODE_SEL_MODE_OVERRIDE;
  
-	switch (v & 0x7) {
+	switch (v & UB953_REG_MODE_SEL_MODE_MASK) {
  	case 0:
  		priv->mode = UB953_MODE_SYNC;
  		break;
@@ -1431,7 +1415,8 @@ static int ub953_probe(struct i2c_client *client)
  	if (ret)
  		goto err_mutex_destroy;
  
-	dev_dbg(dev, "i2c strap setting %s V\n", (v & 1) ? "1.8" : "3.3");
+	dev_dbg(dev, "i2c strap setting %s V\n",
+		(v & UB953_REG_GENERAL_CFG_I2C_STRAP_MODE) ? "1.8" : "3.3");
  
  	ret = ub953_i2c_master_init(priv);
  	if (ret) {
@@ -1446,9 +1431,9 @@ static int ub953_probe(struct i2c_client *client)
  	}
  
  	ub953_write(priv, UB953_REG_GENERAL_CFG,
-		    (1 << 6) | /* continuous clk */
-		    ((priv->num_data_lanes - 1) << 4) |
-		    (1 << 1)); /* CRC TX gen */
+		    UB953_REG_GENERAL_CFG_CONT_CLK |
+		    ((priv->num_data_lanes - 1) << UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT) |
+		    UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE);
  
  	ret = ub953_register_clkout(priv);
  	if (ret) {
@@ -1513,8 +1498,6 @@ static int ub953_probe(struct i2c_client *client)
  		goto err_unreg_async_subdev;
  	}
  
-	dev_dbg(dev, "Successfully probed\n");
-
  	return 0;
  
  err_unreg_async_subdev:
@@ -1543,9 +1526,8 @@ static void ub953_remove(struct i2c_client *client)
  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
  	struct ub953_data *priv = sd_to_ub953(sd);
  
-	dev_dbg(&client->dev, "Removing\n");
-
-	ub953_remove_i2c_adapter(priv);
+	i2c_atr_del_adapter(priv->plat_data->atr,
+			    priv->plat_data->port);
  
  	v4l2_async_unregister_subdev(&priv->sd);
  
@@ -1605,3 +1587,4 @@ MODULE_LICENSE("GPL");
  MODULE_DESCRIPTION("Texas Instruments DS90UB953 serializer driver");
  MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
  MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
+MODULE_IMPORT_NS(I2C_ATR);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index fef704ee5529..b532a93f3da7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -65,6 +65,10 @@
  
  #define UB960_SR_I2C_DEV_ID			0x00
  #define UB960_SR_RESET				0x01
+#define UB960_SR_RESET_DIGITAL_RESET1		BIT(1)
+#define UB960_SR_RESET_DIGITAL_RESET0		BIT(0)
+#define UB960_SR_RESET_GPIO_LOCK_RELEASE	BIT(5)
+
  #define UB960_SR_GEN_CONFIG			0x02
  #define UB960_SR_REV_MASK			0x03
  #define UB960_SR_DEVICE_STS			0x04
@@ -80,6 +84,10 @@
  #define UB960_SR_GPIO_PIN_STS			0x0E
  #define UB960_SR_GPIO_INPUT_CTL			0x0F
  #define UB960_SR_GPIO_PIN_CTL(n)		(0x10 + (n)) /* n < UB960_NUM_GPIOS */
+#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SEL		5
+#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SRC_SHIFT	2
+#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_EN		BIT(0)
+
  #define UB960_SR_FS_CTL				0x18
  #define UB960_SR_FS_HIGH_TIME_1			0x19
  #define UB960_SR_FS_HIGH_TIME_0			0x1A
@@ -135,7 +143,13 @@
  #define UB960_TR_CSI_TEST_PATT_LO		0x3A
  
  #define UB960_XR_SFILTER_CFG			0x41
+#define UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT	4
+#define UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT	0
+
  #define UB960_XR_AEQ_CTL1			0x42
+#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_SHIFT	4
+#define UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN	BIT(0)
+
  #define UB960_XR_AEQ_ERR_THOLD			0x43
  
  #define UB960_RR_BCC_ERR_CTL			0x46
@@ -213,6 +227,9 @@
  
  #define UB960_RR_CSI_ERR_COUNTER		0x7B
  #define UB960_RR_PORT_CONFIG2			0x7C
+#define UB960_RR_PORT_CONFIG2_LV_POL_LOW	BIT(1)
+#define UB960_RR_PORT_CONFIG2_FV_POL_LOW	BIT(0)
+
  #define UB960_RR_PORT_PASS_CTL			0x7D
  #define UB960_RR_SEN_INT_RISE_CTL		0x7E
  #define UB960_RR_SEN_INT_FALL_CTL		0x7F
@@ -247,9 +264,21 @@
  
  #define UB960_RR_PORT_DEBUG			0xD0
  #define UB960_RR_AEQ_CTL2			0xD2
+#define UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR		BIT(2)
+
  #define UB960_RR_AEQ_STATUS			0xD3
+
  #define UB960_RR_AEQ_BYPASS			0xD4
+#define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT	5
+#define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK	GENMASK(7, 5)
+#define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT	1
+#define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK	GENMASK(3, 1)
+#define UB960_RR_AEQ_BYPASS_ENABLE			BIT(0)
+
  #define UB960_RR_AEQ_MIN_MAX			0xD5
+#define UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT	4
+#define UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT	0
+
  #define UB960_RR_SFILTER_STS_0			0xD6
  #define UB960_RR_SFILTER_STS_1			0xD7
  #define UB960_RR_PORT_ICR_HI			0xD8
@@ -295,7 +324,12 @@
  #define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
  
  #define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
+#define UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
+#define UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
+
  #define UB960_IR_RX_ANA_STROBE_SET_DATA		0x09
+#define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
+#define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
  
  /* EQ related */
  
@@ -347,6 +381,8 @@ struct ub960_rxport {
  	struct i2c_client      *ser_client;	/* Serializer */
  	unsigned short          ser_alias;	/* Serializer i2c alias (lower 7 bits) */
  
+	u8			lv_fv_pol;	/* LV and FV polarities */
+
  	struct regulator	*vpoc;
  
  	/* EQ settings */
@@ -905,7 +941,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
  				   const struct i2c_client *client,
  				   u16 *alias_id)
  {
-	struct ub960_data *priv = i2c_atr_get_clientdata(atr);
+	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
  	struct ub960_rxport *rxport = priv->rxports[chan_id];
  	struct device *dev = &priv->client->dev;
  	struct atr_alias_table_entry *entry = NULL;
@@ -978,7 +1014,7 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
  static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
  				    const struct i2c_client *client)
  {
-	struct ub960_data *priv = i2c_atr_get_clientdata(atr);
+	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
  	struct ub960_rxport *rxport = priv->rxports[chan_id];
  	struct device *dev = &priv->client->dev;
  	struct atr_alias_table_entry *entry;
@@ -1134,6 +1170,51 @@ static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
   * RX ports
   */
  
+static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
+{
+	unsigned int nport;
+	int ret;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport || !rxport->vpoc)
+			continue;
+
+		ret = regulator_enable(rxport->vpoc);
+		if (ret)
+			goto err_disable_vpocs;
+	}
+
+	return 0;
+
+err_disable_vpocs:
+	for (; nport > 0; --nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport - 1];
+
+		if (!rxport || !rxport->vpoc)
+			continue;
+
+		regulator_disable(rxport->vpoc);
+	}
+
+	return ret;
+}
+
+static void ub960_rxport_disable_vpocs(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport || !rxport->vpoc)
+			continue;
+
+		regulator_disable(rxport->vpoc);
+	}
+}
+
  static void ub960_rxport_clear_errors(struct ub960_data *priv,
  				      unsigned int nport)
  {
@@ -1168,24 +1249,24 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
  	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
  		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
  
-	clk_delay = v & BIT(3) ? 0 : 6;
+	clk_delay = v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY ? 0 : 6;
  
  	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
  		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
  
-	data_delay = v & BIT(3) ? 0 : 6;
+	data_delay = v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY ? 0 : 6;
  
  	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
  	if (ret)
  		return ret;
  
-	clk_delay += v & 0x7;
+	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
  
  	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
  	if (ret)
  		return ret;
  
-	data_delay += v & 0x7;
+	data_delay += v & UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK;
  
  	*strobe_pos = data_delay - clk_delay;
  
@@ -1201,17 +1282,17 @@ static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
  		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
  		return;
  
-	clk_delay = BIT(3);
-	data_delay = BIT(3);
+	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
  
  	if (strobe_pos < -7)
  		clk_delay = abs(strobe_pos) - 6;
  	else if (strobe_pos > 7)
  		data_delay = strobe_pos - 6;
  	else if (strobe_pos < 0)
-		clk_delay = abs(strobe_pos) | BIT(3);
+		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
  	else if (strobe_pos > 0)
-		data_delay = strobe_pos | BIT(3);
+		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
  
  	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
  			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay);
@@ -1230,7 +1311,8 @@ static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
  	strobe_max += 7;
  
  	ub960_write(priv, UB960_XR_SFILTER_CFG,
-		    (u8)strobe_min | ((u8)strobe_max << 4));
+		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
+		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT));
  }
  
  static int ub960_rxport_get_eq_level(struct ub960_data *priv,
@@ -1267,10 +1349,11 @@ static void ub960_rxport_set_eq_level(struct ub960_data *priv,
  
  	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
  
-	v &= ~((0x7 << 5) | (0x7 << 1));
-	v |= eq_stage_1_select_value << 5;
-	v |= eq_stage_2_select_value << 1;
-	v |= BIT(0); /* Enable AEQ Bypass */
+	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
+	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
+	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
+	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
+	v |= UB960_RR_AEQ_BYPASS_ENABLE; /* Enable AEQ Bypass */
  
  	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
  }
@@ -1279,11 +1362,13 @@ static void ub960_rxport_set_eq_range(struct ub960_data *priv,
  				      unsigned int nport, u8 eq_min, u8 eq_max)
  {
  	ub960_rxport_write(priv, nport, UB960_RR_AEQ_MIN_MAX,
-			   eq_min | (eq_max << 4));
+			   (eq_min << UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) |
+			   (eq_max << UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT));
  
  	/* Enable AEQ min setting */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2, BIT(2),
-				 BIT(2));
+	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2,
+				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR,
+				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR);
  }
  
  static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
@@ -1294,10 +1379,13 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
  
  	if (priv->strobe.manual) {
  		/* Disable AEQ_SFILTER_EN */
-		ub960_update_bits(priv, UB960_XR_AEQ_CTL1, BIT(0), 0);
+		ub960_update_bits(priv, UB960_XR_AEQ_CTL1,
+				  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0);
  	} else {
  		/* Enable SFILTER and error control */
-		ub960_write(priv, UB960_XR_AEQ_CTL1, (0x7 << 4) | BIT(0));
+		ub960_write(priv, UB960_XR_AEQ_CTL1,
+			    (0x7 << UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_SHIFT) |
+				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN);
  
  		/* Set AEQ strobe range */
  		ub960_rxport_set_strobe_range(priv, priv->strobe.min,
@@ -1317,7 +1405,8 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
  
  		/* Enable AEQ Bypass */
  		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
-					 BIT(0), BIT(0));
+					 UB960_RR_AEQ_BYPASS_ENABLE,
+					 UB960_RR_AEQ_BYPASS_ENABLE);
  	} else {
  		ub960_rxport_set_eq_range(priv, nport,
  					  rxport->eq.aeq.eq_level_min,
@@ -1325,7 +1414,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
  
  		/* Disable AEQ Bypass */
  		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
-					 BIT(0), 0);
+					 UB960_RR_AEQ_BYPASS_ENABLE, 0);
  	}
  }
  
@@ -1492,7 +1581,7 @@ static int ub960_init_atr(struct ub960_data *priv)
  	if (IS_ERR(priv->atr))
  		return PTR_ERR(priv->atr);
  
-	i2c_atr_set_clientdata(priv->atr, priv);
+	i2c_atr_set_driver_data(priv->atr, priv);
  
  	return 0;
  }
@@ -1800,7 +1889,8 @@ static void ub960_init_rx_port_ub960(struct ub960_data *priv,
  	}
  
  	/* LV_POLARITY & FV_POLARITY */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3, 0x1);
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
+				 rxport->lv_fv_pol);
  
  	/* Enable all interrupt sources from this port */
  	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
@@ -2758,8 +2848,6 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  	struct device *dev = &priv->client->dev;
  	u8 vc_map[UB960_MAX_RX_NPORTS] = { 0 };
  
-	dev_dbg(dev, "%s for pad %d\n", __func__, pad);
-
  	if (!ub960_pad_is_source(priv, pad))
  		return -EINVAL;
  
@@ -2805,9 +2893,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  		}
  
  		fd->entry[fd->num_entries].stream = route->source_stream;
-
-		fd->entry[fd->num_entries].flags =
-			V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
  		fd->entry[fd->num_entries].length = source_entry->length;
  		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
  
@@ -3015,13 +3101,15 @@ static int ub960_log_status(struct v4l2_subdev *sd)
  		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
  
  		dev_info(dev, "\t%s strobe\n",
-			 (v & BIT(0)) ? "Adaptive" : "Manual");
+			 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
+								  "Manual");
  
-		if (v & BIT(0)) {
+		if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
  			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
  
  			dev_info(dev, "\tStrobe range [%d, %d]\n",
-				 (v & 0xf) - 7, ((v >> 4) & 0xf) - 7);
+				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
+				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
  		}
  
  		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
@@ -3033,14 +3121,15 @@ static int ub960_log_status(struct v4l2_subdev *sd)
  		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
  
  		dev_info(dev, "\t%s EQ\n",
-			 (v & BIT(0)) ? "Manual" : "Adaptive");
+			 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
+							    "Adaptive");
  
-		if (!(v & BIT(0))) {
-			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX,
-					  &v);
+		if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
+			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
  
-			dev_info(dev, "\tEQ range [%u, %u]\n", v & 0xf,
-				 (v >> 4) & 0xf);
+			dev_info(dev, "\tEQ range [%u, %u]\n",
+				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
+				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
  		}
  
  		ub960_rxport_get_eq_level(priv, nport, &eq_level);
@@ -3270,9 +3359,6 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
  		if (!rxport)
  			continue;
  
-		if (rxport->vpoc)
-			regulator_disable(rxport->vpoc);
-
  		fwnode_handle_put(rxport->fwnode);
  		of_node_put(rxport->remote_of_node);
  
@@ -3416,6 +3502,51 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
  	return 0;
  }
  
+static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv, struct ub960_rxport *rxport)
+{
+	struct device *dev = &priv->client->dev;
+	struct device_node *ep_np;
+	int ret;
+	u32 v;
+
+	switch (rxport->rx_mode) {
+	case RXPORT_MODE_RAW10:
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		break;
+	default:
+		return 0;
+	}
+
+	ep_np = of_graph_get_endpoint_by_regs(priv->client->dev.of_node,
+					      rxport->nport, 0);
+	if (!ep_np)
+		return -EINVAL;
+
+	ret = of_property_read_u32(ep_np, "hsync-active", &v);
+	if (ret) {
+		dev_err(dev, "Failed to parse 'hsync-active' for port %u: %d\n",
+			rxport->nport, ret);
+		goto err;
+	}
+
+	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_LV_POL_LOW : 0;
+
+	ret = of_property_read_u32(ep_np, "vsync-active", &v);
+	if (ret) {
+		dev_err(dev, "Failed to parse 'vsync-active' for port %u: %d\n",
+			rxport->nport, ret);
+		goto err;
+	}
+
+	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_FV_POL_LOW : 0;
+
+	return 0;
+err:
+	of_node_put(ep_np);
+	return ret;
+}
+
  static int ub960_parse_dt_rxport(struct ub960_data *priv,
  				 struct device_node *np)
  {
@@ -3501,16 +3632,13 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv,
  
  	rxport->fwnode = remote_ep_node;
  
-	// XXX enable somewhere else?
-	if (rxport->vpoc) {
-		ret = regulator_enable(rxport->vpoc);
-		if (ret)
-			goto err_ep_node_put;
-	}
+	ret = ub960_parse_dt_rxport_ep_properties(priv, rxport);
+	if (ret)
+		goto err_remote_ep_node_put;
  
  	return 0;
  
-err_ep_node_put:
+err_remote_ep_node_put:
  	fwnode_handle_put(rxport->fwnode);
  err_ser_node_put:
  	of_node_put(rxport->remote_of_node);
@@ -3659,8 +3787,6 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
  	unsigned int i;
  	int ret;
  
-	dev_dbg(dev, "Bind %s\n", subdev->name);
-
  	ret = media_entity_get_fwnode_pad(&subdev->entity, rxport->fwnode,
  					  MEDIA_PAD_FL_SOURCE);
  	if (ret < 0) {
@@ -3700,11 +3826,7 @@ static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
  				struct v4l2_subdev *subdev,
  				struct v4l2_async_subdev *asd)
  {
-	struct ub960_data *priv = sd_to_ub960(notifier->sd);
  	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unbind %s\n", subdev->name);
  
  	rxport->sd = NULL;
  }
@@ -3755,10 +3877,6 @@ static int ub960_v4l2_notifier_register(struct ub960_data *priv)
  
  static void ub960_v4l2_notifier_unregister(struct ub960_data *priv)
  {
-	struct device *dev = &priv->client->dev;
-
-	dev_dbg(dev, "Unregister async notif\n");
-
  	v4l2_async_nf_unregister(&priv->notifier);
  	v4l2_async_nf_cleanup(&priv->notifier);
  }
@@ -3870,7 +3988,8 @@ static void ub960_reset(struct ub960_data *priv, bool reset_regs)
  	int ret;
  	u8 bit;
  
-	bit = reset_regs ? BIT(1) : BIT(0);
+	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
+			   UB960_SR_RESET_DIGITAL_RESET0;
  
  	ub960_write(priv, UB960_SR_RESET, bit);
  
@@ -4041,7 +4160,9 @@ static int ub960_probe(struct i2c_client *client)
  
  	/* release GPIO lock */
  	if (priv->hw_data->ub9702)
-		ub960_update_bits(priv, UB960_SR_RESET, BIT(5), BIT(5));
+		ub960_update_bits(priv, UB960_SR_RESET,
+				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
+				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
  
  	ret = ub960_parse_dt(priv);
  	if (ret)
@@ -4051,10 +4172,14 @@ static int ub960_probe(struct i2c_client *client)
  	if (ret)
  		goto err_free_ports;
  
-	ret = ub960_init_rx_ports(priv);
+	ret = ub960_rxport_enable_vpocs(priv);
  	if (ret)
  		goto err_free_ports;
  
+	ret = ub960_init_rx_ports(priv);
+	if (ret)
+		goto err_disable_vpocs;
+
  	ub960_reset(priv, false);
  
  	ub960_rxport_wait_locks(priv, 0xf, NULL);
@@ -4067,7 +4192,7 @@ static int ub960_probe(struct i2c_client *client)
  
  	ret = ub960_init_atr(priv);
  	if (ret)
-		goto err_free_ports;
+		goto err_disable_vpocs;
  
  	ret = ub960_rxport_add_serializers(priv);
  	if (ret)
@@ -4077,43 +4202,20 @@ static int ub960_probe(struct i2c_client *client)
  	if (ret)
  		goto err_free_sers;
  
-	if (client->irq) {
-		dev_dbg(dev, "using IRQ %d\n", client->irq);
+	if (client->irq)
+		dev_warn(dev, "irq support not implemented, using polling\n");
  
-		ret = devm_request_threaded_irq(dev, client->irq, NULL,
-						ub960_handle_events,
-						IRQF_ONESHOT, client->name,
-						priv);
-		if (ret) {
-			dev_err(dev, "Cannot enable IRQ (%d)\n", ret);
-			goto err_irq;
-		}
-
-		/* Disable GPIO3 as input */
-		ub960_update_bits(priv, UB960_SR_GPIO_INPUT_CTL, BIT(3), 0);
-		/* Enable GPIO3 as output, active low interrupt */
-		ub960_write(priv, UB960_SR_GPIO_PIN_CTL(3), 0xd1);
-
-		ub960_write(priv, UB960_SR_INTERRUPT_CTL,
-			    UB960_SR_INTERRUPT_CTL_ALL);
-	} else {
-		/* No IRQ, fallback to polling */
-		schedule_delayed_work(&priv->poll_work,
-				      msecs_to_jiffies(UB960_POLL_TIME_MS));
-
-		dev_dbg(dev, "using polling mode\n");
-	}
-
-	dev_info(dev, "Successfully probed\n");
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(UB960_POLL_TIME_MS));
  
  	return 0;
  
-err_irq:
-	ub960_destroy_subdev(priv);
  err_free_sers:
  	ub960_rxport_remove_serializers(priv);
  err_uninit_atr:
  	ub960_uninit_atr(priv);
+err_disable_vpocs:
+	ub960_rxport_disable_vpocs(priv);
  err_free_ports:
  	ub960_rxport_free_ports(priv);
  	ub960_txport_free_ports(priv);
@@ -4130,20 +4232,17 @@ static void ub960_remove(struct i2c_client *client)
  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
  	struct ub960_data *priv = sd_to_ub960(sd);
  
-	dev_dbg(&client->dev, "Removing\n");
-
  	cancel_delayed_work_sync(&priv->poll_work);
  
  	ub960_destroy_subdev(priv);
  	ub960_rxport_remove_serializers(priv);
  	ub960_uninit_atr(priv);
+	ub960_rxport_disable_vpocs(priv);
  	ub960_rxport_free_ports(priv);
  	ub960_txport_free_ports(priv);
  	ub960_disable_core_hw(priv);
  	mutex_destroy(&priv->atr_alias_table.lock);
  	mutex_destroy(&priv->reg_lock);
-
-	dev_dbg(&client->dev, "Remove done\n");
  }
  
  static const struct ub960_hw_data ds90ub960_hw = {
@@ -4190,6 +4289,7 @@ static struct i2c_driver ds90ub960_driver = {
  module_i2c_driver(ds90ub960_driver);
  
  MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Texas Instruments DS90UB960-Q1 FPDLink-3 deserializer driver");
+MODULE_DESCRIPTION("Texas Instruments DS90UB960-Q1 FPD-Link deserializer driver");
  MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
  MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
+MODULE_IMPORT_NS(I2C_ATR);
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 044c87c5b336..5b879115dfc6 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -3,6 +3,7 @@
   * I2C Address Translator
   *
   * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
   *
   * Based on i2c-mux.h
   */
@@ -11,12 +12,11 @@
  #define _LINUX_I2C_ATR_H
  
  #include <linux/i2c.h>
-#include <linux/mutex.h>
  #include <linux/types.h>
  
  struct device;
-struct i2c_atr;
  struct fwnode_handle;
+struct i2c_atr;
  
  /**
   * struct i2c_atr_ops - Callbacks from ATR to the device driver.
@@ -42,41 +42,77 @@ struct i2c_atr_ops {
  };
  
  /**
- * struct i2c_atr - Represents the I2C ATR instance
+ * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
+ * @parent:       The parent (upstream) adapter
+ * @dev:          The device acting as an ATR
+ * @ops:          Driver-specific callbacks
+ * @max_adapters: Maximum number of child adapters
+ *
+ * The new ATR helper is connected to the parent adapter but has no child
+ * adapters. Call i2c_atr_add_adapter() to add some.
+ *
+ * Call i2c_atr_delete() to remove.
+ *
+ * Return: pointer to the new ATR helper object, or ERR_PTR
   */
-struct i2c_atr {
-	/* private: internal use only */
-
-	struct i2c_adapter *parent;
-	struct device *dev;
-	const struct i2c_atr_ops *ops;
-
-	void *priv;
-
-	struct i2c_algorithm algo;
-	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
-	struct mutex lock;
-	int max_adapters;
-
-	struct i2c_adapter *adapter[];
-};
-
  struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
  			    const struct i2c_atr_ops *ops, int max_adapters);
-void i2c_atr_delete(struct i2c_atr *atr);
-
-static inline void i2c_atr_set_clientdata(struct i2c_atr *atr, void *data)
-{
-	atr->priv = data;
-}
  
-static inline void *i2c_atr_get_clientdata(struct i2c_atr *atr)
-{
-	return atr->priv;
-}
+/**
+ * i2c_atr_delete - Delete an I2C ATR helper.
+ * @atr: I2C ATR helper to be deleted.
+ *
+ * Precondition: all the adapters added with i2c_atr_add_adapter() mumst be
+ * removed by calling i2c_atr_del_adapter().
+ */
+void i2c_atr_delete(struct i2c_atr *atr);
  
+/**
+ * i2c_atr_add_adapter - Create a child ("downstream") I2C bus.
+ * @atr:        The I2C ATR
+ * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
+ *              passed to the callbacks in `struct i2c_atr_ops`.
+ * @bus_handle: The fwnode handle that points to the adapter's i2c
+ *              peripherals, or NULL.
+ *
+ * After calling this function a new i2c bus will appear. Adding and removing
+ * devices on the downstream bus will result in calls to the
+ * &i2c_atr_ops->attach_client and &i2c_atr_ops->detach_client callbacks for the
+ * driver to assign an alias to the device.
+ *
+ * The adapter's fwnode is set to @bus_handle, or if @bus_handle is NULL the
+ * function looks for a child node whose 'reg' property matches the chan_id
+ * under the i2c-atr device's 'i2c-atr' node.
+ *
+ * Call i2c_atr_del_adapter() to remove the adapter.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
  int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
-			struct fwnode_handle *bus_np);
+			struct fwnode_handle *bus_handle);
+
+/**
+ * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
+ *                       i2c_atr_add_adapter(). If no I2C bus has been added
+ *                       this function is a no-op.
+ * @atr:     The I2C ATR
+ * @chan_id: Index of the adapter to be removed (0 .. max_adapters-1)
+ */
  void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id);
  
+/**
+ * i2c_atr_set_driver_data - Set private driver data to the i2c-atr instance.
+ * @atr:  The I2C ATR
+ * @data: Pointer to the data to store
+ */
+void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data);
+
+/**
+ * i2c_atr_get_driver_data - Get the stored drive data.
+ * @atr:     The I2C ATR
+ *
+ * Return: Pointer to the stored data
+ */
+void *i2c_atr_get_driver_data(struct i2c_atr *atr);
+
  #endif /* _LINUX_I2C_ATR_H */

