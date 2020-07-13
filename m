Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C3B21D6F5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 15:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgGMNYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 09:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729937AbgGMNW6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 09:22:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A94C061755;
        Mon, 13 Jul 2020 06:22:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bm28so11680279edb.2;
        Mon, 13 Jul 2020 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SZWhEQhdAshrEKOg1OdeBySM/iJl7P0u/Wtd+OUZgXk=;
        b=fRAKL+ar0mP3quTtvn/VpmyE8ofupZbeB8r47gxq5b/gxvL3G1VqC9LYDGni8Tlx5I
         0qsw3fcJ+cb5IZKC4h24+hvVIbdMcms3VyUgaBvoAaECnfjkgmnLIHQHjTIBMriAiTlY
         3akPM+5JCmyP+/gaM3gU5ANiOKopU6jAzN/DU2LtxeAXgN49CQ3umiX8APk8D3hUIrLx
         kVYrJttsCfxDIsqUozcJwuNsipxmBfwFIKackKL08Am03KDZnQQw2R9aM+I9ePyvdhoq
         zgwreYm3Ofx6rpfGKucbI3B/AWhLiaTD9EPIf9zTJkR/J+jjAzees1l65pkjG6gNZ+u5
         fwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SZWhEQhdAshrEKOg1OdeBySM/iJl7P0u/Wtd+OUZgXk=;
        b=ESvmr0z7PcnfAcxZI3wVhP6EEtNV9k+kH9juwztWVrJEmxK4Ci+X4rGPyLvJKDSXM3
         VXLA8ocSE3uX+pTD918cQWGEoaD1ve/wic/aRhcHPIG5zzElbbkZmmzIU916ldRaC1av
         uWqAKBCxI1vYAKXFP5yqykqQAl8lmji/fU7i5kXhbJMBa8qz96vqR8hulYCtZgPNvnhv
         HJztgWMZ6reLmQXl/0MG+JoHFH9o9YDCvwgHaeK31pbRo9Tq6w09FTDp+lg3dy/hIj3c
         Yxez5meVqFA0Ohd5cA3waFF6WSwO28Qez432PZFkN9lcdAY/LODDu4gmjnrJnM/fxv1W
         wWoQ==
X-Gm-Message-State: AOAM53057kAtGRxaGO/+Bqw5OwVb6Vk0MupSd/g6FDQlALpib12gbC7w
        Jt1SqgzKggj5QFEJjRfoerY=
X-Google-Smtp-Source: ABdhPJxjSkM06k8pRCUPzMRpx17h5RlpCmZfRWCd5RkykmrcYELKqDznF5j3XGqTDyeV2adZguE47A==
X-Received: by 2002:aa7:c341:: with SMTP id j1mr95061530edr.197.1594646576666;
        Mon, 13 Jul 2020 06:22:56 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
        by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:22:55 -0700 (PDT)
From:   "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To:     helgaas@kernel.org, Jean Delvare <jdelvare@suse.com>
Cc:     "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
        bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-pci@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [RFC PATCH 14/35] i2c/busses: Change PCIBIOS_SUCCESSFUL to 0
Date:   Mon, 13 Jul 2020 14:22:26 +0200
Message-Id: <20200713122247.10985-15-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/i2c/busses/i2c-ali15x3.c |  4 ++--
 drivers/i2c/busses/i2c-nforce2.c |  2 +-
 drivers/i2c/busses/i2c-sis5595.c | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..359ee3e0864a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -167,11 +167,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	if(force_addr) {
 		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
 			ali15x3_smba);
-		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
+		if (0 != pci_write_config_word(ALI15X3_dev,
 								SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
+		if (0 != pci_read_config_word(ALI15X3_dev,
 								SMBBA, &a))
 			goto error;
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 777278386f58..385f4f446f36 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -328,7 +328,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		u16 iobase;
 
 		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != PCIBIOS_SUCCESSFUL) {
+		    != 0) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..fbe3ee31eae3 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -176,10 +176,10 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 	if (force_addr) {
 		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
 		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
@@ -189,15 +189,15 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 	}
 
 	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != PCIBIOS_SUCCESSFUL)
+	    != 0)
 		goto error;
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
 		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
-- 
2.18.2

