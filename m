Return-Path: <linux-i2c+bounces-7874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38C9C10CC
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 22:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 102F0B24F49
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 21:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD27218921;
	Thu,  7 Nov 2024 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvN7N2h7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6FD2185A7;
	Thu,  7 Nov 2024 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014077; cv=none; b=QLX8XpkuyciX/bB8GvLI6K+XeWIsmTC0ZxXI+y3o+eHAG0ioS4VPB7r5XtBDmytAHjPWtQozzaqmUebttexwxQ5A6yxCj3E6MHpmiofItmQiBWB8NSpOnU0Z46dFvyLuKnSZuM5W4Q+KdQVKlTg8JtWbd9FIRIA4i04dKWpCo1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014077; c=relaxed/simple;
	bh=wQAwMy3r7FzJUUodxCO8uG97AJCUypmzZEHRhsQQMkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S44g6Tn91LiDApTxZfIH55WuV3qRxFLEfflmtmwEeUvVPIhvKx1giaQD/A8TWBclDh5CUAk8Zg6Jb3D10qqE7mFPiDz6XYjhOyK8PYR6Z1zeQFewDgbm++zzErHT93r+uyo+8jIf9Uup0cQjxMslBqqySM8PI4zHtp4ad1cm2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvN7N2h7; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e786167712so1018933b6e.3;
        Thu, 07 Nov 2024 13:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014075; x=1731618875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOo8kzEPRGUvbYhKweLQJeBsbVaNvGh932XZf4KLPhQ=;
        b=hvN7N2h7iaTAgblGziaYlJ1paiTFq3GenKzfyJg85QAzOCNXRZskzzDQi3AyTlSBzi
         6y+T2avafBSi12wu9F+kwPbDNwa/N7YKKMoiJvIztKh25SMUvVMDnTz3GCnmhNJw7fKS
         FRAawSH7ka4M3vltaqjH/EVoM4WDYcpgx9Fi7Oq/fZePsMwgb5cF+AWeGr4jrAep6Dok
         ixe6NkEKJ5iiTC+/YRaxeQ6L0Gnv7KF3CimcvN+Mh3I4qe8g6N2jIVnSU0NQgZCT1DJL
         TXCq4Qe3+enbZYpEQmMtZMbCtcs1qVyLvnvlg2DWzht9AfkQc3r0+FHp4dSRCZlwPUH/
         INxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014075; x=1731618875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOo8kzEPRGUvbYhKweLQJeBsbVaNvGh932XZf4KLPhQ=;
        b=gkwQoTD/OwR+39z7b33VvbS8ZYUUWf+HDK7g7adrqXMxwYu0Sd14k/iX8T5bfp5uLb
         TaEqi0Y3hMJVyvZaB0qfG3pDmhEj3WkJdiesXLmOKIet2y9aNDe//Kj7iuQUV74L3blf
         m4cVf7NUOSGBdXfTwY9nB0BLyDjYmj0o7Wer4lJ9YK/aK+K+P0wBfvy0vS7fxX1wXd0b
         jMlsmWOBwKXVZHIP0ylCwVMGC1VvXKy4yaAa8SayocA4cZlfcbWNcn08ezHIJ06gO6GP
         Pb2A6dZkHmWA5JeGo39HdpEBTYOyMW0U5T2AK5NxIi1Pqmm7+UqY7A4cSJ5DcQnSaBDw
         MRwA==
X-Forwarded-Encrypted: i=1; AJvYcCUi76yZQk1VN32FqPZVtLg9CCV+xJOdw4OWeHQ63loMccOBT6DTati5FMs0H6OhZhyyL0gfqXYgIcSXlrSu@vger.kernel.org, AJvYcCXjVKFa/K2dym3Rpd9xOURFS2d4rPUDfkbWULgOkA/1DPVJeHNty74eeB9Qp7DGg9+Gt/EX43ET81c=@vger.kernel.org
X-Gm-Message-State: AOJu0YymRjlsDAMo95r/IZF+LTaxFme+Ttjd1cvbdRiXQf9QK+XhDtUp
	57/Ly2J4QJ+tpeuvpGsvgjI7A59ZcjQ5Bz5firmKyGix9SBG+9VB
X-Google-Smtp-Source: AGHT+IGhY1N2hk3DoCWVBqOOz8Mayrp7EeXL93lHogS0TvaItsDXtOLZPyJv421K0nsnaCchGhGTMg==
X-Received: by 2002:a05:6359:428d:b0:1b8:203b:db84 with SMTP id e5c5f4694b2df-1c641e749e9mr92914155d.4.1731014074581;
        Thu, 07 Nov 2024 13:14:34 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:34 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: dianders@chromium.org,
	rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	wsa@kernel.org,
	manabian@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v3 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Thu,  7 Nov 2024 21:14:27 +0000
Message-Id: <20241107211428.32273-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return values of clk_enable() and clk_prepare_enable()
in order to catch the potential exceptions.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()
2. Correct the usage of dev_err_probe()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-pxa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..4a92c5386df6 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,9 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret, "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1562,14 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


