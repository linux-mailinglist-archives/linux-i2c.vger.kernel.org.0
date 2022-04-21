Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765FA509AFE
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 10:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbiDUIvW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 04:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386880AbiDUIvW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 04:51:22 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CF7B1F8;
        Thu, 21 Apr 2022 01:48:33 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KkWQ91zG0zfZQG;
        Thu, 21 Apr 2022 16:47:45 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 16:48:31 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 16:48:31 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC:     <wsa@kernel.org>, <narmstrong@baylibre.com>, <tanure@linux.com>
Subject: [PATCH -next] i2c: meson: fix missing clk_disable_unprepare() on error in meson_i2c_probe()
Date:   Thu, 21 Apr 2022 17:00:42 +0800
Message-ID: <20220421090042.2278081-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the missing clk_disable_unprepare() before return
from meson_i2c_probe() in the error handling case.

Fixes: a57f9b4dd6f5 ("i2c: meson: Use 50% duty cycle for I2C clock")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-meson.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 50dab123380a..195a9716da31 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -520,8 +520,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
 			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
 
-	if (!i2c->data->set_clk_div)
+	if (!i2c->data->set_clk_div) {
+		clk_disable_unprepare(i2c->clk);
 		return -EINVAL;
+	}
 	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
 
 	ret = i2c_add_adapter(&i2c->adap);
-- 
2.25.1

