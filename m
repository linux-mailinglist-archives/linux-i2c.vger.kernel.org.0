Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4F8348CEE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 10:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCYJai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 05:30:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14532 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhCYJaW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 05:30:22 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5fsJ4Xn2zPlJ7;
        Thu, 25 Mar 2021 17:27:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 17:30:18 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <krzysztof.kozlowski@canonical.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH] i2c: s3c2410: Remove unneeded variable "ret"
Date:   Thu, 25 Mar 2021 17:30:51 +0800
Message-ID: <1616664651-26617-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following coccicheck warning:
drivers/i2c/busses/i2c-s3c2410.c:391:5-8:
Unneeded variable : returnvar : "ret". Return "0" on line 551

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 62a903f..22474e6 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -388,7 +388,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
@@ -548,7 +547,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
  out:
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.7.4

