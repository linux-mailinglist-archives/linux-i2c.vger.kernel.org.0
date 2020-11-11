Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E090A2AE6FD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Nov 2020 04:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgKKDWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 22:22:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7513 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgKKDWl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Nov 2020 22:22:41 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CW95d3vnTzhk9p;
        Wed, 11 Nov 2020 11:22:29 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 11:22:35 +0800
From:   Wang Xiaojun <wangxiaojun11@huawei.com>
To:     <kblaiech@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: mlxbf: Fix the return check of devm_ioremapm and ioremap
Date:   Wed, 11 Nov 2020 11:27:26 +0800
Message-ID: <20201111032726.3675159-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_ioremapm and ioremap may return NULL which cannot be checked
by IS_ERR.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 33574d40ea9c..2fb0532d8a16 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -1258,9 +1258,9 @@ static int mlxbf_i2c_get_gpio(struct platform_device *pdev,
 		return -EFAULT;
 
 	gpio_res->io = devm_ioremap(dev, params->start, size);
-	if (IS_ERR(gpio_res->io)) {
+	if (!gpio_res->io) {
 		devm_release_mem_region(dev, params->start, size);
-		return PTR_ERR(gpio_res->io);
+		return -ENOMEM;
 	}
 
 	return 0;
@@ -1323,9 +1323,9 @@ static int mlxbf_i2c_get_corepll(struct platform_device *pdev,
 		return -EFAULT;
 
 	corepll_res->io = devm_ioremap(dev, params->start, size);
-	if (IS_ERR(corepll_res->io)) {
+	if (!corepll_res->io) {
 		devm_release_mem_region(dev, params->start, size);
-		return PTR_ERR(corepll_res->io);
+		return -ENOMEM;
 	}
 
 	return 0;
@@ -1717,9 +1717,9 @@ static int mlxbf_i2c_init_coalesce(struct platform_device *pdev,
 			return -EFAULT;
 
 		coalesce_res->io = ioremap(params->start, size);
-		if (IS_ERR(coalesce_res->io)) {
+		if (!coalesce_res->io) {
 			release_mem_region(params->start, size);
-			return PTR_ERR(coalesce_res->io);
+			return -ENOMEM;
 		}
 
 		priv->coalesce = coalesce_res;
-- 
2.25.1

