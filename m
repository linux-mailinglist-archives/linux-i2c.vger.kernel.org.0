Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3181431B0D0
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Feb 2021 15:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhBNOiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Feb 2021 09:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhBNOiV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Feb 2021 09:38:21 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5856FC061756;
        Sun, 14 Feb 2021 06:37:41 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id k13so2613213pfh.13;
        Sun, 14 Feb 2021 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtbVHE2/VZ4Kj1HFV2Xs1zJxAnBnHtTZ1xmCVyYj9tw=;
        b=sUzWjH0cAlvOg+ziQxfWN7ktsgv5mQwSNNX+PORiTRAd0ova4fLVqsGCanV8W1ygTt
         LFDXPHiK/rHBsJXPuixSK1nbM+6qiCvaX5KadywL1nttRw51Eop3tBYe8KVa4Xyc9Bxm
         TUguYX8ufffdTO5RpPOBVRs3J6cmZ2pydeeqQE+3mdr+fLEVoK5L9wIjjWo//jG42+01
         I4leNVW59ya/U/UqdwT87vCT5TlJdff3t/uiGB0+xaZG1nridclxnZFgaZP3RntBEY6w
         JlgPFF9RgWxS+GfmyYguCt9yM5jBG8SwR5PJzIoX1lYP6pPJE4JYDumCNTGTr07hM+u1
         5MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtbVHE2/VZ4Kj1HFV2Xs1zJxAnBnHtTZ1xmCVyYj9tw=;
        b=go9vxmoYpm16++DNGkWKfdyVsSQhappfpvZVFoP7Pg+gQT1pvg+uB2yV7Cnm39R0ni
         sCk7ooV9BdX90QJ0u3X/Bd3eyIGkFYCiocEYYPmRPqGjQ6JtYlSbthTs6h9obbSyQ4xr
         Gza//HmNsjk6teUR5mFZ41yxMDE6cKUhlOnpbA7NiVwMhZNAAtHCJ/hzlc2d7P/zHDGb
         W7secXDamwyuHhfDREhDUGaiBy0Pt7Zii5Q3OzYaRxyonJ0E9x2FPAIIQsA/MzSQZJ1+
         nYGeGNMB6YdFfleXDeWAhkn5RCvCIt4xvMK4+E5t37k8oMs2wIqjZaqBOAsV0uZzQ9Qf
         51uA==
X-Gm-Message-State: AOAM532KdLfTtrbaC7CaSjYVf+l8KVzfSwKHQ9xANukJYMhZf8worFg1
        2+guyb2tjUJ5JH70y+jnzt0=
X-Google-Smtp-Source: ABdhPJx1E/4PPBAFNf9ozYyjJMOQ4aGIbMQ1Th8IR4h5QCl1aZVQz+Cki8ln1ffxE7rTNF2MCkaoEA==
X-Received: by 2002:a62:e709:0:b029:1dd:3e55:3ce5 with SMTP id s9-20020a62e7090000b02901dd3e553ce5mr11406217pfh.24.1613313460916;
        Sun, 14 Feb 2021 06:37:40 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id np7sm12771573pjb.10.2021.02.14.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 06:37:40 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     rric@kernel.org, wsa+renesas@sang-engineering.com,
        jan.glauber@gmail.com, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH] i2c: thunderx: Fix an issue about missing call to 'pci_free_irq_vectors()'
Date:   Sun, 14 Feb 2021 22:37:34 +0800
Message-Id: <20210214143734.591789-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Call to 'pci_free_irq_vectors()' are missing both in the error handling
path of the probe function, and in the remove function. So add them.

Fixes: 4c21541d8da17fb ("i2c: thunderx: Replace pci_enable_msix()")
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 12c90aa0900e..6a338be4d4b7 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -199,11 +199,11 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	ret = devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, 0,
 			       DRV_NAME, i2c);
 	if (ret)
-		goto error;
+		goto error_free_irq;
 
 	ret = octeon_i2c_init_lowlevel(i2c);
 	if (ret)
-		goto error;
+		goto error_free_irq;
 
 	octeon_i2c_set_clock(i2c);
 
@@ -219,7 +219,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto error;
+		goto error_free_irq;
 
 	dev_info(i2c->dev, "Probed. Set system clock to %u\n", i2c->sys_freq);
 
@@ -229,6 +229,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	return 0;
 
+error_free_irq:
+	pci_free_irq_vectors(pdev);
 error:
 	thunder_i2c_clock_disable(dev, i2c->clk);
 	return ret;
@@ -238,6 +240,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pdev)
 {
 	struct octeon_i2c *i2c = pci_get_drvdata(pdev);
 
+	pci_free_irq_vectors(pdev);
 	thunder_i2c_smbus_remove(i2c);
 	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
 	i2c_del_adapter(&i2c->adap);
-- 
2.25.0

