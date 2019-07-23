Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34193716C0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 13:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfGWLLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 07:11:16 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38752 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfGWLLQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 07:11:16 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so18981808pfn.5;
        Tue, 23 Jul 2019 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLE+uvTLBw9PwWML02QRkRdkEaxbje4YIX9zUI0ZUnc=;
        b=s2yL5v4pdf2a5iHalxCn1uyDwXhBF7kNoqnlkEsHZJZWLe65EAkNcNsjCtLoQKjh9F
         /ng32Olv7Qsj6XMr5mjWZBDjR1rKaLweZe5zbNN5CAujGDw9ZcXdYyJNgA0OiQCqqX1c
         MwEQHzkpK3LT28WNE/BxUA1vPo4KiFz+XWZM2tVnabsC1BQCWWvbpN8eKR+ctaUUcZkV
         h+2ckclyhLDyHPijSs+T1gHpKURtzgpZGmkxebScKhGZiUejNxmRhhZ6J48ZwoN8MPC0
         RrONS2zUVy+lns5i7RighM+ng4LRD6jYuzGVXsAm0jbTUPYMNpWb14XjzqfsUNl4pWkm
         VkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLE+uvTLBw9PwWML02QRkRdkEaxbje4YIX9zUI0ZUnc=;
        b=R3wkUUuqIlDAHjzJEdUH3aQmJahV6Ev0el5/vw8P6EV0MZJ4OQlryxm9Itpu7VFLHj
         GSF1aUZNR6ejPJ93IDJXlN8Rd+eT8sAFOLCMDfP7vLyOoADl/+kLR7f16kXLEeB5PXlS
         LzD++MnS691MyYXfQvNUGQFoH2At9XiQRLJCXQZ61a94IsojVZ653/Lc7YjZ5744g/zo
         nxJ4YqXtmPA2Vmlj/ZbluuvyuZA3EbOL1oo/XSPFeV4pFUT6AkOBocjduNrOuCtKtGIV
         zgbJy2xxGkZ7/BNTU/otecJGwNl/oOOul2RYazqWgzgu4Wkz7LYGO91PRJG9Zq3qxdLO
         hRkg==
X-Gm-Message-State: APjAAAXNc6749sWS8AFCZJv5iu0Cd+Lccl6412JQxGUt2jhMDc9TmJxh
        dPjucoLDZHjh3MHjzVaQQLkTRovH61A=
X-Google-Smtp-Source: APXvYqynnH31LPno6ltEcHkrqbGBKnOd2p39f1ApYnrfRJpCTGj65ZrPPHx+h/IJvOdLzJu1SuNV3g==
X-Received: by 2002:a65:640d:: with SMTP id a13mr75434935pgv.256.1563880275480;
        Tue, 23 Jul 2019 04:11:15 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id l25sm52282284pff.143.2019.07.23.04.11.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 04:11:14 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] i2c: busses: Use dev_get_drvdata where possible
Date:   Tue, 23 Jul 2019 19:11:10 +0800
Message-Id: <20190723111110.11121-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 6 ++----
 drivers/i2c/busses/i2c-i801.c              | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 76810deb2de6..7d2e6959679c 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -173,8 +173,7 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 #ifdef CONFIG_PM
 static int i2c_dw_pci_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct dw_i2c_dev *i_dev = pci_get_drvdata(pdev);
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
 	i_dev->suspended = true;
 	i_dev->disable(i_dev);
@@ -184,8 +183,7 @@ static int i2c_dw_pci_suspend(struct device *dev)
 
 static int i2c_dw_pci_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct dw_i2c_dev *i_dev = pci_get_drvdata(pdev);
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 	int ret;
 
 	ret = i_dev->init(i_dev);
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f2956936c3f2..a6469978e735 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1912,8 +1912,7 @@ static int i801_suspend(struct device *dev)
 
 static int i801_resume(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct i801_priv *priv = pci_get_drvdata(pci_dev);
+	struct i801_priv *priv = dev_get_drvdata(dev);
 
 	i801_enable_host_notify(&priv->adapter);
 
-- 
2.20.1

