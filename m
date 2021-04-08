Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520E735818B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDHLTs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:19:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15971 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhDHLTr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 07:19:47 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGJdH5C1HzrdK6;
        Thu,  8 Apr 2021 19:17:23 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.149) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 19:19:26 +0800
From:   Ye Weihua <yeweihua4@huawei.com>
To:     <aisheng.dong@nxp.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yangjihong1@huawei.com>,
        <zhangjinhao2@huawei.com>
Subject: [PATCH -next] i2c: imx-lpi2c: fix PM reference leak in lpi2c_imx_master_enable()
Date:   Thu, 8 Apr 2021 19:19:30 +0800
Message-ID: <20210408111930.203574-1-yeweihua4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PM reference count is not expected to be incremented on return in
ipi2c_imx_master_enable().

However, pm_runtime_get_sync() will increment the PM reference count
even on failure. forgetting to put the reference again will result in
a leak.

Replace it with pm_runtime_resume_and_get() to keep the usage counter
balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Weihua <yeweihua4@huawei.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9db6ccded5e9..8b9ba055c418 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -259,7 +259,7 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 	unsigned int temp;
 	int ret;
 
-	ret = pm_runtime_get_sync(lpi2c_imx->adapter.dev.parent);
+	ret = pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1

