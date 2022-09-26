Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917185EA8AA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbiIZOkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbiIZOjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:39:45 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F0758E0D0;
        Mon, 26 Sep 2022 06:01:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OGUojFjdz4iAA--.62163S3;
        Mon, 26 Sep 2022 21:01:09 +0800 (CST)
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
Subject: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Date:   Mon, 26 Sep 2022 21:00:04 +0800
Message-Id: <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664193316.git.zhoubinbin@loongson.cn>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OGUojFjdz4iAA--.62163S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW3Xr17Ww4ktw4rWrWxJFb_yoW5JFyfpF
        s09FW5tr4UGF12gF17Xw1kua4Skws7X3yxKw47G3sF9an0qr98XryxKFya9F1rAFW5G3W7
        Xa4DtFW7CFsrZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
        62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
        0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
        1lc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
        3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
        WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
        AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
        Xa7VUjU3vUUUUUU==
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
 drivers/i2c/busses/i2c-gpio.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index b1985c1667e1..417eb31e0971 100644
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
@@ -375,6 +394,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	if (np) {
 		of_i2c_gpio_get_props(np, pdata);
+	} else if (ACPI_COMPANION(dev)) {
+		acpi_i2c_gpio_get_props(dev, pdata);
 	} else {
 		/*
 		 * If all platform data settings are zero it is OK
@@ -491,10 +512,19 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
 #endif
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id i2c_gpio_acpi_match[] = {
+	{"LOON0005"}, /*LoongArch*/
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

