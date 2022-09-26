Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD55A5EB17F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 21:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiIZTp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 15:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiIZTpr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 15:45:47 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A223193C5
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 12:45:25 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 26 Sep 2022 22:45:19 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28QJjIWE029234;
        Mon, 26 Sep 2022 15:45:18 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28QJjIcP024886;
        Mon, 26 Sep 2022 15:45:18 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Date:   Mon, 26 Sep 2022 15:45:07 -0400
Message-Id: <20220926194507.24786-6-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220926194507.24786-1-asmaa@nvidia.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

BlueField customers have to use the the BlueField firmware with
UEFI ACPI tables so there is no need to have device tree
support in the i2c-mlxbf.c driver. Remove the device tree
binding documentation as well.

Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 77 -------------------
 drivers/i2c/busses/i2c-mlxbf.c                | 49 +-----------
 2 files changed, 1 insertion(+), 125 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
deleted file mode 100644
index 93198d5d43a6..000000000000
--- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
+++ /dev/null
@@ -1,77 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mellanox I2C SMBus on BlueField SoCs
-
-maintainers:
-  - Khalil Blaiech <kblaiech@nvidia.com>
-
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
-properties:
-  compatible:
-    enum:
-      - mellanox,i2c-mlxbf1
-      - mellanox,i2c-mlxbf2
-
-  reg:
-    minItems: 3
-    items:
-      - description: Smbus block registers
-      - description: Cause master registers
-      - description: Cause slave registers
-      - description: Cause coalesce registers
-
-  interrupts:
-    maxItems: 1
-
-  clock-frequency:
-    enum: [ 100000, 400000, 1000000 ]
-    description:
-      bus frequency used to configure timing registers;
-      The frequency is expressed in Hz. Default is 100000.
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-unevaluatedProperties: false
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - mellanox,i2c-mlxbf1
-
-then:
-  properties:
-    reg:
-      maxItems: 3
-
-examples:
-  - |
-    i2c@2804000 {
-        compatible = "mellanox,i2c-mlxbf1";
-        reg = <0x02804000 0x800>,
-              <0x02801200 0x020>,
-              <0x02801260 0x020>;
-        interrupts = <57>;
-        clock-frequency = <100000>;
-    };
-
-  - |
-    i2c@2808800 {
-        compatible = "mellanox,i2c-mlxbf2";
-        reg = <0x02808800 0x600>,
-              <0x02808e00 0x020>,
-              <0x02808e20 0x020>,
-              <0x02808e40 0x010>;
-        interrupts = <57>;
-        clock-frequency = <400000>;
-    };
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 30e6ba1f412c..1127d07b56a6 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2247,24 +2247,6 @@ static struct i2c_adapter_quirks mlxbf_i2c_quirks = {
 	.max_write_len = MLXBF_I2C_MASTER_DATA_W_LENGTH,
 };
 
-static const struct of_device_id mlxbf_i2c_dt_ids[] = {
-	{
-		.compatible = "mellanox,i2c-mlxbf1",
-		.data = &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1]
-	},
-	{
-		.compatible = "mellanox,i2c-mlxbf2",
-		.data = &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2]
-	},
-	{
-		.compatible = "mellanox,i2c-mlxbf3",
-		.data = &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_3]
-	},
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, mlxbf_i2c_dt_ids);
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] = {
 	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
@@ -2315,31 +2297,6 @@ static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
 }
 #endif /* CONFIG_ACPI */
 
-static int mlxbf_i2c_of_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
-{
-	const struct of_device_id *oid;
-	int bus_id = -1;
-
-	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
-		oid = of_match_node(mlxbf_i2c_dt_ids, dev->of_node);
-		if (!oid)
-			return -ENODEV;
-
-		priv->chip = oid->data;
-
-		bus_id = of_alias_get_id(dev->of_node, "i2c");
-		if (bus_id >= 0)
-			priv->bus = bus_id;
-	}
-
-	if (bus_id < 0) {
-		dev_err(dev, "Cannot get bus id");
-		return bus_id;
-	}
-
-	return 0;
-}
-
 static int mlxbf_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2353,14 +2310,11 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = mlxbf_i2c_acpi_probe(dev, priv);
-	if (ret < 0 && ret != -ENOENT && ret != -ENXIO)
-		ret = mlxbf_i2c_of_probe(dev, priv);
-
 	if (ret < 0)
 		return ret;
 
 	/* This property allows the driver to stay backward compatible with older
-	 * ACPI table and device trees versions.
+	 * ACPI tables.
 	 * Starting BlueField-3 SoC, the "smbus" resource was broken down into 3
 	 * separate resources "timer", "master" and "slave".
 	 */
@@ -2539,7 +2493,6 @@ static struct platform_driver mlxbf_i2c_driver = {
 	.remove = mlxbf_i2c_remove,
 	.driver = {
 		.name = "i2c-mlxbf",
-		.of_match_table = mlxbf_i2c_dt_ids,
 #ifdef CONFIG_ACPI
 		.acpi_match_table = ACPI_PTR(mlxbf_i2c_acpi_ids),
 #endif /* CONFIG_ACPI  */
-- 
2.30.1

