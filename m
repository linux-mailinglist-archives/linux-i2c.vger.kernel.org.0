Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEDD390A53
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhEYUJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhEYUJD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 16:09:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D532AC061756
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:32 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so4382811wmk.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=4wCoa6yLxoS2QJzfZmEKjMhThTbX5LovNMXKOdEWsIQ=;
        b=ge5evWpnRKBvGpSsko7NgXDrkgNQ7yYCwaiTWU28pOI0XxvKDFZU1/gjPnhKggK74b
         dmLb4TWIdzF1cguf9YDPRNwDliVvc86gWkKCc8EX+VwKDZSmrdI5BoarCS9DHJ1xP7do
         LX9J2IKnysZ1h1rPWIeYZAgAPGJZKQC4iyKtq6GZDEkpbA8hanHDp9Gc2Z93avHimK1J
         FBZ0HellNZ3/osGoV3ngVR/UItiofM6ulA5e9vGnxq7x5+tDww5gI3RnmK6t4elwmkcp
         YLJOS4kx6ov8HuBtTD6tOx5lFqCRb2GyLYa08p9Oa123JNN6LcSRdJBNWNCk16qKnaiJ
         nwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=4wCoa6yLxoS2QJzfZmEKjMhThTbX5LovNMXKOdEWsIQ=;
        b=O6ALs4x4zn2gePPrMMmcS8jwTn5jf6zhq30BvU2ZTTYIzqVyh9sw6hX2NFlD4T9skb
         eK6MfiJ43P2yb2UwWBM/fAJ+oFwqaeRw1BnJFqny/rPyOWejPVFTPdO9vi9LZ2Slldec
         atnIqpU1a+q2c82ipBaJWhBfL1leKC1kNCZ1mwWIot7DU/BEmh1knoR7QfBHxdteqtlR
         CXTc9z4X79QA9loLTPmGV+ONawg4f2HzwSN48EityRYu//uVN6Zwr1Hu/7rSVLaloWJb
         rwhQgUnIBZnMkyvhIelLDLFuoEX1jotvojWuIyZpjDnZg/Y5VNkO0WTEZF/Hm57VV3kt
         oBzw==
X-Gm-Message-State: AOAM530G98SMph2ijHXDIpnC96/mNJnCYBrBjdqVSLpVqjkwIoktkSAU
        K2Q8D0jAhLw04SJyn3Fh7B07QuBEfKA=
X-Google-Smtp-Source: ABdhPJwFePLdaCCkORsED4GlAbx+Sr2yNwAoLFmlqNj4ULOCN4bJuqrXKoLjrajzwAp18qBc9l3akg==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr25233555wmf.140.1621973248924;
        Tue, 25 May 2021 13:07:28 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:a053:ef5d:7e3e:e120? (p200300ea8f384600a053ef5d7e3ee120.dip0.t-ipconnect.de. [2003:ea:8f38:4600:a053:ef5d:7e3e:e120])
        by smtp.googlemail.com with ESMTPSA id v3sm17303127wrr.19.2021.05.25.13.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 13:07:28 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Use driver name constant instead of function
 dev_driver_string
Message-ID: <089c47ad-1519-947e-ac31-290da37159d7@gmail.com>
Date:   Tue, 25 May 2021 22:04:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are the driver, so we can use the driver name directly instead of
retrieving it by calling dev_driver_string().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 047f73f1a..5a7ce2658 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -88,6 +88,8 @@
  * See the file Documentation/i2c/busses/i2c-i801.rst for details.
  */
 
+#define DRV_NAME	"i801_smbus"
+
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -1813,8 +1815,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (i801_acpi_probe(priv))
 		return -ENODEV;
 
-	err = pcim_iomap_regions(dev, 1 << SMBBAR,
-				 dev_driver_string(&dev->dev));
+	err = pcim_iomap_regions(dev, 1 << SMBBAR, DRV_NAME);
 	if (err) {
 		dev_err(&dev->dev,
 			"Failed to request SMBus region 0x%lx-0x%Lx\n",
@@ -1872,8 +1873,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		init_completion(&priv->done);
 
 		err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
-				       IRQF_SHARED,
-				       dev_driver_string(&dev->dev), priv);
+				       IRQF_SHARED, DRV_NAME, priv);
 		if (err) {
 			dev_err(&dev->dev, "Failed to allocate irq %d: %d\n",
 				dev->irq, err);
@@ -1963,7 +1963,7 @@ static int i801_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
 
 static struct pci_driver i801_driver = {
-	.name		= "i801_smbus",
+	.name		= DRV_NAME,
 	.id_table	= i801_ids,
 	.probe		= i801_probe,
 	.remove		= i801_remove,
-- 
2.31.1

