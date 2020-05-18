Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174F11D7D7A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgERPxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgERPxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 11:53:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B6CC061A0C;
        Mon, 18 May 2020 08:53:35 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x13so5135499pfn.11;
        Mon, 18 May 2020 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5k+qyRVNZONvHscIRTTeDPQYlFL/cqvj8vnwf8/QSNI=;
        b=XneIGm7QjHDEX5E2HTiQuXdBgq8xCa7AHD3kxOpTD0iL+eqirY/HCcWXWejh8yRhC/
         t2KFk7mZ3MickGaesKkYhmsXezVfcPoyOp1l8fTUQa3tJcoxz92m2TY467TcwGl1T36p
         HXd2NZTkFjQV8l4uSVUc6XkP03yS3MNzfa57AeAVz27ZJaxpuG+jVXvq/W7SK357w14y
         NnOcrCPGr0NZaQAoQLoz/tPE5Df4rGMWpIvcgDPUVeLN3DJwqCvdy8YLMIoGf+szjpw8
         Qo2BkH5goE6gdxMtk8wJafZiZUHZM9MmLvaSEECsqOWQ5oMHsKeJPbEkH6foiM2OVofC
         kulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5k+qyRVNZONvHscIRTTeDPQYlFL/cqvj8vnwf8/QSNI=;
        b=IkEZ59AT2Psi1yLi79arR7x+59G0iL5HnfFe1EWJhNzWCJFwY2pwmTy9BXJmd2kZde
         0XF296fCwznB9VyxH+XftbeQ/rqlzLnnGwz+RM4RwZ91i3E7D0yKbVagjU2+N1iPqKzU
         WsCFerH2QSog32ogYnnaZVnEh7p9/+EThlDRYE5OjSwMnNpLh6j/9hPQeRvdDhlXL8DM
         qsSLoEVn7yHVjPrGkO4LJkkNbxqRB+MhC3XEqoo+cQX8rE67wRktu7OvjaaNVgt7FUS4
         0RS+duPTmNY1FM6PyE9IURe5RNmRGlvpOT4rWcxATDyCiecB0ldeq/AkM37+hVhxkQKA
         cKzg==
X-Gm-Message-State: AOAM530bM6+pjmB5CZn3g3qAVKjNk43jlJNXeDNn5pHHIiw7dwSffPe7
        MerMHY3SRpnjbKm7veiU0gk=
X-Google-Smtp-Source: ABdhPJwxw6G3xmiwTaq/deA6LtMMj3S1/Xh9C5APfzZk+8LUquGCNUcj4AqD+xRQ68idY0pED0XssQ==
X-Received: by 2002:aa7:9508:: with SMTP id b8mr11709277pfp.48.1589817214876;
        Mon, 18 May 2020 08:53:34 -0700 (PDT)
Received: from localhost ([176.122.159.242])
        by smtp.gmail.com with ESMTPSA id m9sm8033391pgd.1.2020.05.18.08.53.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:53:34 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, vz@mleia.com,
        slemieux.tyco@gmail.com, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, ardb@kernel.org,
        radu_nicolae.pirea@upb.ro, zhouyanjie@wanyeetech.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 1/2] drivers: provide devm_platform_request_irq()
Date:   Mon, 18 May 2020 23:53:03 +0800
Message-Id: <20200518155304.28639-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200518155304.28639-1-zhengdejin5@gmail.com>
References: <20200518155304.28639-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It will call devm_request_irq() after platform_get_irq() function
in many drivers, sometimes, it is not right of the error handling
for these two functions in some drivers. so provide this function
to simplify the driver.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/base/platform.c         | 33 +++++++++++++++++++++++++++++++++
 include/linux/platform_device.h |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 823646ffb978..75c600e286a8 100644
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

