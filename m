Return-Path: <linux-i2c+bounces-8870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF0A006A8
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56816163A71
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF7A1B87C3;
	Fri,  3 Jan 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyVjT3Ew"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D871119A;
	Fri,  3 Jan 2025 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895956; cv=none; b=dtcVVencIqQKyho2g1hje3k7gxADshj6JPx5P3rZgfcsbs6SLlTCAOk5V+JVkYBCcquDlMEz0YEJpPzPVGbshaAMlX1SsHaoaHitruNO5kSik8YYG4SkM73Wap1Axk0RvaW2kfmrCdGmx5hiw+sqpMHS11eVCReKOLBrsrUnckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895956; c=relaxed/simple;
	bh=nvONnhRInxBTf32N5voMJ4stDfChre64pZCqb66Vp48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHXG7ZKmSbju2PtWzf9AEz2Jn5QrNPo8AEL3gNE1NStWYFXyaY8xrRnsH4gMUNBWPB8lxNSVfJ7Lraz2vqz/D/3cYc5zatSosAqMPCcXmeoNTbfQ9uRNw/c/+4Q7FbsjBkokxNqx9l9ZQX48mS2euvVjIKBDEyAbK+qdqRo3UlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyVjT3Ew; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso125035295e9.1;
        Fri, 03 Jan 2025 01:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895953; x=1736500753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZC00Z9dkYVufzWTHzlU8berQ/ewDLFuIhT4jig9bpg=;
        b=kyVjT3Ew7zYRlSe7/p0M2eZqi5XACCVSPy6Tte74V0EQsRI7m5wBMh/RcHx+bQOmuC
         8Ch1LDlB8xf7Nnl3QYyQd9+Hi9af9mT8Zs/LQXEUpe36dHOZp4TCFRVaJSCjlZslWzbp
         wH4Ij562YenK3kmS0/b6DY47kN4yNK8ypIK6L2NhqZNYzrrd4h208QwEzBsLXEDXIlu5
         KIsmb1A75l16+bGVQYbAzkTh8FiSodj33OmP63HVb2KL5yLQgq7F6e82dvOBYwzzyCct
         ro4tzu9i832GYZzWcpN/n9wKu0jShddZbCmnQbnn5/qCRxeoheYeNBt/6TTPBcbMSDHG
         bRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895953; x=1736500753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZC00Z9dkYVufzWTHzlU8berQ/ewDLFuIhT4jig9bpg=;
        b=oC6sFyyl+o795cbxgzG22+++gg56VIN+YhipFB3Nrou9a9h4odoqsNL+XfSfQGuat1
         gAxGGIX9agHXunbjgC2kXUWcVW5mKj/O7+3idEloi4Q1CC7A8Qp+7CnJUwjQtjbWC5xX
         eZg/Kk4JXGxJ9LwiXhCsQ3ASXuCvZ2+ruNp71cGGsFd1LQGX28qXeO6PkSLJwTjATYjn
         4XM5q9r++NhqYMAqQNhzSjeT8mHEVzKJD9SMTknYs9gS3CTpLzFaOHCHVKAzgBImPd8o
         BYE/YjSvUog4mhCsebpZ7OvBAy8+v5lZSEZ/VAJBGFGm1xppuT7uIvoO1CoheP+E/3Sg
         PLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAIM77jevFAvB1UABzl9ccyDAL06caZ3RVWNybo5kc8TjAAmZ4hTI6I3dpesBTNXkaM6NhWzoX0+gMUID@vger.kernel.org, AJvYcCVZDmovlosL821k1s+1Il+gPWpAvkwhL2GhXj4kpa4lMPEMU/EeFxPOXysirfApyswIYCpLEnceJhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/TwNnad+vI9WQy4tAY5N8sbNmSNo8Lx7CsTVQYYIiiThTmgH
	kbKHkhLoolQqPob3OzCPvR3a34pLWu6IDwc83lgas9j/WjM92/qO
X-Gm-Gg: ASbGnct0h0nMWIX7FekiHGDFGunmjhQt8hQRaf1fupj5XZpPsEKv4gDmMD/hGH3MHWk
	PBPzlkPKl9ZuJOcPLrcuoY0lw5+++sthjMLgPGT7fEAwQeig7W3nORrX8MgWClvU9rCKhMBiG9h
	giKhbhTazkUVpGVYI6/w0CWc3gdBRuuoUHtmPWye+2NxCC+RH8DSwIgrrN/16x+409ZESKV1FJm
	ONiYZBBH8eNPdSp3FV9nfbj3gPqiFctSmPEE1ReiSvFqK/Z3Dfj/mZqO3j7ut3sxfsl5v+VUpGJ
	Bv9aoIQw8g==
X-Google-Smtp-Source: AGHT+IHZc96f/buPB7yleSN0vTjAPMJ11rdQmR11PZzRhsf9/US/P9dDmXzK1MCbShQ4mOwiVwdTLQ==
X-Received: by 2002:a05:600c:1c9d:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4366854c17bmr415178075e9.14.1735895952690;
        Fri, 03 Jan 2025 01:19:12 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:12 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/9] i2c: riic: Introduce a separate variable for IRQ
Date: Fri,  3 Jan 2025 09:18:52 +0000
Message-ID: <20250103091900.428729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the IRQ handling in riic_i2c_probe by introducing a local variable
`irq` to store IRQ numbers instead of assigning them to `ret`. This change
improves code readability and clarity.

Remove explicit error handling after `platform_get_irq()` since
`devm_request_irq()` already handles such errors.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- New patch
---
 drivers/i2c/busses/i2c-riic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9264adc97ca9..c9b2ceaf4000 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -464,11 +464,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
-		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
-		if (ret < 0)
-			return ret;
+		int irq = platform_get_irq(pdev, riic_irqs[i].res_num);
 
-		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,
+		ret = devm_request_irq(dev, irq, riic_irqs[i].isr,
 				       0, riic_irqs[i].name, riic);
 		if (ret) {
 			dev_err(dev, "failed to request irq %s\n", riic_irqs[i].name);
-- 
2.43.0


