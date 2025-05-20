Return-Path: <linux-i2c+bounces-11083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76728ABE3F4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDDA67A57DF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBA227FD79;
	Tue, 20 May 2025 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILgsFy5q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A30280CFB
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770261; cv=none; b=Imjfs5yqYYLcMKG31V0t43g6elr5VyMOysz1o1NiRVg/d/sf6ewEzv6EAW69gW7PLAAT+5hXl7V1gs8YlRxnmPfedLe/LeoumoOIttbtRaxIUbTDeygyM0nOMhgd7yCn6Nrw2ksrHpfNsxYzdaC10ALcPjPWo/aBnrVvMNPrQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770261; c=relaxed/simple;
	bh=LCzJRNCDscXMDZdG4MBkfgsmjK6cIi+bcvdVqIpEXQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyW3g1QbW5/sCl1r85S/Cq5647Wdd2u+Lp1ZbjxRUrulErfoiEBdbfyZ6fSXVWMnUxYFQsg9LhgB76Cvi/V3XZ2vc/ZtQCJfZioHatqEcIhpM8Y3hkvbfltCAabs/YnHEnB31YF59+dBm6CvEG2ajePGCcAIb/uKpuQcyjmJOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILgsFy5q; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad545e74f60so659155166b.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770258; x=1748375058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svzZdYZrxSuRStx76VDt/bV5dnOlxDgL19Gcp9uOERE=;
        b=ILgsFy5q2eFfV6yNDX2/Gui/6BlzzkGI23rRnu1CVSGUYOIg7OKm7329gVlvCa8psr
         HB8gUaJtb8+lKFiTCKSavFBYxW5YC4QyQIufcNqrMdpqGQwQvnEM2nqGLDnaQnNLI/eg
         /Jd6aqvxmUtPjeOXK8TvLoSS0WESL9hPb1BIPep3MbJuu2Pqo2bN6FnDWzZdb/rtI6bt
         LYIqhqhwyUZDnXCdLFJ6txv+6+d61UcQrGRXlholP+IiNSfobdBLHlJp1TkHOoHOaz25
         hFp8EUbb1LP+pEXihaTtdW1khAhFzLpvby8X8QtcrmZZInOiAHyF1umkEp7kRibRked3
         X4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770258; x=1748375058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svzZdYZrxSuRStx76VDt/bV5dnOlxDgL19Gcp9uOERE=;
        b=Tgw4aiUpScdSle/xlp754GfY3eSRWtZ1KgS1EXib9TtGfACuHpxK40vdxHmSeDTYaN
         y8uayt10MLvoRoH5wyuAD72HcKJFiuFdyyuT4V/UpUzAqZSj8ZAjM9K/YkSWs/xAFJOm
         sjBTz7Ma7a+VR4grpblwRdKEuc5jn4J+9AQSpQUIShPUen5//Zh3Xj1vZmL31qQ2G8e7
         uSFsmb+zCKLKsee2mHkyl8Ul5LdD6kHvGdcdsVpbqUz6LqdI6yp58YpQHKZJ1fE1VZ3N
         A0rWj/yEQrag4wIFN1t3xewhqg0hnNYVs9yKGz6ukqFXQlEn15kTmNLpKWQHtto39X0+
         jTOg==
X-Gm-Message-State: AOJu0YxYaKOPeBZ6LZurV8Qm7rcQ3tD3A7VrHBnD1FSsn60Us9vQ10Pp
	fiiETw7tOfwPqxutORayC/SCntqfKVZ4HxsfVI3Iiy9besGJQMoxcp5+hkaNpmOZ
X-Gm-Gg: ASbGnct1DTIuCE7IEGmr983dab8N43UVmaYsgON3RNMaLPLHz4/5e/UQg7LKsz1UDgg
	F6QQWFNKLKz4QxDJGqLjIlVfk0Om/j9O+8LfZq/2gEePaH0+LKKsfPJg+Xa3p9N5NLGuKmetum3
	QgGmT8888W9Y5tTim4Kmg/RFWlkJkdMlTeg1y9Xf6xlQsNFr0nvODaiAKOgEZzqGOXTvytOpTuZ
	y6G06WwtiX/SaTTcAALCQtuLqs1Xbb+J+4HmFh1gqq0jRaJVgRzTvtLvsEvJo5LrrpHnAdrnffG
	jrLLsBQ+3KB4ZHImrdTQuM+/lc3nSYv0GSn8SnhtTyV2LL2kVLuOypDqaweD5dEiFm0EUR238na
	6GHY69g==
X-Google-Smtp-Source: AGHT+IEvl23CjxFJrN0ar62w/0hD9Iattrhj3p0NYYTDSwCVAfoC1ovKunl442NR5N1g8VFgiZk6FQ==
X-Received: by 2002:a17:907:1b20:b0:ace:c505:3349 with SMTP id a640c23a62f3a-ad52d42c0f0mr1775612766b.12.1747770257773;
        Tue, 20 May 2025 12:44:17 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:17 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 09/10] i2c: sis96x: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:59 +0200
Message-ID: <20250520194400.341079-10-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-sis96x.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..eee41dc9d706 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -245,23 +245,19 @@ static int sis96x_probe(struct pci_dev *dev,
 	u16 ww = 0;
 	int retval;
 
-	if (sis96x_smbus_base) {
-		dev_err(&dev->dev, "Only one device supported.\n");
-		return -EBUSY;
-	}
+	if (sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EBUSY, "Only one device supported.\n");
 
 	pci_read_config_word(dev, PCI_CLASS_DEVICE, &ww);
-	if (PCI_CLASS_SERIAL_SMBUS != ww) {
-		dev_err(&dev->dev, "Unsupported device class 0x%04x!\n", ww);
-		return -ENODEV;
-	}
+	if (ww != PCI_CLASS_SERIAL_SMBUS)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Unsupported device class 0x%04x!\n", ww);
 
 	sis96x_smbus_base = pci_resource_start(dev, SIS96x_BAR);
-	if (!sis96x_smbus_base) {
-		dev_err(&dev->dev, "SiS96x SMBus base address "
-			"not initialized!\n");
-		return -EINVAL;
-	}
+	if (!sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EINVAL,
+				     "SiS96x SMBus base address not initialized!\n");
+
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
 			sis96x_smbus_base);
 
@@ -272,9 +268,9 @@ static int sis96x_probe(struct pci_dev *dev,
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(sis96x_smbus_base, SMB_IOSIZE,
 			    sis96x_driver.name)) {
-		dev_err(&dev->dev, "SMBus registers 0x%04x-0x%04x "
-			"already in use!\n", sis96x_smbus_base,
-			sis96x_smbus_base + SMB_IOSIZE - 1);
+		dev_err_probe(&dev->dev, -EINVAL,
+			      "SMBus registers 0x%04x-0x%04x already in use!\n",
+			      sis96x_smbus_base, sis96x_smbus_base + SMB_IOSIZE - 1);
 
 		sis96x_smbus_base = 0;
 		return -EINVAL;
@@ -287,7 +283,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
 	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
-		dev_err(&dev->dev, "Couldn't register adapter!\n");
+		dev_err_probe(&dev->dev, retval, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
 	}
-- 
2.43.0


