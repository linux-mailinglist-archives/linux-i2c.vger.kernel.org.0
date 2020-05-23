Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F341DF7D7
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 16:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387883AbgEWOwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 10:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbgEWOwN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 10:52:13 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40481C061A0E;
        Sat, 23 May 2020 07:52:13 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x10so5591826plr.4;
        Sat, 23 May 2020 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LVepsmiIcELTwr/Tkv7UeOUAGygZHxdqoJxYP1p3mR4=;
        b=oLz4YVW1Ih3zj9+y9VE736E3sRkFDJcPiB1AlodAlzrqSC1vmDHCzAw/ZgjzDRDmWH
         2EjxvfQ3qyMZ/29zo3uhjUQvhBwpb0AwFj/HP5D+pxLWNg7eM3sdV3j4OqOgtsVtcpTv
         xHdDyWmqqbgXddFkG/hkjNGJB7NK5ll73+pycXgMtulEQ28gBTGlXIgjqQQlUJ6+OGw1
         U6gw1zH2Pr0+bSWmyW4bZMqlqlFo2od2Cmw5WgrVF0PeWuaUZZpWdSDAivT9/74wh+nm
         ZwYSXS2/+50xchwj+7JEqslghtSAebC0FBpIioMnjKo8rmtU/syb8kPtk37yV3i3GfkS
         Y7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LVepsmiIcELTwr/Tkv7UeOUAGygZHxdqoJxYP1p3mR4=;
        b=LYhmGleEZLNU6YvN3V5TeEiPTfWDk0sX+/rl7Zst9E7qZlKfkqd24gQuL/6RcyFR2h
         OI6ILvM+uOmiLCsdTNOX0ImgCq35rtXaBM0we21RoqGMiX7MkoBUd2Now3XY+H/pPpPG
         cJFvVkE/2Ep8HZ5h7bqY2xxriXYcwSGyBwwUfdxbgleBdTFzRsHZKWY+/nM2AxOnjKHF
         In3WC0qvvHiXEgAEw75unUfTUhrDLCZ0Lm0qgrJHqKSBd4c04GQR/YK9IedmaYgOKLFE
         ckREGHbo4muFO5H9Xkorf/wAcYfuKMCwP9HgsKCi/YghYvMQT2Z0XDkwwkCOMzTY4Msj
         sG1Q==
X-Gm-Message-State: AOAM533g0Pe4DeczwG/UJgvYrlxknoH8iLZFAsvwFOS4SW3xGD97RdL0
        pYIj6AOgZmm1APO57INtQzI=
X-Google-Smtp-Source: ABdhPJxy35bUCMDQ7xdWiYfCPXZ0X5C8XEn3nic/AvocdbtyPmw5CRXQPs+eK0CTh9f1iZAERAeC0Q==
X-Received: by 2002:a17:902:fe8d:: with SMTP id x13mr20627145plm.198.1590245532790;
        Sat, 23 May 2020 07:52:12 -0700 (PDT)
Received: from localhost (176.122.159.134.16clouds.com. [176.122.159.134])
        by smtp.gmail.com with ESMTPSA id y6sm9215926pjw.15.2020.05.23.07.52.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2020 07:52:12 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, festevam@gmail.com,
        vz@mleia.com, heiko@sntech.de, linus.walleij@linaro.org,
        baohua@kernel.org, ardb@kernel.org, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 1/2] drivers: provide devm_platform_request_irq()
Date:   Sat, 23 May 2020 22:51:56 +0800
Message-Id: <20200523145157.16257-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200523145157.16257-1-zhengdejin5@gmail.com>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It will call devm_request_irq() after platform_get_irq() function
in many drivers, sometimes, it is not right for the error handling
of these two functions in some drivers. so provide this function
to simplify the driver.

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- The patch content has not changed. just resend it by this discussion:
	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/

 drivers/base/platform.c         | 33 +++++++++++++++++++++++++++++++++
 include/linux/platform_device.h |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index c0d0a5490ac6..1d2fd1ea3bc5 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -275,6 +275,39 @@ int platform_irq_count(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(platform_irq_count);
 
+/**
+ * devm_platform_request_irq - get an irq and allocate an interrupt
+ *				line for a managed device
+ * @pdev: platform device
+ * @num: IRQ number index
+ * @irq: get an IRQ for a device if irq != NULL
+ * @handler: function to be called when the IRQ occurs
+ * @irqflags: interrupt type flags
+ * @devname: an ascii name for the claiming device, dev_name(dev) if NULL
+ * @dev_id: a cookie passed back to the handler function
+ *
+ * Return: zero on success, negative error number on failure.
+ */
+int devm_platform_request_irq(struct platform_device *pdev, unsigned int num,
+		unsigned int *irq, irq_handler_t handler,
+		unsigned long irqflags, const char *devname, void *dev_id)
+{
+	int tmp_irq, ret;
+
+	tmp_irq = platform_get_irq(pdev, num);
+	if (tmp_irq < 0)
+		return tmp_irq;
+
+	ret = devm_request_irq(&pdev->dev, tmp_irq, handler, irqflags,
+				devname, dev_id);
+	if (ret < 0)
+		dev_err(&pdev->dev, "can't request IRQ\n");
+	else if (irq != NULL)
+		*irq = tmp_irq;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_platform_request_irq);
+
 /**
  * platform_get_resource_byname - get a resource for a device by name
  * @dev: platform device
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 77a2aada106d..d94652deea5c 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -11,6 +11,7 @@
 #define _PLATFORM_DEVICE_H_
 
 #include <linux/device.h>
+#include <linux/interrupt.h>
 
 #define PLATFORM_DEVID_NONE	(-1)
 #define PLATFORM_DEVID_AUTO	(-2)
@@ -70,6 +71,9 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
+extern int devm_platform_request_irq(struct platform_device *pdev,
+		unsigned int num, unsigned int *irq, irq_handler_t handler,
+		unsigned long irqflags, const char *devname, void *dev_id);
 extern struct resource *platform_get_resource_byname(struct platform_device *,
 						     unsigned int,
 						     const char *);
-- 
2.25.0

