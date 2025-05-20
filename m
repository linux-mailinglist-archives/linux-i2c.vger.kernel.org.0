Return-Path: <linux-i2c+bounces-11084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E754ABE3F5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28AE87A5743
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91623280CFB;
	Tue, 20 May 2025 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeNdN0Lk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719127FD4D
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770262; cv=none; b=J05IA3sVuwwt3YR7fq7Oy5kOY5tAH6Hi3NoXvMVP7G3uxDkkElTnDU31Dqz8x/vjMpspPkqAe1iWX6V57ztqusFWpfFmGfMNSGlYFhPoLrqomMwYrw0BJOqh03t68gKTNSO/AmhWyzrInn0LWKaBWGB4xWxuN1SEsozxF14FNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770262; c=relaxed/simple;
	bh=Grgt3ocdyh4uBFLmgAgJDVm/IgLTZaWHdaA1SrgKRhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hS3anZEVyBdPT/COgpGhm+L0hHL8eFQ7D3oBA3RdE6Zuihm30Yv0l1U5vfLOYtFdXFG9dzXkdSin04OWGiPYfBt/w/5QzAW8mbmGTpJeyhCH6si89TL2p/RQ/CCTfLga62V7WwKC8KaJjH4BsDWeKqpVx3MwD84Io0SCZu/lLmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeNdN0Lk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so1167276166b.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770259; x=1748375059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFo9gcT/1a0eu/X6R2IYP4VmtBGqYLekUCk7wmzPX5c=;
        b=BeNdN0LksjZc8aN+d1ToJAlZpQzRfrYm7unWt2sNuDfQfPMLvrqaz9zdPBN/6nXeEC
         inRpkjdsBKZK+lK0sFMTw81KjEbRmI1x2Di/keDV5/Y04h39SGABs/7MRvSy2qqbktSy
         636VQ9Cv2WYvGJd7CTkNGToA8qkcdIPmBk4UwqMxHopO4s58prX8GDkX01sRnvCgpOpO
         G1uhTk1hPQNOvgElmRrG9xfWSqf1uzXn1ftHBey4qfF/8fEpIEfVgb66xLGpNth6W0oA
         LJepVcxmLFTlxdM7U6ZN1Q4GDFUbdCaQCfsZaK+4Wh66selSkwSGUV9qf90KyLgymFcV
         OGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770259; x=1748375059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFo9gcT/1a0eu/X6R2IYP4VmtBGqYLekUCk7wmzPX5c=;
        b=G3pXwgKgC1ZRumlMj80UX+g35n2PJfg7T5dsRnvbpE9zInsi+x+3FqCjqIff6peg/1
         lbw/YwjAolAVr699XVDPnTRGIxnNPSNe5rSadrXEqDk0U9E5z0DHkeimZ+8uMyGKIPP/
         xQbKl4FvL8H4djPecy7+r/C2sgOvIaFqlzjjWrxLzoP8shEcrR0zslfolFnzkDOlyJLf
         lWG+BfUeQ6wYMrGPODJlKffyVzfyNaYb6BefluqVwC6q/cICfUH4CeY0lE6Lc7U06IbN
         zv/KuuCm2t8KHjiI1wyxWm8bcp1d2wCQ+S8b21XH47PhthSGJJl8p3lVYVvgtgPAHHhW
         5KXw==
X-Gm-Message-State: AOJu0YxZ5ddlKCmvWVqG0RQDoUGhgST8O36ma6ZOFS3kxa7FikjH1VtO
	kFekR6nS/dHKpDr9pZsDaXh0ffotbXUlkUwE6h97flMzXJoMR+atnpLiRaADduQS
X-Gm-Gg: ASbGncvzWSFBCNm7l5oC1EJu+3KBj6kR5Xyqf8lCx50u4rLf4k98v20JuLJeXt3+vOH
	+nMudAOtTdlUuCHvkQLpbeAHTcVF8TwfJ/3HHpq8zRsGdLszPxDZfAKox816tX+XdVxE3xYTbCc
	chBpQEA1BIW9URNMo5mPrzpI8o722PSKLvh518SbXPa36P7clT3CI91yU7v2Vio4wC1agXBYyFH
	9z2Ho5M8OuFKMh3X1BLToPd4izcdaWtz4VW69OYaXbxyED5pUJuk1U6vcay+B1+565ZYzPtFW0L
	dPRRG8uxoYHNg4qYSKTfJRVeCqdQpqxpu5rRM2OSkY/wzhoFgDmksy9ofCE4CDh1NDu2NxalAGV
	+11PD5MW8PvPCPBnmmXmm7YMIB2U=
X-Google-Smtp-Source: AGHT+IGM3AJt0lQukp+k6tAm8ksTBPXNtr8y+Pciyj0Im4/5zhQDbcxvypurNXm3+X4Ur4tItmg0rw==
X-Received: by 2002:a17:907:60d2:b0:ad5:54ec:6b3c with SMTP id a640c23a62f3a-ad554ec711bmr1181982266b.27.1747770258870;
        Tue, 20 May 2025 12:44:18 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:18 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 10/10] i2c: sis630: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:44:00 +0200
Message-ID: <20250520194400.341079-11-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-sis630.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index a19c3d251804..3d0638c2bc51 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -431,24 +431,23 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   in acpi io space and read acpi base addr
 	*/
 	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
-		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't read bios ctl reg\n");
 		goto exit;
 	}
 	/* if ACPI already enabled , do nothing */
 	if (!(b & 0x80) &&
 	    pci_write_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, b | 0x80)) {
-		dev_err(&sis630_dev->dev, "Error: Can't enable ACPI\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't enable ACPI\n");
 		goto exit;
 	}
 
 	/* Determine the ACPI base address */
 	if (pci_read_config_word(sis630_dev,
 				 SIS630_ACPI_BASE_REG, &acpi_base)) {
-		dev_err(&sis630_dev->dev,
-			"Error: Can't determine ACPI base address\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't determine ACPI base address\n");
 		goto exit;
 	}
 
@@ -469,11 +468,10 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION,
 			    sis630_driver.name)) {
-		dev_err(&sis630_dev->dev,
-			"I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
-			smbus_base + SMB_STS,
-			smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
-		retval = -EBUSY;
+		retval = dev_err_probe(&sis630_dev->dev, -EBUSY,
+				       "I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
+				       smbus_base + SMB_STS,
+				       smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
 		goto exit;
 	}
 
@@ -511,12 +509,9 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
 
-	if (sis630_setup(dev)) {
-		dev_err(&dev->dev,
-			"SIS630 compatible bus not detected, "
-			"module not inserted.\n");
-		return -ENODEV;
-	}
+	if (sis630_setup(dev))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Compatible bus not detected, module not inserted.\n");
 
 	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;
-- 
2.43.0


