Return-Path: <linux-i2c+bounces-5939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785D9655E6
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1B4EB23CCE
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A3A1494B4;
	Fri, 30 Aug 2024 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ+xp0Ec"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E751369AE;
	Fri, 30 Aug 2024 03:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989737; cv=none; b=Mh6KXzN8cTp7rKcsTzMX0wF8IhaYJW9Q3nM+zyr91ef5pdTI+yLWIIXwwwLbULQ8xDb3UBBiArRWfFj971QvtsoIk3Ola5A8dT9hiK4bSFdx2VGPu1g5c3bYh1dSYuCQqhSHkDxkqs8QadiktNT3DJY+wnnSIyDzSDVAKlImncE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989737; c=relaxed/simple;
	bh=/Hh9cHSOWQABreVbQ8MWvIlvXbfjoJgtyHNDAPmLs54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KGCUJgDSyPLI3ob8fYkLs3PmYTU/lqXq3ZYg3M3b10J50JtpIwcUUOOvfp8EUYgWHMntNLh2tJPQAlrLH3AYOCoSpzfeaZCgHZbu9HjbA+YOVKxkkugx1EhQbh1mq+tyRFzegAlTGnIfrb9EZr9Ip9pFKsdMKcZXoVm1bFZEA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZ+xp0Ec; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20203988f37so13549695ad.1;
        Thu, 29 Aug 2024 20:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989735; x=1725594535; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Yuwb6+ZqfPT0JtISqh7yyK1d1c60sdj5zghOt5FrDU=;
        b=iZ+xp0Ec4pbvM4Z8Mw2lxhoRw5hTYNGklx9fg6NxlQ2RfC2NQLCP8Y9Y6SZ6GQHTlB
         lmbQy2PbQjaIXpV398eT4TT8ikfhawBF/IH77ff4gB1lSydsk8aS5KpV0TbSIVkkxGIi
         dVFWMQlePHvCbjrufYdzQNLTYZDnmlOJ0bvdJfJKtwGPUq6BGd8TmsUO5phLFPlyh2mb
         SSQbDAaOm95u5JsQ7I1alNE1Rk03nurRS/GO1m4xouCGcDiTnnqOgrSlnliu7BAl4ujW
         ZhVXQJvbtEuJkDW347ND12InmxlcpI/IXr1jR6Ey1rV8NNBtaSd9llhxyWFyIWvGtdBM
         fBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989735; x=1725594535;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yuwb6+ZqfPT0JtISqh7yyK1d1c60sdj5zghOt5FrDU=;
        b=t4r3vvCljDZ4Gpj4aiVXUZUluZrC0aqQIJ+IadHdoONHscWm2NJwgs14CVfA/ZPAMi
         Pxl0Zi8AbZ66xvkOAjr+UhpqkScr52P4Mjf096CSVx7urW+lgiKB+H5N1aGOjVGQc6hz
         Kcph3VptWv3mu6Qfhz/vvN9zAlV0Ggy9aqKrvcfUNVxk7QWti4Op7qf5tjn3Qt1o0tIl
         kB/2pPMTFli+w0gkfTFTu0YOO2gCuEHGZmW7nnLEwxeY8f/8MjGhbhxvcU5udoU0PDzY
         tu/uRNyeIe3SrSU8cCAQ+TI38WhdBHNkl/xzZ5Mp7Ke5+/g9Hl/1+mj+7fIyF4ZsJgp1
         j1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCURpA9qjVUsI8ep75jpVTgPAl1hzEx5WgL0vYq+REZEMvm1Rcl4ehgcaMhTAYkWDhbyP2k9kbqUKHc=@vger.kernel.org, AJvYcCVodA05hjImQieHYamE+EW92tpo+1EJ0mj+3aVHpWlqJiKqKTCx+QmitHJtmlgMS5+ru3Qat960uIZMys/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZ/wj/DUsp8IgBulFRD2UUZICgaIq221vTEBtjlNlq+KDi7yk
	VU5C/qa/bfT0YtL+jC/lTIiqx+0QtjEH7v5U3kOVk7I6aa3kSi8=
X-Google-Smtp-Source: AGHT+IFQRsKAjsdhrL2+vAvZzE83PEnwKYSeTkwNNHy+5kcEHFwYymLvN94tr8b32+bjiWubAZNy8A==
X-Received: by 2002:a17:902:c94c:b0:201:e646:4d8 with SMTP id d9443c01a7336-2050c3a7166mr62180945ad.26.1724989734783;
        Thu, 29 Aug 2024 20:48:54 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1225sm18350175ad.22.2024.08.29.20.48.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:54 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Date: Fri, 30 Aug 2024 11:46:34 +0800
Message-Id: <20240830034640.7049-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
The original design supports 10 slave addresses although only 2
addresses are required for current implementation.

Restore the npcm_i2caddr array length to fix the smatch warning.

Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..bbcb4d6668ce 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -136,11 +136,13 @@ enum i2c_addr {
  * Since the addr regs are sprinkled all over the address space,
  * use this array to get the address or each register.
  */
-#define I2C_NUM_OWN_ADDR 2
+#define I2C_NUM_OWN_ADDR 10
 #define I2C_NUM_OWN_ADDR_SUPPORTED 2
 
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
-	NPCM_I2CADDR1, NPCM_I2CADDR2,
+	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
+	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
+	NPCM_I2CADDR9, NPCM_I2CADDR10,
 };
 #endif
 
-- 
2.34.1


