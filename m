Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E4A654DF5
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 10:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbiLWJAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Dec 2022 04:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLWJAh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Dec 2022 04:00:37 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 15D6E36C49;
        Fri, 23 Dec 2022 01:00:34 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxrusybqVjLQ0IAA--.18354S3;
        Fri, 23 Dec 2022 17:00:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxzr4ubqVjuz0JAA--.14684S3;
        Fri, 23 Dec 2022 17:00:33 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy@kernel.org>,
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
Subject: [PATCH V8 1/4] i2c: gpio: Add support on ACPI-based system
Date:   Fri, 23 Dec 2022 17:00:49 +0800
Message-Id: <ecfc60725e203aeb9f957f8e670b8eb652a1ae2d.1671688961.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1671688961.git.zhoubinbin@loongson.cn>
References: <cover.1671688961.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxzr4ubqVjuz0JAA--.14684S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZFWxXry8AFyxXr48ZFWDurg_yoW5Zr13pF
        WY9FZxtFWjgF42grnrXw1kZw1Skwn2q3yIgw47G3sY9w4qqrn8XFy8tFyI9F15ZFW8Gw13
        tw1UtFW3CFsrZaUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j
        6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8XTm3UUUUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the ACPI-based device registration, so that the driver
can be also enabled through ACPI table.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/i2c-gpio.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 0e4385a9bcf7..680936234ef8 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -13,9 +13,9 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 struct i2c_gpio_private_data {
@@ -300,22 +300,23 @@ static inline void i2c_gpio_fault_injector_init(struct platform_device *pdev) {}
 static inline void i2c_gpio_fault_injector_exit(struct platform_device *pdev) {}
 #endif /* CONFIG_I2C_GPIO_FAULT_INJECTOR*/
 
-static void of_i2c_gpio_get_props(struct device_node *np,
-				  struct i2c_gpio_platform_data *pdata)
+/* Get i2c-gpio properties from DT or ACPI table */
+static void i2c_gpio_get_properties(struct device *dev,
+				     struct i2c_gpio_platform_data *pdata)
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
+		i2c_gpio_get_properties(dev, pdata);
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

