Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A6B35AA9B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 05:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbhDJDvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 23:51:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16880 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhDJDvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 23:51:46 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FHLbp2Lmxzkjvy;
        Sat, 10 Apr 2021 11:49:42 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Sat, 10 Apr 2021
 11:51:25 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Dejin Zheng" <zhengdejin5@gmail.com>,
        Linhua Xu <linhua.xu@unisoc.com>
CC:     <linux-i2c@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] i2c: sprd: Add missing MODULE_DEVICE_TABLE
Date:   Sat, 10 Apr 2021 11:50:44 +0800
Message-ID: <20210410035044.11418-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/i2c/busses/i2c-sprd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 2917fecf6c80..9f77d1ddbaf8 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -640,6 +640,7 @@ static const struct of_device_id sprd_i2c_of_match[] = {
 	{ .compatible = "sprd,sc9860-i2c", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sprd_i2c_of_match);
 
 static struct platform_driver sprd_i2c_driver = {
 	.probe = sprd_i2c_probe,

