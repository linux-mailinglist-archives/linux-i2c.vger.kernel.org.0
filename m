Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4346269EA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfEVSdm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34182 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfEVSdl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id n19so1785387pfa.1;
        Wed, 22 May 2019 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u0JGhVsoc2MieyAr4lI6AVHWnT0CzecbZjFmC3a/a7E=;
        b=Hzyvgh/5GPSYJz6KYvOnHjJyMEoteMMbFd0k2Q45/NMf6+2GwQx09TpMLxMj32qrgL
         jhGY0l0+iiprx8tjNBJA5r9K/O837k3585n54DWZOE0iYf6A2DI7DLcJEgl4TeMXNk3q
         +JlXVUXEm+jDWKVCaiN5tHJjewqcVV7aHvL0NryIrRpKQkt/3gkPSptPubWfLyMMRPqV
         Y0j+Jb2H3TmjzzqJbB0MCv518XFMrGhJHgjKJ81ZKuUaSAn1b8XiLcKHvKvQ4jyCNdsw
         OaHuE2FLpa03A5H+adfZcthvefxtQTepRm8gMfUDV/mF5L1P5eWMoM63Pubp9kF7fxGi
         0xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u0JGhVsoc2MieyAr4lI6AVHWnT0CzecbZjFmC3a/a7E=;
        b=OFaS2mrY/AykAqunRbAnY5kWy5mK9PcnRsMfoA13mZM/aOV1NM81TSEYN/jn2/6jn7
         PLPZVgpv6WV1sQ5DOWcCAEC6COJjOO+6TuXv21J3RSu8f2X812snYeRyQkUODKMmOHeT
         LGBKLsNu7iQu5fQipuG6x2E0j4sUdJMZkZFFKrAfZDBRegnIAQBeWXX/KmWAsbkTShBl
         x5bIhU6V3WCK4pTvDCIQ3JBRhhS56BrVJQ8T4ge29V6Wzvi91qQ+gdc/k9ti7gV/A1+y
         ZVYVr4APEYDv9vppyNIxNtf6xiPUNv9c+vYDR3OXYZxsjmnz/qEGNMtcXH0FyeUXkSNl
         4wnA==
X-Gm-Message-State: APjAAAWA0kKnVp9HjpEyTdwDLlKHgY+NIX+kIfWhqKTkxOfJkxAFP7Db
        k1Hok40k8AYSNLESN3V/J0o=
X-Google-Smtp-Source: APXvYqzvKyopck+vjCQshKq33RMAQc4ughKea+gQ6y0DA1xVZG0e2Uv0gbsZfc1FLRQ8zsPxJoJWxw==
X-Received: by 2002:a62:7a8f:: with SMTP id v137mr96739769pfc.243.1558550020553;
        Wed, 22 May 2019 11:33:40 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:39 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Date:   Wed, 22 May 2019 11:31:40 -0700
Message-Id: <20190522183142.11061-4-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522183142.11061-1-ajayg@nvidia.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

The change enables runtime pm support to UCSI CCG driver.
Added ucsi_resume() function to enable notification after
system reusme. Exported both ucsi_resume() and ucsi_send_command()
symbols in ucsi.c for modular build.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v2->v3 : None
	- Fixed comments from Heikki by adding ucsi_resume()
	in ucsi.c and used it from ucsi_ccg.c
	- Also removed ucsi_ccg_runtime_idle() and
	ucsi_ccg_suspend() which were stubs and not needed.
	- We still need stub fucntion ucsi_ccg_runtime_suspend
	for runtime pm functionality

 drivers/usb/typec/ucsi/ucsi.c     | 10 ++++++++
 drivers/usb/typec/ucsi/ucsi.h     |  1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c | 38 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7850b851cecd..ba288b964dc8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -206,7 +206,17 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ucsi_send_command);
 
+int ucsi_resume(struct ucsi *ucsi)
+{
+	struct ucsi_control ctrl;
+
+	/* Restore UCSI notification enable mask after system resume */
+	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_ALL);
+	return ucsi_send_command(ucsi, &ctrl, NULL, 0);
+}
+EXPORT_SYMBOL_GPL(ucsi_resume);
 /* -------------------------------------------------------------------------- */
 
 void ucsi_altmode_update_active(struct ucsi_connector *con)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 1e2981aef629..de87d0b8319d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -430,6 +430,7 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 		      void *retval, size_t size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
+int ucsi_resume(struct ucsi *ucsi);
 
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 9d46aa9e4e35..b15bc6c29c46 100644
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
 
@@ -1155,9 +1168,34 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
 
+static int ucsi_ccg_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucsi_ccg *uc = i2c_get_clientdata(client);
+
+	return ucsi_resume(uc->ucsi);
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
+static const struct dev_pm_ops ucsi_ccg_pm = {
+	.resume = ucsi_ccg_resume,
+	.runtime_suspend = ucsi_ccg_runtime_suspend,
+	.runtime_resume = ucsi_ccg_runtime_resume,
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

