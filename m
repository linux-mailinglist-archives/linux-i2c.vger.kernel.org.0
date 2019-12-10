Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DF5118CC8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 16:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfLJPmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 10:42:19 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35261 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfLJPmS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 10:42:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so20645704wro.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w4D6ZqamJW9QSroTdCyeCwKsa+r24vCro2cOz6VJshk=;
        b=XDJgVY9Nq/Bwd9tasYyqOJZUxEl9HxMnhBkzMYCb4XFprY/wyK/6NOZ9cYHDFugzms
         mjqEk/NTc0CAUlPwrkDFlpkJ/lUBK4Ztuc8/QBDtRfGD6a6n+iu3W6zO/W4zht9X0ZpO
         Uj+jgkNncdn80EFCOc2nwuctP8hFPeWnhgGrFZM/AjOjjhxzfXNycgswVJBJ7zZnoQtI
         EEH05c0gCrzmXgu0T2BN/5mHVeRSHlb5fs7QgXqPlpNaY7e2UdPnGEpH9hiIYq9P4i/8
         T29uZh7WCTQHJ4hKtMaWoEiknjuTNGMBwzAhFcUKZ1EU2OxqQVJBNYw36/V0IQTlfBxx
         MYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w4D6ZqamJW9QSroTdCyeCwKsa+r24vCro2cOz6VJshk=;
        b=TGfcKuWbm/WapIi3G+wBfONnfwdWT6uP2+F9yUbLHgvKXS6R9iB1Dnd7vXTB6i0a8S
         BBnCs/LISwoAU3Uthy5VVQ0chCMKujjT+zP1XsC8tELeGcOhZX0MKHQSNs0aN/PKxR5O
         4GMekYbPnUSP5cAMKUr0U+y6+hh1mOuXtF/NGN8/6EC7rnRN+WoV1PEttGxwfeSuhwC8
         m9dPiLRCOxTsz8RBPSZnxAjyO3LTuS3K8wkALBj1P0V1/G7nfFDRNjS6HnLS7WWVhXLS
         knE5Zb8dcPEJCdQiGl38OEWUd5oJCOfb130W8cLLUCjywB8NFhV9zqvnfGcHkwmno4dm
         fs7A==
X-Gm-Message-State: APjAAAWbmSTsnrrWxbM+CIi34z8Qk8pIjHquaB/gdO6Kr+UgNJ1Z11Ld
        f8YwasDhFTn51x+1zee6s0PAxg==
X-Google-Smtp-Source: APXvYqzCgA0PcGad9RTEou2mhhv6GR2/UeLuAcIFhkrUBd747CO23p8eft22O+eXRUUlpImtvMVRxg==
X-Received: by 2002:adf:b605:: with SMTP id f5mr3847966wre.383.1575992537146;
        Tue, 10 Dec 2019 07:42:17 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o7sm3469085wmc.41.2019.12.10.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:42:16 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v2 2/4] nvmem: add support for the write-protect pin
Date:   Tue, 10 Dec 2019 16:41:55 +0100
Message-Id: <20191210154157.21930-3-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210154157.21930-1-ktouil@baylibre.com>
References: <20191210154157.21930-1-ktouil@baylibre.com>
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

