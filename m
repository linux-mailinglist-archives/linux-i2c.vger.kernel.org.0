Return-Path: <linux-i2c+bounces-7242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A9993873
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 22:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B6BD1F234E2
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 20:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB7D1DE3D6;
	Mon,  7 Oct 2024 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoKyYvaT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B881727
	for <linux-i2c@vger.kernel.org>; Mon,  7 Oct 2024 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333833; cv=none; b=YawyqA6j+tQE2amWNozlcCDpVu3L6afsQP33ZThWmZTEpcupne3uyfqyvSVoIX5ysthdFHdPsqYR53JjFUxMmWTFsIeeCwrMQMYUtKEfEuZ+FED63zQnrVgrp7kFXUv4UCMrRajHE6dd7CwtedCvSsjLhj3LRgiinmtTO3kVbM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333833; c=relaxed/simple;
	bh=99gsGzqJJE1bjx67o2Zl7rDshU+G/GEb4EXbBWu7RRI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k3LvSUe9b+5kFUfxS20OzuYkhnjw1KiyJcSH7FWeqxvqe37C4DyO77bMfnzWBjFa5lgNwxQ1LK9a9ObSorYXcY3osZFGpr93tMwm6aSCTtJcTt2Fiu33btPebTdNs+tuaSEspy0UbGkwPI+llQshL5TqoM1kxxRJPnbHyThPgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoKyYvaT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99422c796eso317115566b.3
        for <linux-i2c@vger.kernel.org>; Mon, 07 Oct 2024 13:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333830; x=1728938630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q9yv0HQnxP8/P85nI8nI0SNcC4yLuSSMH4gvNt5maV8=;
        b=XoKyYvaTfhJAxdLIteUmQKxGwnA4eMDwLBvVbJdrrPKugDYzu53KO9RxxhiUMQN1pW
         VWKVgSKEwwSZDt5ornRqMCuPWnJpWgbOw/qKmH28hWwmM4ArO08fXcGAAr30ZsIovs7v
         zY9k4nfpmMEQC+BlQU2+o55IRJb+xgWQgDifq7kPTZkWJFPEtxHrGfSALZJrR1xJQu62
         5PPQTyG3YzdKPFkPvL2y0fDDITKeJU0/mao2BeAT8ObiO25tlrKmFyk5Y83AOkUAU0nB
         cQvlUr4smpFuWeapg5wMvbY5N5ehOFcjjzAo9OVSZ7WW/exMQIvGH9EdcY8Z1aXKwN3M
         pNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333830; x=1728938630;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9yv0HQnxP8/P85nI8nI0SNcC4yLuSSMH4gvNt5maV8=;
        b=i5YLQ+QpaHZ7mic99vXrOQf3IYIlwoJnYTuKKsAtqNUN5sAyd9ocgkzvt+kiPP7DI+
         AbbFkAzDl+lMgDiJw9u0tdtSFKTWvlX1yXA5htHQCDTR8+Mbsiw5wulElVRo6v97N1c9
         Qq2XvcVe3Wq4uuiwsk8vu6u9XLaJT9s0++jHsuq5oj1qPLuwXd4T/O0V1XvIJHwDcC5D
         PAXdsT9o2no6+whdUHpo4t/tUmhM1jlNGIxKpnqQsytMm8xp2P6v3G498cPxvxxIiK87
         n/yRnCHskNDOCqSTGdJ5A6nb1RoZCVc6YJ023bpAEdLCz2r5BcHFk9L21DGBQLCm+7dJ
         szlg==
X-Gm-Message-State: AOJu0Yzl4Bt/YUAB4bGmFdV6SLk+pcfbSBHbJFD1DauYwHmzHhG7C8XD
	V4GUaxiXNb8RIFw+T3O0V585jeqiDqLV7YoOpXKlDVDc1/he/V7M
X-Google-Smtp-Source: AGHT+IHczTtwESljpij9yrDdRNJpWlPrQ2uRJhCQH4xFEbptkJ/tpcSJciQ464I/0I/HnAJkHZWK/Q==
X-Received: by 2002:a17:906:7956:b0:a99:463c:ea55 with SMTP id a640c23a62f3a-a99463cebe2mr745045866b.24.1728333829239;
        Mon, 07 Oct 2024 13:43:49 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a12d:4f00:a884:c611:9e1:3345? (dynamic-2a02-3100-a12d-4f00-a884-c611-09e1-3345.310.pool.telefonica.de. [2a02:3100:a12d:4f00:a884:c611:9e1:3345])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a994254846dsm325534866b.131.2024.10.07.13.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 13:43:48 -0700 (PDT)
Message-ID: <1aab1846-f5a4-4720-a11e-8afef36fd35d@gmail.com>
Date: Mon, 7 Oct 2024 22:43:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] i2c: i801: Cosmetic improvements
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <10d7eca3-0a2d-4db4-8498-e5b28bbf9261@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <10d7eca3-0a2d-4db4-8498-e5b28bbf9261@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

- Use pci_err et al instead of dev_err to simplify the code
- use format %pr to print resource

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 51 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 75dab01d4..2a2a0e3e7 100644
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
@@ -1271,7 +1268,7 @@ static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 	}
 
 	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
+		pci_warn(priv->pci_dev,
 			 "Accelerometer lis3lv02d is present on SMBus but its"
 			 " address is unknown, skipping registration\n");
 		return;
@@ -1562,7 +1559,7 @@ static void i801_add_tco(struct i801_priv *priv)
 		priv->tco_pdev = i801_add_tco_spt(pci_dev, tco_res);
 
 	if (IS_ERR(priv->tco_pdev))
-		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
+		pci_warn(pci_dev, "failed to create iTCO device\n");
 }
 
 #ifdef CONFIG_ACPI
@@ -1591,8 +1588,8 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
 		priv->acpi_reserved = true;
 
-		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
-		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
+		pci_warn(pdev, "BIOS is accessing SMBus registers\n");
+		pci_warn(pdev, "Driver SMBus register access inhibited\n");
 
 		/*
 		 * BIOS is accessing the host controller so prevent it from
@@ -1673,8 +1670,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Disable features on user request */
 	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {
 		if (priv->features & disable_features & (1 << i))
-			dev_notice(&dev->dev, "%s disabled by user\n",
-				   i801_feature_names[i]);
+			pci_notice(dev, "%s disabled by user\n", i801_feature_names[i]);
 	}
 	priv->features &= ~disable_features;
 
@@ -1684,8 +1680,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	err = pcim_enable_device(dev);
 	if (err) {
-		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-			err);
+		pci_err(dev, "Failed to enable SMBus PCI device (%d)\n", err);
 		return err;
 	}
 	pcim_pin_device(dev);
@@ -1693,8 +1688,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Determine the address of the SMBus area */
 	priv->smba = pci_resource_start(dev, SMBBAR);
 	if (!priv->smba) {
-		dev_err(&dev->dev,
-			"SMBus base address uninitialized, upgrade BIOS\n");
+		pci_err(dev, "SMBus base address uninitialized, upgrade BIOS\n");
 		return -ENODEV;
 	}
 
@@ -1703,26 +1697,24 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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
@@ -1741,7 +1733,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* Complain if an interrupt is already pending */
 		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
 		if (pcists & PCI_STATUS_INTERRUPT)
-			dev_warn(&dev->dev, "An interrupt is pending!\n");
+			pci_warn(dev, "An interrupt is pending!\n");
 	}
 
 	if (priv->features & FEATURE_IRQ) {
@@ -1750,12 +1742,11 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
2.46.2



