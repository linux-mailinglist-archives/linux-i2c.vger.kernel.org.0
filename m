Return-Path: <linux-i2c+bounces-7766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2109BC03C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 22:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B4D1F2298E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 21:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5F11FCC78;
	Mon,  4 Nov 2024 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKLVB1dV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2213F1FA272;
	Mon,  4 Nov 2024 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730756596; cv=none; b=EzM5/ZTKUTlcXL9kMD4BGD1nkGG+H/hnb092VBMLy7oh8SVPyj4YuRhLTIGobEbSIi1DiHgXX38O/2RA+GYsJXS8i5mHtg2wqCICpIgUuAC0K5KNr5t5nAO/6r7XCIzg7WIsrLA4OT5hamCT5WuXwu4BuWNun2ZKCVHIql23mUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730756596; c=relaxed/simple;
	bh=G5TtYDkJ/9/I8cZQy53k83kHp5eWxFTGnXpbMyoYplY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IhcDeBBP3dZkaQnQLtt1cBOhCOM3nfnUzPQaIJeMrzkTg4lwdoErCbtyq7aYT9OgI0P1CTyYM2MOK3pSF4pzl1FUsqJKxD9tApsAcSFszQofuNYxR/+MmrcsnMxlH8AlcO0y2ThATxiKUsZPMJoiJSEl4h9292myyOf1CGNM97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKLVB1dV; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cbe3ea8e3fso33462756d6.0;
        Mon, 04 Nov 2024 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756594; x=1731361394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=;
        b=fKLVB1dVm0cEyKq1xikkuA2I1GlHmdXLvOWBQUOqGZkHORxFfGmACl/NLcXOPC2r2F
         mZtcy7RkqCETJDCoEiHvHloKm2GfJ+noJrUN4N78BSUvGLonAZllC5VKydDEtXT/8E3g
         nKHAi6X0YMowkqw8AGqtoGJG+JASNVXmgRFTTJ8gUZSfmpIGBJIiy/a3Gu1J3FLlqAYr
         O1Z1zL5WqyrO758/rxgOL1oLoDqIHFBBixBvyNXh5/uuwrKry/miYGSq5M80pn0ARvmj
         Ofk+Y5M9EXQxZ1xQLyRJbCfyO6/J/+VYm1L7v4rXvwU0vrByF8TFJk3Acl+vaOqmed5E
         Qriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756594; x=1731361394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=;
        b=V+2zz+K1FsEv2Rv2qL0PwoqPhapV6coao9GIOlPLct5jCxHT4B3607VcCSpYuknIIF
         zd75lD/Arsrnp6K9NxM/qRixEjqgw14O4q5INBnAIYPA9Qt9u8ftnPkO1xQe1cseLCT2
         ykr47MUGXcZPied4Yl9gL5s8acIDPmBfERJCp7iqKn7AV2DN8WKSGR5AfwdoGxc5mBbR
         H1mWvz8CihNmVkfU6TA2mEvz8JW91ArWQ0xmfZvI3OIvpNPKiEfPgr5/9Pdrki+DTDKj
         u1rPc3dGJ1tgcGhFlH8cuVph+v8cfBGuw4fzBydiy7Ety12NqOaktxsnN0k6cmIFZg6k
         uzhg==
X-Forwarded-Encrypted: i=1; AJvYcCUXlncPlrgaxjnii0JRXbVnhlYF9wlqMKcCOzF6NPTOduSx5rJ3QtYU7rChVmNgh7BYsGR3i4szWGRUmYAY@vger.kernel.org, AJvYcCWnWY6sYmhf5Nh9l/1Ufh9rvTnUkwk4MAMxEIJ8ETPgTCcZLpWBNdo58SOw2PorRJP4DN929EiAbAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMeWnAU8p2cd1QNJ1NUU0p66dYSOODFC+sHdpcVn8BS23h/NTe
	KPxKHU46yWDWXjdsfWq+aG2q3/tptmibn/nQM/jbGDZy1h2KQz/i
X-Google-Smtp-Source: AGHT+IHiD08rBdxTtb8aWm9tjEu6W9aqyM2twM5OiMs1ouAVCkDkPquU7pdY0W4uFRX0AKoynB85Ww==
X-Received: by 2002:a05:6214:3386:b0:6cb:fa1c:87da with SMTP id 6a1803df08f44-6d351b2083emr248567506d6.38.1730756593883;
        Mon, 04 Nov 2024 13:43:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Mon,  4 Nov 2024 21:43:08 +0000
Message-Id: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
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

Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
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


