Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C39390EB3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 05:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhEZDMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 23:12:05 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:44307 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229750AbhEZDMC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 23:12:02 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0Ua7n3xB_1621998629;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Ua7n3xB_1621998629)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 26 May 2021 11:10:30 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] i2c: designware: Fix kernel-doc
Date:   Wed, 26 May 2021 11:10:23 +0800
Message-Id: <1621998623-14846-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix function name in i2c-designware-master.c kernel-doc comment
to remove a warning found by clang_w1.

drivers/i2c/busses/i2c-designware-master.c:176: warning: expecting
prototype for i2c_dw_init(). Prototype was for i2c_dw_init_master()
instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 'commit 21bf440ce18e ("i2c: designware: Make HW init functions
static")'
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 13be1d6..9b08bb5 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -165,7 +165,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 }
 
 /**
- * i2c_dw_init() - Initialize the designware I2C master hardware
+ * i2c_dw_init_master() - Initialize the designware I2C master hardware
  * @dev: device private data
  *
  * This functions configures and enables the I2C master.
-- 
1.8.3.1

