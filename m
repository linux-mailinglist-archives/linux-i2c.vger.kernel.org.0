Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6BE646D79
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 11:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLHKrZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 05:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiLHKqi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 05:46:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8747F8B3;
        Thu,  8 Dec 2022 02:42:18 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C39225B;
        Thu,  8 Dec 2022 11:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670496137;
        bh=ICcJ0/r7U2tlteHUFu6A2N/nc40xM8CLOFtCYSZS+4c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Rp4sTUe1Ebd9Ux55DVGDi0Ti6p7i9rl1qV8v/SKCjaGLvFXomoRzqLBL21YRj9iy7
         rqhnF53A2wzGo9bbHLZxkwlUcC9NKaybxfONHbARdKL/eh9Q8GXwblgn2OpUwh3H9A
         idG4zBz6CYB9DZNKrfZvRhMsw4tlvabxFf8/8xxg=
Message-ID: <c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com>
Date:   Thu, 8 Dec 2022 12:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/8] i2c-atr and FPDLink
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
        Marek Vasut <marex@denx.de>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/12/2022 12:39, Tomi Valkeinen wrote:
> Hi,
> 
> You can find v4 of the series from:
> 
> https://lore.kernel.org/all/20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com/
> 
> You can find a longer introduction of the series in that version's cover
> letter.
> 
> There has been a lot of changes to the DT bindings and the i2c-atr code in this
> version, but they are all fixes and cleanups, no architectural changes. The
> FPDLink drivers have not been changed, except to reflect the changes in the
> DT.
> 
> I will send a diff between v4 and v5 to give a better idea of the changes.

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
index 1e0d66704968..3a5b34c6bb64 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
@@ -9,7 +9,7 @@ title: Texas Instruments DS90UB913 FPD-Link 3 Serializer
  maintainers:
    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  
-description: |
+description:
    The TI DS90UB913 is an FPD-Link 3 video serializer for parallel video.
  
  properties:
@@ -38,23 +38,21 @@ properties:
      $ref: /schemas/graph.yaml#/properties/ports
  
      properties:
-
        port@0:
          $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
          description: CSI-2 input port
  
          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
  
        port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link 3 output port
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
    i2c:
      $ref: /schemas/i2c/i2c-controller.yaml#
      unevaluatedProperties: false
@@ -106,15 +104,11 @@ examples:
          #address-cells = <1>;
          #size-cells = <0>;
  
-        sensor@37 {
-          compatible = "ovti,ov10635";
-          reg = <0x37>;
+        sensor@48 {
+          compatible = "aptina,mt9v111";
+          reg = <0x48>;
  
            clocks = <&fixed_clock>;
-          clock-names = "xvclk";
-
-          reset-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
-          powerdown-gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;
  
            port {
              sensor_out: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 355f7d6a19fe..fd7d25d93e2c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -9,7 +9,7 @@ title: Texas Instruments DS90UB953 FPD-Link 3 Serializer
  maintainers:
    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  
-description: |
+description:
    The TI DS90UB953 is an FPD-Link 3 video serializer for MIPI CSI-2.
  
  properties:
@@ -30,23 +30,21 @@ properties:
      $ref: /schemas/graph.yaml#/properties/ports
  
      properties:
-
        port@0:
          $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
          description: CSI-2 input port
  
          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
  
        port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link 3 output port
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
    i2c:
      $ref: /schemas/i2c/i2c-controller.yaml#
      unevaluatedProperties: false
@@ -97,17 +95,11 @@ examples:
          #address-cells = <1>;
          #size-cells = <0>;
  
-        sensor@21 {
-          compatible = "sony,imx390";
-          reg = <0x21>;
-
-          clocks = <&clk_cam_27M>;
-          clock-names = "inck";
+        sensor@1a {
+          compatible = "sony,imx274";
+          reg = <0x1a>;
  
-          xclr-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
-          error0-gpios = <&serializer 1 GPIO_ACTIVE_HIGH>;
-          error1-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
-          comready-gpios = <&serializer 3 GPIO_ACTIVE_HIGH>;
+          reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
  
            port {
              sensor_out: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 4456d9b3e2c7..d8b5e219d420 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -9,7 +9,7 @@ title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
  maintainers:
    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  
-description: |
+description:
    The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
    forwarding.
  
@@ -24,10 +24,6 @@ properties:
      description:
        i2c addresses for the deserializer and the serializers
  
-  reg-names:
-    items:
-      - const: main
-
    clocks:
      maxItems: 1
      description:
@@ -45,7 +41,12 @@ properties:
    i2c-alias-pool:
      $ref: /schemas/types.yaml#/definitions/uint16-array
      description:
-      i2c alias pool for remote devices.
+      i2c alias pool is a pool of i2c addresses on the main i2c bus that can be
+      used to access the remote peripherals. The addresses must be available,
+      not used by any other peripheral. Each remote peripheral is assigned an
+      alias from the pool, and transactions to that address will be forwarded
+      to the remote peripheral, with the address translated to the remote
+      peripheral's real address.
  
    links:
      type: object
@@ -58,7 +59,7 @@ properties:
        '#size-cells':
          const: 0
  
-      manual-strobe:
+      ti,manual-strobe:
          type: boolean
          description:
            Enable manual strobe position and EQ level
@@ -73,12 +74,12 @@ properties:
              maxItems: 1
  
            i2c-alias:
-            description: |
+            description:
                The i2c address used for the serializer. Transactions to this
                address on the i2c bus where the deserializer resides are
                forwarded to the serializer.
  
-          rx-mode:
+          ti,rx-mode:
              $ref: /schemas/types.yaml#/definitions/uint32
              enum:
                - 0 # RAW10
@@ -88,23 +89,23 @@ properties:
                - 4 # CSI2 NON-SYNC
              description: FPD-Link Input Mode
  
-          cdr-mode:
+          ti,cdr-mode:
              $ref: /schemas/types.yaml#/definitions/uint32
              enum:
                - 0 # FPD3
                - 1 # FPD4
              description: FPD-Link CDR Mode
  
-          strobe-pos:
+          ti,strobe-pos:
              $ref: /schemas/types.yaml#/definitions/int32
              minimum: -13
              maximum: 13
-            description: Manual strobe position, from -13 to 13
+            description: Manual strobe position
  
-          eq-level:
+          ti,eq-level:
              $ref: /schemas/types.yaml#/definitions/uint32
              maximum: 14
-            description: Manual EQ level, from 0 to 14
+            description: Manual EQ level
  
            serializer:
              type: object
@@ -113,7 +114,7 @@ properties:
          required:
            - reg
            - i2c-alias
-          - rx-mode
+          - ti,rx-mode
            - serializer
  
    ports:
@@ -121,65 +122,51 @@ properties:
  
      properties:
        port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link input 0
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
        port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link input 1
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
        port@2:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link input 2
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
        port@3:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
          description: FPD-Link input 3
  
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-
        port@4:
          $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
          description: CSI-2 Output 0
  
          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
  
              properties:
-              clock-lanes:
-                maxItems: 1
-
                data-lanes:
                  minItems: 1
                  maxItems: 4
  
        port@5:
          $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
          description: CSI-2 Output 1
  
          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
  
              properties:
-              clock-lanes:
-                maxItems: 1
-
                data-lanes:
                  minItems: 1
                  maxItems: 4
@@ -204,9 +191,7 @@ examples:
  
        deser@3d {
          compatible = "ti,ds90ub960-q1";
-
-        reg-names = "main";
-        reg       = <0x3d>;
+        reg = <0x3d>;
  
          clock-names = "refclk";
          clocks = <&fixed_clock>;
@@ -225,19 +210,15 @@ examples:
  
              ub960_fpd3_1_in: endpoint {
                remote-endpoint = <&ub953_1_out>;
-
-              rx-mode = <0>;
              };
            };
  
-          /* Port 0, Camera 1 */
+          /* Port 1, Camera 1 */
            port@1 {
              reg = <1>;
  
              ub960_fpd3_2_in: endpoint {
                remote-endpoint = <&ub913_2_out>;
-
-              rx-mode = <0>;
              };
            };
  
@@ -245,7 +226,6 @@ examples:
            port@4 {
              reg = <4>;
              ds90ub960_0_csi_out: endpoint {
-              clock-lanes = <0>;
                data-lanes = <1 2 3 4>;
                link-frequencies = /bits/ 64 <800000000>;
                remote-endpoint = <&csi2_phy0>;
@@ -257,13 +237,13 @@ examples:
            #address-cells = <1>;
            #size-cells = <0>;
  
-          /* Link 0 has DS90UB953 serializer and IMX390 sensor */
+          /* Link 0 has DS90UB953 serializer and IMX274 sensor */
  
            link@0 {
              reg = <0>;
-            i2c-alias = <68>;
+            i2c-alias = <0x44>;
  
-            rx-mode = <3>;
+            ti,rx-mode = <3>;
  
              serializer1: serializer {
                compatible = "ti,ds90ub953-q1";
@@ -280,7 +260,6 @@ examples:
                  port@0 {
                    reg = <0>;
                    ub953_1_in: endpoint {
-                    clock-lanes = <0>;
                      data-lanes = <1 2 3 4>;
                      remote-endpoint = <&sensor_1_out>;
                    };
@@ -299,17 +278,11 @@ examples:
                  #address-cells = <1>;
                  #size-cells = <0>;
  
-                sensor@21 {
-                  compatible = "sony,imx390";
-                  reg = <0x21>;
-
-                  clocks = <&clk_cam_27M>;
-                  clock-names = "inck";
+                sensor@1a {
+                  compatible = "sony,imx274";
+                  reg = <0x1a>;
  
-                  xclr-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
-                  error0-gpios = <&serializer1 1 GPIO_ACTIVE_HIGH>;
-                  error1-gpios = <&serializer1 2 GPIO_ACTIVE_HIGH>;
-                  comready-gpios = <&serializer1 3 GPIO_ACTIVE_HIGH>;
+                  reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
  
                    port {
                      sensor_1_out: endpoint {
@@ -321,13 +294,13 @@ examples:
              };
            };  /* End of link@0 */
  
-          /* Link 1 has DS90UB913 serializer and OV10635 sensor */
+          /* Link 1 has DS90UB913 serializer and MT9V111 sensor */
  
            link@1 {
              reg = <1>;
-            i2c-alias = <69>;
+            i2c-alias = <0x45>;
  
-            rx-mode = <0>;
+            ti,rx-mode = <0>;
  
              serializer2: serializer {
                compatible = "ti,ds90ub913a-q1";
@@ -364,22 +337,15 @@ examples:
                  #address-cells = <1>;
                  #size-cells = <0>;
  
-                sensor@30 {
-                  compatible = "ovti,ov10635";
-                  reg = <0x30>;
+                sensor@48 {
+                  compatible = "aptina,mt9v111";
+                  reg = <0x48>;
  
                    clocks = <&serializer2>;
-                  clock-names = "xvclk";
-
-                  powerdown-gpios = <&serializer2 0 GPIO_ACTIVE_HIGH>;
  
                    port {
                      sensor_2_out: endpoint {
                        remote-endpoint = <&ub913_2_in>;
-                      hsync-active = <1>;
-                      vsync-active = <1>;
-                      pclk-sample = <0>;
-                      bus-width = <10>;
                      };
                    };
                  };
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 3d177d4ec1d2..aaf33d1315f4 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -16,9 +16,9 @@ Introduction
     instantiating-devices
     busses/index
     i2c-topology
+   muxes/i2c-atr
     muxes/i2c-mux-gpio
     i2c-sysfs
-   muxes/i2c-atr
  
  Writing device drivers
  ======================
diff --git a/MAINTAINERS b/MAINTAINERS
index 357de12cbca6..4c375e30f951 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9569,7 +9569,8 @@ S:	Maintained
  F:	drivers/i2c/i2c-core-acpi.c
  
  I2C ADDRESS TRANSLATOR (ATR)
-M:	Luca Ceresoli <luca@lucaceresoli.net>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+R:	Luca Ceresoli <luca.ceresoli@bootlin.com>
  L:	linux-i2c@vger.kernel.org
  S:	Maintained
  F:	drivers/i2c/i2c-atr.c
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 5636bbd03b09..1d3b25a6550f 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -7,14 +7,17 @@
   * Originally based on i2c-mux.c
   */
  
+#include <linux/fwnode.h>
  #include <linux/i2c-atr.h>
  #include <linux/i2c.h>
  #include <linux/kernel.h>
  #include <linux/module.h>
  #include <linux/mutex.h>
-#include <linux/of.h>
  #include <linux/slab.h>
  
+#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */
+#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */
+
  /**
   * struct i2c_atr_cli2alias_pair - Hold the alias assigned to a client.
   * @node:   List node
@@ -85,9 +88,11 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
  
  	/* Ensure we have enough room to save the original addresses */
  	if (unlikely(chan->orig_addrs_size < num)) {
-		void *new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
-					      GFP_KERNEL);
-		if (new_buf == NULL)
+		u16 *new_buf;
+
+		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
+					GFP_KERNEL);
+		if (!new_buf)
  			return -ENOMEM;
  
  		kfree(chan->orig_addrs);
@@ -118,7 +123,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
   *
   * @see i2c_atr_map_msgs()
   */
-static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg msgs[],
+static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
  			       int num)
  {
  	int i;
@@ -127,7 +132,7 @@ static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg msgs[],
  		msgs[i].addr = chan->orig_addrs[i];
  }
  
-static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
+static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
  			       int num)
  {
  	struct i2c_atr_chan *chan = adap->algo_data;
@@ -236,8 +241,8 @@ static int i2c_atr_attach_client(struct i2c_adapter *adapter,
  	struct i2c_atr_chan *chan = adapter->algo_data;
  	struct i2c_atr *atr = chan->atr;
  	struct i2c_atr_cli2alias_pair *c2a;
-	u16 alias_id = 0;
-	int ret = 0;
+	u16 alias_id;
+	int ret;
  
  	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
  	if (!c2a)
@@ -311,7 +316,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
  	struct i2c_adapter *parent = atr->parent;
  	struct device *dev = atr->dev;
  	struct i2c_atr_chan *chan;
-	char *symlink_name;
+	char symlink_name[ATR_MAX_SYMLINK_LEN];
  	int ret;
  
  	if (chan_id >= atr->max_adapters) {
@@ -370,24 +375,26 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
  	if (ret) {
  		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
  			chan_id, ret);
-		goto err_add_adapter;
+		goto err_mutex_destroy;
  	}
  
-	symlink_name = kasprintf(GFP_KERNEL, "channel-%u", chan_id);
-
-	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
-	     "can't create symlink to atr device\n");
-	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
-	     "can't create symlink for channel %u\n", chan_id);
+	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
+		 chan->chan_id);
  
-	kfree(symlink_name);
+	ret = sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device");
+	if (ret)
+		dev_warn(dev, "can't create symlink to atr device\n");
+	ret = sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name);
+	if (ret)
+		dev_warn(dev, "can't create symlink for channel %u\n", chan_id);
  
  	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
  
  	atr->adapter[chan_id] = &chan->adap;
  	return 0;
  
-err_add_adapter:
+err_mutex_destroy:
+	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
  	mutex_destroy(&chan->orig_addrs_lock);
  	kfree(chan);
  	return ret;
@@ -402,14 +409,14 @@ EXPORT_SYMBOL_GPL(i2c_atr_add_adapter);
   */
  void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
  {
-	char symlink_name[20];
+	char symlink_name[ATR_MAX_SYMLINK_LEN];
  
  	struct i2c_adapter *adap = atr->adapter[chan_id];
  	struct i2c_atr_chan *chan = adap->algo_data;
-	struct fwnode_handle *fwnode = adap->dev.fwnode;
+	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
  	struct device *dev = atr->dev;
  
-	if (atr->adapter[chan_id] == NULL) {
+	if (!atr->adapter[chan_id]) {
  		dev_err(dev, "Adapter %d does not exist\n", chan_id);
  		return;
  	}
@@ -418,8 +425,8 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
  
  	atr->adapter[chan_id] = NULL;
  
-	snprintf(symlink_name, sizeof(symlink_name),
-		 "channel-%u", chan->chan_id);
+	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
+		 chan->chan_id);
  	sysfs_remove_link(&dev->kobj, symlink_name);
  	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
  
@@ -449,16 +456,15 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
  			    const struct i2c_atr_ops *ops, int max_adapters)
  {
  	struct i2c_atr *atr;
-	size_t atr_size;
  
-	if (!ops || !ops->attach_client || !ops->detach_client)
+	if (max_adapters > ATR_MAX_ADAPTERS)
  		return ERR_PTR(-EINVAL);
  
-	atr_size = struct_size(atr, adapter, max_adapters);
-	if (atr_size == SIZE_MAX)
-		return ERR_PTR(-EOVERFLOW);
+	if (!ops || !ops->attach_client || !ops->detach_client)
+		return ERR_PTR(-EINVAL);
  
-	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
+	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
+			   GFP_KERNEL);
  	if (!atr)
  		return ERR_PTR(-ENOMEM);
  
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 1563fa0abf0e..b24f89f58807 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1603,7 +1603,12 @@ menu "Video serializers and deserializers"
  
  config VIDEO_DS90UB960
  	tristate "TI DS90UB960 Deserializer"
-	depends on OF_GPIO
+	depends on OF && I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select REGMAP_I2C
+	select OF_GPIO
  	select I2C_ATR
  	help
  	  Device driver for the Texas Instruments DS90UB960
@@ -1611,12 +1616,26 @@ config VIDEO_DS90UB960
  
  config VIDEO_DS90UB913
  	tristate "TI DS90UB913 Serializer"
+	depends on OF && I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select REGMAP_I2C
+	select OF_GPIO
+	select I2C_ATR
  	help
  	  Device driver for the Texas Instruments DS90UB913
  	  FPD-Link III Serializer.
  
  config VIDEO_DS90UB953
  	tristate "TI DS90UB953 Serializer"
+	depends on OF && I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select REGMAP_I2C
+	select OF_GPIO
+	select I2C_ATR
  	help
  	  Device driver for the Texas Instruments DS90UB953
  	  FPD-Link III Serializer.
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c653474b5efc..fef704ee5529 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2253,7 +2253,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
  	unsigned int i;
  	unsigned int nport;
  	u8 fwd_ctl;
-	u32 active_tx_mask = 0;
  	struct {
  		u32 num_streams;
  		u8 pixel_dt;
@@ -2283,8 +2282,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
  		if (!txport)
  			return -EINVAL;
  
-		active_tx_mask |= BIT(ub960_pad_to_port(priv, route->source_pad));
-
  		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
  
  		rx_data[nport].num_streams++;
@@ -3346,7 +3343,7 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
  	u32 eq_level;
  	unsigned int nport = rxport->nport;
  
-	ret = of_property_read_u32(np, "cdr-mode", &cdr_mode);
+	ret = of_property_read_u32(np, "ti,cdr-mode", &cdr_mode);
  	if (ret == -EINVAL) {
  		cdr_mode = RXPORT_CDR_FPD3;
  	} else if (ret < 0) {
@@ -3367,7 +3364,7 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
  
  	rxport->cdr_mode = cdr_mode;
  
-	ret = of_property_read_u32(np, "rx-mode", &rx_mode);
+	ret = of_property_read_u32(np, "ti,rx-mode", &rx_mode);
  	if (ret < 0) {
  		dev_err(dev, "Missing RX port RX mode: %d\n", ret);
  		return ret;
@@ -3387,10 +3384,10 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
  	rxport->eq.aeq.eq_level_min = UB960_MIN_EQ_LEVEL;
  	rxport->eq.aeq.eq_level_max = UB960_MAX_EQ_LEVEL;
  
-	ret = of_property_read_s32(np, "strobe-pos", &strobe_pos);
+	ret = of_property_read_s32(np, "ti,strobe-pos", &strobe_pos);
  	if (ret) {
  		if (ret != -EINVAL) {
-			dev_err(dev, "Failed to read 'strobe-pos': %d\n", ret);
+			dev_err(dev, "Failed to read 'ti,strobe-pos': %d\n", ret);
  			return ret;
  		}
  	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
@@ -3400,17 +3397,17 @@ static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
  		// NOTE: ignored unless global manual strobe pos is set
  		rxport->eq.strobe_pos = strobe_pos;
  		if (!priv->strobe.manual)
-			dev_warn(dev, "'strobe-pos' ignored as 'manual-strobe' not set\n");
+			dev_warn(dev, "'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n");
  	}
  
-	ret = of_property_read_u32(np, "eq-level", &eq_level);
+	ret = of_property_read_u32(np, "ti,eq-level", &eq_level);
  	if (ret) {
  		if (ret != -EINVAL) {
-			dev_err(dev, "Failed to read 'eq-level': %d\n", ret);
+			dev_err(dev, "Failed to read 'ti,eq-level': %d\n", ret);
  			return ret;
  		}
  	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
-		dev_err(dev, "Illegal 'eq-level' value: %d\n", eq_level);
+		dev_err(dev, "Illegal 'ti,eq-level' value: %d\n", eq_level);
  	} else {
  		rxport->eq.manual_eq = true;
  		rxport->eq.manual.eq_level = eq_level;
@@ -3566,7 +3563,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
  	priv->strobe.min = 2;
  	priv->strobe.max = 3;
  
-	priv->strobe.manual = of_property_read_bool(links_np, "manual-strobe");
+	priv->strobe.manual = of_property_read_bool(links_np, "ti,manual-strobe");
  
  	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
  		struct device_node *link_np;
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 19ac2f1db96b..044c87c5b336 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -16,6 +16,7 @@
  
  struct device;
  struct i2c_atr;
+struct fwnode_handle;
  
  /**
   * struct i2c_atr_ops - Callbacks from ATR to the device driver.
@@ -41,7 +42,7 @@ struct i2c_atr_ops {
  };
  
  /**
- * Helper to add I2C ATR features to a device driver.
+ * struct i2c_atr - Represents the I2C ATR instance
   */
  struct i2c_atr {
  	/* private: internal use only */
@@ -53,10 +54,11 @@ struct i2c_atr {
  	void *priv;
  
  	struct i2c_algorithm algo;
+	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
  	struct mutex lock;
  	int max_adapters;
  
-	struct i2c_adapter *adapter[0];
+	struct i2c_adapter *adapter[];
  };
  
  struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,

