Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533497A9D57
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 21:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjIUTbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 15:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjIUTaR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 15:30:17 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACE257B02;
        Thu, 21 Sep 2023 10:18:47 -0700 (PDT)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
        by SHSQR01.spreadtrum.com with ESMTP id 38L8vR5h048606;
        Thu, 21 Sep 2023 16:57:27 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 38L8tXmD040792;
        Thu, 21 Sep 2023 16:55:33 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Rrq0F2frGz2SZykd;
        Thu, 21 Sep 2023 16:52:13 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 21 Sep
 2023 16:55:32 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 6/7] i2c: sprd: Increase the waiting time for I2C transmission to avoid system crash issues
Date:   Thu, 21 Sep 2023 16:54:56 +0800
Message-ID: <20230921085457.32446-7-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
References: <20230921085457.32446-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 38L8tXmD040792
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to the relatively low priority of the isr_thread, when the CPU
load is high, the execution of sprd_i2c_isr_thread will be delayed.
After the waiting time is exceeded, the I2C driver will perform
operations such as disabling the I2C controller. Later, when
sprd_i2c_isr_thread is called by the CPU, there will be kernel panic
caused by illegal access to the IIC register. After pressure testing,
we found that increasing the IIC waiting time to 10 seconds can
avoid this problem.

Fixes: 0b884fe71f9e ("i2c: sprd: use a specific timeout to avoid system hang up issue")
Cc: <stable@vger.kernel.org> # v5.11+
Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index b65729ba7d5a..dbdac89ad482 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -74,7 +74,7 @@
 /* timeout (ms) for pm runtime autosuspend */
 #define SPRD_I2C_PM_TIMEOUT	1000
 /* timeout (ms) for transfer message */
-#define I2C_XFER_TIMEOUT	1000
+#define I2C_XFER_TIMEOUT	10000
 /* dynamic modify clk_freq flag  */
 #define I2C_3M4_FLAG		0x0100
 #define I2C_1M_FLAG		0x0080
-- 
2.17.1

