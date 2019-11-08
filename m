Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DA6F423F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2019 09:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfKHIhD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Nov 2019 03:37:03 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:47986 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726987AbfKHIhD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Nov 2019 03:37:03 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=wenyang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0ThUQNT9_1573202209;
Received: from localhost(mailfrom:wenyang@linux.alibaba.com fp:SMTPD_---0ThUQNT9_1573202209)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 16:37:01 +0800
From:   Wen Yang <wenyang@linux.alibaba.com>
To:     wsa@the-dreams.de
Cc:     zhiche.yy@alibaba-inc.com, xlpang@linux.alibaba.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wen Yang <wenyang@linux.alibaba.com>
Subject: [PATCH] i2c: core: fix use after free in of_i2c_notify
Date:   Fri,  8 Nov 2019 16:36:48 +0800
Message-Id: <20191108083648.56503-1-wenyang@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We can't use "adap" after it has been freed.

Fixes: 5bf4fa7daea6 ("i2c: break out OF support into separate file")
Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/i2c-core-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6f632d54..7eb4199 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -245,14 +245,14 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 		}
 
 		client = of_i2c_register_device(adap, rd->dn);
-		put_device(&adap->dev);
-
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
 				 rd->dn);
+			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
 		}
+		put_device(&adap->dev);
 		break;
 	case OF_RECONFIG_CHANGE_REMOVE:
 		/* already depopulated? */
-- 
1.8.3.1

