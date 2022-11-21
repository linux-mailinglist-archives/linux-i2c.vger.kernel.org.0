Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF76631D8A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiKUJ5u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbiKUJ5t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:57:49 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DADF1E738;
        Mon, 21 Nov 2022 01:57:47 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NG2mR018CzFqS7;
        Mon, 21 Nov 2022 17:54:30 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 17:57:39 +0800
From:   Wang Yufen <wangyufen@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC:     <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Wang Yufen <wangyufen@huawei.com>
Subject: [PATCH] i2c: qcom-geni: fix error return code in geni_i2c_gpi_xfer
Date:   Mon, 21 Nov 2022 18:17:52 +0800
Message-ID: <1669025872-44226-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix to return a negative error code from the gi2c->err instead of
0.

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 84a7751..8fce98b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -626,7 +626,6 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
 				gi2c->cur->flags, gi2c->cur->addr);
 			gi2c->err = -ETIMEDOUT;
-			goto err;
 		}
 
 		if (gi2c->err) {
-- 
1.8.3.1

