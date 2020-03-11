Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078EE181E88
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 17:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbgCKQ6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 12:58:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35795 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730031AbgCKQ6X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Mar 2020 12:58:23 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jC4gU-0003xs-3A; Wed, 11 Mar 2020 16:58:18 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     ajayg@nvidia.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org (open list:I2C CONTROLLER DRIVER FOR NVIDIA
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()
Date:   Thu, 12 Mar 2020 00:58:06 +0800
Message-Id: <20200311165806.12365-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Nvidia card may come with a "phantom" UCSI device, and its driver gets
stuck in probe routine, prevents any system PM operations like suspend.

Let's handle the unaccounted case that the target time equals to jiffies
in gpu_i2c_check_status(), so the UCSI driver can let the probe fail as
it should.

Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 62e18b4db0ed..1988e93c7925 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -88,7 +88,7 @@ static int gpu_i2c_check_status(struct gpu_i2c_dev *i2cd)
 		usleep_range(500, 600);
 	} while (time_is_after_jiffies(target));
 
-	if (time_is_before_jiffies(target)) {
+	if (time_is_before_eq_jiffies(target)) {
 		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
 		return -ETIMEDOUT;
 	}
-- 
2.17.1

