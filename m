Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32AE526F10
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 09:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiENC4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 22:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbiENCz4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 22:55:56 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08699311CD5;
        Fri, 13 May 2022 19:20:27 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L0Tj92rdFzfbNt;
        Sat, 14 May 2022 10:19:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:20:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 14 May
 2022 10:20:24 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC:     <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>,
        <christophe.jaillet@wanadoo.fr>
Subject: [PATCH -next v2 1/2] i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()
Date:   Sat, 14 May 2022 10:31:47 +0800
Message-ID: <20220514023148.305457-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the missing clk_disable_unprepare() before return
from mtk_i2c_probe() in the error handling case.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
   v2: add return 0 in normal path.
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 45fe4a7fe0c0..901f0fb04fee 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	if (i2c->bus_freq == 0) {
 		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_disable_clk;
 	}
 
 	adap = &i2c->adap;
@@ -322,10 +323,15 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret < 0)
-		return ret;
+		goto err_disable_clk;
 
 	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
 
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(i2c->clk);
+
 	return ret;
 }
 
-- 
2.25.1

