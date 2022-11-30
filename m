Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDAC63CEFE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Nov 2022 06:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbiK3F7J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 00:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbiK3F6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 00:58:52 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9FDF37223;
        Tue, 29 Nov 2022 21:58:47 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8DxvusW8YZj90cCAA--.5418S3;
        Wed, 30 Nov 2022 13:58:46 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuAR8YZjnUwiAA--.19574S4;
        Wed, 30 Nov 2022 13:58:45 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V4 2/5] i2c: gpio: Add support on ACPI-based system
Date:   Wed, 30 Nov 2022 13:55:52 +0800
Message-Id: <05a28866877347f2aaed34288ad76963905e2f33.1669777792.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669777792.git.zhoubinbin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuAR8YZjnUwiAA--.19574S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZFW3Ar17Cry5Cr1rZr1DWrg_yoW5Xw1fpF
        yY9FZxtFWjgF42gr17Xw1ku34Skwn2qayIgw47G3sY9w4DXrn8XryxtFyI9ryYvFW8G343
        tw1jqFW3CF4DZaUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU4Xo7DUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the ACPI-based device registration, so that the driver
can be also enabled through ACPI table.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/i2c-gpio.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 0e4385a9bcf7..33634d5e4c35 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -300,22 +300,23 @@ static inline void i2c_gpio_fault_injector_init(struct platform_device *pdev) {}
 static inline void i2c_gpio_fault_injector_exit(struct platform_device *pdev) {}
 #endif /* CONFIG_I2C_GPIO_FAULT_INJECTOR*/
 
-static void of_i2c_gpio_get_props(struct device_node *np,
-				  struct i2c_gpio_platform_data *pdata)
+/* Get i2c-gpio props from DT or ACPI table */
+static void i2c_gpio_get_props(struct device *dev,
+				struct i2c_gpio_platform_data *pdata)
 {
 	u32 reg;
 
-	of_property_read_u32(np, "i2c-gpio,delay-us", &pdata->udelay);
+	device_property_read_u32(dev, "i2c-gpio,delay-us", &pdata->udelay);
 
-	if (!of_property_read_u32(np, "i2c-gpio,timeout-ms", &reg))
+	if (!device_property_read_u32(dev, "i2c-gpio,timeout-ms", &reg))
 		pdata->timeout = msecs_to_jiffies(reg);
 
 	pdata->sda_is_open_drain =
-		of_property_read_bool(np, "i2c-gpio,sda-open-drain");
+		device_property_read_bool(dev, "i2c-gpio,sda-open-drain");
 	pdata->scl_is_open_drain =
-		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
+		device_property_read_bool(dev, "i2c-gpio,scl-open-drain");
 	pdata->scl_is_output_only =
-		of_property_read_bool(np, "i2c-gpio,scl-output-only");
+		device_property_read_bool(dev, "i2c-gpio,scl-output-only");
 }
 
 static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
@@ -373,8 +374,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	bit_data = &priv->bit_data;
 	pdata = &priv->pdata;
 
-	if (np) {
-		of_i2c_gpio_get_props(np, pdata);
+	if (dev_fwnode(dev)) {
+		i2c_gpio_get_props(dev, pdata);
 	} else {
 		/*
 		 * If all platform data settings are zero it is OK
@@ -489,10 +490,17 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
 
+static const struct acpi_device_id i2c_gpio_acpi_match[] = {
+	{ "LOON0005" }, /* LoongArch */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
+
 static struct platform_driver i2c_gpio_driver = {
 	.driver		= {
 		.name	= "i2c-gpio",
 		.of_match_table	= i2c_gpio_dt_ids,
+		.acpi_match_table = i2c_gpio_acpi_match,
 	},
 	.probe		= i2c_gpio_probe,
 	.remove		= i2c_gpio_remove,
-- 
2.31.1

