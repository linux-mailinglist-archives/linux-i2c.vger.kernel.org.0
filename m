Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EC331AF83
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Feb 2021 07:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhBNGqR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Feb 2021 01:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhBNGqP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Feb 2021 01:46:15 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83ED3C061574;
        Sat, 13 Feb 2021 22:45:35 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id m2so2408978pgq.5;
        Sat, 13 Feb 2021 22:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kxieg2fYbmNp08HkGfhgbIDiBi4p+VeYpKohIERpFA8=;
        b=cK5/G+LROFF73yYorWUTE9ddeKSLK1MjoIvVAuAuaBOZfnEDGu4aJcUFFY3rkzTQb/
         qxES8JqFUjhEhH1n65QjaMBh5GUnLEztMLVwD6ITj3F0CbUfMKHRyvruMUZFiJVleq+C
         GFJrcokvWrlqgg0gM1MTh+KNe2glT8eNzhMS3wfpDBFfBC4VyZces0RtKQhzi+yHh4Aj
         BrJ9muaLabfKRpOhbJiL1MsBPh6oMJUuafST/sZw4nTHpuNnbBGet4o/iJ1eUN5v5jbZ
         KCv4VKpDesOLs6U75jse3fYp9yOKwBD8njcvOF33KHDw9QvyrWPEvTyzqy9lcFnStmtQ
         N7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kxieg2fYbmNp08HkGfhgbIDiBi4p+VeYpKohIERpFA8=;
        b=D4bMUS52n8XxGc3UktAnFsSQna1L9vS/zoFksMydlXYEPB4A57Y9bpNb6L5HzRb8cI
         j7Jxez5ATyM8x9rEVr6gz+xq+9ULDnUDkjDPwLqDiAiZb/wrXnEs7zGntvCpVeFHrofo
         Rg2VZUlJtB3JaTeqLuz/pE/06V0xXcPICNTXDDi3/dFoY60E4BIOzYMH7E4JpKF3BcgZ
         UOu3u1MJbk7mQdb0Vx4za1b9dBGpSd7iay+2YUxug4pOCZxZfZ4MjfCk4MDN/+/aMWsD
         HSM3pfgdnJg4A0Wk4gxfBZDbSwt9oIeBq/gNZnEukBb/DTl/lnBFpQ1xvzxJvruKd9Y0
         8aeg==
X-Gm-Message-State: AOAM532Bfo8NvyUYCXKhJa+/Yota2Mn90xX3tgMPmITf5KGr5L7v6Vgq
        Ls8aIoqFfYZk5F3VsJ6Pqe4=
X-Google-Smtp-Source: ABdhPJzCNsO51oIyLjKKKo5lArer/lVABNVDwsQaayiH336EQFIH4xLhymm37Cq/09KzzibntLDz9Q==
X-Received: by 2002:a65:6706:: with SMTP id u6mr10378754pgf.26.1613285134998;
        Sat, 13 Feb 2021 22:45:34 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id o11sm11736110pjo.43.2021.02.13.22.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 22:45:34 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH i2c-next] i2c: designware: Consolidate pci_free_irq_vectors to a single place
Date:   Sun, 14 Feb 2021 14:45:29 +0800
Message-Id: <20210214064529.481341-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Consolidate pci_free_irq_vectors to a single place using "goto free_irq"
for simplify the code.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..f0c82e91870a 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -234,10 +234,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
-		if (r) {
-			pci_free_irq_vectors(pdev);
-			return r;
-		}
+		if (r)
+			goto free_irq;
 	}
 
 	i2c_dw_adjust_bus_speed(dev);
@@ -246,10 +244,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		i2c_dw_acpi_configure(&pdev->dev);
 
 	r = i2c_dw_validate_speed(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
-		return r;
-	}
+	if (r)
+		goto free_irq;
 
 	i2c_dw_configure(dev);
 
@@ -269,10 +265,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
-		return r;
-	}
+	if (r)
+		goto free_irq;
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -280,6 +274,10 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	pm_runtime_allow(&pdev->dev);
 
 	return 0;
+
+free_irq:
+	pci_free_irq_vectors(pdev);
+	return r;
 }
 
 static void i2c_dw_pci_remove(struct pci_dev *pdev)
-- 
2.25.0

