Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70D921BC6
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 18:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfEQQjv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 12:39:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45406 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQQju (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 12:39:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id s11so3921367pfm.12;
        Fri, 17 May 2019 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+3+oWi1hLvJXUHSpDcp4CGSVtkvFd6CNLTfoiSB3WnA=;
        b=tHQsW2hHa8S8NsjuWim9VjYx0EE0w2Fa51p91v51nMqFIhJ9Uo52XDIc3ZK1MiVbWj
         pE7GIix+z5uZFfIi4CKFhdi1uqHy0n932OD3Sa98IDAFY4LEsFRxZ5onUhvrBYvjsX56
         fxvbt4W509L5mfNNHLD6WL+fsZrrTgKbl7idJ4hLAeuZeVf4ZuEksvu9R+fdnGnld2xX
         WR3UG0MQ+P3K1y/Ex9MDYw4+VuoN6i7Bzs+8CM1lD+H/9L3WldHyvzmCg0WStHFM2MNx
         nEAeSRDmj7ZbOucfwY+a9GohLplE/Pbip/W2dStr+0gE7ufirxJUIFuW0TWzLdTA/v1+
         x1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+3+oWi1hLvJXUHSpDcp4CGSVtkvFd6CNLTfoiSB3WnA=;
        b=Aopljoluu8VFtjQtk4lzNACAQSIq+Pl9euAK7sfYbgHg2n6dw/cMQo9029Egvb6S7V
         4LS7qzSfUmtiX++FnhzTxTspJvWTbVDeG+F5etH2c2wrQED1n4xDzO28TN8lWA3V2GJD
         sFBg35JiIE4rSaArEtsPZozPOV6I66PneTRBtxaVfnboPXOWxSXJw1l9eWgz95heEvYN
         HkL1tfxXkkPF4kgJANLYQ3rp10RqMNMiWnEj93PSbGmFywRaS1+VtB3lG5pUGWhQWWIg
         GhOhTUduupLmYRNklo7wFTpRIMJAUmhNO56i94ym/j8f1Pc8IbtsVn/VLAjZ2thFzIy3
         G/rQ==
X-Gm-Message-State: APjAAAV4mS+xXkRiETHLTh03yLAxDgNgNy1d4FK71ursq4OLeoOh3gk/
        sx6h2FklCEyHToexMfJd1XUbh/M7F9U=
X-Google-Smtp-Source: APXvYqy4Sxcq6orWONxLA0cA5KoPl3Czd8m8wJPQ+dZD8eqBnIVBOdM1ZvV9oywaxlA4e9oHSMYGhA==
X-Received: by 2002:aa7:8e59:: with SMTP id d25mr60769270pfr.24.1558111190095;
        Fri, 17 May 2019 09:39:50 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z7sm10513791pgh.81.2019.05.17.09.39.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:39:49 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
Date:   Fri, 17 May 2019 09:38:15 -0700
Message-Id: <20190517163818.5007-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517163818.5007-1-ajayg@nvidia.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
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
 drivers/i2c/busses/i2c-nvidia-gpu.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 1c8f708f212b..9d347583f8dc 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -175,6 +175,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 	 * The controller supports maximum 4 byte read due to known
 	 * limitation of sending STOP after every read.
 	 */
+	pm_runtime_get_sync(i2cd->dev);
 	for (i = 0; i < num; i++) {
 		if (msgs[i].flags & I2C_M_RD) {
 			/* program client address before starting read */
@@ -189,7 +190,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 			status = gpu_i2c_start(i2cd);
 			if (status < 0) {
 				if (i == 0)
-					return status;
+					goto exit;
 				goto stop;
 			}
 
@@ -206,13 +207,18 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 	}
 	status = gpu_i2c_stop(i2cd);
 	if (status < 0)
-		return status;
+		goto exit;
 
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return i;
 stop:
 	status2 = gpu_i2c_stop(i2cd);
 	if (status2 < 0)
 		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
+exit:
+	pm_runtime_mark_last_busy(i2cd->dev);
+	pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
 
@@ -332,6 +338,11 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto del_adapter;
 	}
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
 	return 0;
 
 del_adapter:
@@ -345,10 +356,16 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
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
@@ -357,7 +374,8 @@ static __maybe_unused int gpu_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, NULL, gpu_i2c_resume, NULL);
+static UNIVERSAL_DEV_PM_OPS(gpu_i2c_driver_pm, gpu_i2c_suspend, gpu_i2c_resume,
+			    NULL);
 
 static struct pci_driver gpu_i2c_driver = {
 	.name		= "nvidia-gpu",
-- 
2.17.1

