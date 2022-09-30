Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A121E5F026B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Sep 2022 03:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiI3BvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 21:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiI3BvQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 21:51:16 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1BCF1905;
        Thu, 29 Sep 2022 18:51:15 -0700 (PDT)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MdtPr0J57z1P6rt;
        Fri, 30 Sep 2022 09:46:56 +0800 (CST)
Received: from localhost.localdomain (10.157.217.52) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:51:13 +0800
From:   Tao Lan <taolan@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     taolan <taolan@huawei.com>
Subject: [PATCH] i2c-hix5hd2:  Add I2C_M_STOP flag support for i2c-hix5hd2 driver.
Date:   Fri, 30 Sep 2022 01:45:07 +0000
Message-ID: <20220930014507.5612-1-taolan@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.157.217.52]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500021.china.huawei.com (7.185.36.21)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: taolan <taolan@huawei.com>

For compatibility, some devices need to work with controller between
messages using a stop.

Signed-off-by: taolan <taolan@huawei.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 61ae58f57047..e5042e34ecc7 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -360,7 +360,11 @@ static int hix5hd2_i2c_xfer(struct i2c_adapter *adap,
 	pm_runtime_get_sync(priv->dev);
 
 	for (i = 0; i < num; i++, msgs++) {
-		stop = (i == num - 1);
+		if ((i == num - 1) || (msgs->flags & I2C_M_STOP))
+			stop = 1;
+		else
+			stop = 0;
+
 		ret = hix5hd2_i2c_xfer_msg(priv, msgs, stop);
 		if (ret < 0)
 			goto out;
-- 
2.22.0

