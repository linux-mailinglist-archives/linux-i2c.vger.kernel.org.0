Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAB0356197
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 05:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhDGDBy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 23:01:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15928 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbhDGDBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 23:01:51 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FFTdk224CzjYV0;
        Wed,  7 Apr 2021 10:59:54 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 11:01:30 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Sanket Goswami <Sanket.Goswami@amd.com>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] i2c: designware: Fix return value check in navi_amd_register_client()
Date:   Wed, 7 Apr 2021 03:11:37 +0000
Message-ID: <20210407031137.2750993-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case of error, the function i2c_new_client_device() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: fix description format.
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7ca0017883a6..0f409a4c2da0 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -132,8 +132,8 @@ static int navi_amd_register_client(struct dw_i2c_dev *dev)
 	info.irq = dev->irq;
 
 	dev->slave = i2c_new_client_device(&dev->adapter, &info);
-	if (!dev->slave)
-		return -ENODEV;
+	if (IS_ERR(dev->slave))
+		return PTR_ERR(dev->slave);
 
 	return 0;
 }

