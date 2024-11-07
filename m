Return-Path: <linux-i2c+bounces-7873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E449C10C8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 22:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1AE1F22C4B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 21:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B7121858C;
	Thu,  7 Nov 2024 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddgLfsBk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9111EC015;
	Thu,  7 Nov 2024 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014074; cv=none; b=iyDnUIj7OyOtD+kQ+tI4b7FvK/OZSmg6vD620beq6T5Hprwu7VQy5JExWAmnRAgyCcSplgk++Gpj975iv/PByLRFTpFwg9WAW3Pgnx+MKxZl8Q+EFb0kGbri6LUE46Co2l1ZZrk5LDtDSHVRHDGIKOreBjy1I2zMeg+gg0bqa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014074; c=relaxed/simple;
	bh=pqjgTpcgdJf0vXPdIAuto0LnqO8V02lIDQngJ9eq3fE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cp4dkBcEpiOT2ffqaFLUxGlBWjKi/aunnLl7pMizzosJqFqZvGaH30A9n0Sg4S+U7eh+cw27YHViMu/70nO1093ha6EthkHy4jLTrrC5MRHZfRHMJYqUIcj76PesexjBH7f1hotzB+mbXzCu8oDeWF0uTGrLLrIhjzuBgXOM1wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddgLfsBk; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-460ace055d8so9033361cf.1;
        Thu, 07 Nov 2024 13:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014072; x=1731618872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uKO2TXaFtTXkQxrGMFy3dzEippfijU9bG+tCuCJOR0=;
        b=ddgLfsBkYYM9udRleiXoSEuqem6I4Y0bleO/M36efKUuJwC1Y5T95MkJgjouUCLY1W
         2SlEVi6Nr3wuAoS5rfSl57kWhvJT9yzJU+4u2Fo3ChEqlqFdYbtOEf39o7yORKX7kcfb
         p5XudMx2vtiBeKdWQOoDApFWr5JNG89iNgRjomhN+iSvSVfv3mFOKw1U7Aj5CheaCkgR
         eBni2Zu4w5tBxfBJTXckfbgNT6smyrlwHQ3nqH9w7udSMb3dfiNnZ8m2fOzuaSXoTqrn
         trheqT8ss95vMZHA7feC2d23KncOFVbsF/CPCG1FNfhlZn46o0ui7lRhY3X33aRtVbjY
         12kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014072; x=1731618872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uKO2TXaFtTXkQxrGMFy3dzEippfijU9bG+tCuCJOR0=;
        b=f3bUi/EN4aK9XE2m3GYYyoTpDTzLR5+xalMZzuVkJnI6KL5Jh3IZdZOC5f7Gn4YR/S
         rItN7yG6N+7+IfEHT0eG3yGoHUtLbD74P1kU9OHPypmKl301PxEcOq+4HrdEri6Py/JK
         dzEoBcubrMK0JVCWcMIumF3RQZAjqwWKG3TNpmnKx43hzgAA6Ceu9UhHnZ4bQjzLBTrY
         V88+pENjma7hX47vnkJWWAqb/8d5nlM3IfV97XVHFDHFXpM5Dh4G4JWnD3E8DL0fNYly
         nYbLvzPWjQTJJMlSGeyz2Hhpyk6lwAV/VXgrrHKjhy/zdvwHiPQIe+NEfniFnpE1sQp0
         uQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv2TWRM7Y9vXeG8rkPRAMecothiLeVQWaaT9siF9+bsOpyz5vSLUTg3be6IXm90ScDULKv6I6iL1A=@vger.kernel.org, AJvYcCVvIv4Ncm2J5pzroafUYF/BhwknxofWcVX2zdAEq0ZjQ8qnTVLxecQjjC+D5P2kSL47WAwkYWoHJOmkfJx0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4R6YSCZB4ehNCHXzkWbJeg8N3CqlNJUtdvrfq3QJsdX08IfJU
	jvGkdntpJtjtvuj8wxP/fNZvZq4u7pOx7woTtol4kTI9VYbmH/EF
X-Google-Smtp-Source: AGHT+IEQO315sJ58AjAImU5jNkUQnktZ/9GnYkEh96OypdQQhSv+PNXvH4Sz82UfLiseFX3Nn+MBsA==
X-Received: by 2002:a05:6214:5348:b0:6d3:5af5:2a58 with SMTP id 6a1803df08f44-6d39e1ee70bmr5395506d6.33.1731014071767;
        Thu, 07 Nov 2024 13:14:31 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:31 -0800 (PST)
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
Subject: [PATCH v3 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Thu,  7 Nov 2024 21:14:26 +0000
Message-Id: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-lpc2k.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..ea9831f34cd6 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,14 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.25.1


