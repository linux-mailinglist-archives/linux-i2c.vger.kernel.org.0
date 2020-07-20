Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3A6226186
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 16:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgGTODM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 10:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTODM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 10:03:12 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67118C061794;
        Mon, 20 Jul 2020 07:03:12 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so10150712pjt.0;
        Mon, 20 Jul 2020 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvjcerpoGbzCqh4PiBTodpMKQRC6COJGb/XldQjhF8w=;
        b=vdp2OlVtYtgwwNvWfxMZw0hNeAtgQ8Ohk4zCvTDYnF9fvZR8A/bM5eaUWE5WClGGMB
         Z9r8SVjpQCXZ05FMcQ6rDEAKzHo4qx/Q6dCuOX9U/EJCXyOoavZEC50SJkoJjGWUyk0A
         IUQh/xCh5zY616an3Ng6ObsbhT52rw7DPnzZi2kMVhsYzbPEif0qniIB6JKEQPNrD6O+
         XbU46obyQLZ3apRH0ByW4x8oRrJ0A/8yIXONFA8Sup7PNu2VTKtVhz+wHTDZeKUFmTpB
         hrb5b56yPlcOvEoQTM5DH/dhTbx39GNThWzVoi8v9TBAc7r4CpUYCA18trSRC/tiQqIk
         vdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvjcerpoGbzCqh4PiBTodpMKQRC6COJGb/XldQjhF8w=;
        b=SMZHOW3ODRPMYjwHkrmG9JdlQ4zmYobROeAOmdjwjDF7HE1iGYtR/tAuGM54STStNV
         adq9yGBwWA5Ebo0JcE3Yv0D32sIOUcZvoLlItd+5vr17R6JvKR5ePJlfMEJsc42kiQ6t
         mClhNyM/e7jzFoXSnsfmdt63GH1Fnl65zIG5EqlMTKKwtBNedGWsRyE866kaK4o0mtP/
         CYVwngA2qYzBTNY0K/Al83M1TDdmoXPfFXIEwo5AMfCkRsiU8yyfVU868oHayINwgMOm
         ETjPMMLr8HEDQ2KUWb34nE7xhlSqIDDh/wThm4QxzC0Yd3ZCavEOB7FB0MiIOGJRQii2
         F/+w==
X-Gm-Message-State: AOAM533cyW1a614xTtT9bXRwBgcE7FAbgxC9s1roLZcRE4rtogO7FZO5
        VLhLlwFh7VHuJxZXPDWpoj4=
X-Google-Smtp-Source: ABdhPJxmJIiCYPj771LA4jyig7s/69E5m+L8g5e6jC85VSMnNWB9HAh1laUPagA6BvOlZiLnm2FXVQ==
X-Received: by 2002:a17:90a:1a13:: with SMTP id 19mr21689484pjk.167.1595253791829;
        Mon, 20 Jul 2020 07:03:11 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id w64sm15773459pgd.67.2020.07.20.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 07:03:10 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1] i2c: eg20t: use generic power management
Date:   Mon, 20 Jul 2020 19:30:32 +0530
Message-Id: <20200720140031.511830-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_enable_wake() and pci_set_power_state() to do required operations. In
generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
"struct pci_dev*" variable and drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 73f139690e4e..c0ddc4cc2ce7 100644
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
 
@@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
 		ioread32(p + PCH_I2CESRSTA));
 
-	ret = pci_save_state(pdev);
-
-	if (ret) {
-		pch_pci_err(pdev, "pci_save_state\n");
-		return ret;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_disable(dev);
 
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
+	struct adapter_info *adap_info = dev_get_drvdata(dev);
 
-	if (pci_enable_device(pdev) < 0) {
-		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
-		return -EIO;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
+	device_wakeup_disable(dev);
 
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
@@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 
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

