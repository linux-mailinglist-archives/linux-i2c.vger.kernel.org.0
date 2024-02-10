Return-Path: <linux-i2c+bounces-1682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE78504EE
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 16:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB0E284A39
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 15:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308865BAD4;
	Sat, 10 Feb 2024 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPtNSMMD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8F5B69F
	for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707578871; cv=none; b=fYHs1DJWhQ2oCr9GFOdbubmMFm+qAsen83XPEeoSqrIwR7mn6NMqEvgepHU+xoT/SoZGkDD9RGS3vSS9A1UqBYAsWq7mjXC3MWpkpGikwRoNTjPAA5eG222ZHhISRWhjC9WeiG4/Ts6v4R921bulqVKNJ+e2ZTdd2MTXmuSoq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707578871; c=relaxed/simple;
	bh=oaoDt5yf3FC+k/UiYMLvFIGyh3iegfWsot4Hn5r9Nyg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=InBUhWfej7DV+Ik7HFgDP2mQ2y/iFBaIqC+A/bkIhI/YooF6nTJdZeOQYxg0/wLvGOFzjkNtghzQMLhkEnXhTwtkv5Ja0UPrQW2xqfD0Jy2PmbNbfBSV5sj6TyhJYDwJ6LaLqFUvLQr+vUp+djYJlDfUhBF+bv6wXWa5mqxQna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPtNSMMD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5610b9855a8so4831320a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707578867; x=1708183667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUqH6U2FqffRJUXLWYxAToa5lBPKpOUcvs42qsO04Js=;
        b=bPtNSMMDEUokIDVAWcxeSMyUThGm64tGGPaAa7GlcUaZMuoh+oDgQ45RFGJ+Im3YmS
         0BRvHlQFG1duC5ez6vE8u1JC5OG7sLzgLaRBG8U5wg+yZyiZcwWjtaUEzl4MqX1spcgk
         vUfyBAf7Qvz+CSEJz+HEJwXLrBjpUcjRCr152y3QD+iwia3+BAo2TNvOE4vkVdNpbEer
         b19fh0dK1WMdCSTt3VgsMTg/qoShj1VZQXEkzg1NFcfOay6FB+La17KeQ4tWtpkRqTsq
         luz6oDkpr2b0OfcLZ6bQ7HHPigSoEa7nR0fGs73LK0w0GThFYgVfVtfHNEaCBDmuXHoe
         PoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578867; x=1708183667;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUqH6U2FqffRJUXLWYxAToa5lBPKpOUcvs42qsO04Js=;
        b=Xjgms9idl/0SiuCiE/PJD3m8blhFO27vqHzXap9F62kbC3KalaTFgcDspVSMgQh3aX
         DBbyNj6z7mx3o42bW70SalSW+369EB2AyYKjyLZtGZ2tsv6y+XLR+WbdE0B/olavo/3b
         dMx42+1LZahGj8teewQR7wMfSrlhHEPVug5U/QNGk1+4TNdhCZXccpHu+iVTi6OERpgk
         b5qoK8Nh3p/Qz1RKnD2/uQyoWgrFFEQ6L8zdLS4gAeKPEcnzPDG+4+tCUe3QNIZ24Tbm
         2Tlxm7HkuZwO4mZmUvP8SQn245osHV1eUa8A7UrWW0dN3d6XXDjZRwqAvaR4RLPhB5T2
         IUig==
X-Gm-Message-State: AOJu0Yz4XLCPGl+a61FB9oQh7W85E18RLI4TQ1Uj+W3f5FiHD4pQ36Kz
	ah/D36MY5S6YGveVNvA9cM0NkUtfIAajFTy70sdOgFBzBbSYaT1j3PZ6gzKa
X-Google-Smtp-Source: AGHT+IH0PsMNJgtGm4u6Dbsc0Uc9ctI4KeUVFteuKudMGB2TcrEXNCJYzI/lFCQjd2pOzfPBYC5Wqw==
X-Received: by 2002:a05:6402:559:b0:561:33dd:621c with SMTP id i25-20020a056402055900b0056133dd621cmr2234205edx.7.1707578867046;
        Sat, 10 Feb 2024 07:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjHUv0WhHJ9nQC83T2JoTwhb2ZFkdS+lqF21mwENGh+E3HmPv6lFCg5ZpJ76qB+YqQwX/20M7xZUkG4Ga6YU2EWZGYZN8=
Received: from ?IPV6:2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8? (dynamic-2a01-0c23-c5e3-d400-ad36-06b8-178b-1fc8.c23.pool.telefonica.de. [2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8])
        by smtp.googlemail.com with ESMTPSA id d13-20020a056402400d00b00560b0b707adsm851631eda.73.2024.02.10.07.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 07:27:46 -0800 (PST)
Message-ID: <e3ef7a1e-be00-4efe-a708-3ce0459801f6@gmail.com>
Date: Sat, 10 Feb 2024 16:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] i2c: i801: Cosmetic improvements
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

- Use pci_err et al instead of dev_err to simplify the code
- Combine an error and subsequent debug message in i801_check_post()
- use format %pr to print resource

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 54 ++++++++++++++---------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 918c794c7..4951d7d90 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -398,25 +398,22 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	 * If the SMBus is still busy, we give up
 	 */
 	if (unlikely(status < 0)) {
-		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
+		pci_err(priv->pci_dev, "Timeout, terminating transaction\n");
 		/* try to stop the current command */
-		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
 		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		usleep_range(1000, 2000);
 		outb_p(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
 		status = inb_p(SMBHSTSTS(priv));
-		if ((status & SMBHSTSTS_HOST_BUSY) ||
-		    !(status & SMBHSTSTS_FAILED))
-			dev_err(&priv->pci_dev->dev,
-				"Failed terminating the transaction\n");
+		if ((status & SMBHSTSTS_HOST_BUSY) || !(status & SMBHSTSTS_FAILED))
+			pci_err(priv->pci_dev, "Failed terminating the transaction\n");
 		return -ETIMEDOUT;
 	}
 
 	if (status & SMBHSTSTS_FAILED) {
 		result = -EIO;
-		dev_err(&priv->pci_dev->dev, "Transaction failed\n");
+		pci_err(priv->pci_dev, "Transaction failed\n");
 	}
 	if (status & SMBHSTSTS_DEV_ERR) {
 		/*
@@ -444,7 +441,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	}
 	if (status & SMBHSTSTS_BUS_ERR) {
 		result = -EAGAIN;
-		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
+		pci_dbg(priv->pci_dev, "Lost arbitration\n");
 	}
 
 	return result;
@@ -572,8 +569,7 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		if (priv->count < priv->len)
 			priv->data[priv->count++] = inb(SMBBLKDAT(priv));
 		else
-			dev_dbg(&priv->pci_dev->dev,
-				"Discarding extra byte on block read\n");
+			pci_dbg(priv->pci_dev, "Discarding extra byte on block read\n");
 
 		/* Set LAST_BYTE for last byte of read transaction */
 		if (priv->count == priv->len - 1)
@@ -1262,7 +1258,7 @@ static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 	}
 
 	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
+		pci_warn(priv->pci_dev,
 			 "Accelerometer lis3lv02d is present on SMBus but its"
 			 " address is unknown, skipping registration\n");
 		return;
@@ -1533,7 +1529,7 @@ static void i801_add_tco(struct i801_priv *priv)
 		priv->tco_pdev = i801_add_tco_spt(pci_dev, tco_res);
 
 	if (IS_ERR(priv->tco_pdev))
-		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
+		pci_warn(pci_dev, "failed to create iTCO device\n");
 }
 
 #ifdef CONFIG_ACPI
@@ -1562,8 +1558,8 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
 		priv->acpi_reserved = true;
 
-		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
-		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
+		pci_warn(pdev, "BIOS is accessing SMBus registers\n");
+		pci_warn(pdev, "Driver SMBus register access inhibited\n");
 
 		/*
 		 * BIOS is accessing the host controller so prevent it from
@@ -1644,8 +1640,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Disable features on user request */
 	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {
 		if (priv->features & disable_features & (1 << i))
-			dev_notice(&dev->dev, "%s disabled by user\n",
-				   i801_feature_names[i]);
+			pci_notice(dev, "%s disabled by user\n", i801_feature_names[i]);
 	}
 	priv->features &= ~disable_features;
 
@@ -1655,8 +1650,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	err = pcim_enable_device(dev);
 	if (err) {
-		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-			err);
+		pci_err(dev, "Failed to enable SMBus PCI device (%d)\n", err);
 		return err;
 	}
 	pcim_pin_device(dev);
@@ -1664,8 +1658,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Determine the address of the SMBus area */
 	priv->smba = pci_resource_start(dev, SMBBAR);
 	if (!priv->smba) {
-		dev_err(&dev->dev,
-			"SMBus base address uninitialized, upgrade BIOS\n");
+		pci_err(dev, "SMBus base address uninitialized, upgrade BIOS\n");
 		return -ENODEV;
 	}
 
@@ -1674,26 +1667,24 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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
@@ -1712,7 +1703,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* Complain if an interrupt is already pending */
 		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
 		if (pcists & PCI_STATUS_INTERRUPT)
-			dev_warn(&dev->dev, "An interrupt is pending!\n");
+			pci_warn(dev, "An interrupt is pending!\n");
 	}
 
 	if (priv->features & FEATURE_IRQ) {
@@ -1721,12 +1712,11 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
2.43.0



