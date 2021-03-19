Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175883417CC
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 09:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCSI4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 04:56:01 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14403 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhCSIza (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 04:55:30 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1yNy4R5KzkbCl;
        Fri, 19 Mar 2021 16:53:54 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 16:55:26 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <kblaiech@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: mlxbf: Remove the unneeded devm_free_irq
Date:   Fri, 19 Mar 2021 16:56:05 +0800
Message-ID: <1616144165-54498-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_request_irq to request interrupts,devm_free_irq is
not needed to release interrupts. so just remove it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 2fb0532..ea839de 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2426,8 +2426,6 @@ static int mlxbf_i2c_remove(struct platform_device *pdev)
 	}
 	mutex_unlock(&mlxbf_i2c_bus_lock);
 
-	devm_free_irq(dev, priv->irq, priv);
-
 	i2c_del_adapter(&priv->adap);
 
 	return 0;
-- 
2.7.4

