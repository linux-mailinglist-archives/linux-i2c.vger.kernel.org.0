Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABA6235211
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Aug 2020 14:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbgHAMYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Aug 2020 08:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbgHAMYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Aug 2020 08:24:41 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED97C061756;
        Sat,  1 Aug 2020 05:24:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o18so34005098eje.7;
        Sat, 01 Aug 2020 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UPMKmQkw5j2Bh/Rizmhe2Km1hW9ddbiX+OSz6ICfDL0=;
        b=lxoAru1R5QoARIY5Zj8IRtaCQjydTdcDfATP28B1jbs7FRLq31y9L/U2SR0zijpXrz
         bwjdGdwpBCY+OL8xy3+j8KOYTQ4iuc9pQ7t1ryeXThG/akFvuU5yTDz4bKRppe3UTI6S
         mVk1U19Sq1sZ5/BFGKbeETK7mgjUoVVrEja3FLOzJB39cha7M1+zv2654sn/ZVjvDKjF
         4pB4sPSLkEAGsjJ7lx/0i9X+FEoPJHHs30BL/XHuibQBDEMQsaMLSnn6J0s4EQ/nuUuK
         JbxLd+JXACbythRSYj8Fo862E0AsZbbp92RxcFiBidmKNrCL1IdKeKAKnnBLqOIqjvx8
         HRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UPMKmQkw5j2Bh/Rizmhe2Km1hW9ddbiX+OSz6ICfDL0=;
        b=N9qcFM7oNv9apn3wRRO/t6e2dz+XudRblBdBfkn8OV83RzEiIuZYbcr9NooGHzDpL1
         Av7uZZocpW6D8H9LURX/HjPJGSs7w8mCcrM4Y4a5l8lh7p5NXCd9XGX7ts58ubhvctGz
         USS+VR7CrjtUu/MpjBE1lrLaspSNhKL2V2DnFqBA35Jj3JEYbrDUdn57s2ZZAMVD4OAj
         1Qdwb3brbtbbquWmpx3KrTZs9sQ9JsXIdvL1263Xe9hyF+q6x0xc5oHFcdE8OV1AP/Ch
         OlXU7hZeS2qyyGq3yAOUXnBJdC2gDdAqXqImt0yyIhz6R3uNMJ+fH21epEAKuSUGLELk
         l6RQ==
X-Gm-Message-State: AOAM533TO+vaJVBbTmTJY1YE882WUJMd8ssZg1DFVnffFrBCELIhASnP
        Rn1KG3FzKQ1ApzmsemXWXLT75nW7/vN+tQ==
X-Google-Smtp-Source: ABdhPJyCxIUjb+mwT7ePMCbvB9sb/Y2iHevdo/OKsCbDfX1QEQPPASWDc4dVgABKN92MfYabQCbrqA==
X-Received: by 2002:a17:906:bce9:: with SMTP id op9mr8659385ejb.462.1596284679790;
        Sat, 01 Aug 2020 05:24:39 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
        by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 05:24:39 -0700 (PDT)
From:   "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To:     helgaas@kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
        bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [RFC PATCH 12/17] i2c: Drop uses of pci_read_config_*() return value
Date:   Sat,  1 Aug 2020 13:24:41 +0200
Message-Id: <20200801112446.149549-13-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/i2c/busses/i2c-ali15x3.c |  6 ++++--
 drivers/i2c/busses/i2c-elektor.c |  3 ++-
 drivers/i2c/busses/i2c-nforce2.c |  4 ++--
 drivers/i2c/busses/i2c-sis5595.c | 17 +++++++++++------
 drivers/i2c/busses/i2c-sis630.c  |  7 ++++---
 drivers/i2c/busses/i2c-viapro.c  | 11 ++++++-----
 6 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..fa103131746d 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -171,9 +171,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 								SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
-								SMBBA, &a))
+
+		pci_read_config_word(ALI15X3_dev, SMBBA, &a);
+		if (a == (u16)~0)
 			goto error;
+
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
 			/* make sure it works */
 			dev_err(&ALI15X3_dev->dev,
diff --git a/drivers/i2c/busses/i2c-elektor.c b/drivers/i2c/busses/i2c-elektor.c
index 140426db28df..82c8d6d55561 100644
--- a/drivers/i2c/busses/i2c-elektor.c
+++ b/drivers/i2c/busses/i2c-elektor.c
@@ -207,7 +207,8 @@ static int elektor_match(struct device *dev, unsigned int id)
 		if (cy693_dev) {
 			unsigned char config;
 			/* yeap, we've found cypress, let's check config */
-			if (!pci_read_config_byte(cy693_dev, 0x47, &config)) {
+			pci_read_config_byte(cy693_dev, 0x47, &config);
+			if (config != (u8)~0) {
 
 				dev_dbg(dev, "found cy82c693, config "
 					"register 0x47 = 0x%02x\n", config);
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 777278386f58..dc5d032c5a1d 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -327,8 +327,8 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		/* Older incarnations of the device used non-standard BARs */
 		u16 iobase;
 
-		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != PCIBIOS_SUCCESSFUL) {
+		pci_read_config_word(dev, alt_reg, &iobase);
+		if (iobase == (u16)~0) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..9b3fbde9cd9c 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -178,9 +178,11 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
 		    != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != PCIBIOS_SUCCESSFUL)
+
+		pci_read_config_word(SIS5595_dev, ACPI_BASE, &a);
+		if (a == (u16)~0)
 			goto error;
+
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
 			dev_err(&SIS5595_dev->dev, "force address failed - not supported?\n");
@@ -188,17 +190,20 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		}
 	}
 
-	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != PCIBIOS_SUCCESSFUL)
+	pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+	if (val == (u8)~0)
 		goto error;
+
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
 		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
 		    != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != PCIBIOS_SUCCESSFUL)
+
+		pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+		if (val == (u8)~0)
 			goto error;
+
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
 			dev_err(&SIS5595_dev->dev, "ACPI enable failed - not supported?\n");
diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index cfb8e04a2a83..73b17436f964 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -430,7 +430,8 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   Enable ACPI first , so we can accsess reg 74-75
 	   in acpi io space and read acpi base addr
 	*/
-	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
+	pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b);
+	if (b == (u8)~0) {
 		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
 		retval = -ENODEV;
 		goto exit;
@@ -444,8 +445,8 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	}
 
 	/* Determine the ACPI base address */
-	if (pci_read_config_word(sis630_dev,
-				 SIS630_ACPI_BASE_REG, &acpi_base)) {
+	pci_read_config_word(sis630_dev, SIS630_ACPI_BASE_REG, &acpi_base);
+	if (acpi_base == (u16)~0) {
 		dev_err(&sis630_dev->dev,
 			"Error: Can't determine ACPI base address\n");
 		retval = -ENODEV;
diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 4abc7771af06..14bfa5401845 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -321,12 +321,13 @@ static int vt596_probe(struct pci_dev *pdev,
 		goto found;
 	}
 
-	if ((pci_read_config_word(pdev, id->driver_data, &vt596_smba)) ||
-	    !(vt596_smba & 0x0001)) {
+	pci_read_config_word(pdev, id->driver_data, &vt596_smba);
+	if ((vt596_smba == (u16)~0) || !(vt596_smba & 0x0001)) {
 		/* try 2nd address and config reg. for 596 */
-		if (id->device == PCI_DEVICE_ID_VIA_82C596_3 &&
-		    !pci_read_config_word(pdev, SMBBA2, &vt596_smba) &&
-		    (vt596_smba & 0x0001)) {
+		pci_read_config_word(pdev, SMBBA2, &vt596_smba);
+		if ((id->device == PCI_DEVICE_ID_VIA_82C596_3) &&
+					(vt596_smba != (u16)~0) &&
+					(vt596_smba & 0x0001)) {
 			SMBHSTCFG = 0x84;
 		} else {
 			/* no matches at all */
-- 
2.18.4

