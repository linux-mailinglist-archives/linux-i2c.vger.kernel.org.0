Return-Path: <linux-i2c+bounces-9524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22252A400DB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23263AC523
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 20:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F094253359;
	Fri, 21 Feb 2025 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMqQX8PZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4292253358
	for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169655; cv=none; b=Z9Khg2s/Omcm42fIKPZ1OjHl4I6onntgE3maDbuM5ntsmUxSgOjOWBda/udy2sqO/E6xndYCQjzXjnNdsiHmwL1iyazsBgsaMFhijwIr9W2w63qRzfPzILFhGnsBax99uHMHzMYj3vxGgvvn/LWMXaOsicozxiyCWkgYDskiM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169655; c=relaxed/simple;
	bh=lE8aq37umKGqhb9JmHmX29cHorV8HFgLGy3gII9ph6s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nQoRUqKPHCxe3k62KW43Db04oEr5zjSKbmR1Sk1fsE3du04F/22asCHrvcK1xRXNkkkjWJFSuDVxabeBPR+UTDFL6UVf0+hNaZLZ/bBnk1exNg34wELCLKSPqBHDPyrk3uKf9u+yhpiKnDJsXx0s252TkUCTnNa1Aldo4HWGx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMqQX8PZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f378498b0so2065791f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 12:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169652; x=1740774452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nPiSdEGkN/ytaozIXXfkd5rzMlQ8bKeVZ7aZRBN6ekU=;
        b=LMqQX8PZNM3CcDfFFNxrZj5EnTDIoC9EJzfkk/n3YiquSeBeou3+gMzfnsEIIevWRJ
         7cx64NCFfn77QNyDZ+ApfXf6Z2Bi3ZnBuiFLQSSt6U9GBzGVZscfs1nMcLueOPzMlnDc
         WWhEXzHxYIpZbb/xz1w0obsHW2mRbRPt6cemeQ5Sf0vVoihcC7UU1EmqO1nk9AR8BUUM
         2dy6xCXlE/6M93Y6uImmzBRSx+QdQqhS6/9AsHMt5hwE4/BLHVXtDkXeV0/VMXtBruxF
         oH5ccX+4OJJelu7qh7A68IS2eaqXboZbso8Z0l352FsP4pvjH0lC5J+fRZKMIcNmauhH
         gEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169652; x=1740774452;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPiSdEGkN/ytaozIXXfkd5rzMlQ8bKeVZ7aZRBN6ekU=;
        b=Jja2+lih1n3PkuiErymIAilhU7jDnIyv6cZF5ucb7dYo/VaBGnpzmod/CMXhl3DiYw
         gEFhMTcxW8eYxt6PzNUnfFEUjhi0WziNvWMZOsTghGUPpTY7HOD807bp0cGuc0Ij7qBo
         zyur28kqdqvorlfVpqVTI2JtT0F+0rQWeoLhBHMqcBOjBinSqURr+a2HMRBhMPMM+Xnq
         Q5GKV39PW5nRyrbl/iJFpJB3PBZuRjCsOY2BVaDDm+Ck09XWcy18aSCUZr8/ZlHkdGRS
         UGu0KdgbPpoQWf6TDFIX/zdyknXuFXnRC00UGkWCi3a/AR+wubPXVJ0/TQ8q5ZvVBixn
         TDjA==
X-Gm-Message-State: AOJu0YwfeB4qTUeNiIjmB4oG/i3/eJ3ALpIR0z6FxbJGCBZ4/wCuRlxi
	+QLxvE7NyE6+xAEXZ6DcuAMXZEos7E1SgUhLamkoHinr4C4yhvE5dqu6jpf1
X-Gm-Gg: ASbGncs7/ZwyisguMdciND9FIBND1gOskHLvzQtMBuSlJBS7kA8s26z+vd17Tx4EBj5
	PvdL8h4SzAiacMrnmnNvN8bJgMVuxsRpOFVRvkHBEBLufIwpwh4SM4s/IqQ4W+245XtO4Vg8aKw
	nnmkJe4WKQVvR38n0judGoRkV7pTCWWqbjZj1vyQfdy5IqJncwuyaWaM0pKbzZJY9K2CJ2pmo+o
	4RYMAzKZFwSth70ckTC/0BaVXZVY5wS8PgMCQ9ZmV0ood8czFxKdLDMl3o7qDGLm7d26GdA1lnd
	8A9qALsc4wSwj37rQPeRbeV6Q2mXGx3j1G9ZWZQB6StVfWONqk5Jsme2ZlYShr8BVOPCfwdh2mF
	zzttWkNmQAfW5Mj1WZjTm496X3U9EggR5t9Tp9EZEpgX1Zodkuh4bpvUIbbR9SGxS5g8emr+5R/
	XA0ITLrW02y5GF
X-Google-Smtp-Source: AGHT+IG100eKf4hq1WYiZ2CXeeVBeUNnJTZ4ooxsC2ce1tw+eWQSjqV50eoNUPTme6Bh0DXve9afrw==
X-Received: by 2002:a5d:64ad:0:b0:38f:2766:759f with SMTP id ffacd0b85a97d-38f6f09bfdbmr4383177f8f.41.1740169652104;
        Fri, 21 Feb 2025 12:27:32 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:9dc2:647a:dfc:6311? (dynamic-2a02-3100-b29e-0900-9dc2-647a-0dfc-6311.310.pool.telefonica.de. [2a02:3100:b29e:900:9dc2:647a:dfc:6311])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f258dd5acsm24618296f8f.35.2025.02.21.12.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:27:31 -0800 (PST)
Message-ID: <6676001a-a584-46e2-a98e-17163d82c218@gmail.com>
Date: Fri, 21 Feb 2025 21:28:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] i2c: i801: Cosmetic improvements
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

- Use pci_err et al instead of dev_err to simplify the code
- use format %pr to print resource

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 49 ++++++++++++++---------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 171d29d27..a3d79a5ab 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -412,16 +412,14 @@ static int i801_check_post(struct i801_priv *priv, int status)
 
 		/* Check if it worked */
 		status = inb_p(SMBHSTSTS(priv));
-		if ((status & SMBHSTSTS_HOST_BUSY) ||
-		    !(status & SMBHSTSTS_FAILED))
-			dev_dbg(&priv->pci_dev->dev,
-				"Failed terminating the transaction\n");
+		if ((status & SMBHSTSTS_HOST_BUSY) || !(status & SMBHSTSTS_FAILED))
+			pci_dbg(priv->pci_dev, "Failed terminating the transaction\n");
 		return -ETIMEDOUT;
 	}
 
 	if (status & SMBHSTSTS_FAILED) {
 		result = -EIO;
-		dev_err(&priv->pci_dev->dev, "Transaction failed\n");
+		pci_err(priv->pci_dev, "Transaction failed\n");
 	}
 	if (status & SMBHSTSTS_DEV_ERR) {
 		/*
@@ -449,7 +447,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	}
 	if (status & SMBHSTSTS_BUS_ERR) {
 		result = -EAGAIN;
-		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
+		pci_dbg(priv->pci_dev, "Lost arbitration\n");
 	}
 
 	return result;
@@ -578,8 +576,7 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		if (priv->count < priv->len)
 			priv->data[priv->count++] = inb(SMBBLKDAT(priv));
 		else
-			dev_dbg(&priv->pci_dev->dev,
-				"Discarding extra byte on block read\n");
+			pci_dbg(priv->pci_dev, "Discarding extra byte on block read\n");
 
 		/* Set LAST_BYTE for last byte of read transaction */
 		if (priv->count == priv->len - 1)
@@ -1438,7 +1435,7 @@ static void i801_add_tco(struct i801_priv *priv)
 		priv->tco_pdev = i801_add_tco_spt(pci_dev, tco_res);
 
 	if (IS_ERR(priv->tco_pdev))
-		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
+		pci_warn(pci_dev, "failed to create iTCO device\n");
 }
 
 #ifdef CONFIG_ACPI
@@ -1467,8 +1464,8 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
 		priv->acpi_reserved = true;
 
-		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
-		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
+		pci_warn(pdev, "BIOS is accessing SMBus registers\n");
+		pci_warn(pdev, "Driver SMBus register access inhibited\n");
 
 		/*
 		 * BIOS is accessing the host controller so prevent it from
@@ -1549,8 +1546,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Disable features on user request */
 	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {
 		if (priv->features & disable_features & (1 << i))
-			dev_notice(&dev->dev, "%s disabled by user\n",
-				   i801_feature_names[i]);
+			pci_notice(dev, "%s disabled by user\n", i801_feature_names[i]);
 	}
 	priv->features &= ~disable_features;
 
@@ -1564,16 +1560,14 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 */
 	err = pci_enable_device(dev);
 	if (err) {
-		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-			err);
+		pci_err(dev, "Failed to enable SMBus PCI device (%d)\n", err);
 		return err;
 	}
 
 	/* Determine the address of the SMBus area */
 	priv->smba = pci_resource_start(dev, SMBBAR);
 	if (!priv->smba) {
-		dev_err(&dev->dev,
-			"SMBus base address uninitialized, upgrade BIOS\n");
+		pci_err(dev, "SMBus base address uninitialized, upgrade BIOS\n");
 		return -ENODEV;
 	}
 
@@ -1582,26 +1576,24 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	err = pcim_iomap_regions(dev, 1 << SMBBAR, DRV_NAME);
 	if (err) {
-		dev_err(&dev->dev,
-			"Failed to request SMBus region 0x%lx-0x%Lx\n",
-			priv->smba,
-			(unsigned long long)pci_resource_end(dev, SMBBAR));
+		pci_err(dev, "Failed to request SMBus region %pr\n",
+			pci_resource_n(dev, SMBBAR));
 		i801_acpi_remove(priv);
 		return err;
 	}
 
-	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &priv->original_hstcfg);
+	pci_read_config_byte(dev, SMBHSTCFG, &priv->original_hstcfg);
 	i801_setup_hstcfg(priv);
 	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))
-		dev_info(&dev->dev, "Enabling SMBus device\n");
+		pci_info(dev, "Enabling SMBus device\n");
 
 	if (priv->original_hstcfg & SMBHSTCFG_SMB_SMI_EN) {
-		dev_dbg(&dev->dev, "SMBus using interrupt SMI#\n");
+		pci_dbg(dev, "SMBus using interrupt SMI#\n");
 		/* Disable SMBus interrupt feature if SMBus using SMI# */
 		priv->features &= ~FEATURE_IRQ;
 	}
 	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
-		dev_info(&dev->dev, "SPD Write Disable is set\n");
+		pci_info(dev, "SPD Write Disable is set\n");
 
 	/* Clear special mode bits */
 	if (priv->features & (FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER))
@@ -1620,7 +1612,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* Complain if an interrupt is already pending */
 		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
 		if (pcists & PCI_STATUS_INTERRUPT)
-			dev_warn(&dev->dev, "An interrupt is pending!\n");
+			pci_warn(dev, "An interrupt is pending!\n");
 	}
 
 	if (priv->features & FEATURE_IRQ) {
@@ -1629,12 +1621,11 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
 				       IRQF_SHARED, DRV_NAME, priv);
 		if (err) {
-			dev_err(&dev->dev, "Failed to allocate irq %d: %d\n",
-				dev->irq, err);
+			pci_err(dev, "Failed to allocate irq %d: %d\n", dev->irq, err);
 			priv->features &= ~FEATURE_IRQ;
 		}
 	}
-	dev_info(&dev->dev, "SMBus using %s\n",
+	pci_info(dev, "SMBus using %s\n",
 		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
 
 	/* Host notification uses an interrupt */
-- 
2.48.1



