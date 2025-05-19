Return-Path: <linux-i2c+bounces-11047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 683B4ABC783
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 20:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1125D4A2AFD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD41C1EF0BE;
	Mon, 19 May 2025 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcB2U244"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684420C00C
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 18:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681041; cv=none; b=DI9tnzv5c2lvO65TXVKRK9wY6A5V3lCXlC+qALyJOzYZNYDPeRrCRhYX+pkrQyLFQdEbALVjWQU5p6VmkXbenW0mfn/HjRMEFQ58he5pbpPvP3li9YthVdu7MaEbPIw6Us2+gMNC/rbfDenAzfTBO2obb9lGZ3VDWKSGGHjPogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681041; c=relaxed/simple;
	bh=a4kq/Wjgg8nLNuDk/Kiki1bSw7JZdr82NlwfnGw6v2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cuP8VXEceNWXPtF2CxeNbMcd7q12BYAJduBvuN8hNts/3VEjYwgEMaVBLnkiDADmDm0QEVrbpUReFsRrU8p/U4L4wNlS8jjG5Di8e/vsIuGQIJzz3PJ2hzCI7j0alCocdHwQC2xVHtq+TGnCABRwd9UY4fWCqy0Nke/0h86hZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcB2U244; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2321c38a948so20143245ad.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747681038; x=1748285838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQNsPT4x3Rz7GlzUociMCr/mpU7YylbcbwnhzKGrGf4=;
        b=fcB2U244anM/56uJVRwy/qMHSq3K9syMklySO+mczIdbqd3KTszr81hSQ8iGMwDgbr
         TO9zcdiQt00KxYdXZQXIRMhwlX3Sl0wRe6DD62vzwgWBCN2M7F3v/LPw/ZuzCODCi5Z6
         hjVriBQFRg5n6qc92UIw8NiMM+2dbS9V5qYBZ9aS7Sl4ecSX3QpJ972ZTxEe7KojZKDA
         hMrBDKS8m5iZ0H/t1/jFUGnsnf//ReGto4knU98aWhokdWR1I2eEsXRiHn1FP1nhE2wf
         suoodQU1xdYWJvOGt5wiOWH/39v8dARVHW6iECihlPhXh3lK9FP3t60qmx1dOqAUb8dc
         6OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747681038; x=1748285838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQNsPT4x3Rz7GlzUociMCr/mpU7YylbcbwnhzKGrGf4=;
        b=JUGcteOlZtenHV/2B/nsJwK7EGrRwXTsJF/Hkh3z6iCc4/wnkxhgSsZqADIO+zzXmJ
         GL9J0FW13Iidd/zlECQxt9qMddb9p9nmuVc1cjIQnVRINR03lAmnROy7zRwjoycNvgcI
         TMksHa+Phb6gHna6fubcJlEHH1kjyOgp0wNBrZjr6AUhD70qmFGfQ38lmktm2aSlwFJd
         VavmQqz6QLRVpb3Ce6jOptMew+34GOJL6art/HuiekendmK0BmLETuDw3aIP1Y6B8rMG
         6nJmOCYXG3GVInftkm/72taNUzTJ/cy0pHIUsJ0zUrpOtO1jkGLtbDM6NekRKnsCtz8O
         aS9Q==
X-Gm-Message-State: AOJu0YxQ+i5bTnJN/lJ68j0XvS0QuEmClmvoeefdJpHb/0w/Ev59xmva
	JtI55e8GFQRRLZRchTWigruBXPZ8xmdq68ryLOUpeshxoHd+3ONqEaH8j1W6e7Om
X-Gm-Gg: ASbGnctdmSoQU+BTL5CfonVP6YZ9sktFiMpqFampsH9T7ri+1Cuxv/WHhUDXHs4AMZe
	Q3oYgaRG9HwpVYMiKv8RsJDdSDHeTJ2mcpWkqH8ZIkaiqs0tj2WPj4UxOsWRJfDhlTLsbTVyvS4
	w5e0QP0xROV6D5NndO5cgcrsR2U5n10GfVGouDYRIkExXbXnz8DnlHNhxfShzce98Ve8WwfO8PO
	qYwz9xHP4wUbYZXRr17sofk616HnKZZM0mnuGgG7jZsabwPIm67dX6fgN4c8psJXnDSPaLYHGw8
	OtYzDFLidF7NOHab+oyicVkFgBQU8RGmDtATl8BhmukTfvO6bf4V79Yw5+dO/dep5N6KIvjmQI7
	52hUeUGvllDI=
X-Google-Smtp-Source: AGHT+IEihu7+LKk/JIzA+/+algltq08bcoLf1r3xHd6B+8k3E3XvZN7mf13uYpOfuxixsgQQts/pEQ==
X-Received: by 2002:a17:903:2582:b0:223:f408:c3e2 with SMTP id d9443c01a7336-231de35f14amr155665015ad.14.1747681038073;
        Mon, 19 May 2025 11:57:18 -0700 (PDT)
Received: from localhost.localdomain ([223.181.108.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4b1020dsm63611305ad.104.2025.05.19.11.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:57:17 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: Fix grammatical errors in i2c_msg documentation
Date: Tue, 20 May 2025 00:27:03 +0530
Message-ID: <20250519185703.3957-1-viswanathiyyappan@gmail.com>
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


