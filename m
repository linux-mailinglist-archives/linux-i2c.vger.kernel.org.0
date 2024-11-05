Return-Path: <linux-i2c+bounces-7788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073B9BD228
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1693E1C2301B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B2617BB28;
	Tue,  5 Nov 2024 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkhHCAWy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6717C22B;
	Tue,  5 Nov 2024 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823509; cv=none; b=KvOShNlJ1Uo2kicyx9s7YlQDi08/gUgco650btcDgqT2giLGmuLjo9Jf+M0n3Oy39RbZb8AJHG6DtpGcxBrYScEIKUxZEpn5zlS6WGJyKeieh7YCamEdj0ku2yErYFhMvDMEV6/VRVA4YjJS87Xey1f1v/u6bmcZRdjWsdDDrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823509; c=relaxed/simple;
	bh=WZtVn59iDVkO73iASai27i+jcw5hLgkhpFYsg1i5DJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jv0kGGY5H+e4vqFPvqOKpufTnpwuYRtcWrl3ejHYdVY+k1vcxVTZz6T8gFtRpF3CtKFf31Zn01vjwM8kuH8vXJ9jBkbURDhhm/b3Dd+Ey9Dk+6C1jGx7krpNTclLET85JrRyVi5zPxN9oM5m+Jy8M45NbtZN/LtuQg8WGsJCZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkhHCAWy; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b15416303aso411596785a.1;
        Tue, 05 Nov 2024 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823506; x=1731428306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXGcEW/yKJ2kT/lKQoK+ikV2KsFoei/F8kGwDlFWQO8=;
        b=gkhHCAWyw3e7Cwg117zMwh4toYmFs221xfAm+fE3LfvSOVdnZqd3JwSPKJCA+KBVxZ
         kReUiGj23oMxUXrRSqpeyyufj7kXP+9bsqVakBaEH8QGt+CPNd2i1KNNrPrWsGiVb7Ql
         7vHAQ8/vRSdNRx9cEIwu1eVLmx9mcw2jF/xDojS6YPmQXMHZE+Zicv+TTYlQ8IYaMrhW
         e+AoSY5kynH+4UniRPB1xK8ncTw6e7t6wiP6Lgb0XZW18a4JO+2rcdljB8FZhp4Qujtk
         SGBG9S+f9VfwmYiuh5H3Fo1KyKFmoSWEWR3eucyHcRtkxCW0159n+QxZx5CnLAzz7INa
         SEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823506; x=1731428306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXGcEW/yKJ2kT/lKQoK+ikV2KsFoei/F8kGwDlFWQO8=;
        b=Mf3iCOqSE3uTvwXGUTHN8iOB4KiHnZGBdPJnHSwZZxh50l5dtb93t2C9ZgHcnea6+M
         rWBjjtXOQt3iXNCgcP0gcRTE0bNeIezXDr9IvmvGZ/D7+iPqSa+vl+5jod3CF08k2VmM
         A68ZIDomDIjAMR3bgKEhxU+ja0kgD/RM+nsv71FFn1/oPU6k3Q/i8621+slpCY+nMOXB
         tmWfe++Kn4FQdYjtN/4HEIHxDEeiWviDM6JnNg8Ou+FtT/kVmG9C42ciS+4DPBRq91VR
         327t25IvC4reHWY1UaKrh5nbg0Xok0RetiRQSo0e+a59sJX5ylJRl3UwYE3ekGlCZVFQ
         yKnw==
X-Forwarded-Encrypted: i=1; AJvYcCWEDGXIjTHaL8iMxLL1TAgJXbHDU1anCYKlXsp+WwohPtYBoertqcgHZvqGSut7biex9YS1z2K873I=@vger.kernel.org, AJvYcCXhA59Ccb0N04taRBlNs/mTyciqv0BRHfwb2VGsu3msJYWVy7OdeFzGaijlxMbsOxtanXeoTkz2ugn1G9LO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn65igVIsvbCaS+/T2phQi85Q6oP1PraHm1n2VQ1Wlnc6jmq6k
	hlLOnzr8s/aWc+oSrbpNJU3BKSOfeZfyL9Gfg1H8yyJfYeUFQ0Ph
X-Google-Smtp-Source: AGHT+IH/TVTagDdBicU9q7qr8NhSf15bW+aAQAdd0pCb97OHGnCjFbeCAMwnLUwjAeS4tg6AWJHmHQ==
X-Received: by 2002:a05:620a:4492:b0:7b1:52a9:ae15 with SMTP id af79cd13be357-7b2fb948de3mr2387592485a.9.1730823506107;
        Tue, 05 Nov 2024 08:18:26 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:25 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
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
Subject: [PATCH v2 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Tue,  5 Nov 2024 16:18:19 +0000
Message-Id: <20241105161820.32512-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
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

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-pxa.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..0ee6fe83de40 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,9 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret, "failed to enable clock: %d\n", ret);
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1562,12 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock: %d\n", ret);
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


