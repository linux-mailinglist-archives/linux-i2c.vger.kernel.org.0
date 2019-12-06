Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9528B114CF2
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 08:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfLFHyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Dec 2019 02:54:00 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41568 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfLFHyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Dec 2019 02:54:00 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so2376547plb.8;
        Thu, 05 Dec 2019 23:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snNOF+7AD33j18lB/I6AK+czBNstt4GlkeBdfRsweyU=;
        b=mUxqFrrkJcxJKQhpVO8x/3U7Pug8siGRMcLVYR0ahd6M5xuLylod2cZDu/wAXo515h
         /h/hc/xqnuO96wcqsE9J1GbyH+WHv9JN0nKJfkykDWfot3NYrNkg/eSOCbYmOcB11kxm
         92+WCkuLm2i2hoBcX1ALKYhQqldQN+R59G5JSUO3vWd1uj8D78J5zcvwxY0kKv3sqHEg
         gyvk9uuMZIAhxo/obH2WocE3wmQpBWEdQ2/rHhIoXimgpsSJFWrTPWLb+E0bMK08rAdZ
         ahGfbN3v+zQIDlo2ktLzz4SVi3nId2d2iCSDoJr15FGZj++0JlGt1ObYAOlG6MusHBX2
         rW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snNOF+7AD33j18lB/I6AK+czBNstt4GlkeBdfRsweyU=;
        b=CaGBsgj9kb6qjZjEDQOuOFsCPQiFwLJ1dT5T0i4GFdM/GnWThJLTLdMMQhyYoA39UT
         bBiT9EBLKeukChg+XGqUCsPY2M2mhWDxFHzcTtE4/c4RGXQzE4HzwupxNJAeiKwQ9VVn
         +Tsw8KpsERBvk97zrf9Wdk+/bNYPxtHJNs7T45ssbE9QfhgZwbb8koU+tpROw9JQIC4G
         +Dd77gltakr65HgUMrbd38lJGem1qOsGSE1bSjuzES2B3jCzAzc1C/9ftK0mWtZfN6s0
         Mq4xiqC5bIPWC3P1wLMJ0Tvx8GQErpQ2jFpVI6vh3htmAI+dL8whqtU9gfav4XX9FKCM
         bvEw==
X-Gm-Message-State: APjAAAWTSmcxy2dGuVgpDtU3mU2hw7vBoFIsgakusx3aUK6EzuW1P+v9
        Kh02VKvzQ+7vFwYZAiJfy28=
X-Google-Smtp-Source: APXvYqxHkR+7Llp+tRbYSlR2porllKhK1tgi+6QcyAgR588qnBX4LlKwZdHNPfBb2jhVVdzxuOjSYQ==
X-Received: by 2002:a17:902:7292:: with SMTP id d18mr13345926pll.2.1575618839651;
        Thu, 05 Dec 2019 23:53:59 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id b11sm14895828pfd.83.2019.12.05.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 23:53:59 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Jan Glauber <jglauber@cavium.com>,
        David Daney <david.daney@cavium.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] i2c: thunderx: Add missed pci_release_regions
Date:   Fri,  6 Dec 2019 15:53:49 +0800
Message-Id: <20191206075349.18297-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver forgets to call pci_release_regions() in probe failure
and remove.
Add the missed calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 19f8eec38717..31f7e254e99f 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -172,8 +172,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 		return ret;
 
 	i2c->twsi_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
-	if (!i2c->twsi_base)
-		return -EINVAL;
+	if (!i2c->twsi_base) {
+		ret = -EINVAL;
+		goto error_release_regions;
+	}
 
 	thunder_i2c_clock_enable(dev, i2c);
 	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
@@ -189,16 +191,16 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (ret < 0)
-		goto error;
+		goto error_disable_clock;
 
 	ret = devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, 0,
 			       DRV_NAME, i2c);
 	if (ret)
-		goto error;
+		goto error_disable_clock;
 
 	ret = octeon_i2c_init_lowlevel(i2c);
 	if (ret)
-		goto error;
+		goto error_disable_clock;
 
 	octeon_i2c_set_clock(i2c);
 
@@ -214,7 +216,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto error;
+		goto error_disable_clock;
 
 	dev_info(i2c->dev, "Probed. Set system clock to %u\n", i2c->sys_freq);
 
@@ -224,8 +226,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	return 0;
 
-error:
+error_disable_clock:
 	thunder_i2c_clock_disable(dev, i2c->clk);
+error_release_regions:
+	pci_release_regions(pdev);
 	return ret;
 }
 
@@ -236,6 +240,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pdev)
 	thunder_i2c_smbus_remove(i2c);
 	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
 	i2c_del_adapter(&i2c->adap);
+	pci_release_regions(pdev);
 }
 
 static const struct pci_device_id thunder_i2c_pci_id_table[] = {
-- 
2.24.0

