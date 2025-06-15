Return-Path: <linux-i2c+bounces-11474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83FADA4A8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 01:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62CAE188F520
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 23:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED37F1DED70;
	Sun, 15 Jun 2025 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXQEznYB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4261DA53;
	Sun, 15 Jun 2025 23:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750030391; cv=none; b=IdQOKQdm3wbpm591tzX3JSLHeSY/p3iCBAOeymrFqlCz5Ohvli+qX9HSGBVgyI+l6tMmwTBP1CmwJ1WBVzSZoXY7gDEXNYbhejcHYKH+hQGUv+l0bfA0gnKt6UNILXseAZQRFu9K+g4pgKEqgpMHIGw9rElzFYG7LTnjiaLrmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750030391; c=relaxed/simple;
	bh=YlPQk7j80QqOkmbUSSCmLcsvgr1t5V3zGkq/indYuZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LktmEj0Lky0MbFKQmUo2iLqMXpkq4fm6ik2Dkl7uE/SBRCc7DFa4hsV7oOGfYiPIYDef26lbB1lB7pM/AaNHvnJtZaLRsgibvXe7/ar+iqayOu7y0Wxy8AfpgeUki5755eI8sV5r6sSHpNt+JQa0W742Cw5LZI3fDfhAgWvzNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXQEznYB; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-711756ae8c9so13270677b3.3;
        Sun, 15 Jun 2025 16:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750030389; x=1750635189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsOR1EWstSUkJeN0xRWqZ1f8fpAyKGGlNEK9p2YjE5M=;
        b=FXQEznYBAFvnSsW0JKbaodPA/UP1T1wIlm0ZySccNhET9HfBSL/3mBvC3Rtw0fYcx7
         bKZb0YVahsZ8kVi33pmzFH8iZStdHW0DP4UkQZZbXGQjakWCuY0UnzuQjRhdQPqE/TaV
         WCs/EyEAdDI7Vu1oZtoOv8jX4ywNY+FsWa6San8UGlNU6CBOr+fe/nfuC/0AibMpFmS/
         JoNFthLqNhwHBDtpqaIr1zsAc5kCrkXkLKDmRNdLHKj4LCpGcUUred0qBgIfrs/KeuzG
         t7XRSdQCsLqS+yX1KmT1Ig6iHsAEdtz8wk+s/AC+z8HbwPV9jAUjQqcQhWwe2gr1xtZK
         jBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750030389; x=1750635189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsOR1EWstSUkJeN0xRWqZ1f8fpAyKGGlNEK9p2YjE5M=;
        b=gn5037whnkD4IUgbevdqvoVQRZDil5brAe70LcZ8iRBlPyngzfTeq/ZtYSjFdZzua2
         /mTZmpj+1199EB6JGyGj3lrZ0Deq4K7s4QcvuT5bavoe3yY4De8JmYRVqBhuatSmwemi
         fH/cfUGFp10Kk8U930W69VjBmOm3+dQsUqYyxebwALmZAGAvwgV8Wf6pe449yCQwrFw0
         lXj+L3/1hI4z9taGzMxSinLfBNWCXtoBGvLqcUZ+TkVbmVBZJ9KTnnf+rCQTzH+oV66S
         qydGDV9xRArB+rKKXsDTwya/COJ8qc4lwo7WewRS3KbINOxwsqbUs57vGnyreigxE9sq
         f2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUvjUBylkxgSueo9O8QQTqzQax1VnmAmq/MUN2euTV+GKJLe4nk3fR1CfLe6aCMfeSTANE9ckdmaWM=@vger.kernel.org, AJvYcCWlcDYeSajT2WFm/q6Agdt1j+cgH2Jex9uYS6Kj7aemKaMSqmxurd4LJpVLv7B/KXceHMaiLuozIh2PfxCc@vger.kernel.org
X-Gm-Message-State: AOJu0YxUujtlv4GASbh5UWSqxFQjuMc/TpNORj5WQi9VNki8/7xIOlTm
	4cXJujpyiHKnHX2ZYjnrHxPVGszZiLnH8y4rLEoVdWO66VGQU1QYaWX3
X-Gm-Gg: ASbGncsr4CYqH9a0E+5gufoByOpOVkiBEPh+OU9zccgInUIP9MkOizAoOkLMAT/lKvm
	GyKZBfAbslS9h4eXZQW6IcQM5ECpm3n+y+U9r+buLdjOeADAhErDfPooqhJjTlFQB2ifmsxeKov
	QjJTy/fbv8GS0v2Y6ZSrJpn2R2nJ06yH5hksQQ4m68RfSj50k7xttAlp6QngyPXxOjOHUtfD/RJ
	U1Oxun3q4V3kyOkgtCZRt/mEzy+QisWl6dxy+wiY7dy4z/pP+yjSNlEmewmg5rosnvM/gHI9eDX
	it+MyRTd832m5lraPAkoIywftIk1fHejUzlR0GJhp5K/Tt9EZKUsbhqFVGbIOJ7N3TF05PBfanT
	0
X-Google-Smtp-Source: AGHT+IE9GWdR36dFWzvR7zPclik2YU1bmIJCP2VuSSYLadb4oaCAbUyr3nD9XTV6Bof8zz4xwIzIBw==
X-Received: by 2002:a05:690c:4483:b0:70e:2881:2f5f with SMTP id 00721157ae682-71175432eebmr99852127b3.20.1750030389047;
        Sun, 15 Jun 2025 16:33:09 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7116e12f614sm10108647b3.105.2025.06.15.16.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:33:08 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: jdelvare@suse.com
Cc: alexguo1023@gmail.com,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: i801: Fix out-of-bounds bug in i801_block_transaction _byte_by_byte
Date: Sun, 15 Jun 2025 19:33:06 -0400
Message-Id: <20250615233306.498536-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data->block[0] variable comes from user. Without proper check,
the variable may be very large to cause an out-of-bounds bug.

Fix this bug by checking the value of data->block[0] first.

Similar commit:
1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
ismt_access()")
2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
bug in xgene_slimpro_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7503418be39a..aed4473fb9ba 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -678,6 +678,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		return -EOPNOTSUPP;
 
 	len = data->block[0];
+	if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
+		return -EINVAL;
 
 	if (read_write == I2C_SMBUS_WRITE) {
 		iowrite8(len, SMBHSTDAT0(priv));
-- 
2.34.1


