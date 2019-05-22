Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E65269EE
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbfEVSdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43380 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbfEVSdo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id gn7so1468479plb.10;
        Wed, 22 May 2019 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BhC9WeOPHtKzs6wF/OAOSfwtaNdebLL5sTld3iXl2vA=;
        b=u4UVkg2qDwlJs0wutP15S/yEDnSRvjLFKvMXuG50ItWQg6l9czyfVvSfq66iI8rS30
         FdQPsjNufE+neb4C1mU4tGxRM18rLTpAIYxYUebQkFbBeWU0bXILiycRxZU4mSCF+BIY
         TE6F2aj6ZZtYdjCbByb+z/PHTtk4y/oisgvk5G32HPDaFVILHJ6lCsl61JaEZUcI3g3Q
         ml6k91j67m21yHA2RVbxB3iUFGxIzhjBlW34jyvoBsqkZ5Uaa1Veybv+b68h1i4Gboei
         zSnCDknBdqoBPZM3MWdd1r7oFb/udC4JvZU7RbqDLpr36P9WTWWPdluVx06ot+RQH6U9
         2EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BhC9WeOPHtKzs6wF/OAOSfwtaNdebLL5sTld3iXl2vA=;
        b=ZwXQzXQzKSBYcw6FYb+eNegtv9TTwkZ4hpLJzrL6G9ieRnEBKiTNMgHlwqE3YiVYBP
         6RAVQYf48baDLKm0eqeRSlAMHIOpfMXMWrev9WJS//tsHG/BQnzeGbdObMNvGxjof5ne
         fMsvNXieDayE3VwJZo+G3AO8f83Lfr4P60z93rfJut7vOX8pXgJ8fwPhMoGCM5gpWX0O
         VIHWzlfjzv/geH8+Bqp/xIV3TTJaBnDdKu+vNRlI05bxKpUwtYhWnNr8UDaX8zc8m1Kn
         ZXjiDa5oOoEkUSkPNPLCCQwAxtTV+vNP1dAIz3S3mzTmgckLLc9IFOJBAOfjzve92DBL
         O0cw==
X-Gm-Message-State: APjAAAUruQv0PlCcuYnjW1uL5tHNhaqrSiHUH8SkU2G495dLZoSUr+RU
        xVqT3h4Dj0GQWDn4QZ6eEUw=
X-Google-Smtp-Source: APXvYqyuRpl17Tc/hzadvQGMSbZ69rhjVIhec/Fiw4ulJqhce5s3pg9qU3IKhYH6lQOFOSgZeTSXFQ==
X-Received: by 2002:a17:902:f081:: with SMTP id go1mr44935634plb.211.1558550022639;
        Wed, 22 May 2019 11:33:42 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:41 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 5/5] usb: typec: ucsi: ccg: add runtime pm workaround
Date:   Wed, 22 May 2019 11:31:42 -0700
Message-Id: <20190522183142.11061-6-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522183142.11061-1-ajayg@nvidia.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Cypress USB Type-C CCGx controller firmware version 3.1.10
(which is being used in many NVIDIA GPU cards) has known issue of
not triggering interrupt when a USB device is hot plugged to runtime
resume the controller. If any GPU card gets latest kernel with runtime
pm support but does not get latest fixed firmware then also it should
continue to work and therefore a workaround is required to check for
any connector change event.

The workaround is that i2c bus driver will call pm_request_resume()
to runtime resume ucsi_ccg driver. CCG driver will call the ISR
for any connector change event for NVIDIA GPU card and only if it has
old CCG firmware with the known issue.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v2->v3: None

 drivers/usb/typec/ucsi/ucsi_ccg.c | 80 +++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index b15bc6c29c46..a5b81c011148 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -109,12 +109,21 @@ struct version_format {
 	__le16 build;
 	u8 patch;
 	u8 ver;
+#define CCG_VERSION_PATCH(x) ((x) << 16)
+#define CCG_VERSION(x)	((x) << 24)
 #define CCG_VERSION_MIN_SHIFT (0)
 #define CCG_VERSION_MIN_MASK (0xf << CCG_VERSION_MIN_SHIFT)
 #define CCG_VERSION_MAJ_SHIFT (4)
 #define CCG_VERSION_MAJ_MASK (0xf << CCG_VERSION_MAJ_SHIFT)
 } __packed;
 
+/*
+ * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
+ * of missing interrupt when a device is connected for runtime resume
+ */
+#define CCG_FW_BUILD_NVIDIA	(('n' << 8) | 'v')
+#define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
+
 struct version_info {
 	struct version_format base;
 	struct version_format app;
@@ -172,6 +181,7 @@ struct ucsi_ccg {
 	struct ccg_dev_info info;
 	/* version info for boot, primary and secondary */
 	struct version_info version[FW2 + 1];
+	u32 fw_version;
 	/* CCG HPI communication flags */
 	unsigned long flags;
 #define RESET_PENDING	0
@@ -185,6 +195,8 @@ struct ucsi_ccg {
 
 	/* fw build with vendor information */
 	u16 fw_build;
+	bool run_isr; /* flag to call ISR routine during resume */
+	struct work_struct pm_work;
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -212,6 +224,18 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	if (quirks && quirks->max_read_len)
 		max_read_len = quirks->max_read_len;
 
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		/*
+		 * Do not schedule pm_work to run ISR in
+		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
+		 * since we are already in ISR path.
+		 */
+		uc->run_isr = false;
+		mutex_unlock(&uc->lock);
+	}
+
 	pm_runtime_get_sync(uc->dev);
 	while (rem_len > 0) {
 		msgs[1].buf = &data[len - rem_len];
@@ -254,6 +278,18 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	msgs[0].len = len + sizeof(rab);
 	msgs[0].buf = buf;
 
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		/*
+		 * Do not schedule pm_work to run ISR in
+		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
+		 * since we are already in ISR path.
+		 */
+		uc->run_isr = false;
+		mutex_unlock(&uc->lock);
+	}
+
 	pm_runtime_get_sync(uc->dev);
 	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (status < 0) {
@@ -383,6 +419,13 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void ccg_pm_workaround_work(struct work_struct *pm_work)
+{
+	struct ucsi_ccg *uc = container_of(pm_work, struct ucsi_ccg, pm_work);
+
+	ucsi_notify(uc->ucsi);
+}
+
 static int get_fw_info(struct ucsi_ccg *uc)
 {
 	int err;
@@ -392,6 +435,9 @@ static int get_fw_info(struct ucsi_ccg *uc)
 	if (err < 0)
 		return err;
 
+	uc->fw_version = CCG_VERSION(uc->version[FW2].app.ver) |
+			CCG_VERSION_PATCH(uc->version[FW2].app.patch);
+
 	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
 		       sizeof(uc->info));
 	if (err < 0)
@@ -740,11 +786,12 @@ static bool ccg_check_fw_version(struct ucsi_ccg *uc, const char *fw_name,
 	}
 
 	/* compare input version with FWCT version */
-	cur_version = le16_to_cpu(app->build) | app->patch << 16 |
-			app->ver << 24;
+	cur_version = le16_to_cpu(app->build) | CCG_VERSION_PATCH(app->patch) |
+			CCG_VERSION(app->ver);
 
-	new_version = le16_to_cpu(fw_cfg.app.build) | fw_cfg.app.patch << 16 |
-			fw_cfg.app.ver << 24;
+	new_version = le16_to_cpu(fw_cfg.app.build) |
+			CCG_VERSION_PATCH(fw_cfg.app.patch) |
+			CCG_VERSION(fw_cfg.app.ver);
 
 	if (!ccg_check_vendor_version(uc, app, &fw_cfg))
 		goto out_release_firmware;
@@ -1084,8 +1131,10 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	uc->ppm.sync = ucsi_ccg_sync;
 	uc->dev = dev;
 	uc->client = client;
+	uc->run_isr = true;
 	mutex_init(&uc->lock);
 	INIT_WORK(&uc->work, ccg_update_firmware);
+	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
 	status = device_property_read_u16(dev, "ccgx,firmware-build",
@@ -1153,6 +1202,7 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 {
 	struct ucsi_ccg *uc = i2c_get_clientdata(client);
 
+	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
 	ucsi_unregister_ppm(uc->ucsi);
 	pm_runtime_disable(uc->dev);
@@ -1183,6 +1233,28 @@ static int ucsi_ccg_runtime_suspend(struct device *dev)
 
 static int ucsi_ccg_runtime_resume(struct device *dev)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucsi_ccg *uc = i2c_get_clientdata(client);
+	bool schedule = true;
+
+	/*
+	 * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
+	 * of missing interrupt when a device is connected for runtime resume.
+	 * Schedule a work to call ISR as a workaround.
+	 */
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		if (!uc->run_isr) {
+			uc->run_isr = true;
+			schedule = false;
+		}
+		mutex_unlock(&uc->lock);
+
+		if (schedule)
+			schedule_work(&uc->pm_work);
+	}
+
 	return 0;
 }
 
-- 
2.17.1

