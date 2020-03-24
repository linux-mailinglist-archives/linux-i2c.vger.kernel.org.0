Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D41191462
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 16:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgCXP2Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 11:28:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46420 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgCXP2Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 11:28:25 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jGlTX-0000IV-P5; Tue, 24 Mar 2020 15:28:20 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     ajayg@nvidia.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org (open list:I2C CONTROLLER DRIVER FOR NVIDIA
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()
Date:   Tue, 24 Mar 2020 23:28:11 +0800
Message-Id: <20200324152812.20231-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Nvidia card may come with a "phantom" UCSI device, and its driver gets
stuck in probe routine, prevents any system PM operations like suspend.

There's an unaccounted case that the target time can equal to jiffies in
gpu_i2c_check_status(), let's solve that by using readl_poll_timeout()
instead of jiffies comparison functions. 

Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v3:
- Use readl_poll_timeout to make the retry loop simpler.

v2:
- Use a boolean to make sure the operation is timeout or not.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 62e18b4db0ed..f5d25ce00f03 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -75,20 +76,15 @@ static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
 
 static int gpu_i2c_check_status(struct gpu_i2c_dev *i2cd)
 {
-	unsigned long target = jiffies + msecs_to_jiffies(1000);
 	u32 val;
+	int ret;
 
-	do {
-		val = readl(i2cd->regs + I2C_MST_CNTL);
-		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER))
-			break;
-		if ((val & I2C_MST_CNTL_STATUS) !=
-				I2C_MST_CNTL_STATUS_BUS_BUSY)
-			break;
-		usleep_range(500, 600);
-	} while (time_is_after_jiffies(target));
-
-	if (time_is_before_jiffies(target)) {
+	ret = readl_poll_timeout(i2cd->regs + I2C_MST_CNTL, val,
+				 !(val & I2C_MST_CNTL_CYCLE_TRIGGER) ||
+				 (val & I2C_MST_CNTL_STATUS) != I2C_MST_CNTL_STATUS_BUS_BUSY,
+				 500, 1000 * USEC_PER_MSEC);
+
+	if (ret) {
 		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
 		return -ETIMEDOUT;
 	}
-- 
2.17.1

