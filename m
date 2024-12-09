Return-Path: <linux-i2c+bounces-8373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D679E8B4F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 07:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B24281538
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 06:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647B91C3022;
	Mon,  9 Dec 2024 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LsYQHE49"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C414AD0E
	for <linux-i2c@vger.kernel.org>; Mon,  9 Dec 2024 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733724270; cv=none; b=UcT8LAYyzdHPKia5KwHspMPeQWJxDr1+qwj3Z5KVe+M8st+F6nti7CZlfr39d6slVklF6ebvIjLEVR15G4kDYFEOuSQa+tT4QcLw7KMJHYyusqvGzq7lxsDsfl1ThZgHCVghzuy2H/P405X8CDEa5J0vNlfaVIkVNie8JKdOrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733724270; c=relaxed/simple;
	bh=F4vouyVtcKW0X8jSdaJkiCxfL9VYGc6mP6tX/c3lWDA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fPqOO1h5oOXkTwJi0zRaGH4KvzBdr7xN6rkCLIc7AYyNQKW4ABGWTTQ96tNXd6ujM5d46+C+kzIx01jsonmah2ZDXMS263Ic9Gfaf4LN6FnwS6fljSMqqD3VS54SxztT6KSHrGP9xgGRhkbUZtI5mvNg0z5Nhr1y2J+b4Ik0R38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LsYQHE49; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725c24f3a89so1944805b3a.0
        for <linux-i2c@vger.kernel.org>; Sun, 08 Dec 2024 22:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733724265; x=1734329065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xBLZIFuwdPdIo7c9yIdBVJBPUeOE/XllfXOGGCfPYA=;
        b=LsYQHE496pg9BA6LE2dn9A+BOVKHc0A6jsKr9ryx2Wu1sCkWSdE9HMfuMjw1wPoVgy
         cqBKdd7Pz6jyI2IOXZKINh+QEfS66jIvn4C8UWKaY4DzQCSm+IUeinD3C6JQtUr9OWBv
         1Ur22+/g8PHZRxOF1wkPWIKzHgadSlX6/tBmHFAaWoi3UBdUsExajDcYzxBa9zzjUhxK
         YmxFNUiv31xVoSMY353Kbj++POQRtJnilwfTepjJ89r0G+J3QRvxY7VVE8j1b2HXY/ea
         +7pE1ZYCuM6OsTkmCSO4CLJ6vIIhwDW5F3DlhDUykHfyB2/Zk5h5jcPcJDuQIcNjRlFL
         qsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733724265; x=1734329065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xBLZIFuwdPdIo7c9yIdBVJBPUeOE/XllfXOGGCfPYA=;
        b=lhLyfccHchRSgVCu4hkn11h2YOjQgtQaJ/0Rpk4cUozCYYzgyJtyotb/hBp9Ks3iit
         ir7P2wP8Fd+U/cTWapTBbSxo6VEWiuX+iN2ANB/+qK+vA0k2iyFCgEllXKD0tbvsp7D3
         9W0loJRa5OHN+eco7oXCTVqN7HwEhS7b7Rna58f0oiunrZgV1jMv5clMlFmbO1wCahTs
         6vUd03ToAmFrFNZZnWxnWB+neMnyQK18PdN7e/JoM5PQtniKbflxHs9MaV0L27WM9TFV
         fXnQtBELpcL2zdu9xV+95Jv9aEfx/jBaYeZ14gwRD5Mc5eLi5C0cx0qUNoUDFyXAjjiY
         t9zw==
X-Forwarded-Encrypted: i=1; AJvYcCXfXmHAgiEQOgRAf//WkaHsQqYH8OLzzP72+YrFJfAUkkwvQNyvy5YEMby0od/xPYw6Aht2l+7K080=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywae+1Ni761neyupAY/Vnzd3THYiNHcgwDtcKN9bUNpMB6Z6FRo
	rsXwwEuMnMCesuegF6G/9vK8OWqVNvYYte975vqkx2wVMZJZ+OxWk3rbkn3o5zbH3LSMSsZi5cR
	p
X-Gm-Gg: ASbGnctWUYGVrxT97XJTGhN20s550HzTNnwVJkDJ6qccEyyvV/xc3h+IvQv6uj9rXxe
	JfpKtLaI2w180ruDG+pVU72Cyf9Ej0KSL1OHta5KpnOh+PeiiqRwRvtOhX6f5XEnim1S/GBj0c+
	KraqLevsSvq91Qh2qxfE/TarZf6S2dohFK99mYUlWgsbRId00e33Eo/h4mfE6opIr6exE48MTX5
	bE1kx0aKb9USRVCNnnlyWgW2DXtKo5qWqRXtz8hAC4KQbDc59BNGQaMYAYckw==
X-Google-Smtp-Source: AGHT+IGnNpiYR9YRPDiKPN9Q5vTAOHi7xpfdLlQY2S9l/FJYyvgp5XVUlnCd4fDLpn15Z3eTjLxA7A==
X-Received: by 2002:a05:6a21:7895:b0:1e1:ab63:c5ed with SMTP id adf61e73a8af0-1e1ab63c75cmr2452719637.23.1733724265250;
        Sun, 08 Dec 2024 22:04:25 -0800 (PST)
Received: from localhost ([106.38.221.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e34bbb17sm2104894b3a.56.2024.12.08.22.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:04:24 -0800 (PST)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: slave-eeprom: add latch mode
Date: Mon,  9 Dec 2024 14:04:21 +0800
Message-ID: <20241209060422.1021512-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The read operation is locked by byte, while the write operation is
locked by block (or based on the amount of data written). If we need to
ensure the integrity of a "block" of data that the other end can read,
then we need a latch mode, lock the buffer when a read operation is
requested.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 5946c0d0aef9..29246ac7d350 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -33,7 +33,9 @@ struct eeprom_data {
 	u16 address_mask;
 	u8 num_address_bytes;
 	u8 idx_write_cnt;
+	bool latch;
 	bool read_only;
+	u8 *buffer_latch;
 	u8 buffer[];
 };
 
@@ -49,6 +51,11 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 
 	switch (event) {
 	case I2C_SLAVE_WRITE_RECEIVED:
+		if (eeprom->latch) {
+			spin_lock(&eeprom->buffer_lock);
+			memcpy(eeprom->buffer_latch, eeprom->buffer, eeprom->bin.size);
+			spin_unlock(&eeprom->buffer_lock);
+		}
 		if (eeprom->idx_write_cnt < eeprom->num_address_bytes) {
 			if (eeprom->idx_write_cnt == 0)
 				eeprom->buffer_idx = 0;
@@ -69,7 +76,10 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 		fallthrough;
 	case I2C_SLAVE_READ_REQUESTED:
 		spin_lock(&eeprom->buffer_lock);
-		*val = eeprom->buffer[eeprom->buffer_idx & eeprom->address_mask];
+		if (eeprom->latch)
+			*val = eeprom->buffer_latch[eeprom->buffer_idx & eeprom->address_mask];
+		else
+			*val = eeprom->buffer[eeprom->buffer_idx & eeprom->address_mask];
 		spin_unlock(&eeprom->buffer_lock);
 		/*
 		 * Do not increment buffer_idx here, because we don't know if
@@ -152,6 +162,17 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client)
 	if (!eeprom)
 		return -ENOMEM;
 
+	if (of_property_read_bool(client->adapter->dev.of_node, "use-latch")) {
+		dev_info(&client->dev, "Using latch mode");
+		eeprom->latch = true;
+		eeprom->buffer_latch = devm_kzalloc(&client->dev, size, GFP_KERNEL);
+		if (!eeprom->buffer_latch)
+			return -ENOMEM;
+	} else {
+		eeprom->buffer_latch = NULL;
+		eeprom->latch = false;
+	}
+
 	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
 	eeprom->address_mask = size - 1;
 	eeprom->read_only = FIELD_GET(I2C_SLAVE_FLAG_RO, id->driver_data);
-- 
2.47.0


