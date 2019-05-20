Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE024091
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 20:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfETSjk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 14:39:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45674 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfETSjj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 14:39:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id s11so7625554pfm.12;
        Mon, 20 May 2019 11:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PZ/tbcFcCvHOSqEDz47sYlToMZ2Jk0dbzOiy+eRO5oU=;
        b=JicZLJLc7jIXqI88XOZcdgN5TXsjQ3T6CP4gdnV1/wQCIq76FIqPutTsBccpkk/nkP
         mMQ5MPuzb2GfapCogvNWb01r299RXx1yHch888LkrjLHwO7KJf1u9xKZieHQ2CkqHU6H
         EOhgUr3KRscSzOQUKgFi7k2JFjcn5HGflestELyFcZPHArhq/YxbS7aTFHtd6S+6/tW2
         XR8rkRRqDMb21M15cqJpoAcbKrnjijQFD243sjyQUSt5M9vKt8T6NcLhONsQIf3HlX9v
         2pg5Z/I5PoC/y1LBAT+YmS7JD/0ItrgZANCdG1miRx2UQIEsnhhsy1IwA9eIvLuThVmD
         8P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PZ/tbcFcCvHOSqEDz47sYlToMZ2Jk0dbzOiy+eRO5oU=;
        b=gJ9Ugga39Rw4Kgg2EHn1drojx4bFPNR7yYr/bjIBh37wlQMXjgbbvo4icY0BACWZ+j
         OCClei3QLt1EnoRZAmC8fo16AaAPSnsAxouPWbbOV/f/S0ndRzmPUWE2P+hVhbm24CId
         qYsKZvzmur0nJ8Arc/GwKghi5a/plu5ARZWbpIkMjVrMB1hM1zYq79A/WyZTR2/EojwL
         TNtlPhA3G8hpZrUFe0J4J9DVyN1yLc+V8d8mnJK+EDpna4nlvnFUvLGytw4PNZgZHj8f
         hhIouHrrCLqZSV6tsLnvZPGHJJGEIJqSWMVwy9zClGmb6dImHrKFyfA2vLK9q3JmJaYu
         DAWQ==
X-Gm-Message-State: APjAAAVFaCbppd3f95jlR1LBJ6xweNzXHi8Y+hwQQ3BENwQgGGv668f3
        bfYc6dNpipdpJQxdWfJxuPE=
X-Google-Smtp-Source: APXvYqzo5z0Pr7G9cVCeJIsivJDr8TrF7qaKOQDH2aRg8W/vIlYkiYD/eFaHCHEiM1c9e4Wwx1BX+g==
X-Received: by 2002:a62:4607:: with SMTP id t7mr82834358pfa.138.1558377578988;
        Mon, 20 May 2019 11:39:38 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id o20sm22321288pgj.70.2019.05.20.11.39.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:39:38 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 2/5] i2c: nvidia-gpu: add runtime pm support
Date:   Mon, 20 May 2019 11:37:47 -0700
Message-Id: <20190520183750.2932-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520183750.2932-1-ajayg@nvidia.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
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
Changes from v1->v2: None

 drivers/i2c/busses/i2c-nvidia-gpu.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 2d9561ec2320..af445590041b 100644
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
@@ -211,6 +212,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 		goto exit;
 	}
 
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return i;
 exit:
 	if (send_stop) {
@@ -218,6 +221,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 		if (status2 < 0)
 			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
 	}
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
 
@@ -337,6 +342,11 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto del_adapter;
 	}
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
 	return 0;
 
 del_adapter:
@@ -350,10 +360,16 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_get_noresume(i2cd->dev);
 	i2c_del_adapter(&i2cd->adapter);
 	pci_free_irq_vectors(pdev);
 }
 
+static int gpu_i2c_suspend(struct device *dev)
+{
+	return 0;
+}
+
 static __maybe_unused int gpu_i2c_resume(struct device *dev)
 {
 	struct gpu_i2c_dev *i2cd = dev_get_drvdata(dev);
@@ -362,7 +378,8 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, NULL, gpu_i2c_resume, NULL);
+static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, gpu_i2c_suspend, gpu_i2c_resume,
+			    NULL);
 
 static struct pci_driver gpu_i2c_driver = {
 	.name		= "nvidia-gpu",
-- 
2.17.1

