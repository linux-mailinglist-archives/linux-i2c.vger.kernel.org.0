Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAB64269E8
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbfEVSdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40577 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfEVSdk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id u17so1765175pfn.7;
        Wed, 22 May 2019 11:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YoK+jgaU1pOd7oo6QR907tculPG9SXxwXBTXzfSOuBU=;
        b=iVQsKyeUq9yL72EEQ5/lIWNKVEYgwxL46XN72hG1z90cliDdCSSaFbPRYr7i2UvzhV
         c2/sTQ672TaJNo2sEsO3aUsTVep/rFYYD/zVRDzfrmaXYTCqBVdrmq7o+CgmW482gI0P
         ItEcFRbWySaEkXHksrenbAh92Ylir10djOsh+YgaLwQ1Fo0NJS03yITVMeRyaEKL3x6B
         l1zFW3Bi6KNObiNjbAwPQDVrvtHbYOg7B4gaAY4f3If9MhILgxY6gmYqD1VtHztyiZCW
         WsyfHc2uBSgEy2ctPijhVZzKvArlg8KeXqokRHRfy3hKOBLsxHRtpFfsPPTcRdCqHnxP
         +n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YoK+jgaU1pOd7oo6QR907tculPG9SXxwXBTXzfSOuBU=;
        b=hO9zt7scV33R3on5Cev3UMwJTkz5YwExmGQaiHMOH/XXhgxXFvTfe2FeV7miJ2cMpX
         4KJNKU4NgdpD9Ff6YJ6r40Dwb0t9YpJZRszd+zw2uqJnP4LpXAwKIwcQLXL5S31IIqbz
         VvhFQmhzvrE3tGVXQNS18hmthB3BO28O0LV3BkYmQpwKBJ87UMXo1y3/v7atKqy4H22k
         zl5NmQZ4ErxUqm6wbLbgMqGUM2FqCWnguq0U1MAcY3dzWdhvJwNOuhSznUp1gmPVChGb
         Mv3e5VEKy5jc9FbAlbqbB1dYIBtaMzUtyYQlD/zjntG7OwCM8sVj5hk3n0gu/QieN2ca
         YobA==
X-Gm-Message-State: APjAAAUYVi31F06WiWFl7cbqeBcfRchDlH0/AfVq7fZ8iID8wCWE32AB
        Uu/PCVmwvb9/LYtoieYlIKc=
X-Google-Smtp-Source: APXvYqx/BBjjG2Eu83fRK1vK1iv/YqOnWWwzLpg801zivaQ+9i7m+QApV1UJub6N+MTqG4oSwpqA3Q==
X-Received: by 2002:a62:ed09:: with SMTP id u9mr98806615pfh.23.1558550019516;
        Wed, 22 May 2019 11:33:39 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:38 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Date:   Wed, 22 May 2019 11:31:39 -0700
Message-Id: <20190522183142.11061-3-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522183142.11061-1-ajayg@nvidia.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
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
Changes from v1->v2:
	- Added __maybe_unused in gpu_i2c_suspend to avoid
	warning when CONFIG_PM is disabled. 

 drivers/i2c/busses/i2c-nvidia-gpu.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 2d9561ec2320..28fee85135ac 100644
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
 
+static __maybe_unused int gpu_i2c_suspend(struct device *dev)
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

