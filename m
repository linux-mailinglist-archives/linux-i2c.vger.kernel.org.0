Return-Path: <linux-i2c+bounces-11185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56AAC99BD
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 08:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6623BCED1
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 06:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3BF22A811;
	Sat, 31 May 2025 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edwMxnAq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827E22DFAC;
	Sat, 31 May 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674678; cv=none; b=ahU8HECOGBZRqGSV5ACsx8QyLbRHIvoDm4EFHx1/avMynsems7KK6lo6+f2PdeufSqDv9s7Vz5x3AiZKvHj0UkRohcHyk7Z6ml8wxFNmgXIETFPFwlfulxrbhafHrInbPwuj6uJxHMlwk8CUBQ2q2WONAExFKpwmkGWWSphVJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674678; c=relaxed/simple;
	bh=kQKAVOjABu4DOdsXyMCztP9egiM+XBu9UnlB89Vw2+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baBzSnNpF0TvpNVtN7t+H764ULgYwYYSTXwbTvuFz3RUPYkFB8j6RrKWQCdMeDXr6YE8nkVcchKhusmNyHu1dY2wR+dFaCILnR45+LQUb4Zg1+dUQyud0lRWZ6pC/Pvpj2llowcHX2fYO6sBa+FZj/DtnZlSTvQg7yzPeeNR8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edwMxnAq; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-23508d30142so29113675ad.0;
        Fri, 30 May 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674676; x=1749279476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=edwMxnAqZUSwZfNMMfG9fpAuYSFBoki3IsNJjTc0oOqF8zBCwEKiVIu1NbPew9yBf6
         6JW9WxjFpQzocL0Oc0+823iC0Jqm7o5a0dDQDXR1BGapnaH1ndKD4NB+TMZlGo+vh1PG
         VvHh6q6bqpBZVPoW7NI7hXoHRr4D0Kx2nO8nbAXocMADZRdcmm7J3BWODPFAct+BFnz/
         8AC6Nujcrq4Err4fARkU2nvfBFhjJ+LPC3QVbkxCBe2w6HKMaxdt1NQMM7wtWHcBMDdI
         Bw+LeL8+nMhjIoBHO+BKLkgYo89xTH1UF9Y8+cg6zcWdy7zKb3mvfEHJq4N53l9L5PCA
         e05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674676; x=1749279476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=D5sgjlWoaDp1JV87MIl9n61ORLuyLNmsfcOMwtAYWcx4XfqSjKU2CpopuSF0qEZgQL
         RJXC49DOXs3uWTfZNy8NJHasg1+8ZdmcIXf7rxT4e4Moqfz15LLe52pnZwvU5kFzytGk
         cQgqWJbIR8NQaoojBn//vHxloSJJKiYO+onLWgD8qwFDGkTTqf1sm80lAL6/eA3voYnF
         Hd/Ay8clP5RYl/QS4xtRYbUAtRiqM6FBGRPcEFOu1naRi/89mjRhvzJMZ6qYpi59mbJ+
         kouZJ0xzzYidNSwTTNxX8vzM8/Faebhv6CLRbp3FdK732wHEXkjlX5NeyeFoDvbcYKTa
         7VLw==
X-Forwarded-Encrypted: i=1; AJvYcCVSzRNRZEizQ+pXwX17yxRXTn8yNEvNcDPUfxaFdRUOb08ghkhN6TLfEBInx0kymQPTjTrPn6cGcp3IOoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlrEv43IVhog4PxxwqU19odTkRlPLKd0gb+CzZj64IeR8UoxUQ
	BVASSRmLidv48SE4bNvi9mTHc/7iuIC5Kav4HT/O06PJuTuvpEVokeHmjUDjW9SVH2BOjQ==
X-Gm-Gg: ASbGncvPiFD6yA1EfrVieyh07qfP1xOMJoUbPlTOrCipmF4q9Kc9mz/8VxIovgziPNT
	zQ/cyxY+MMl+5OETW9Cl/gIqD0GD4dVCAsdndT3L1xuNgf8XCE6IBr1MvhRfa3I6ASnE/SNdj4i
	7kIThBpujLLfULU90aWv3OHnXwb3MwLrSY0Uad3GzPGSjX1jHa4Vn26BIekRI8F3n5rUMig1jIM
	kGD1IP4BHqhAa6ngEeWKtpvfTzeA7RjEP9bxvpwkpnsSQpgKifQk75gbtgMLcVUuo0LBLBV1jVw
	P8PfnMLVEiiob7eLBRvML0N6z3b6R1ama4A=
X-Google-Smtp-Source: AGHT+IEZEi9SjcI+3gdNIx2vN1L8Jdx9YJrveBMTkReaRTGrreg8M6bTR+tIvp8XdcV58kFMe1FPxg==
X-Received: by 2002:a17:902:ec8e:b0:234:e655:a627 with SMTP id d9443c01a7336-235395d6680mr70877965ad.35.1748674676483;
        Fri, 30 May 2025 23:57:56 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:27 +0800
Subject: [PATCH v4 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-2-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=973;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kQKAVOjABu4DOdsXyMCztP9egiM+XBu9UnlB89Vw2+Y=;
 b=pU3nS5K/z91d8OcdBox2f63zfxUhxWUPLtlrhjoZVy21l+Y9Pw4XxYTZL8coyx6XZu9rmRwCT
 DefaDA6YghUCOJT2/YpR3id0q8qHsCsTy1UXDct+TsQiQB89grxhXZw
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5b276e007292..d85adfb73bac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1687,8 +1687,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


