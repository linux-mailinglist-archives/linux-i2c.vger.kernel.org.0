Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C99622403E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 18:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgGQQLG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 12:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQQLG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 12:11:06 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE932C0619D2;
        Fri, 17 Jul 2020 09:11:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f16so6556892pjt.0;
        Fri, 17 Jul 2020 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/JT8GvZCM/gEMGdeiSZlYf2mCTUbO5AeEqz30v/2yk=;
        b=tHZXegleYTo8Je2SJDiwAg+PX42CyknF7dNkXn1u/4/eY7ENLwVGLY1T1sYTXOeDw+
         R6clmCUZCKTCXQRMgxk6U7HI4lWs3g7DN9aOsHsiia3nfM4gq+aWg4lwXszbRk7ssozJ
         Z+dbdQ5vsBNAvu19GSjH2HovV+O7S62oCnIlXHHdqxgrICL9Se6pgahwj95natNxQmI+
         amsROk9bBpjvNzmkhpy8qacpGQPXbffIbrpElFvY9Wkn2UV/MxusWlRF6mzq9pG2VVyv
         AUWrvUsyTjaIBIwe4MA9foMX49DgF3JYktk4TKdwqybhSERdgGpZSHfGQ+SRkeWh6DQ0
         9jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/JT8GvZCM/gEMGdeiSZlYf2mCTUbO5AeEqz30v/2yk=;
        b=Q14XFphuIEMCZQtX+1mMm/qUYlWNtDJNtErXeXubxQGsbaPkDW88yjqN5p/D/IdIuC
         KtgDgnU2Zhfjmz9yJx6m1ObBGwKcEQ5ntwu4GFGPfVomOfWU07McnWFWM6yTZOovCxW+
         9zVCY2dRCCgzTVXWV8N8sPSy7GN52jjboHS8+4qjS0E+TNfWfh1ynPkrtoY4Eo7mpKX6
         hSBEql4Q+afi9UrcN5BSLpeiVZUFVzwCGXop0gKpGc/w4GVoTDzIbpF/VDc68YVTY+LF
         tqtYMfpTLJaiUVFgrECdA8OPXOO6rQ5+TX76NqQhCeO4weg/VsNg7iiKMLAdam64GNsf
         ThWQ==
X-Gm-Message-State: AOAM530rRnRL/4GsApbUd9BrXr7dXE4GTMOFDflgGyH71fIe3iEOJd2X
        p6zW9MhA8wy3gm4Cc+sz0Co=
X-Google-Smtp-Source: ABdhPJz8+9DiVk48iTznhvwlTqX9fNIICVnzTs33hfzm2Hn4JqvMgR+6xsmH2yQmzSkfzldh+26OeQ==
X-Received: by 2002:a17:902:7d8f:: with SMTP id a15mr8138706plm.37.1595002265426;
        Fri, 17 Jul 2020 09:11:05 -0700 (PDT)
Received: from localhost ([89.208.244.139])
        by smtp.gmail.com with ESMTPSA id q24sm8286571pfg.95.2020.07.17.09.11.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 09:11:04 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, heiko@sntech.de, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v4 1/2] drivers: provide devm_platform_request_irq()
Date:   Sat, 18 Jul 2020 00:10:44 +0800
Message-Id: <20200717161045.11458-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200717161045.11458-1-zhengdejin5@gmail.com>
References: <20200717161045.11458-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It will call devm_request_irq() after platform_get_irq() function
in many drivers, And sometimes, the error handling of these two functions
is incorrect in some drivers. So this function is provided to simplify
the driver.

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v3 -> v4:
	- The patch v3 sent on May 27 may be lost somewhere in the
	  world, so resend it.
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
index eaaaafc21134..9c75903bce7c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -326,6 +326,7 @@ IRQ
   devm_request_any_context_irq()
   devm_request_irq()
   devm_request_threaded_irq()
+  devm_platform_request_irq()
   devm_irq_alloc_descs()
   devm_irq_alloc_desc()
   devm_irq_alloc_desc_at()
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index e5d8a0503b4f..d4212d12bf60 100644
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

