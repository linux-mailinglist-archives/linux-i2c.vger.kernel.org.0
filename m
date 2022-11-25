Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336C46385A6
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 09:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiKYI4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 03:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiKYI4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 03:56:52 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D27431EEB;
        Fri, 25 Nov 2022 00:56:49 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Axz+tRg4BjbOIAAA--.2297S3;
        Fri, 25 Nov 2022 16:56:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxBldOg4BjghMaAA--.49336S3;
        Fri, 25 Nov 2022 16:56:48 +0800 (CST)
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
Subject: [PATCH V3 1/5] i2c: gpio: Fix potential unused warning for 'i2c_gpio_dt_ids'
Date:   Fri, 25 Nov 2022 16:54:11 +0800
Message-Id: <4ace98785f900bf1a818d006ae5906f6b51edf7e.1669359515.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669359515.git.zhoubinbin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxBldOg4BjghMaAA--.49336S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GF4kJw4kGFWkXrW8Xr1rtFb_yoWDZFg_A3
        4rXwsrZr18Crn8ZF1Yqr4avFWDK3Z0gF1rXF10yaya9w15Xw45JF4DAFs3J398urWxGF1q
        9a1DXFWfCa42qjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        C7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
        JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jz5lbUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

of_match_ptr() compiles into NULL if CONFIG_OF is disabled.
Fix warning by dropping of_match_ptr().

Suggested by Andy Shevchenko, thanks.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/i2c-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index b1985c1667e1..0e4385a9bcf7 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -482,19 +482,17 @@ static int i2c_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_OF)
 static const struct of_device_id i2c_gpio_dt_ids[] = {
 	{ .compatible = "i2c-gpio", },
 	{ /* sentinel */ }
 };
 
 MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
-#endif
 
 static struct platform_driver i2c_gpio_driver = {
 	.driver		= {
 		.name	= "i2c-gpio",
-		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
+		.of_match_table	= i2c_gpio_dt_ids,
 	},
 	.probe		= i2c_gpio_probe,
 	.remove		= i2c_gpio_remove,
-- 
2.31.1

