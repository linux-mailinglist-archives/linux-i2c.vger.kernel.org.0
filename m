Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80795E6159
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 13:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiIVLlf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 07:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiIVLla (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 07:41:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 623AAD690C;
        Thu, 22 Sep 2022 04:41:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxFeLhSSxjyhYgAA--.56317S4;
        Thu, 22 Sep 2022 19:41:23 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 2/5] i2c: gpio: Add support on ACPI-based system
Date:   Thu, 22 Sep 2022 19:39:55 +0800
Message-Id: <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1663835855.git.zhoubinbin@loongson.cn>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeLhSSxjyhYgAA--.56317S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCry8ur13tw4UArWUGr4rXwb_yoW5ZFy8pF
        s09FW5KrWUWF12gr17Zr1ku34akwn2q3yxK3y7G3sF9ws0qrn8XFyxtFya9Fn5AFWrG3W7
        Xa4UtFW7uFsrZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjTRircTUUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the ACPI-based device registration so that the driver
can be also enabled through ACPI table.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/i2c-gpio.c | 41 ++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index b1985c1667e1..ccea37e755e6 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/platform_device.h>
@@ -318,6 +319,24 @@ static void of_i2c_gpio_get_props(struct device_node *np,
 		of_property_read_bool(np, "i2c-gpio,scl-output-only");
 }
 
+static void acpi_i2c_gpio_get_props(struct device *dev,
+				  struct i2c_gpio_platform_data *pdata)
+{
+	u32 reg;
+
+	device_property_read_u32(dev, "delay-us", &pdata->udelay);
+
+	if (!device_property_read_u32(dev, "timeout-ms", &reg))
+		pdata->timeout = msecs_to_jiffies(reg);
+
+	pdata->sda_is_open_drain =
+		device_property_read_bool(dev, "sda-open-drain");
+	pdata->scl_is_open_drain =
+		device_property_read_bool(dev, "scl-open-drain");
+	pdata->scl_is_output_only =
+		device_property_read_bool(dev, "scl-output-only");
+}
+
 static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
 					   const char *con_id,
 					   unsigned int index,
@@ -363,6 +382,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	enum gpiod_flags gflags;
+	acpi_status status;
+	unsigned long long id;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -375,6 +396,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	if (np) {
 		of_i2c_gpio_get_props(np, pdata);
+	} else if (ACPI_COMPANION(dev)) {
+		acpi_i2c_gpio_get_props(dev, pdata);
 	} else {
 		/*
 		 * If all platform data settings are zero it is OK
@@ -445,7 +468,14 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	adap->dev.parent = dev;
 	adap->dev.of_node = np;
 
-	adap->nr = pdev->id;
+	if (ACPI_COMPANION(dev)) {
+		status = acpi_evaluate_integer(ACPI_HANDLE(dev),
+						"_UID", NULL, &id);
+		if (ACPI_SUCCESS(status) && (id >= 0))
+			adap->nr = id;
+	} else
+		adap->nr = pdev->id;
+
 	ret = i2c_bit_add_numbered_bus(adap);
 	if (ret)
 		return ret;
@@ -491,10 +521,19 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
 #endif
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id i2c_gpio_acpi_match[] = {
+	{"LOON0005"},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
+#endif
+
 static struct platform_driver i2c_gpio_driver = {
 	.driver		= {
 		.name	= "i2c-gpio",
 		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
+		.acpi_match_table = ACPI_PTR(i2c_gpio_acpi_match),
 	},
 	.probe		= i2c_gpio_probe,
 	.remove		= i2c_gpio_remove,
-- 
2.31.1

