Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37A932269E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 08:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhBWHsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 02:48:15 -0500
Received: from m12-17.163.com ([220.181.12.17]:35044 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232008AbhBWHsO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Feb 2021 02:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EQlFb
        PsFTZi9ewGkDle+g/qeavm7rzg+OmBnQFzqMn8=; b=FeYR2qolkQI8aS4sNCwbv
        LD6hnD2hBkUU6yBOYGBp+V4kbVdWswAmZgpJfXtK7hpMF7Ts8v/P260WmG0DN40t
        7uuEPFdhx7/iEoa+S9u4KUOLgA6gwZiR1wkEa2+IMPzcbwilWaA1dk55ad5MvyTA
        pJT6W/PiMis5d/GTW/RbCQ=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp13 (Coremail) with SMTP id EcCowACHPXrSYzRgRuu7mQ--.4187S2;
        Tue, 23 Feb 2021 10:09:23 +0800 (CST)
From:   dingsenjie@163.com
To:     brendanhiggins@google.com, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] i2c/busses:remove unneeded variable: "ret"
Date:   Tue, 23 Feb 2021 10:09:25 +0800
Message-Id: <20210223020925.22856-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACHPXrSYzRgRuu7mQ--.4187S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur43XF4xKw1rur4xWryxAFb_yoWfArX_KF
        1kW3Z7Gr1DZr95A345A3s8XryDKFyrurn5W3Z5Kay3CFy5Z348XFWDuryfJrs8Xrs7CFnr
        Zr1UWF47Aw17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0StC7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiThNCyFUDH1LYqgAAs+
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

remove unneeded variable: "ret".

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30..efad900 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -175,7 +175,6 @@ struct aspeed_i2c_bus {
 static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 {
 	unsigned long time_left, flags;
-	int ret = 0;
 	u32 command;
 
 	spin_lock_irqsave(&bus->lock, flags);
@@ -232,7 +231,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 out:
 	spin_unlock_irqrestore(&bus->lock, flags);
 
-	return ret;
+	return 0;
 
 reset_out:
 	spin_unlock_irqrestore(&bus->lock, flags);
-- 
1.9.1


