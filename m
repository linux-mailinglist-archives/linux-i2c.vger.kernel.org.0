Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6444C20527F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 14:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732393AbgFWMac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 08:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729611AbgFWMab (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 08:30:31 -0400
X-Greylist: delayed 1407 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Jun 2020 05:30:31 PDT
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868EFC061573
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jun 2020 05:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=+9P0veH3bRYGxJ7OmCEI28itKeJb+ud/P1u+38Hw3vw=; b=BU
        qM9YTd4A6jMTR+fYWxjEio83Td52s3AwjFA+pgwOG4cbbKMN3WOe5Ts6elr2p+bzBsSBJ1cc/cSMb
        qCqmX4ygHfBT1EWIMLogJWxQprw8eTOOisrR2y43eX+29Qr6S39vxjU4hWqFFWQ/nElcYXbCBp0/d
        B3veK2LWXZxFSRji4tLFOyFVZRCGmyK0du+w9DxLo2NvRiGnbYNMP0XTLmLyRrHotvy+mAzc810GS
        dIKjUjOyby0NBkM/U77qqHp0OFBoi0xsGk6bT+APxSQ7knvtH3Fm9uNgoHX3LxEaMi0p15RxdRVje
        XJhAxXGe/32W9A5yZITYFmCDTgqER+nw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1jnhhc-0005dX-06; Tue, 23 Jun 2020 13:07:00 +0100
From:   John Keeping <john@metanate.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     John Keeping <john@metanate.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rk3x: support master_xfer_atomic
Date:   Tue, 23 Jun 2020 13:06:46 +0100
Message-Id: <20200623120646.2175569-1-john@metanate.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable i2c transactions in irq disabled contexts like poweroff where the
PMIC is connected via i2c.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 39 +++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 15324bfbc6cb..8e3cc85d1921 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
@@ -1040,8 +1041,21 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 	return ret;
 }
 
-static int rk3x_i2c_xfer(struct i2c_adapter *adap,
-			 struct i2c_msg *msgs, int num)
+static int rk3x_i2c_wait_xfer_poll(struct rk3x_i2c *i2c)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), WAIT_TIMEOUT);
+
+	while (READ_ONCE(i2c->busy) &&
+	       ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(5);
+		rk3x_i2c_irq(0, i2c);
+	}
+
+	return !i2c->busy;
+}
+
+static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num, bool polling)
 {
 	struct rk3x_i2c *i2c = (struct rk3x_i2c *)adap->algo_data;
 	unsigned long timeout, flags;
@@ -1075,8 +1089,12 @@ static int rk3x_i2c_xfer(struct i2c_adapter *adap,
 
 		rk3x_i2c_start(i2c);
 
-		timeout = wait_event_timeout(i2c->wait, !i2c->busy,
-					     msecs_to_jiffies(WAIT_TIMEOUT));
+		if (!polling) {
+			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
+						     msecs_to_jiffies(WAIT_TIMEOUT));
+		} else {
+			timeout = rk3x_i2c_wait_xfer_poll(i2c);
+		}
 
 		spin_lock_irqsave(&i2c->lock, flags);
 
@@ -1110,6 +1128,18 @@ static int rk3x_i2c_xfer(struct i2c_adapter *adap,
 	return ret < 0 ? ret : num;
 }
 
+static int rk3x_i2c_xfer(struct i2c_adapter *adap,
+			 struct i2c_msg *msgs, int num)
+{
+	return rk3x_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int rk3x_i2c_xfer_polling(struct i2c_adapter *adap,
+				 struct i2c_msg *msgs, int num)
+{
+	return rk3x_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
@@ -1126,6 +1156,7 @@ static u32 rk3x_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm rk3x_i2c_algorithm = {
 	.master_xfer		= rk3x_i2c_xfer,
+	.master_xfer_atomic	= rk3x_i2c_xfer_polling,
 	.functionality		= rk3x_i2c_func,
 };
 
-- 
2.27.0

