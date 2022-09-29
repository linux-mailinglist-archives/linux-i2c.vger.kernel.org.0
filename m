Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0895EEE73
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 09:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbiI2HHv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 03:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbiI2HHf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 03:07:35 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196E611A0D;
        Thu, 29 Sep 2022 00:07:34 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MdPTH0W25z1P6vt;
        Thu, 29 Sep 2022 15:03:15 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 15:07:32 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <wsa@kernel.org>, <chenweilong@huawei.com>,
        <yangyicong@hisilicon.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH next v4] i2c: hisi: Add support to get clock frequency from clock property
Date:   Thu, 29 Sep 2022 15:15:47 +0800
Message-ID: <20220929071547.135913-1-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clk_rate attribute is not generic device tree bindings for I2C
busses described in Documentation/devicetree/bindings/i2c/i2c.txt.
It can be managed by clock binding.

Support the driver to obtain clock information by clk_rate or
clock property. Find clock first, if not, fall back to clk_rate.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
Acked-by: Yicong Yang <yangyicong@hisilicon.com>
---
Change since v1:
- Ordered struct field to inverted triangle.
- Use devm_clk_get_optional_enabled().
- Use IS_ERR_OR_NULL.
Link: https://lore.kernel.org/lkml/20220921101540.352553-1-chenweilong@huawei.com/

Change since v2:
- Remove redundant blank line
Link: https://lore.kernel.org/all/20220923011417.78994-1-chenweilong@huawei.com/

Change since v3:
- Commit message update
Link: https://lore.kernel.org/lkml/20220926091503.199474-1-chenweilong@huawei.com/T/

 drivers/i2c/busses/i2c-hisi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 67031024217c..e4b0ebe54f6f 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -8,6 +8,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -90,6 +91,7 @@ struct hisi_i2c_controller {
 	struct i2c_adapter adapter;
 	void __iomem *iobase;
 	struct device *dev;
+	struct clk *clk;
 	int irq;
 
 	/* Intermediates for recording the transfer process */
@@ -456,10 +458,15 @@ static int hisi_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
-	if (ret) {
-		dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
-		return ret;
+	ctlr->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR_OR_NULL(ctlr->clk)) {
+		ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
+		if (ret) {
+			dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
+			return ret;
+		}
+	} else {
+		clk_rate_hz = clk_get_rate(ctlr->clk);
 	}
 
 	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(clk_rate_hz, HZ_PER_KHZ);
-- 
2.31.GIT

