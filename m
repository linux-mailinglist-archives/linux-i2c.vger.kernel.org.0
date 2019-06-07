Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766B73923E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 18:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbfFGQhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 12:37:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40931 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfFGQhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 12:37:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id d30so1435396pgm.7;
        Fri, 07 Jun 2019 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HwTvlmWdDghlNpnmNUhFKxbXnmDZSk9We4aYnmK+PIU=;
        b=jzpAthglFHOW66a+yJIVVN0gYCphuCE1GEcOnxiLz4mizZLDnS7hYd6NXusCsqXYdk
         HJJ7A8NFeXw+StXTMX1ps1uosCg7F4as/7B0OTNbBbz340N5Meei4gbPzrs0zjhn94Xq
         Qp0aIZ00vVfB2TabxUBDd3DRXk7UQopx0bdAcjKyTiUzTkWs9aRsaVpv2eDRuuBJSH1n
         TMr+4TPJxN33QDDkIQY32O6dgR/N8aJFkoCSAhymUVOwrYrnTeVrpapaiotjlX7+nFkS
         dAHUKZnKpfQRQHlUsa6YdXEOGA/cVoJrTphj7J20tRpNsaa/O9Q8l43QVhoTAKpd4Tdo
         OkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HwTvlmWdDghlNpnmNUhFKxbXnmDZSk9We4aYnmK+PIU=;
        b=OYJCfIU80RiFrgRONxy12EA7DQ45VeehnzS2M5vHA87JcU0X0fZBogl5yhKPILfLMQ
         LGtCgCJgtzE9IbapVF49nHmeAMaz8CJm4Bqrq7AXNCeeOimg71Z1BT1zscicdk8VbkY8
         SCF1tQOWN/uMGhezCKY63nniTIfE7DQhPTC7ZBY8EV+ROY5P3msSzaqF3KqYOkOmKZlo
         yJFAV/6CWFY++TOroKt8wwew3fDrhfaE5WEZ2ogj6yYsGr8sgIsxCSuJb/y/Lwb3fxMH
         o6gAirR+PJ5ViENW5DZswYPNi54su5SX/DY2MSwTLP7vH/GspB3EAV0sP7xSBlJTV6SC
         D09Q==
X-Gm-Message-State: APjAAAVgVBIk6onilJLt4jn59ndPEfbGu4+9akKOH6vvPIXtmv1H3UsZ
        jYOuWWhl4rm2lyzFAuqucKzPWB/a
X-Google-Smtp-Source: APXvYqzRNMfGHFsrTNxGBJ+nK8fBGe3LC8akRaph5DYt4XdwDPxHldU0GnsVwJhh/+KKs903SU2e8w==
X-Received: by 2002:a63:eb56:: with SMTP id b22mr3562051pgk.81.1559925456436;
        Fri, 07 Jun 2019 09:37:36 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id t2sm1745520pgj.39.2019.06.07.09.37.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:37:35 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5 2/5] i2c: nvidia-gpu: add runtime pm support
Date:   Fri,  7 Jun 2019 09:34:20 -0700
Message-Id: <20190607163423.31860-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607163423.31860-1-ajayg@nvidia.com>
References: <20190607163423.31860-1-ajayg@nvidia.com>
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
Changes from v4->v5:
	- Removed extra comments for gpu_i2c_suspend() based on
	Wolfram's comment.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 7678a460bf9a..364244ffb5bf 100644
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
@@ -217,6 +218,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 		if (status2 < 0)
 			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
 	}
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
 
@@ -336,6 +339,11 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto del_adapter;
 	}
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
 	return 0;
 
 del_adapter:
@@ -349,10 +357,21 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_get_noresume(i2cd->dev);
 	i2c_del_adapter(&i2cd->adapter);
 	pci_free_irq_vectors(pdev);
 }
 
+/*
+ * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
+ * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
+ * Documentation/power/pci.txt also insists for driver to provide this.
+ */
+static __maybe_unused int gpu_i2c_suspend(struct device *dev)
+{
+	return 0;
+}
+
 static __maybe_unused int gpu_i2c_resume(struct device *dev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(dev);
@@ -361,7 +380,8 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, NULL, gpu_i2c_resume, NULL);
+static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, gpu_i2c_suspend, gpu_i2c_resume,
+			    NULL);
 
 static struct pci_driver gpu_i2c_driver = {
 	.name		= "nvidia-gpu",
-- 
2.17.1

