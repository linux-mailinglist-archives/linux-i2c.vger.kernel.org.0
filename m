Return-Path: <linux-i2c+bounces-7244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7499387D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 22:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41BBD285146
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 20:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D46C18A95F;
	Mon,  7 Oct 2024 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK+qQTYe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43618A94E
	for <linux-i2c@vger.kernel.org>; Mon,  7 Oct 2024 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333917; cv=none; b=SHA161Lpzm8c44417I4WMYIAWvTyBcUoXprZJox2Xd+C7cB1N2D+8aN0F3jAA/pOOM9WyhUOctP2z9SbaY5XHphIJl4/ciErNVvHLMV5Um+Jx6VqI5yvUyxk18M70VZc6yvs9Jffvf15hBDVpdXlsm/KFNTB44cNGrZYqTvDx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333917; c=relaxed/simple;
	bh=FV00mioq94tT5+VRtj/WT44XwFaHfiTw4mu1yRzS8Zg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pwtpEna1Vie1Y+S6D9hA3tzl9qLeirvbj21jWVKVqVunp2y3yjIfLDS1JnNZFRAhZBYt/ZLLamLZ7yQQevQnRNMNDaVLqLkpnNrDlMPN9WjZGRPbOvMbpbFq2DujhJLY/AmgwyTMNjH9hdRCz39cuO4ZomkUCAlKx5OAIUws7X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK+qQTYe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99388e3009so326148666b.3
        for <linux-i2c@vger.kernel.org>; Mon, 07 Oct 2024 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333914; x=1728938714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V7QavWDCYM+JKx8HON/OKQgZ366yC8qLtlM27bZU5lo=;
        b=KK+qQTYeWwOLF9dANjH2P8GRJp+JXCftS05NGcPkuwYSzCBt3ZwOT28PMT7dsj7uU0
         W1Z107Sul87KcTqXZD+aBXihoMChDGWdDmI0ha5lB+aLyVe0gfU3Rmt4jWj2CCGnl6Av
         d9XIuArsJG4eNtTZeMPtIIAOuNEKITDBDwzyVf5sFXam6OatmYRgLtx4tyihFH4wiDeX
         3/hyuEhjSf80hCtbM3iM/YkrYRVesLZNVYgUdn9HGG1LCsNNzhKI+soGbKUK5MR/z5Xg
         5GSfSYVuSRB7J55HuPWKXqJ1xtgvYdv0bkqwnMSF+KLtcYmbjWayksVeMrHvo/bUb0yi
         vPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333914; x=1728938714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7QavWDCYM+JKx8HON/OKQgZ366yC8qLtlM27bZU5lo=;
        b=o7cSgaRpXV2aY1WbljL76lqnJeHwk/O+UkII8+lVhshJXDW3xKF1Z+BfSQDTxtyX2m
         XxsdTw/Dc8MvhIEBCX7dELx4KEl1wsUVnM9rGZU08u7Cw/F+hlnCSnFqCvw+0ufL1e0A
         JU0tyTIGYyZICuSnrZrAHBI9YPJwu0BxJLo0dhoJRAfdvt2qRWBHokSDAL5xS5W4o3Me
         uOA1qW5uhV731RJelzNPqrrTjWXnxOfexC2SWNTekUQInCEof/9G9v78CuBKxo5vM6vq
         IPs52FqzXCq4CIytv0JsrYR1DYjgt2h3jLSVuRFsTRFokCjQdz/E7DeD/+5oZ4chC4ZW
         EP6A==
X-Gm-Message-State: AOJu0YyimUTxTYZKzym6NNyL1PLaIiRIZi72FRwRU1iRq6bwrnGnh5pI
	8Gqc6lrTVmVpijWUPWPo3b1prwhs3sPdOU1KYA6g9Hqv+tUvd5V9
X-Google-Smtp-Source: AGHT+IHVMkFR1ucE1hIEm3UJyTxm3ikp/pDolRlhfInK9FJHrMLjNysKBkWa32ewAUKsLH03HoDqRA==
X-Received: by 2002:a17:907:948b:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a991bd76bf8mr1312768866b.39.1728333913673;
        Mon, 07 Oct 2024 13:45:13 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a12d:4f00:a884:c611:9e1:3345? (dynamic-2a02-3100-a12d-4f00-a884-c611-09e1-3345.310.pool.telefonica.de. [2a02:3100:a12d:4f00:a884:c611:9e1:3345])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99446bd93asm304325566b.82.2024.10.07.13.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 13:45:13 -0700 (PDT)
Message-ID: <04ad9524-6278-4e68-aff0-40c8083698f2@gmail.com>
Date: Mon, 7 Oct 2024 22:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] i2c: i801: Use MMIO if available
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

Newer versions of supported chips support MMIO in addition to legacy
PMIO register access. Probe the MMIO PCI BAR and use faster MMIO
register access if available.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4e1b1c825..3afdbb964 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -144,6 +144,7 @@
 #define SMBNTFDADD(p)	(20 + (p)->smba)	/* ICH3 and later */
 
 /* PCI Address Constants */
+#define SMBBAR_MMIO	0
 #define SMBBAR		4
 #define SMBHSTCFG	0x040
 #define TCOBASE		0x050
@@ -1647,7 +1648,7 @@ static void i801_restore_regs(struct i801_priv *priv)
 
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	int err, i;
+	int err, i, bar = SMBBAR;
 	struct i801_priv *priv;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1692,15 +1693,18 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (i801_acpi_probe(priv))
 		return -ENODEV;
 
-	err = pcim_iomap_regions(dev, 1 << SMBBAR, DRV_NAME);
+	if (pci_resource_flags(dev, SMBBAR_MMIO) & IORESOURCE_MEM)
+		bar = SMBBAR_MMIO;
+
+	err = pcim_iomap_regions(dev, 1 << bar, DRV_NAME);
 	if (err) {
 		pci_err(dev, "Failed to request SMBus region %pr\n",
-			pci_resource_n(dev, SMBBAR));
+			pci_resource_n(dev, bar));
 		i801_acpi_remove(priv);
 		return err;
 	}
 
-	priv->smba = pcim_iomap_table(dev)[SMBBAR];
+	priv->smba = pcim_iomap_table(dev)[bar];
 
 	pci_read_config_byte(dev, SMBHSTCFG, &priv->original_hstcfg);
 	i801_setup_hstcfg(priv);
-- 
2.46.2



