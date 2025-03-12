Return-Path: <linux-i2c+bounces-9814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D557A5E421
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 20:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E8616E675
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0055205ADB;
	Wed, 12 Mar 2025 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdnOvG7K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097AC136A
	for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741806495; cv=none; b=Zuimeku57E5stfADtdVK5MdjjGxClRlygec47ihGkzx+G1yiUrQ2sueIgj82ggE84rl0otJuon0mSnyaFD0oN9mal1MjtS8M9OEI95Pc2YhSSqwAWyU53wjeSwnji2TOi7UsGewVtHiEifKkjNkS0pZ28rjrNZXN9RMxOcwJATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741806495; c=relaxed/simple;
	bh=36Z/v8pCNxI13a++iC6qIvnTzEUIgaSOPvcICdb/KR8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTZK75fCNBeIRd5Qb7nneKccU1MTwzMdMAgru4KDhOQhcokkmmycceMlkHhNIYVzJqeiHATpPyBGsqdTYoRtix+eUQY/g3BLkDscFuBwy9K4HT3o8OtkUwEI5YwIxeOjLlLiRgHK1kY9CjWTtihiS3HyFadPHafny730wT3idew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdnOvG7K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so1305825e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741806492; x=1742411292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f57efTgL3BTf1yrpy+ECBWuhH2pJ+E3g+XrniET1OkQ=;
        b=CdnOvG7Kyy9ER5iceTHGQymtKEVdp6Ek5QZr8jz9HsT2gaBj7sBM92suIHRpOkGS9n
         1yykdrK8FZW+SufqLCqgiigVZ4U1B5VJQ/dPTS9GDETMnMACnamwcriMcYyvggyq0uQ9
         x0qzXcxZaruTWrY+sbp4CIfi15/Wmkzwrtj2LIi/T2WoagsEro/q6bu2ZAdM/FItgaBC
         sSopK4mLPZhurHimOsBBjoiB4Iwam37ZvlNE3vmxS37bYaMhcKiAO8H7UbQoGaVIAsjP
         Kx7S2zfGezTaK4I0USpChYQP4jTuxM8Da7dixb6/DLYb/zm2O/Q8BSk/+Nt++4+roiRx
         9wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741806492; x=1742411292;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f57efTgL3BTf1yrpy+ECBWuhH2pJ+E3g+XrniET1OkQ=;
        b=S6GOxFTW55ZJhoppYwOi+a7ZhFAz6TfuQxenv9eWllAhPd70wLTUKgmYufGd7EbAlB
         QsVC1bWU0SJunQUnqix7HDV/vxtb7wacs1uuBhBDAZaI8YQYJbTZfWycVaL/KEakrbKm
         C/1epYqRkiaDQg6bXfrBmCYgtmmgh8mh7TQ3P0/WzzBypGovqfC9r2ZoG3Rs07bt/ZM+
         LeGeS4h7r/tkrn6h7rQj3NUXrFzO/AYLwFg961m4K6QVy018PTDf1fT2NI0+sp7w7sE8
         s8eyETe8HGqUmgxzXs6b49GY9TRhya2edE9hEwLeaATGLlkpWfr2afU+Nrh94900jInM
         QPGQ==
X-Gm-Message-State: AOJu0Yym+avxuZzLA/rDAQGB5buC0ESY2fp8r9/+VbJ+QE6kvH3RqSTS
	hjqpqh/qO81rWoXRFPBj2z9H5+gKzeNfvkG5l/P8gfI1zI0UN0Oo4nvczx3u
X-Gm-Gg: ASbGncuhdckw9b7zKA/CVuSF1VDQNtVac0VlIkoB7GAkDF1tmUP620dOXBC41OfREKc
	t5SqcLT9XuVHU3VTSogHe3DjzIsXQN6yCmsnTWDDUVi2ZO7sCkWA9X5bx7bE9vCKagoN+IptFV+
	ZIKYqcr39v273mNuKcqBE5eiOYV0USyq8Q9454x3zaUWU3Azb8/0EHvpgZvEBppG0aAZ0mls1jn
	Qc6PER2uELReuwYWvFlf/kuNcz5+VsLqJ4NDmnJ14BzuSEVlOJvX88XLzIPZZhbnYdG/nTEpHXY
	zr1zbG/44UzkRFA0tk3S+R2vDykfDcLCIj/RE2wtSS1zGLQLtq6gsbNJ6kGCNpow7rdZVT0oz5s
	grIYs34KKFYZi1uqHytF3M/Sb3ERTLQYVJDnv0AKOww/yg6DElMsEWEaAdM0E/YQWHeQkGXNpVQ
	Snxg31ClYoyA5+7LgOAloeAS9KusEzbFHju1tS
X-Google-Smtp-Source: AGHT+IH2wF5m+Fy2xO4v1fvoSYoHbiT45lCgzfCYKBnNdkJ6qSH6JfpFSHp0XG422WM4UwWb8FJtBA==
X-Received: by 2002:a5d:5f4a:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39132d21055mr21461844f8f.14.1741806492177;
        Wed, 12 Mar 2025 12:08:12 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724? (dynamic-2a02-3100-a4d2-5c00-ad7a-ba59-161c-c724.310.pool.telefonica.de. [2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d0a78f4c2sm29447475e9.30.2025.03.12.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 12:08:11 -0700 (PDT)
Message-ID: <b4748b7a-aac5-445c-b813-20c4d2c23ec3@gmail.com>
Date: Wed, 12 Mar 2025 20:08:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] i2c: i801: Use MMIO if available
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Newer versions of supported chips support MMIO in addition to legacy
PMIO register access. Probe the MMIO PCI BAR and use faster MMIO
register access if available.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index bf5702ccb..48e1af544 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -144,6 +144,7 @@
 #define SMBNTFDADD(p)	(20 + (p)->smba)	/* ICH3 and later */
 
 /* PCI Address Constants */
+#define SMBBAR_MMIO	0
 #define SMBBAR		4
 #define SMBHSTCFG	0x040
 #define TCOBASE		0x050
@@ -1522,7 +1523,7 @@ static void i801_restore_regs(struct i801_priv *priv)
 
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	int err, i;
+	int err, i, bar = SMBBAR;
 	struct i801_priv *priv;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1570,10 +1571,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (i801_acpi_probe(priv))
 		return -ENODEV;
 
-	priv->smba = pcim_iomap_region(dev, SMBBAR, DRV_NAME);
+	if (pci_resource_flags(dev, SMBBAR_MMIO) & IORESOURCE_MEM)
+		bar = SMBBAR_MMIO;
+
+	priv->smba = pcim_iomap_region(dev, bar, DRV_NAME);
 	if (IS_ERR(priv->smba)) {
 		pci_err(dev, "Failed to request SMBus region %pr\n",
-			pci_resource_n(dev, SMBBAR));
+			pci_resource_n(dev, bar));
 		i801_acpi_remove(priv);
 		return PTR_ERR(priv->smba);
 	}
-- 
2.48.1



