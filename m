Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0822324092
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 20:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfETSjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 14:39:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34347 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfETSjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 14:39:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id c13so7193729pgt.1;
        Mon, 20 May 2019 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZNeknb8PGKUKLTWwoHkpexxbNOhtv1U320+t2geunDU=;
        b=XQpa+iKRqFGDkGMUxnwiTI4jcMagDJtTt2zUXinzlS/yfIxm13IF7gU3PRCrnb4xM2
         +w+tQ6kI4L/JtskDeif8gDnWUaDFgKcBdh8s4wmAPNJA53GGGICbvtymsdodcfPUmGQ0
         DUra2RiLvSd2y9D+i/vn6+voFQmboz0I8FOZRFxiYk6KJdhfetGyyx9XNDtgvheQOQyV
         imx2mTzN/XnnVMu8/A77EBZHwZxYftYHT0aB87gqqA8ZSLMuPTz+Ma3iiUzuZvwfsn/c
         jXJx6G2YyfHTWPX5rly5ym75I4A8NYJJe+lbRybmDYTuwSrXh3AgksH/2ZLPA8DRTsZf
         ukhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZNeknb8PGKUKLTWwoHkpexxbNOhtv1U320+t2geunDU=;
        b=VfLa+7nA9MDcW8xmuy5hv8xAd7JeOIr02th+FmKT6eLeCol3t0I6PJwFeuCqKdEnDh
         +1acjeYWhb1W5UR88sRbJQa5uRZJ5pwolm7XsVlYcCItxitEXPVm3JhBr1mbmZ7mumko
         Axz9MKtyZzN9K2IGFj4tm4TlJ5I8A5HgZ0wd5YxQ0e6xZaA+AwHYx3SUxCOsL97KMxg8
         QySD1H8lBoggjSNBWiMFfiURY9sz1acK5TcK0wFElyIUJT2ZcgzHjcKb41Lsw0l5Qvvz
         8SgJ7iA2TYvAzVrroR4ukDdkSAXFlcrkmPuCj+z1ojdfH2dIY/1JwhA4Al5iKQWRHT+u
         oWeA==
X-Gm-Message-State: APjAAAVrebFNr/dMK1QU5R0mMJk8dTQ6rt7M+qf/CyujIlh/ZFUZaOAB
        /Yg025OTTjkFxn1ffVYbZZZXqQovnJs=
X-Google-Smtp-Source: APXvYqypWz5ne83xcaprjSZ7xvdhZ+uNXhfnYWjzOsB97iMBn4kwA27hajkJ0KXVsBk71Yd+mqa6HQ==
X-Received: by 2002:a62:4e86:: with SMTP id c128mr81377582pfb.39.1558377579972;
        Mon, 20 May 2019 11:39:39 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id o20sm22321288pgj.70.2019.05.20.11.39.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:39:39 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Date:   Mon, 20 May 2019 11:37:48 -0700
Message-Id: <20190520183750.2932-4-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520183750.2932-1-ajayg@nvidia.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

The change enables runtime pm support to UCSI CCG driver.
ucsi_send_command() is used in resume path and so exported
ucsi_send_command() symbol in ucsi.c for modular build.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v1->v2 : None

 drivers/usb/typec/ucsi/ucsi.c     |  1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c | 60 +++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7850b851cecd..e9454134d399 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -206,6 +206,7 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ucsi_send_command);
 
 /* -------------------------------------------------------------------------- */
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 9d46aa9e4e35..cc7094ecda2d 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -14,6 +14,8 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
 
 #include <asm/unaligned.h>
 #include "ucsi.h"
@@ -210,6 +212,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	if (quirks && quirks->max_read_len)
 		max_read_len = quirks->max_read_len;
 
+	pm_runtime_get_sync(uc->dev);
 	while (rem_len > 0) {
 		msgs[1].buf = &data[len - rem_len];
 		rlen = min_t(u16, rem_len, max_read_len);
@@ -218,12 +221,14 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 		status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 		if (status < 0) {
 			dev_err(uc->dev, "i2c_transfer failed %d\n", status);
+			pm_runtime_put_sync(uc->dev);
 			return status;
 		}
 		rab += rlen;
 		rem_len -= rlen;
 	}
 
+	pm_runtime_put_sync(uc->dev);
 	return 0;
 }
 
@@ -249,13 +254,16 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	msgs[0].len = len + sizeof(rab);
 	msgs[0].buf = buf;
 
+	pm_runtime_get_sync(uc->dev);
 	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (status < 0) {
 		dev_err(uc->dev, "i2c_transfer failed %d\n", status);
+		pm_runtime_put_sync(uc->dev);
 		kfree(buf);
 		return status;
 	}
 
+	pm_runtime_put_sync(uc->dev);
 	kfree(buf);
 	return 0;
 }
@@ -1134,6 +1142,10 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	if (status)
 		dev_err(uc->dev, "cannot create sysfs group: %d\n", status);
 
+	pm_runtime_set_active(uc->dev);
+	pm_runtime_enable(uc->dev);
+	pm_runtime_idle(uc->dev);
+
 	return 0;
 }
 
@@ -1143,6 +1155,7 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 
 	cancel_work_sync(&uc->work);
 	ucsi_unregister_ppm(uc->ucsi);
+	pm_runtime_disable(uc->dev);
 	free_irq(uc->irq, uc);
 	sysfs_remove_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
 
@@ -1155,9 +1168,56 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
 
+static int ucsi_ccg_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int ucsi_ccg_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucsi_ccg *uc = i2c_get_clientdata(client);
+	struct ucsi *ucsi = uc->ucsi;
+	struct ucsi_control c;
+	int ret;
+
+	/* restore UCSI notification enable mask */
+	UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
+	ret = ucsi_send_command(ucsi, &c, NULL, 0);
+	if (ret < 0) {
+		dev_err(uc->dev, "%s: failed to set notification enable - %d\n",
+			__func__, ret);
+	}
+	return 0;
+}
+
+static int ucsi_ccg_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int ucsi_ccg_runtime_resume(struct device *dev)
+{
+	return 0;
+}
+
+static int ucsi_ccg_runtime_idle(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops ucsi_ccg_pm = {
+	.suspend = ucsi_ccg_suspend,
+	.resume = ucsi_ccg_resume,
+	.runtime_suspend = ucsi_ccg_runtime_suspend,
+	.runtime_resume = ucsi_ccg_runtime_resume,
+	.runtime_idle = ucsi_ccg_runtime_idle,
+};
+
 static struct i2c_driver ucsi_ccg_driver = {
 	.driver = {
 		.name = "ucsi_ccg",
+		.pm = &ucsi_ccg_pm,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.17.1

