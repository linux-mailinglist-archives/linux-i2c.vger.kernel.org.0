Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA87D21D6EB
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 15:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgGMNXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 09:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729941AbgGMNW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 09:22:59 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FE8C061794;
        Mon, 13 Jul 2020 06:22:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id lx13so17142431ejb.4;
        Mon, 13 Jul 2020 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tczYCFdS3/cJq1nOdmzHC0tWFoQ+QsE/iL94vlXviGU=;
        b=R7fqTYEesFmsZR8cnid/s+sdOfqo+j8ibuFpW6vdh+YRJ4gFsdHihYvV7hMXEzRzNr
         rK3uboChKJI7yf3viTPCBaYKlheR1K2wc/wMdcX2HSqtpwuBxu0tebqqqOOIoKKpgx+5
         D1VNntZQRD0d3UDkQBYV52zN2qtwENMN+7O/Cj0Z8NSmPYtH8UubaeaauJJT/6ouVBrc
         Po7kfwVfE7DiPOIjQ8rutCzl81VQLaiFYGVNDSkVvGAXzwIBy0aS8DQ9g2JYwc0wl8iq
         hy/o1FYEnUYXOAKctA5QN4uPHAoi9IVixu+b57RxQJcYwxUljfR7YDA2zk5ew9UqaIUv
         J43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tczYCFdS3/cJq1nOdmzHC0tWFoQ+QsE/iL94vlXviGU=;
        b=GZZeEIUgL7clR1Gpq7RL0h+xP5EYqjF3zDndw8WHyTxKEtP/FjLpkikVR15NGCjUE/
         MVlwjZJ6U65uoh576mKPsKN6hI3zu4MWBxHf/z/f5cVbh5MOGNQY0wF7LStclUemWtZn
         fv8NOI00wqwU7q87bMQieGm8g/Zzr2tWruifbivsWTxim6/VHeJrOpp/jccUr4JlO2m0
         VuHY73FIY4rXtCiKuR7UMOypizCUhVTUsL2L852ghvk4i542xovtzXpT5HohWlxjmTgX
         WWJH32nkcr1wIEB0NS5jG1XT+tfPVjZeWN2pLu3gZZnMmOQlB5eWX9fsx4NBykPn4gy9
         HBfw==
X-Gm-Message-State: AOAM531lcjTvnfPb/t4C+/YE2fmqThdrmXdkaQhWJNS3ZNmTwyIxI9Dy
        BqLp+5RB5f1RY9lnmbk8EEg=
X-Google-Smtp-Source: ABdhPJyi7kdKnWKidhuD/7S0rUnuO695mifL4kwQQRb/qclwiEU741xbCG8OqefW8KfutA+tJMt2Xg==
X-Received: by 2002:a17:906:ef2:: with SMTP id x18mr71342560eji.547.1594646578134;
        Mon, 13 Jul 2020 06:22:58 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
        by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:22:57 -0700 (PDT)
From:   "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To:     helgaas@kernel.org, Jean Delvare <jdelvare@suse.com>
Cc:     "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
        bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-pci@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [RFC PATCH 15/35] i2c/busses: Tidy Success/Failure checks
Date:   Mon, 13 Jul 2020 14:22:27 +0200
Message-Id: <20200713122247.10985-16-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 15/35

 drivers/i2c/busses/i2c-ali15x3.c |  5 ++---
 drivers/i2c/busses/i2c-nforce2.c |  3 +--
 drivers/i2c/busses/i2c-sis5595.c | 15 +++++----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 359ee3e0864a..c9e779cc184e 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -167,11 +167,10 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	if(force_addr) {
 		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
 			ali15x3_smba);
-		if (0 != pci_write_config_word(ALI15X3_dev,
-								SMBBA,
+		if (pci_write_config_word(ALI15X3_dev, SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (0 != pci_read_config_word(ALI15X3_dev,
+		if (pci_read_config_word(ALI15X3_dev,
 								SMBBA, &a))
 			goto error;
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 385f4f446f36..54d2985b7aaf 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -327,8 +327,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		/* Older incarnations of the device used non-standard BARs */
 		u16 iobase;
 
-		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != 0) {
+		if (pci_read_config_word(dev, alt_reg, &iobase)) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index fbe3ee31eae3..b016f48519d3 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -175,11 +175,9 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 
 	if (force_addr) {
 		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
-		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
-		    != 0)
+		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base))
 			goto error;
-		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != 0)
+		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a))
 			goto error;
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
@@ -188,16 +186,13 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		}
 	}
 
-	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != 0)
+	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
 		goto error;
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
-		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
-		    != 0)
+		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80))
 			goto error;
-		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != 0)
+		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
 			goto error;
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
-- 
2.18.2

