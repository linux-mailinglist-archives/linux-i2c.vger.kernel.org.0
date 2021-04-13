Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46BE35DB91
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 11:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238498AbhDMJss (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 05:48:48 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:42482 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230386AbhDMJsq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 05:48:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UVRaprY_1618307305;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UVRaprY_1618307305)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 13 Apr 2021 17:48:26 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     kdasu.kdev@gmail.com
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] i2c: busses: remove unused including <linux/version.h>
Date:   Tue, 13 Apr 2021 17:48:21 +0800
Message-Id: <1618307301-72925-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following versioncheck warnings:
./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-brcmstb.c       | 1 -
 drivers/i2c/busses/i2c-xgene-slimpro.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index ba766d2..490ee39 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -22,7 +22,6 @@
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/version.h>
 
 #define N_DATA_REGS					8
 
diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 63cbb9c7..bba08cb 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/version.h>
 
 #define MAILBOX_OP_TIMEOUT		1000	/* Operation time out in ms */
 #define MAILBOX_I2C_INDEX		0
-- 
1.8.3.1

