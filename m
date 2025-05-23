Return-Path: <linux-i2c+bounces-11125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AEAC1EFC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 10:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D320EA2447C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AE31DB366;
	Fri, 23 May 2025 08:55:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA9130A73;
	Fri, 23 May 2025 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990516; cv=none; b=awEq8hrE3c9EU2ET0PQmLXWV/8YquGgZM+bnvYUw3kRqrfgdQcqcfnVDK0rzkvVygcVpxBKYo7Igjweb4tPaGqKNtZx+t5xppl2sdmplHtNQzJ6rIiPow2rU6f6AEbDGHSkEaUcw5DrHA5gzDyy9TN5IhXlZ08Ik5kDsecnH7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990516; c=relaxed/simple;
	bh=WuYWKSM/26vX+BnazJK6j8NxJkKFj+uIw8YHL5OYIWE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=rL41l8eeBkxQ9KRGLYKOimWzKA7OPiLuBprpON6ye59ISEfcdRV/VKLl2NI5LIiQJdQAq29/FaBiTED+Xe81kIm3x4lBejVITAiq5XA9QJv8uvNwpMJsiun5bWWE22nTjvRiFXjNXlU/XdzL2mwJt+WpafW/5TXoCBPA9u8CpJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b3f9y56Llz5B1J6;
	Fri, 23 May 2025 16:55:02 +0800 (CST)
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl1.zte.com.cn with SMTP id 54N8sg6h069796;
	Fri, 23 May 2025 16:54:42 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 16:54:45 +0800 (CST)
Date: Fri, 23 May 2025 16:54:45 +0800 (CST)
X-Zmail-TransId: 2afc683037d5ffffffffaf2-ab6b4
X-Mailer: Zmail v1.0
Message-ID: <20250523165445002hUV3RCqhv6Xng7_bbUxlJ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <andi.shyti@kernel.org>
Cc: <codrin.ciubotariu@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <wsa+renesas@sang-engineering.com>, <till@harbaum.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>, <mou.yi@zte.com.cn>,
        <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBpMmM6IFVzZSBzdHJfcmVhZF93cml0ZSgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54N8sg6h069796
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 683037E6.003/4b3f9y56Llz5B1J6

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
v1 -> v2
Fix this in the whole i2c subsystem.

 drivers/i2c/algos/i2c-algo-pcf.c     | 3 ++-
 drivers/i2c/busses/i2c-at91-master.c | 3 ++-
 drivers/i2c/busses/i2c-sh_mobile.c   | 3 ++-
 drivers/i2c/busses/i2c-tiny-usb.c    | 3 ++-
 drivers/i2c/busses/i2c-viperboard.c  | 3 ++-
 drivers/i2c/i2c-core-base.c          | 3 ++-
 drivers/i2c/i2c-core-smbus.c         | 3 ++-
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 7a01f2687b4c..740066ceaea3 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -19,6 +19,7 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-pcf.h>
+#include <linux/string_choices.h>
 #include "i2c-algo-pcf.h"


@@ -316,7 +317,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		pmsg = &msgs[i];

 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
-		     pmsg->flags & I2C_M_RD ? "read" : "write",
+		     str_read_write(pmsg->flags & I2C_M_RD),
 		     pmsg->len, pmsg->addr, i + 1, num);)

 		ret = pcf_doAddress(adap, pmsg);
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ee3b469ddfb9..374fc50bb205 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>

 #include "i2c-at91.h"

@@ -523,7 +524,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	 */

 	dev_dbg(dev->dev, "transfer: %s %zu bytes.\n",
-		(dev->msg->flags & I2C_M_RD) ? "read" : "write", dev->buf_len);
+		str_read_write(dev->msg->flags & I2C_M_RD), dev->buf_len);

 	reinit_completion(&dev->cmd_complete);
 	dev->transfer_status = 0;
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index efe29621b8d7..adfcee6c9fdc 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 /* Transmit operation:                                                      */
 /*                                                                          */
@@ -409,7 +410,7 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 	pd->sr |= sr; /* remember state */

 	dev_dbg(pd->dev, "i2c_isr 0x%02x 0x%02x %s %d %d!\n", sr, pd->sr,
-	       (pd->msg->flags & I2C_M_RD) ? "read" : "write",
+	       str_read_write(pd->msg->flags & I2C_M_RD),
 	       pd->pos, pd->msg->len);

 	/* Kick off TxDMA after preface was done */
diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 0f2ed181b266..a18eab0992a1 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>

 /* include interfaces to usb layer */
@@ -71,7 +72,7 @@ static int usb_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)

 		dev_dbg(&adapter->dev,
 			"  %d: %s (flags %d) %d bytes to 0x%02x\n",
-			i, pmsg->flags & I2C_M_RD ? "read" : "write",
+			i, str_read_write(pmsg->flags & I2C_M_RD),
 			pmsg->flags, pmsg->len, pmsg->addr);

 		/* and directly send the message */
diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 7523e7c02271..1bd602852e35 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -278,7 +279,7 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,

 		dev_dbg(&i2c->dev,
 			"  %d: %s (flags %d) %d bytes to 0x%02x\n",
-			i, pmsg->flags & I2C_M_RD ? "read" : "write",
+			i, str_read_write(pmsg->flags & I2C_M_RD),
 			pmsg->flags, pmsg->len, pmsg->addr);

 		mutex_lock(&vb->lock);
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6ff35a2707..2ad2b1838f0f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -41,6 +41,7 @@
 #include <linux/property.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 #include "i2c-core.h"

@@ -2144,7 +2145,7 @@ static int i2c_quirk_error(struct i2c_adapter *adap, struct i2c_msg *msg, char *
 {
 	dev_err_ratelimited(&adap->dev, "adapter quirk: %s (addr 0x%04x, size %u, %s)\n",
 			    err_msg, msg->addr, msg->len,
-			    msg->flags & I2C_M_RD ? "read" : "write");
+			    str_read_write(msg->flags & I2C_M_RD));
 	return -EOPNOTSUPP;
 }

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e73afbefe222..71eb1ef56f0c 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -16,6 +16,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 #include "i2c-core.h"

@@ -433,7 +434,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	case I2C_SMBUS_I2C_BLOCK_DATA:
 		if (data->block[0] > I2C_SMBUS_BLOCK_MAX) {
 			dev_err(&adapter->dev, "Invalid block %s size %d\n",
-				read_write == I2C_SMBUS_READ ? "read" : "write",
+				str_read_write(read_write == I2C_SMBUS_READ),
 				data->block[0]);
 			return -EINVAL;
 		}
-- 
2.25.1

