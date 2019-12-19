Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1391512613F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 12:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLSLwD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 06:52:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53889 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfLSLwC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 06:52:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id m24so5126849wmc.3
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 03:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=inWqr0b7IGQSzA+ufbRqSvKpmxVDxis6ow/O4l0fxAk=;
        b=cYJEm41L8jWpObSqVzKD+h4cAiqqjoBDu2rDMB+uofSR9yWLyQSN10iRib9bzE/ABn
         JYfn3p39+zc5bMk+s5neeREjbGH+ySUc+zrKHX2IyjfewHNNodKFnCdeiCnH/ewQC72R
         VBwXLDmQ6oKNpR0i6HsfMSw/2sPCfRL0bgsjYtJeg/sCayKz4JKYX5bke5fNh9Z0Cnxc
         iDG0rnFTxdhKVpqdU++pr7Kb90oF3g9YCSzJQStm5pyQCUMPvT8HHgfuLdzcL05Ot2YD
         S9WbHaEYgxlXPQeIpTii25CgdSH+u/efYHCYu+YdkARSt2GucHWjY6iX2oA2WlC3erY2
         sHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=inWqr0b7IGQSzA+ufbRqSvKpmxVDxis6ow/O4l0fxAk=;
        b=n/8TNg8S4ZpHAdjsNgh73jUMN4PEZmvU3RVrA9NZAJBuZVVhQHNJAmP+3PIY5to4sr
         AYFDTpyWij/1wEKDsg1AUYKYf6XhsMUw4CL2b3K3ceH80r3on5s4N5qGz1Kh8y/qmwGd
         MHa127ajYnBqlbAMAA+KjOGuMCOnBWTDMJTqgZRkcVQZzAagiDMHrlWzLgaZRla2NRff
         JQp13Id4qmsLswF7XAy4GOUEjuiezFgsWUndW8t5RyWQUUiW7tm/113aUbBm9cov1ZnO
         aC6qpneYVoCn+7GPG3+758IUYrseYusxyAsHEOQGVC59OOVAvwCCLopFAHwy4G5ptQYS
         1gKw==
X-Gm-Message-State: APjAAAUbmETQUfuNcacHt9B9pT3KLIHcmVoWViY1ThH4nvbZ1p8K6k5V
        gHWM2fp+PH7ylK4xX6s+95IJ4A==
X-Google-Smtp-Source: APXvYqypHgDVKt7NGvXddF3Ni8naK7o8HHLN3RAsHXuzpnZpfjixTZ0P+45pRR5StmGQS8ZjrSmSdw==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr9601630wml.49.1576756319784;
        Thu, 19 Dec 2019 03:51:59 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id k16sm6489660wru.0.2019.12.19.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 03:51:59 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v3 2/4] nvmem: add support for the write-protect pin
Date:   Thu, 19 Dec 2019 12:51:39 +0100
Message-Id: <20191219115141.24653-3-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219115141.24653-1-ktouil@baylibre.com>
References: <20191219115141.24653-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The write-protect pin handling looks like a standard property that
could benefit other users if available in the core nvmem framework.

Instead of modifying all the memory drivers to check this pin, make
the NVMEM subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

There was a suggestion for introducing the gpiodesc from pdata, but
as pdata is already removed it could be replaced by adding it to
nvmem_config.

Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.html

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c           | 19 +++++++++++++++++--
 drivers/nvmem/nvmem.h          |  2 ++
 include/linux/nvmem-provider.h |  3 +++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 9f1ee9c766ec..3e1c94c4eee8 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include "nvmem.h"
@@ -54,8 +55,14 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
-	if (nvmem->reg_write)
-		return nvmem->reg_write(nvmem->priv, offset, val, bytes);
+	int ret;
+
+	if (nvmem->reg_write) {
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
+		ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
+		return ret;
+	}
 
 	return -EINVAL;
 }
@@ -338,6 +345,14 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		kfree(nvmem);
 		return ERR_PTR(rval);
 	}
+	if (config->wp_gpio)
+		nvmem->wp_gpio = config->wp_gpio;
+	else
+		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(nvmem->wp_gpio))
+		return PTR_ERR(nvmem->wp_gpio);
+
 
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
diff --git a/drivers/nvmem/nvmem.h b/drivers/nvmem/nvmem.h
index eb8ed7121fa3..be0d66d75c8a 100644
--- a/drivers/nvmem/nvmem.h
+++ b/drivers/nvmem/nvmem.h
@@ -9,6 +9,7 @@
 #include <linux/list.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/gpio/consumer.h>
 
 struct nvmem_device {
 	struct module		*owner;
@@ -26,6 +27,7 @@ struct nvmem_device {
 	struct list_head	cells;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	struct gpio_desc	*wp_gpio;
 	void *priv;
 };
 
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index fe051323be0a..6d6f8e5d24c9 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -11,6 +11,7 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 
 struct nvmem_device;
 struct nvmem_cell_info;
@@ -45,6 +46,7 @@ enum nvmem_type {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @wp-gpio:   Write protect pin
  *
  * Note: A default "nvmem<id>" name will be assigned to the device if
  * no name is specified in its configuration. In such case "<id>" is
@@ -58,6 +60,7 @@ struct nvmem_config {
 	const char		*name;
 	int			id;
 	struct module		*owner;
+	struct gpio_desc	*wp_gpio;
 	const struct nvmem_cell_info	*cells;
 	int			ncells;
 	enum nvmem_type		type;
-- 
2.17.1

