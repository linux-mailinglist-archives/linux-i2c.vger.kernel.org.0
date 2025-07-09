Return-Path: <linux-i2c+bounces-11885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FAAFEDE2
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 17:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24FCC1C426F8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEC42E92C7;
	Wed,  9 Jul 2025 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TihiEY6i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003DEEA8
	for <linux-i2c@vger.kernel.org>; Wed,  9 Jul 2025 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075419; cv=none; b=JNwMOwmR1QtJOPRuY/N2gYsiGMqVe+y0/iE5NV3+m3cWskQk6VU3224ew/b/C0TlIrMa7heXqJZfRkAuc9rn65c+YUpvfPlyA3vzrLY5oP9WPYFYzWZDrNVjHW4v47PYIbWbOeDMRmIA5PT6aCzi2oc6UIMyzwWhMEcPWkSihQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075419; c=relaxed/simple;
	bh=a4kq/Wjgg8nLNuDk/Kiki1bSw7JZdr82NlwfnGw6v2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XWM7fTEstn79MC3mDLWN1CyTKlqZ5L35fAV1uoxMj5yKoShF/E091WjYTE5NFprHeOmBTcQmAwjRBRBr+LyilssssA4JARys6dLIjqYLoLStmZQrDsDXsY4POZ+rFwMUZzpvgWvJh1Rjr+wIijhgKZQNUWcPFsG8LXEG/fpHK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TihiEY6i; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b34ab678931so97939a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jul 2025 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752075417; x=1752680217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQNsPT4x3Rz7GlzUociMCr/mpU7YylbcbwnhzKGrGf4=;
        b=TihiEY6ig7qy64p9Dg3wOzqNEpWaIydGMw8JkdyaEd1p6n+WRKK9OswQwye9M+Gqw6
         B2LdJ5dJVQnoqtUgfUvur2SXcdfv+KJL8X2Bmn6NapKVPUKLQD57qSNu1dTvkNJZspRS
         pIhbWyFYtChakA7FGW73GBwvui1lXR67yHlss/rraJ+qQu4LYix1s2/9PGSTB8zbEpgi
         eTbUDsEjlIU7lcOk1s2Ji+PFxGX4IUSTAO7wDjTG3GJNCnqAa38FRC4rd4V7b15NnxQI
         TAT2+j/yh8T2i4lTqcku4y6VzWNpyU4/+LewdtMpztzY+iitbAukSuWEb+WhHzClI8j2
         FkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752075417; x=1752680217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQNsPT4x3Rz7GlzUociMCr/mpU7YylbcbwnhzKGrGf4=;
        b=BfqHNL8MbaDH/EjiR9p2sGD/WDArvCif/dINipElXxvqkoCQ/3qrYKLuoDvk2XIBk9
         Vpg7QMYCX1EFPKEMWHrhuxFRwerVu/52Eo77UvHa49dPY1UilTHlyxToTZBV+F4vrG8O
         xlkrtdJoIa7je9qBM1atVIgoG/hUb4dAWNtzDEqzTXeaMJftP60Xy1SILECkvtbT25CX
         3ecG6HrJi/hyHHT7C8rGGiW7/lCx7fL0C6h1YujVBDgSpppNnoTHRU5tUUDz6FVWetTh
         Ikqq/ZY76t4ZvqHm/dEx/FA3cWfq6a89o3r8zCGlqUs6dMrJxLlk2QiEhhtPm3LOtunN
         LUgA==
X-Gm-Message-State: AOJu0YzkmnOS9UZCRW0TSODsCfPz+tiCx5paiwUlCWEfVgc2VaGSUp3z
	Y/iFuirRJhLvvty45WLrKZ8XeRyVyvsuN+LInBF3RnE+BANLlm9LI9p1
X-Gm-Gg: ASbGncuhGgobO37XgLFsPLJcfadvUU+Y6h9W5nKZYEFrpfdhp6M4Pa9EWcF2Hbe4J8y
	dVaLLPCTLfhkGDohRStTBkEp8wvSUfX70QZ4eklf9+4yz148fbJFekdeghdKgAmDA4AfpdciUmv
	zHUrMbORTd3RuMHLx0PEfF3I1rtYvqjelsS3WPVaT+NDkkfiLldrEbKgqP3UCCGMtTda/TI8juE
	LI4N6zZh5wC1Kpl5UcRiPPYegzEpRfGo4NJs4+ao5k5TxqD6Nt14p3/95WqNUAp3Cb9h5gb6lxK
	dtzP52CHqXNxxDvrRUk7ANbP229xVb9uapi6UnAm31Gn66b+qtITcCDHoKmDWBveHEsNQbtHyBL
	tHluaTIRM/llXgPEJ2Sb1
X-Google-Smtp-Source: AGHT+IHaAjsqiYCyVRtErfDj/Luo6L2/pfBgGXgy2dHuf+3sne9F25XYJBWU4O6d3UkrPvrMibDH0Q==
X-Received: by 2002:a17:90b:57c7:b0:313:271a:af56 with SMTP id 98e67ed59e1d1-31c3c30a79amr464942a91.30.1752075416898;
        Wed, 09 Jul 2025 08:36:56 -0700 (PDT)
Received: from localhost.localdomain ([223.181.118.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c324893a0sm2047154a91.26.2025.07.09.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:36:56 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	viswanathiyyappan@gmail.com
Subject: [PATCH v3] i2c: Fix grammatical errors in i2c_msg documentation
Date: Wed,  9 Jul 2025 21:06:44 +0530
Message-ID: <20250709153644.10778-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following grammatical errors in i2c_msg documentation:
1. Makes only sense in → Makes sense only in
2. may have changed those standard protocol behaviors →
   may alter the standard protocol behavior

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..aa751389de07 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -24,7 +24,7 @@
  *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
  *
  *   Optional:
- *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
+ *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
  *     in kernelspace, because userspace buffers are copied anyway
  *
  *   Only if I2C_FUNC_10BIT_ADDR is set:
@@ -66,7 +66,7 @@
  * @i2c_msg transaction segment, beginning with a (repeated) START.
  *
  * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
- * passing certain @flags may have changed those standard protocol behaviors.
+ * passing certain @flags may alter the standard protocol behavior.
  * Those flags are only for use with broken/nonconforming slaves, and with
  * adapters which are known to support the specific mangling options they need.
  */
-- 
2.49.0


