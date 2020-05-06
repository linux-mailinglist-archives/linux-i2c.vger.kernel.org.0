Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E673A1C6C42
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 10:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgEFIzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 04:55:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3816 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726935AbgEFIzN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 04:55:13 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E0B60D0BB59F771AB944;
        Wed,  6 May 2020 16:55:09 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 16:54:59 +0800
From:   Samuel Zou <zou_wei@huawei.com>
To:     <ajayg@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Samuel Zou <zou_wei@huawei.com>
Subject: [PATCH -next] i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Wed, 6 May 2020 17:01:10 +0800
Message-ID: <1588755670-38476-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes coccicheck warning:

drivers/i2c/busses/i2c-nvidia-gpu.c:280:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index f5d25ce..dba5d11 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -277,10 +277,8 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 	i2cd->gpu_ccgx_ucsi->irq = irq;
 	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
 	i2cd->ccgx_client = i2c_new_client_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	if (IS_ERR(i2cd->ccgx_client))
-		return PTR_ERR(i2cd->ccgx_client);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(i2cd->ccgx_client);
 }
 
 static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-- 
2.6.2

