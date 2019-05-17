Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0690B21BC8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 18:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfEQQjw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 12:39:52 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37739 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQQjw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 12:39:52 -0400
Received: by mail-pl1-f196.google.com with SMTP id p15so3602438pll.4;
        Fri, 17 May 2019 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uEPK1kmOZF0+H+xCVSAoMHj+XaOnB47qnOGPzlP8xsg=;
        b=KtUgrEEjTO1NShqtGMC0j4hcn0lELm0vTHgxg/ZWgcNLBaAjUbnxGXx5fZag6yR7OU
         kzpLhEtn+e3rgvTzHz+PVsJVA6ghowhW/Xrjtpm2ugBluju65FaQ0ed2PyQaUeFTfhU6
         vHJriEvThyyD9lxByFEd06MkAb9bhZOMeUQkrDW5ke1udmdJdJflMduRG9vnSBGvk8uu
         2P+72cPdzzUE+tS84LAG4EZDcXnHuuQZA/C6fkMFygJTzHNhrMLF3MSGoj0YWGRFOzVc
         +GeRyHIl7Yk9V7n6tCMhCpB1hO5oWmcWP2ZmhDUoIAouYaNb2HrpEDzLP4fiQLXIJ/mv
         y6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uEPK1kmOZF0+H+xCVSAoMHj+XaOnB47qnOGPzlP8xsg=;
        b=OiSW6HdkwBLxqGLv7msWLxslQR6eV5kLqc4QAhrhC2U4FT6U7n7vt+eXuZ1qYukZXr
         nB3hrIt5aMM3vsvxmYCoeLmri/lJRfBtcriWaaFvG0agkahhU1gF6qFNRtUmKSBJ/k9n
         t5ySCX50U3mei+BHGbIXxkWe8I66RmZ7mKgadxX36kBzusjYVTeMLP+6Dq4nhzU123rq
         P6ExHk4E6rM4BMLVmDo3STYqVGO6L0obvoZ6P9uL2aGSBU1buQ7ePYF1C6shMhCjbq/N
         0ftIgPHn0S87p+eNwHzXkXi//ddf5lNXtAOzhJ05UND18za9rYJVdm5RMny2wFZHX8SU
         jzcA==
X-Gm-Message-State: APjAAAVeF6/Z54HqNKtyjUYzc4RljD7prEKQWd3etK5foy/4qlfK6IgT
        IiRSjmOcVhYWZVKRtytjark=
X-Google-Smtp-Source: APXvYqzH/wnGjms2ZbvksF7DDT6B6aottXrJdd5MhL71xiENBdbVeEnLRGAiexd+gBqLEBA3BUPiaw==
X-Received: by 2002:a17:902:6b49:: with SMTP id g9mr6169163plt.298.1558111191191;
        Fri, 17 May 2019 09:39:51 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z7sm10513791pgh.81.2019.05.17.09.39.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:39:50 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 2/4] usb: typec: ucsi: ccg: enable runtime pm support
Date:   Fri, 17 May 2019 09:38:16 -0700
Message-Id: <20190517163818.5007-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517163818.5007-1-ajayg@nvidia.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
X-NVConfidentiality: public
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

