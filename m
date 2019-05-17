Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286CC21BCC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 18:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfEQQjy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 12:39:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36613 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbfEQQjy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 12:39:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id v80so3946671pfa.3;
        Fri, 17 May 2019 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IkIop0wlT6STh2CVqqcB9iKGB/gJvvYoK9sMpq9U66I=;
        b=a8e2EMJkN4l/+1U+KYSaRB6MwDh23KKj97Vgj1ivPCuLFnO8xcNVBkKVI64d4gUZkZ
         ON+bST5piNp9vESgFQVPN5w9cLsthC9AP2il6Q64mJ4sEo0v7H8Hz4dDtOWp/K3LPLaR
         SM/T4ihNEYGIzhwd6/VUX1UlBURQrbs3ckib45Gy+BK/5S5liLQ85g2mRunMZmov/Re2
         MzOn3Gu8OgkcmwvNXu00kIVg3obWuraSH9F+NpIR9IJz9QlQgiJAU8h3nc06j3DZSYwF
         ILhJ3aFaNRH6T2U0AWK8sG6jTCOy0Kk4DSMhmXc3hoSWfTrSFvkOVqQfmQG0+RLtNpiR
         Fluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IkIop0wlT6STh2CVqqcB9iKGB/gJvvYoK9sMpq9U66I=;
        b=oKU9L05/iKkpFKTAfga4j1jqBtGqQzAeMglqblk3YbYkTxny6vHnXgoEBm5f/4Sw3G
         JhKePf1DSK1VBKCQHRIfgLS3sphm/Cp2HYCZ3lBMVSI1y1tYE4EaGHr/8JV8B/0HCRQu
         nyYV1/NH/6W788l2awAJwTCa1EjXuqkNGSd4Vkc1XQRyPCtR0lqK3sMZZ5tv+cShjZlN
         hp/WB8CcBlJg70fcaKufGq2rK65YK1LR7Fu4oYX5Fx76yM4c1VDSDi+43jFQEI538b+2
         armxCicWhdBbym7teRFk0MZzdGX0gbuVYxF4sTEKa89d9reaE5/nGFPG/ty5dYcp7+az
         MTSA==
X-Gm-Message-State: APjAAAUQYpPvQudb4cW7gI3VZRZSTriz7jFDqXd+1h34WQuQfzfE8RY+
        5iwjgVxYrvzrJNKCa7HscrA=
X-Google-Smtp-Source: APXvYqzgQ2BNhj+fc1Up2U78LUK3IpqGAGF3jx5sm1x10OgBAdWaDp26uDNN5C0ulYssz0jODM6RAw==
X-Received: by 2002:a63:b00e:: with SMTP id h14mr54198637pgf.321.1558111193132;
        Fri, 17 May 2019 09:39:53 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z7sm10513791pgh.81.2019.05.17.09.39.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:39:52 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 4/4] usb: typec: ucsi: ccg: add runtime pm workaround
Date:   Fri, 17 May 2019 09:38:18 -0700
Message-Id: <20190517163818.5007-5-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517163818.5007-1-ajayg@nvidia.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Cypress USB Type-C CCGx controller firmware verson 3.1.10
(which is being used in many NVIDIA GPU cards) has known issue of
not triggering interrupt when a USB device is hot plugged to runtime
resume the controller. Many of these cards may get latest kernel but
may not get latest fixed firmware so a workaround is required to
check for any connector change event.

The workaround is that i2c bus driver will call pm_request_resume()
to runtime resume ucsi_ccg driver. CCG driver will call the ISR
for any connector change event only if NVIDIA GPU has old
CCG firmware with the known issue.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 78 +++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index cc7094ecda2d..3457e112fdbc 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -109,6 +109,8 @@ struct version_format {
 	__le16 build;
 	u8 patch;
 	u8 ver;
+#define CCG_VERSION_PATCH(x) ((x) << 16)
+#define CCG_VERSION(x)	((x) << 24)
 #define CCG_VERSION_MIN_SHIFT (0)
 #define CCG_VERSION_MIN_MASK (0xf << CCG_VERSION_MIN_SHIFT)
 #define CCG_VERSION_MAJ_SHIFT (4)
@@ -172,6 +174,7 @@ struct ucsi_ccg {
 	struct ccg_dev_info info;
 	/* version info for boot, primary and secondary */
 	struct version_info version[FW2 + 1];
+	u32 fw_version;
 	/* CCG HPI communication flags */
 	unsigned long flags;
 #define RESET_PENDING	0
@@ -185,6 +188,10 @@ struct ucsi_ccg {
 
 	/* fw build with vendor information */
 	u16 fw_build;
+	bool run_isr; /* flag to call ISR routine during resume */
+	struct work_struct pm_work;
+	u16 old_fw_build;
+	u32 old_fw_version;
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -212,6 +219,17 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	if (quirks && quirks->max_read_len)
 		max_read_len = quirks->max_read_len;
 
+	if (uc->old_fw_build == uc->fw_build &&
+	    uc->fw_version <= uc->old_fw_version) {
+		mutex_lock(&uc->lock);
+		/* do not schedule pm_work to run ISR in
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
@@ -254,6 +272,17 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	msgs[0].len = len + sizeof(rab);
 	msgs[0].buf = buf;
 
+	if (uc->old_fw_build == uc->fw_build &&
+	    uc->fw_version <= uc->old_fw_version) {
+		mutex_lock(&uc->lock);
+		/* do not schedule pm_work to run ISR in
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
@@ -383,6 +412,13 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
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
@@ -392,6 +428,9 @@ static int get_fw_info(struct ucsi_ccg *uc)
 	if (err < 0)
 		return err;
 
+	uc->fw_version = CCG_VERSION(uc->version[FW2].app.ver) |
+			CCG_VERSION_PATCH(uc->version[FW2].app.patch);
+
 	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
 		       sizeof(uc->info));
 	if (err < 0)
@@ -740,11 +779,12 @@ static bool ccg_check_fw_version(struct ucsi_ccg *uc, const char *fw_name,
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
@@ -1084,8 +1124,16 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	uc->ppm.sync = ucsi_ccg_sync;
 	uc->dev = dev;
 	uc->client = client;
+	uc->run_isr = true;
 	mutex_init(&uc->lock);
 	INIT_WORK(&uc->work, ccg_update_firmware);
+	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
+
+	/* Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
+	 * of missing interrupt when a device is connected for runtime resume
+	 */
+	uc->old_fw_build = ('n' << 8) | 'v';
+	uc->old_fw_version = CCG_VERSION(0x31) | CCG_VERSION_PATCH(10);
 
 	/* Only fail FW flashing when FW build information is not provided */
 	status = device_property_read_u16(dev, "ccgx,firmware-build",
@@ -1153,6 +1201,7 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 {
 	struct ucsi_ccg *uc = i2c_get_clientdata(client);
 
+	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
 	ucsi_unregister_ppm(uc->ucsi);
 	pm_runtime_disable(uc->dev);
@@ -1198,6 +1247,27 @@ static int ucsi_ccg_runtime_suspend(struct device *dev)
 
 static int ucsi_ccg_runtime_resume(struct device *dev)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucsi_ccg *uc = i2c_get_clientdata(client);
+	bool schedule = true;
+
+	/* Firmware version "old_fw_version" or earlier, built for NVIDIA has
+	 * known issue of missing interrupt when a device is connected for
+	 * runtime resume. Schedule a work to call ISR as a workaround.
+	 */
+	if (uc->old_fw_build == uc->fw_build &&
+	    uc->fw_version <= uc->old_fw_version) {
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

