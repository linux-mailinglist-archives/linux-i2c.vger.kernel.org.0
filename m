Return-Path: <linux-i2c+bounces-12408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499FB331FB
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 20:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DC23AB4E5
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 18:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F2D2E0B47;
	Sun, 24 Aug 2025 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLm+qtH/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDE2E0406
	for <linux-i2c@vger.kernel.org>; Sun, 24 Aug 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756059276; cv=none; b=nd00PtTIaEUgH1DCuHtBTT/2ehD6dkySGlTUOu/iH9Wr+xePHnDFKkoAWAHYPnB8uEx5vXxOt6RmgM0xQzPwQtDTfwBHRyLBrX5ot3SO9VzLDp1cGUMmL0rMceVg4j82MZnktXoe3ktKcAlKCdlCXBpWtQ9oNPi3Drbx/w5uWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756059276; c=relaxed/simple;
	bh=E6qlPit+0JLaINuwDuMheNspfBMT2l7NIZsN5O8KaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLhbPnHuEIntb8AFJiHs4JHUTwey03xSNByErYOcVLJxUSw21OKLz8RILom4/h9vqY9fDn8P9DEYAd6S6Ouqq/tTldr/aF9rijtEp5BAGnLj3cihDFBIz8FrKKhJZTl2F9VA+IBeY2bo9DL/UlMbYBr5iQP82Cd2fyzr8DUg03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLm+qtH/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3252589a4afso1719603a91.0
        for <linux-i2c@vger.kernel.org>; Sun, 24 Aug 2025 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756059274; x=1756664074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsEKZRNy8m/8mJKxoM3IpgkHHrCyJtWTph1N9Xq1rI8=;
        b=nLm+qtH/uXXtjQH3vlFY3FCpaz6lAuwAPdXeDJHKBl5eViNIKdGmB2e2pLn1qNvPML
         cO1R3ULeEo0Z9RQImFvOadl9cgS4M5Axu1JPz0eXs3c5z/0MFL2XI3vpuYX+pioJ4Q3J
         eK5qo6rpHr6Vr514xEf1fPWhfDVTp+FbKoiKxwUhU00pT9Iqr3RWOD5b0ukuNUHHPj1z
         tqg+X+T6RTNwKUl17ygJ+DnHLPPeefsGUR53w3lA/aUB/Z1We7jOGXGv/7AHx3WoJqt7
         Rbq+mee0ASBJICFHHy6QrQ3N8MgxqVcqJawU6G8G2QeVpLoBp0yjH0ZMTdgjlhM7btAp
         vxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756059274; x=1756664074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsEKZRNy8m/8mJKxoM3IpgkHHrCyJtWTph1N9Xq1rI8=;
        b=ZC5P3UwNhKW8i/CccHWZ3qSpE1ICLfMHCuDdC9TojpJ6uuQH4AhXw//YwE/swxB6/Y
         WjnHVhGfUGZSGMhX0BqCiK2xWF73rruvMtLTzMWJbq67Q5qJ/MxizU6j5wxfPVno/6sH
         wqQ5IwcXEeKTMOxzWId7U4Qi06Iv4DWShXqwr6F3NHXmg0Ttwp330Sx5pkpcjkGIILwC
         cUWnobkpCUmcf7m63sZb+r+BjQ5brSIMU8D2tAG0fBSRLszDzw+fJ+ZToKYnMZipD5xH
         FilS8pIS5apBr905Y/BdnwvHZdZn/dEKQBXmc8dsBSvSyvUDqkEHX5cecxKJVlz+weh6
         UUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0BXUhEVXfiq9Cygqk5Z0+0gXattvHjtGx7KSQBuS7b9y6pwBOZLF1CVYFXz5Nlu8M5V9gNP5Gy/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0qs6rBIykKlsZRLxmhY2LZmDJAlea+MY035qvPTyaQJrkljc
	lVFXTAgX27bCM6AsaKiuQ+SM4WBSnlbUJnW5CQgCvRDl9r78PdgdIxgsTsmnVp75cbo=
X-Gm-Gg: ASbGnctE1gr8KSjpHmEHIBptXHC/BHuuZN5z51gMDZNhTLMZwhFVl6LAkEgy9pBrxz3
	3kc611Yl6p2IN11ssc8RMZpzqpQ1oD6GDL0jvwtJ5c7KXGCuRPpoRwtzvai1wSAVwp1Cc6MF6j6
	1wp6xB0ox1t1SqdwwHJNh2Tj3MGWhYUuxyB73gDOxO5tUn7iHiT2vrCypdOLJHAgnF3NiwCJ4vU
	rnWn+wzBV8oB5WNG82Qyb6Rfft0IkIqbnm8bXR1wIXjQiqpcQTsq2a+oQN1dOJ2uy5q92OQXv5h
	iX8eHz6aamEfIS4BL8f/2pkRz04ctf0acXV5Wd4joU5VwRPd/rp080kPB6SsWsaUU0aqoeYDhcF
	AW/xqJcBHd8CO0jmYSRcYtWji
X-Google-Smtp-Source: AGHT+IFubpj5H1hvOrgzW5L0eyEspCbDndCahow9ISpyF+VK4PFOufJKUIFrQzP0yKsCCaNX+Tn7yw==
X-Received: by 2002:a17:90b:3c47:b0:325:1d6c:f220 with SMTP id 98e67ed59e1d1-3251d6cf486mr11713931a91.19.1756059274054;
        Sun, 24 Aug 2025 11:14:34 -0700 (PDT)
Received: from linux ([223.181.107.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb7b6fbsm4756532a12.30.2025.08.24.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 11:14:33 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: peda@axentia.se
Cc: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] i2c: i2c-mux: Simplify boolean assignment in i2c_mux_alloc
Date: Sun, 24 Aug 2025 23:44:16 +0530
Message-ID: <20250824181416.4316-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor boolean field assignments of the form `if (a) b = true` to `b = a`
in i2c_mux_alloc

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 drivers/i2c/i2c-mux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..abf63758856b 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -241,12 +241,9 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 
 	muxc->parent = parent;
 	muxc->dev = dev;
-	if (flags & I2C_MUX_LOCKED)
-		muxc->mux_locked = true;
-	if (flags & I2C_MUX_ARBITRATOR)
-		muxc->arbitrator = true;
-	if (flags & I2C_MUX_GATE)
-		muxc->gate = true;
+	muxc->mux_locked = flags & I2C_MUX_LOCKED;
+	muxc->arbitrator = flags & I2C_MUX_ARBITRATOR;
+	muxc->gate = flags & I2C_MUX_GATE;
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
-- 
2.50.1


