Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AADF2E42EB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Dec 2020 16:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406932AbgL1Nvf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 08:51:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10086 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406922AbgL1Nvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Dec 2020 08:51:33 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D4Jnm3qbhzMBTJ;
        Mon, 28 Dec 2020 21:49:48 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 28 Dec 2020 21:50:41 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] i2c: busses: Use DEFINE_SPINLOCK() for spinlock
Date:   Mon, 28 Dec 2020 21:51:20 +0800
Message-ID: <20201228135120.28678-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/i2c/busses/i2c-elektor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-elektor.c b/drivers/i2c/busses/i2c-elektor.c
index 140426db28df..671f9ac8387e 100644
--- a/drivers/i2c/busses/i2c-elektor.c
+++ b/drivers/i2c/busses/i2c-elektor.c
@@ -49,7 +49,7 @@ static int mmapped;
 
 static wait_queue_head_t pcf_wait;
 static int pcf_pending;
-static spinlock_t lock;
+static DEFINE_SPINLOCK(lock);
 
 static struct i2c_adapter pcf_isa_ops;
 
@@ -132,7 +132,6 @@ static irqreturn_t pcf_isa_handler(int this_irq, void *dev_id) {
 
 static int pcf_isa_init(void)
 {
-	spin_lock_init(&lock);
 	if (!mmapped) {
 		if (!request_region(base, 2, pcf_isa_ops.name)) {
 			printk(KERN_ERR "%s: requested I/O region (%#x:2) is "
-- 
2.22.0

