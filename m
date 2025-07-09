Return-Path: <linux-i2c+bounces-11884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CAAFED6F
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 17:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8E31895D29
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 15:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F6D2E6D22;
	Wed,  9 Jul 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cynnnp4d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F1238157
	for <linux-i2c@vger.kernel.org>; Wed,  9 Jul 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074063; cv=none; b=XDTPSmf6mW5ve3JYWss8kPI+k6EE4zM5ZQZEDMFjUDK5BzqEpuUZgpeExj2C2EuaFZepK01PD4X6DRSKZ5gvNfmmKvdolS32csCZrHVSa6cUFvXsgLmEO8NMFMVny6gXjEqeA7BcQ38d6dFyO8Uv/JHTinv9mrvLCsOD04ifZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074063; c=relaxed/simple;
	bh=t5+o59dyBvPA7bqoUaNy9Xz0kUitQAN0MDsbwVazwh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLHRsXSmtZIveNm+mUD9vuwZZx+7la6yufbwnbRdNMLfbcXGzUMtFOXFPlWAZZaPkwQew5Lv1sDg6ex8S8ofHe5OaCIu+5ecEZwFy32m7GkD/UjEedDRLzD/xVNC0HCWeXSdKvHnfji70OfVaGzPzJKXXFOTrS4Pzv+YKs50C0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cynnnp4d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23649faf69fso414515ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jul 2025 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752074062; x=1752678862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbLVmFbNIp84nKm/w3pwjDXrr7Sz2Qn+3ewjbseJhQY=;
        b=Cynnnp4dj61Mln6sO7kDDS1oUj+BGlvZWPksosMk7TbeEL51YmhJCKugXb7u/5FLy2
         VNm8fIGHuDJcB0T5Ua1P2dHnBl3EAeHJO0f6FZ0U6tKEn2jrYBYy5R6UX/vdmx6oFJnt
         f9Hd5oK/1hkNp7ldh/weFTdtC1MCME6KdnsSTBwAsYsO8TMETcsfAXKFD19C0FzeEIzA
         kIkz+TaMi4aJnMnkNJ4fncU1vUF9+yRD0TyqB6VWpevl0yejYY70BJ45xEGFubDvh3Ar
         HV977Jqcp+thXJoJ45bWbUhoJosh+fnQT+Ft3NQPDS60kWpBk9R3kthUOuwBXKVjzJ6I
         kpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074062; x=1752678862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbLVmFbNIp84nKm/w3pwjDXrr7Sz2Qn+3ewjbseJhQY=;
        b=Xi/Fi/lxWfly9YVWJZ8GirjOo2yQ5IXGN0H07LYBYwbo7hi7jOL1s5EdNCdleDklCj
         4xghbQWh/KldZVOhC2vxu8oGd+bwIwa35lkuPVS2gd4t58SSYbbHWze2xeChea4OthPZ
         FjxA3hPEyUT4XkAyudfyaEO1uMg17a3NwENWaO3qjeAE6DeRCNt5feMV+7lVpNV9Vxvc
         jW+8qyvwycmtJqyMjblf6EdDFHpV1zPHFVNl779esC//PkMFEHtJ2Iv2TrYDdFsMq0P0
         rVSsBZBDaeAQVjPcjGmz+6plrbT92vODwI8N387c7fAKM2/B5o+4JWKCYI6o5CgGbNXv
         maIw==
X-Gm-Message-State: AOJu0YwmFN/oQ5QCNQ1zPPg5mjvNk6EEOFKqgSqFOmUSROGIbe8txpoy
	OuvGTSlhv71DVKLU7Be3AFv0acr4iyQ7l/3DZVc6CHiZF5zvR9EklWARC18Gtz1e
X-Gm-Gg: ASbGncv0R3QIQ3tP4GKnGQgJJEXozeA/bEgmS6PqjWlLbrsECBnRo1x3t8X3nZdLBGq
	l7d69dQs04CmMOXoFajHyzGwkMESmS5pwbhYUor2vTm9iRKJERCnAcUMHycMu+iFxaCWpKRXIvE
	WctOSc12JE/gI3KdNnK4jLgUD8nt9uO0RrLS8c3LHSEKXYp5u3Bukx7LKSqNfbtpirnkBehBtvF
	8BPMcVaOuX1xbjj/05dYarA+S4sT5KI9u/pN3sQpzOUj0TOupUDyQChzAteZSVWV5yONtNLOurC
	Jdw12iamBGYo25OisLIO4br7ApZZYEHILVIKZQUCZ3dpO1hkFc4YAnbrCqHg3XbBgrT7pyG27RK
	4Ir1zqjYRmg==
X-Google-Smtp-Source: AGHT+IEFM1LEDuXwbJM6dZB+/vAvj2DyGnyfhwext3qqfuU7lkYPs6LnncB1FvlRLr3/s7Gs4HnccA==
X-Received: by 2002:a17:902:e5c1:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-23ddb2f2241mr54309885ad.29.1752074061630;
        Wed, 09 Jul 2025 08:14:21 -0700 (PDT)
Received: from localhost.localdomain ([223.181.118.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm13558373a12.44.2025.07.09.08.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:14:21 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	viswanathiyyappan@gmail.com
Subject: [PATCH v3] i2c: Clarify behavior of I2C_M_RD flag
Date: Wed,  9 Jul 2025 20:37:18 +0530
Message-ID: <20250709151402.7811-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709151402.7811-1-viswanathiyyappan@gmail.com>
References: <aCtgNpWs1tJ1FltB@shikoro>
 <20250709151402.7811-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the description of I2C_M_RD to clarify that not setting it
signals a write transaction

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..a2db2a56c8b0 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the transaction is interpreted as write.
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
-- 
2.49.0


