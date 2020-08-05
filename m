Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E7923D039
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 21:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbgHETpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 15:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgHETpG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 15:45:06 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DFBC0617A0;
        Wed,  5 Aug 2020 12:38:58 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d188so17362619pfd.2;
        Wed, 05 Aug 2020 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dBMgOJj+hD0qde6PizICeeruU0EhS183W5s3SUBAwf4=;
        b=BikImbzKWtXH4hWkL6UbutgkjuCU5o+a4HGlxXS/Eln4FqKtJYUgtDLL6YIHyGSCP8
         CBxLixsGpoTPYMz8Cf0XrtLRu6+Rti11TQrJqZgpiaDsCXwpj9MbpPYhYVAgiB8/QkVf
         DgP19nZF+fOvIDznv++8Xl99J8bYUKHo7N3maZr2NZCnhAlYkpBEiIHaVBCaTr/ZGEQa
         /PRc6prnGBWZ5Z9yJ2ZWDsbUTzud+kzUWqtFPXn5UCcE9iIKmaAOZDPlsP9hiT0UlwWO
         yue8KChKcJa0oHV2iHf01F95VU1hdKwjiPl+mM19h4Pfh/IsJRjEbP4Rcq5XJjIgQYBl
         La/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dBMgOJj+hD0qde6PizICeeruU0EhS183W5s3SUBAwf4=;
        b=AjS7uiD+yX2s/voksWSj+K2iIvDQJlC+iszbqRAMYVx1DBhbMMSOkfiysylXVEfJf8
         vhK/dxVRJbmOTMGkLkchx48xgHYu66yoE19ggZiBcQ7T3EWhJeJISazdVeh/AQtvt+si
         yoeOZl5jonBRvZYdxzScvl+c7OL/6ZK5iI4FTzmGT/IAg/1h7F+aDwztEBn2vcBJOwQ6
         V1NjykpPgR/cqcgrvQbPugVTKi6AbMG7hHJp6WHu65Cks4fWD1R5/+obxyP30LOr7dfN
         TAPTmnnKLjX1bhZUhAnfGzUiyxbx0gaKCkIAd7yvPNGuU04Fwhi4x7Pi61FFbmgJH1en
         ntGQ==
X-Gm-Message-State: AOAM530u1eRCBHttRk6+aIaNCQPYJn6mJrbT6a9e3TYMdhiCd680ufoo
        asHYA/COmikj+DlmMZZaYmE=
X-Google-Smtp-Source: ABdhPJwFtNAeKIW4wjHsuCKjx78tIa6bbsqpyKdJl7Wd91LaOdgUTgAq66b+bFaz44muXZNU/9fsXg==
X-Received: by 2002:a63:5b55:: with SMTP id l21mr4506542pgm.348.1596656338172;
        Wed, 05 Aug 2020 12:38:58 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id f20sm4901764pfk.36.2020.08.05.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:38:57 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/2] i2c: eg20t: use generic power management
Date:   Thu,  6 Aug 2020 01:06:16 +0530
Message-Id: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805193616.384313-1-vaibhavgupta40@gmail.com>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index eb41de22d461..843b31a0f752 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
 	kfree(adap_info);
 }
 
-#ifdef CONFIG_PM
-static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_i2c_suspend(struct device *dev)
 {
-	int ret;
 	int i;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct adapter_info *adap_info = pci_get_drvdata(pdev);
 	void __iomem *p = adap_info->pch_data[0].pch_base_address;
 
@@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
 		ioread32(p + PCH_I2CESRSTA));
 
-	ret = pci_save_state(pdev);
-
-	if (ret) {
-		pch_pci_err(pdev, "pci_save_state\n");
-		return ret;
-	}
-
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int pch_i2c_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_i2c_resume(struct device *dev)
 {
 	int i;
-	struct adapter_info *adap_info = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	if (pci_enable_device(pdev) < 0) {
-		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
-		return -EIO;
-	}
+	struct adapter_info *adap_info = dev_get_drvdata(dev);
 
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
@@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define pch_i2c_suspend NULL
-#define pch_i2c_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
 
 static struct pci_driver pch_pcidriver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pch_pcidev_id,
 	.probe = pch_i2c_probe,
 	.remove = pch_i2c_remove,
-	.suspend = pch_i2c_suspend,
-	.resume = pch_i2c_resume
+	.driver.pm = &pch_i2c_pm_ops,
 };
 
 module_pci_driver(pch_pcidriver);
-- 
2.27.0

