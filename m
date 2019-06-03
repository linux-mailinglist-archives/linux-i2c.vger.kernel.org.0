Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E525C3361B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 19:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728545AbfFCRIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 13:08:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37744 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFCRIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 13:08:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id a23so10985453pff.4;
        Mon, 03 Jun 2019 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dhA93XElDXWwQo4U49kdCfXrgdWn/GrVyfL9Vs9fqyU=;
        b=k3d39lJ6JKDURGUWCnCXw9KhJAaUWTr4nr06WWB0l8PdDOsqcjjVXk48J55bpMCyi7
         o3HycYekoGFFdLYJ+cyyTmoLCZObOzPOSE7wLK3vA8AN/u+JkyOKd5mfGs3WXdAltX67
         7uHRip+q7C0t/vslGqFPko0HiLiphTFjaaSScRbolKEGf61LJorUVb4BHZ/MGY3uaGPB
         uZlfFMXMxVmP8ocA3rE7jY3tpBbz2qsiXvVmFaCdP8touKDZiLfayiXdWYn3bMiiHrfm
         7CKSU/XaplojZZwEYskrO2wI5IMRqqTGelFNMq3FKUZu8S2pM13mrJ9Fe/V7g/NISE44
         qkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dhA93XElDXWwQo4U49kdCfXrgdWn/GrVyfL9Vs9fqyU=;
        b=dUl2dNf6IYGWzQKdipmxguxS2JGriOajvRa4mTq21+2NUDm4DOIo93vkrc3NN+4eqW
         Vk+hxNPgONr2mpZfDYsOMKbIDA4AQdysg1Y9v3qfuZPoFI2igDlUmF8NdFAplptgcn1Z
         z/jiZoadclMhVM14oex5R1Jpa/rNOon6MogSsPTouhSS9AesAMxjlpLt3X9y5H3NorVU
         Je7c9ZUD1c6b4lQJ6Ft1RiFDPG0jbYZVYyitQlcmrf+A8roZgvbbnoFJr0iWZmOx22h2
         TL+IohfM0JRutA7Xm7unHJ3y0IFlWodFGNgRfEIH0KqMQzKcTW6xXqhMFgU4Ao03dKr+
         7snQ==
X-Gm-Message-State: APjAAAWV9u/rov1eqgXI7kq2LadBNSNj9iWxKpqirggcL//BM92w01uc
        kDHjpiY1x6PzVcbYFcSSF2I1M/dU
X-Google-Smtp-Source: APXvYqx+HgSextq2WaOXDRuY9WHVWiNpSjqiI61KTnnkZoOcY0GSrOZsK46bMh5tZ1MJ/BmIMQAcug==
X-Received: by 2002:a17:90a:d16:: with SMTP id t22mr31760518pja.130.1559581718246;
        Mon, 03 Jun 2019 10:08:38 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p63sm17988814pfb.70.2019.06.03.10.08.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 10:08:37 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v4 2/5] i2c: nvidia-gpu: add runtime pm support
Date:   Mon,  3 Jun 2019 10:05:42 -0700
Message-Id: <20190603170545.24004-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603170545.24004-1-ajayg@nvidia.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Enable runtime pm support with autosuspend delay of three second.
This is to make sure I2C client device Cypress CCGx has completed
all transaction.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v3->v4:
	- Added comment on why stub gpu_i2c_suspend() is needed for
	runtime pm to work correctly.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index f1771beb75ea..ad1006e72a03 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -176,6 +176,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 	 * The controller supports maximum 4 byte read due to known
 	 * limitation of sending STOP after every read.
 	 */
+	pm_runtime_get_sync(i2cd->dev);
 	for (i = 0; i < num; i++) {
 		if (msgs[i].flags & I2C_M_RD) {
 			/* program client address before starting read */
@@ -219,6 +220,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 		if (status2 < 0)
 			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
 	}
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
 
@@ -338,6 +341,11 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto del_adapter;
 	}
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
 	return 0;
 
 del_adapter:
@@ -351,10 +359,26 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_get_noresume(i2cd->dev);
 	i2c_del_adapter(&i2cd->adapter);
 	pci_free_irq_vectors(pdev);
 }
 
+/*
+ * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
+ * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
+ * Documentation/power/pci.txt also insists for driver to provide this:
+ * "First, a PCI device is put into a low-power state, or suspended, with the
+ * help of pm_schedule_suspend() or pm_runtime_suspend() which for PCI devices
+ * call pci_pm_runtime_suspend() to do the actual job.  For this to work, the
+ * device's driver has to provide a pm->runtime_suspend() callback (see below),
+ * which is run by pci_pm_runtime_suspend() as the first action."
+ */
+static __maybe_unused int gpu_i2c_suspend(struct device *dev)
+{
+	return 0;
+}
+
 static __maybe_unused int gpu_i2c_resume(struct device *dev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(dev);
@@ -363,7 +387,8 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, NULL, gpu_i2c_resume, NULL);
+static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, gpu_i2c_suspend, gpu_i2c_resume,
+			    NULL);
 
 static struct pci_driver gpu_i2c_driver = {
 	.name		= "nvidia-gpu",
-- 
2.17.1

