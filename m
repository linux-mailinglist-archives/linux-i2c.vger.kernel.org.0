Return-Path: <linux-i2c+bounces-11475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9AADA4D1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 01:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883213AF33B
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 23:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B517263F49;
	Sun, 15 Jun 2025 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCOaUztH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB517548;
	Sun, 15 Jun 2025 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750031365; cv=none; b=ewskm0b/iGwBN1+xXbv0p5TruluWHga20CWscEJKSirjBek3lJQB/qd1ywD02Ujx5MVrdRdDvHb9eLpwyt80gJ0vroqo4arxOkKZEJGfhLvsYP/Jg/9tf4b0V03FF6iiq3V7AUKKuqfxEGITZ9aDuPXWFdlgn6V2fqKr1vOISR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750031365; c=relaxed/simple;
	bh=ZR+Ka9Q5bmbaVz87WlLOGojTRue5vQwJT551+M25uYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PwcQnK204ahuBcArvg7RxnHrIuwOvf0VBQY72E/hZUnCNMvbrmoPx9JPAlBT1TvWsy8cpWzmM7AtzDc3s+WBMgXgbY3SJSrS80T2svX3l5CqsAYhMTbPeXkTyXYbG98swRzqaAQhA+fW1ypO/GMT0spLXML4J602rQXEob3ol6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCOaUztH; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7086dcab64bso33484047b3.1;
        Sun, 15 Jun 2025 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750031363; x=1750636163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG9HUyM6bW1tFji2hu6a2hM7CvhozNYb72MSFTw02W4=;
        b=LCOaUztHpHgVi95XtiYPM9Q9LPwYjVmPXTOSza2hQ5w2B54ts36xijKUh6bR8d5WU/
         FtWeEzPaleOLjCPpAkVJ4kqCanHTvMeYhPbqApnDY3PVfe2mjhvAik4XJH34lO63O5ZH
         Bn0Mu2jzPaU9wx0Hv4dlKzWwZmGJR5ccftusz0V0DV22W9vn8tOya2LYyVe6aWNEORlb
         OTfuOO6s/+iYegmG9U+yBkMY2XoFIG+rYzTllgUOUf5z1Y5M/WPoAlw6xYoHEfy5Kq6D
         /yCPNe8x3xJRB0VdXrZs4w5OAEuu2QbYqWGwRS+yNrDdmX9uMsZNKidYyq6VcEb1g2td
         NoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750031363; x=1750636163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG9HUyM6bW1tFji2hu6a2hM7CvhozNYb72MSFTw02W4=;
        b=wtFUwPPuh5W7i+yD3KwFD3djLvBlJMUfI5+VT/E+hB3eIdtLUN+47Q5NUDVi/uZ9DP
         OoknYqleYisBuspobYUEpg1rC7RqdVCwj3Z1hoGIFF8kqYJhX7vgrNkJXg77hT+7DVRW
         Yzx/Z2/JL++kh66+5oHx+m3hHJxqV3cXdFjU9t3s1bQHRNDA7MlArgEQtmigSVQ2UziA
         AHp/FjP/XGyRUo01h60nNRedY22s93m/ahjBrhMNLswbzZQrLe3tDUz4wUGOJ8aVbDcV
         1Tgo21xgqf2f/sMlHNMFohPc2v/DVh/jPoOECgs81OxZo3cSqvvo1qZKaqk0wIMsHc43
         +sSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+NsplrtmkqzkkrbssCT5zmMQKImDyB7pk307XE99OtvveRlC3BJoq6+MdWkBqbZa4sJk2jk0JRI7e2fZq@vger.kernel.org, AJvYcCXaKoe+kXgNYHkZ3wPp5HFuOcpbpzywHMct6t35SrTwZJQQFbqUIEVwrTqimiDwahtvQhAosfM0+cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+DOBiLBUoy3gRuYvZfIMLoRnl6tRb1r9dqSiFNb9WCicwHH0
	s2ogRNszqwKjmH9xMjXt+3Q00HHO+xDmPllPVks2Ox8tJSkoUAfWj2kZ
X-Gm-Gg: ASbGncv2Jn46bWJyznt6UQqDvBSlg8j/C+YJwdEETA7XJYt9wNZO/CUhFj9Ktuf1Lu+
	N+dbmjJxh1JRnUi5GpQckv0+w2glz6q8NwaBsFBysoVkMp5fK+fKoR8hu/dCPlirlDaAUxK4hyV
	SjHyqp4uBb+ojm0mAtcKnfJ48YHf2jy4KwAuIA555e+Et4DBRHk9XYakklmhkZk1AeezPjWfYhC
	eKD4KVwrtwE1+YZXThHUVR3MZ50jGcwdiF/BJoK7JH1N7Yj7S63rJOWAP51hZX2bANmdHWijJEb
	No0CAx3xjwsA6AChLZ2l7/NweMyBx0do5NkSGw28ehE5B38gi2KXjahvLVmlGGgyyBtlRToBN53
	X
X-Google-Smtp-Source: AGHT+IHXglmGtVcHuPiRpWw41+NQ5ucgQ2jLPsoEFv34seFMTXSXLhbF2JBJp5LIoDqgsY2+4f1BPg==
X-Received: by 2002:a05:690c:7481:b0:70c:a5c2:cef8 with SMTP id 00721157ae682-7117542acd4mr106912707b3.19.1750031363289;
        Sun, 15 Jun 2025 16:49:23 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7118ab6aa0esm3416187b3.11.2025.06.15.16.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:49:23 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: conor.dooley@microchip.com
Cc: alexguo1023@gmail.com,
	daire.mcnamara@microchip.com,
	andi.shyti@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: busses: Fix out-of-bounds bug in mchp_corei2c_smbus_xfer
Date: Sun, 15 Jun 2025 19:49:19 -0400
Message-Id: <20250615234919.525431-1-alexguo1023@gmail.com>
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
 drivers/i2c/busses/i2c-microchip-corei2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722..a79d4d327f20 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -492,6 +492,8 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 		if (read_write == I2C_SMBUS_WRITE) {
 			int data_len;
 
+			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
 			data_len = data->block[0];
 			msgs[CORE_I2C_SMBUS_MSG_WR].len = data_len + 2;
 			for (int i = 0; i <= data_len; i++)
-- 
2.34.1


