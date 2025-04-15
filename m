Return-Path: <linux-i2c+bounces-10367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20343A8A6E1
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3351E4435A5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AC2225A32;
	Tue, 15 Apr 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boAB4djM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04BD22128A
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742148; cv=none; b=bZFPGHk5eh95LJBR+jNs68fC1JaX6AtXwGkd8WvV5PVLv49Btki/nlg22ZGfV0n+m5WQoe+uHP2VX1xXSAbkNSV1AK0Xk10DGYx4y6/yIwxU1GBYgH61JJieloyLBAWwjo/YOHd7CUaKG5Dz7hhNvo8OPaxeNEulxvG9nCox1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742148; c=relaxed/simple;
	bh=pruY+nFNsKca88FjY5lSUCdbgnKB7JQMnCuDdhoig3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0pSnP1Lp5NClVgXMcE6fZg/8zs4fjG/yEZZthKUg0r8Gc9n7fgPRCcHbbA0nQ2BFw2+fHvao3aWTdGK9r4jg+0VkP04Kjvn+D4bLegWrHnikP6DzGZ2klAMHswd6vYo/FXvKtUNPNvqmCkb42e412MfF0HYv6EYFXHmSE1Aw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boAB4djM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso1106307166b.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742144; x=1745346944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA+pMyIkNumlVCFVRszVFMlO4JT2BWBduaXaRgVvQKs=;
        b=boAB4djMNt8WmD284UXlysCfAAaIyAVrwDJsYKi73qsQh5CQ1X/iM9Res4jdMODSsx
         nKPMGNGA5guaop/EuoylOpISfCJkjLzqpgcFgyl5Ur8uzH5Jxs/qGFBqvZEdgIyBN+gf
         hzWLHunFxu5ToZMsXIqMTZzTuRmqnJOEA8dvs/jbmhqVjJ6q0AzARERa6FdRg3w0ZULu
         CxehfmqRHJyEzGt2+CiePZr/0Pi1WmuzpeKScLADfM4wpuVqgfxROjSn53OpDL1Xb0+F
         MY36aldn3dGTcdbTHvE9En8VSXxTH/z8/5zE7bv2dhUfQdTSx7JpHzuWQySvJc0nHDMT
         9RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742144; x=1745346944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA+pMyIkNumlVCFVRszVFMlO4JT2BWBduaXaRgVvQKs=;
        b=fQCqRO5P455eCK9r6+eTX/4GjfjCY9Z6Pt2T5WMhTrueid1JLUemUwOydU9Nty94xz
         7Tq11m4ESDXdWlqhNvG81o7FspiSyAOuZhfAJ8m6bYLbiXxOrVicsT2SH3zDYyeCNFYa
         jk+j5oeznBVAbI9Vn8MU7M0Ww5hxuRXsZaTzUhCV1CgEARaDxJut2YEIn/mVLmzNj2K6
         d1e1/NxLfBYDx8smJNqqASodrMosvVP47Tkq2u78r5GO1WiUp+Ojb0vJMM6o2fMh2Tx9
         X9QxlF2k/tG1W33QDYRv22jotmyDslQRwYPgDzFeUqR2ExcXw7ZQYQBYnB9bOuaOZxTC
         9YKQ==
X-Gm-Message-State: AOJu0Yyz+qXMXdMSY8h+P4FimLgEo1SKtyXEC8VSGfxvL76iKb6ARcjE
	HFQ2HcSPsxftcjXCth+noe5yHitWwaL5wSW5cg/ta9tGYQtljv+rqN89FlH44og=
X-Gm-Gg: ASbGncvwpnh7aiia95J+aDhLxDmlgiXMaqbcDsW2n8D8sWf56gNZFDPYq0ADT0x8S4o
	4BCb4g3ZWI0eV3j0/5MwC9PrXRMQ0zLqgP1BNMISotp8q6dsmAnLBnd0tVW1znWTT4tNS7hoBD7
	6zUhH+TAlHpSyZNj5Q5nkcQ/YnlevgLJW2ABas9FCckMvlPlSdSWq4OLJmc/WiJ8C8SAGexOA/+
	ZyrBNmTTiBoxpT3mtz18Fh47IoFw8xOoUsBvdj1XCxIXuPTx3vP2OGXmF3wxTMtJe7RBo9QQuAS
	vvOlL2Qh0YGj815Mo7TWJd3keSSG/ddLbGyDMa9wDXeTyOEq/+/94+FDXG8vUFZLsg5SVkUgRoq
	h1dh0HA==
X-Google-Smtp-Source: AGHT+IHUaaOfL/D0V93BaMGd1t3O5JDHkPMEVCDMe+wxsykAlCbeQv8qY8+T036PDrTuoPiIF1WKyw==
X-Received: by 2002:a17:906:730e:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-acb383723a9mr12277966b.36.1744742144076;
        Tue, 15 Apr 2025 11:35:44 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:43 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 03/10] i2c: via: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:40 +0200
Message-ID: <20250415183447.396277-4-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-via.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-via.c b/drivers/i2c/busses/i2c-via.c
index 7ed29992a97f..2de73fda6613 100644
--- a/drivers/i2c/busses/i2c-via.c
+++ b/drivers/i2c/busses/i2c-via.c
@@ -89,10 +89,9 @@ static int vt586b_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	u8 rev;
 	int res;
 
-	if (pm_io_base) {
-		dev_err(&dev->dev, "i2c-via: Will only support one host\n");
-		return -ENODEV;
-	}
+	if (pm_io_base)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "i2c-via: Will only support one host\n");
 
 	pci_read_config_byte(dev, PM_CFG_REVID, &rev);
 
@@ -113,10 +112,10 @@ static int vt586b_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pci_read_config_word(dev, base, &pm_io_base);
 	pm_io_base &= (0xff << 8);
 
-	if (!request_region(I2C_DIR, IOSPACE, vt586b_driver.name)) {
-		dev_err(&dev->dev, "IO 0x%x-0x%x already in use\n", I2C_DIR, I2C_DIR + IOSPACE);
-		return -ENODEV;
-	}
+	if (!request_region(I2C_DIR, IOSPACE, vt586b_driver.name))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "IO 0x%x-0x%x already in use\n",
+				     I2C_DIR, I2C_DIR + IOSPACE);
 
 	outb(inb(I2C_DIR) & ~(I2C_SDA | I2C_SCL), I2C_DIR);
 	outb(inb(I2C_OUT) & ~(I2C_SDA | I2C_SCL), I2C_OUT);
-- 
2.43.0


