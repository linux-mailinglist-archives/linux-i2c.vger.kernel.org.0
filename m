Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE9312FBD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 11:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhBHKyq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 05:54:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:12461 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbhBHKvt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 05:51:49 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DZ2pn6lkHzjJWd;
        Mon,  8 Feb 2021 18:49:53 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Feb 2021 18:50:52 +0800
From:   Weihang Li <liweihang@huawei.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Weihang Li <liweihang@huawei.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] i2c: busses: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Mon, 8 Feb 2021 18:48:37 +0800
Message-ID: <1612781317-51815-1-git-send-email-liweihang@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to do irqsave and irqrestore in context of hard IRQ.

Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Weihang Li <liweihang@huawei.com>
---
 drivers/i2c/busses/i2c-digicolor.c | 5 ++---
 drivers/i2c/busses/i2c-jz4780.c    | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index f67639d..60c838c 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -160,12 +160,11 @@ static irqreturn_t dc_i2c_irq(int irq, void *dev_id)
 {
 	struct dc_i2c *i2c = dev_id;
 	int cmd_status = dc_i2c_cmd_status(i2c);
-	unsigned long flags;
 	u8 addr_cmd;
 
 	writeb_relaxed(1, i2c->regs + II_INTFLAG_CLEAR);
 
-	spin_lock_irqsave(&i2c->lock, flags);
+	spin_lock(&i2c->lock);
 
 	if (cmd_status == II_CMD_STATUS_ACK_BAD
 	    || cmd_status == II_CMD_STATUS_ABORT) {
@@ -207,7 +206,7 @@ static irqreturn_t dc_i2c_irq(int irq, void *dev_id)
 	}
 
 out:
-	spin_unlock_irqrestore(&i2c->lock, flags);
+	spin_unlock(&i2c->lock);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index cb4a25e..8509c5f 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -437,9 +437,8 @@ static irqreturn_t jz4780_i2c_irq(int irqno, void *dev_id)
 	unsigned short intst;
 	unsigned short intmsk;
 	struct jz4780_i2c *i2c = dev_id;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c->lock, flags);
+	spin_lock(&i2c->lock);
 	intmsk = jz4780_i2c_readw(i2c, JZ4780_I2C_INTM);
 	intst = jz4780_i2c_readw(i2c, JZ4780_I2C_INTST);
 
@@ -551,7 +550,7 @@ static irqreturn_t jz4780_i2c_irq(int irqno, void *dev_id)
 	}
 
 done:
-	spin_unlock_irqrestore(&i2c->lock, flags);
+	spin_unlock(&i2c->lock);
 	return IRQ_HANDLED;
 }
 
-- 
2.8.1

