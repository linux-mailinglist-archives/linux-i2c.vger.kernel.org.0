Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A621E45C8
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 16:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389165AbgE0O0V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 10:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389036AbgE0O0V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 10:26:21 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B33DC08C5C1;
        Wed, 27 May 2020 07:26:21 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 131so3509481pfv.13;
        Wed, 27 May 2020 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxT1CUhQy7++N7J2uEuPxuFfU6PCHQ/tHRlkWb3usUM=;
        b=q8dfz6chvwikpsccikn81Com/PJ9/ujiLNqcTif2E/2FoveZ5+q1k908+cV5Ol4u5N
         pzIIuASzoed2qsWojrwt4YGsWQlgnD9K46B/VExD/nJ4ABpOBmS0s6dXILeWoFa8Hanh
         o4V1w4L5FoxbSAPAtQz8K2e4zP42/zQhRQ5fZ1U1QCpeGWMxhlyvpa5mkhrTEQNiFcWq
         X6kf0H0WaYAJD+OEv1vM33n946Q+I8u0frhaREc809ycZ4JMYjPy54KHNAFX9q9XIDxz
         kk2K5VYoaQsGSH5GN6D2DDEfEP2FJlDvFurdFkZGfFsS3LSFcFR1TogbEsjuPDrhNBdt
         s5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxT1CUhQy7++N7J2uEuPxuFfU6PCHQ/tHRlkWb3usUM=;
        b=owZ8H9r/J4H+KgnX3l0uX2WnZD9VgAdJpw4Dp59/Z/GSLIo56/vj4tK6f4IlhY22MN
         dGbYZYn6378yjrbU4jVEtKqNwsmLM6YbMrcpbgNV2CKepMCp9FYRlaEo1T26cyzAO9OH
         nkHE+YdKcp9CacBeGX22/yQeB5c4Ky8HCxOYVe1AI6r4SYtXk2GBYSsFYkMvIMCkaD9b
         pK7idBF4sfy9qEmEDWMei67TPyGtAgbqWf1geHLpK+WjYAkf2JHjmjP2rn6JarkOlNSv
         13uX+AunazH/OpWfvbGWq/+5at8+RyUzLYLswBXe3nL3BuEnJtTVBitSX+DbwsAlzqKS
         annw==
X-Gm-Message-State: AOAM5335n4qLCDxYDzEo8LsCfeHVTgJRzl3QrX07FHDVm2Dd6NEUIESH
        CT8HFfrQHluJYCNaQasZKD4=
X-Google-Smtp-Source: ABdhPJzd+fsPgc2gE8SP4AB5eBntBpGk3JVixRSvF/psLPMiB4b6157LuZisq5B/zGRGa3gqZag6hw==
X-Received: by 2002:a63:9255:: with SMTP id s21mr4197708pgn.363.1590589580622;
        Wed, 27 May 2020 07:26:20 -0700 (PDT)
Received: from localhost ([144.34.194.82])
        by smtp.gmail.com with ESMTPSA id 5sm2251982pfp.182.2020.05.27.07.26.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 07:26:20 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dejin Zheng <zhengdejin5@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v3 1/2] drivers: provide devm_platform_request_irq()
Date:   Wed, 27 May 2020 22:26:10 +0800
Message-Id: <20200527142611.9006-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
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
v2 -> v3:
	- add devm_platform_request_irq() to devres.rst by Grygorii's
	  suggestion.
v1 -> v2:
	- The patch content has not changed. just resend it by this discussion:
	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/base/platform.c                       | 33 +++++++++++++++++++
 include/linux/platform_device.h               |  4 +++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 644078332354..89681264ee2c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -325,6 +325,7 @@ IRQ
   devm_request_any_context_irq()
   devm_request_irq()
   devm_request_threaded_irq()
+  devm_platform_request_irq()
   devm_irq_alloc_descs()
   devm_irq_alloc_desc()
   devm_irq_alloc_desc_at()
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

