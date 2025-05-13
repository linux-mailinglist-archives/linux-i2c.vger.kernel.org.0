Return-Path: <linux-i2c+bounces-10953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A3AB4C1B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 08:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DF8D7AE00A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 06:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0897F1EB5DC;
	Tue, 13 May 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fY5oruqO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E041EB5C2;
	Tue, 13 May 2025 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118207; cv=none; b=JbY6dY5oh+hY/JrE4myjuNBhfE+DUfQicl9uLVc4Tsk3M8mUWYpZDjuPLR/ktP95O83IQhMqOZ1DA0L+fG5rt0zp5/KzU8Za0YzF56opRogUOPFK8nZUl19aZAyVG3flf27MvmrdOZiaOcQFyd5Ed/oNfLw8B/2p806o+ddYL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118207; c=relaxed/simple;
	bh=Ip3fCjtKHIWdXoxS2ayjmqQZ2CXz2QC9JgKDfWc8a7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWyWhO9j2lekTgtBk/pUCF47dtEWhfDmy+11/3Euhl0J5hOUudIW3xnA/IIp5ka2wc2Lzc+TvOc03/5Vma+DC/9CA/t3GURKdrPGkaJD4B57F+0uBFj6SorYc0AZ3bs0EUWkt2G7pgbL160wbd6OuQFxzqnhvR63KrtDJHmgJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fY5oruqO; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-740b3a18e26so4435909b3a.2;
        Mon, 12 May 2025 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118205; x=1747723005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=fY5oruqOqJPhWFv2/R+I3/fShgzF11z2IU5cXkQQnozY7N+vZ/u7GhsMFXCCwbMvkt
         gm+fvUDTX+FjEkvyHM4MpOm4hVl+IefPolXQcnwZ9+fchFb66d5fZ7Snbg0m1vTf6JNc
         hvXnKM+In2gW2g0ACzgJlSwA2ryKqsKdjZnBRd6j6E/SwXcK/q5nDHJ8AkaOVzpwptWn
         Jm18/8Hydul/LimXDTywt45d9rRKqqW9SEuE4218qt+eDO1niBJaO43HtulI8ykOI2Qz
         tWJ7F86DgoHRWaipIlbB9cLnPieLiZ4tNcRxQ2mdynvrVBsP7okpUV7b2ltIYu87GQmu
         7NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118205; x=1747723005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=UxOcDp/9SzVVP/hNsWBEqw0QVA7KGGrO2BVlXk4muT7g2YQk0NhJUqhURD3XMQ0HGe
         gkLsaMphCu9e+hqDdAk4GzauaZLWQQ2mi1b58ZzfsyrnkZX5oDJieTdG9mG5A3R7zVHY
         gteyGZsuN8Q8LqhSNe38FLmQCtF2nYHj6N+sNGUN5mmajBuSFBmLi5md41+5kNe3RUQU
         tT1SUwoRcIpAwxDmKdJmCcqNxV2OMKbGHFwcRpsCqKBDJk+PKpBXcW6umyJdGfrz7P37
         V9q34JlQ1YmL+hFymvP0/QQKqpMgSAZYR67oyThkTLgMkkd/GIXDmidcrjpWNuLFe19d
         O53w==
X-Forwarded-Encrypted: i=1; AJvYcCVKiGIdw7FKeyVXAq1tAhnxryL+R8cfb5nlveXSGJcrNav6ke0zd6alaW6Tn3CBnLcW6yyepodzDRQ/798=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3y3lIp5UPaEG5mxT9PNmadlxUa0YJlEz7dF/1shI1OXAR1+BZ
	Fx3RIMat4h76UCGSpnT8n8X2qN1eUfeuZgw31lyVniY1UHRCXqtU/5Qa0qYDqnHZspzk
X-Gm-Gg: ASbGncsJa7qjkbAJL4ezueZj0m8wSx5hFxknLxSGQXxTu6zLr2lqQBMDZTBtsTjMiCB
	+6H3uWz/ldQSAZiY/w0hGNbuxFYY+T9cDcAyj+VC9T+SyQMYCvUt/7rLPvaMYpbEJ5M2BB5d/+q
	Gd6f2Oagg4tQe2lUjwM4GfQejs+fCr60wdz4OPw/IBkMdXJzkcQYc7JLF07GvqJYLna2RjSe+z6
	awr8HDnW+CQ9EvfXuERu1u0/zFVlBPjL+7p8jQjFvTHGSel5/pBbYwrf7KE6dh7L7Fq00eLCKs6
	1LQhI17zO6c5rGesIXpEzcdM1VWDbdJoKA6wETDN9fp6lz5R0lX8eUE=
X-Google-Smtp-Source: AGHT+IFJWXy24yaetI34omZb1r4anR0SzeBfbfb+3vCHkMA5r41DKDPTr4sjv1kUrFcK6m2M+hxgTw==
X-Received: by 2002:a05:6a21:3510:b0:1f5:7cb4:b713 with SMTP id adf61e73a8af0-215abb3a301mr23308487637.19.1747118204664;
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:14 +0800
Subject: [PATCH v3 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Ip3fCjtKHIWdXoxS2ayjmqQZ2CXz2QC9JgKDfWc8a7w=;
 b=dtZzgsLgDl4KFfOlioaf2TlzkSvJK7YIv+UGk86oqaYvH+1y/9yehAeMD3OYYPYJjYj4B7deQ
 sLWQG6khLQIDMDqVZzcC3TMjq2ndve+vwEALeKmMzhawudTm3ezOiut
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
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


