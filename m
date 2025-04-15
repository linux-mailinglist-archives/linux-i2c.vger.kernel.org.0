Return-Path: <linux-i2c+bounces-10374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F141A8A6E8
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7BF1902038
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2F225A32;
	Tue, 15 Apr 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2BZsJ0x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01B204F73
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742164; cv=none; b=KuRT7NTSZQw34p1GOxviP58jDyhkuZ0NUpBCMehumjhErbrbilrEDb/+uSzXyjVFW+apAnQMxZkDAlx5i9KPVW4/7jJcBJLvaq0y6KNbdrYMkdlxv/JFXYUAhn2+TeXvQpWSlfu4dLj0dtuWwIBDt7KUxu+804wSJM+TH4TER+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742164; c=relaxed/simple;
	bh=J0uYXjvD8Hpwh3hGZsfbLf46JUN/Psj+ddfsZVtxfyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDtqGQ/KppC95eEtJEDsGVEJufj+b0zcupySN2t/uuprmSfRgaEq1fmeGUZjaRyKcL+tXS0wA4Uy2+wgRjs7gtE/X4nrR82GGOrdnS5o1zwu5G16zAyPKBB8rW4AFNOMFKjTfD7Gc2+KY7MM1s4BLIXUg+Sk7KJec3DOxrjLXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2BZsJ0x; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so10176615a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742162; x=1745346962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfryQvIzOUjhiY3qFCzORTuNHV2UwDURqLCegwa/tk4=;
        b=L2BZsJ0x2wFgWrMYCdl+0msPguTTMOMWc9oQ9oy+sy1chJvVv6qE3MiLapYm4R8YYK
         NS6sgKWZLqqnbRZgXc+acmtLsQbT4RfWDnVOE8hhGQqAijqicS2KUEt+x8foa13bS35z
         HEcpEOUPPn1v/XmsIOTFf+qUQPStoV7+cQw0CoQL32iJoykTpMNi4zVCbQJDsOio9eLf
         N0ZSliexgRjJP5ivZC2rmQ/HiusPj0kYONyniG0x93/iFGV+/5DMbGANtsqUXNaD6luD
         OC3LdECdtyFPoWA5eQh/dZJUCEbrOiRGxCpqTYns828V4L9JPzWKapEVK0Aol/NUHJxz
         ZHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742162; x=1745346962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfryQvIzOUjhiY3qFCzORTuNHV2UwDURqLCegwa/tk4=;
        b=Ut5LgaPUUva44mKD4lkJTyxS7/x4XsVkr7L9vhNY8LpA2L/wd90qqH/lAnnw4J2w9o
         j694klnQ2YK6boY8QLCwar69vFrZCMx+mtGwC0wwy98V/8Yd4HIHAkohnXRW6lAYuQBi
         Jov3v4AlEc1OsL3Cbgnp9w9Q8oeOer4HWgR9+b21CwUsMJDsB+MStd3CyXBdkSrBqDMQ
         3MkYt7SjQSgJYYerZsSGg0Bna8KfASUpY68TpsEb1AnRNorpM9eTOdDF9LMI3TItMmEP
         PmbWAEyaUmS6kf9/E5oUtagZ9GjmwTnohCrLlDveQNkTCHQp9Fr6rIRFHrIXk6lWUvAP
         p0Lg==
X-Gm-Message-State: AOJu0YzgmwvZ5ii1m7o2cAlhEe901FcrGAEUZqVOZp9/ZOsc5xHum5pD
	hmYDYp+ctNfbYLrXu3+Q9hsULPIjhZwWd02HQJuyvAizDLWLy4GS8vVWuezQ
X-Gm-Gg: ASbGncua5l8TrT/6adKM+NjNocleLMuoIeuM9zPOi7wJmH18yz0ZFBGRCmxM7fe/hR2
	Z46PRld97EytjBohw2baO7qNZ9v9ht7gSnVKzKt/qsG1hAw8oOx9VT9QFEdnAMqsQSwEnUOmMhJ
	9zo6h+oFqyYuhmNO3YNuW3F6ZikqDkteqNM9hCI94JW12f82qPCsFW9jd9YZ9dTMrTOZC6v6APg
	a2uawfLbyg4d635XqaFe4etekcFns4oy8B6bGhRSB3iQgrL9p8m158DBsgMTZ8EZukrMUQ7rCfj
	ppJsBcl4gswCNy4obiSJzO6ay65HCv8WTSeWE1E+Kr+PXJZZoI5PSuhgljG6KhscAWMcmBk=
X-Google-Smtp-Source: AGHT+IHJGsewST6jnmj9yIH26E+Sgv/g2O/o6nz6W1pZh6kt6TBXhanEvsuCzFh2W+goShSflm9Q9g==
X-Received: by 2002:a17:907:7e86:b0:abf:6cc9:7ef2 with SMTP id a640c23a62f3a-acb384e070emr7427666b.42.1744742161497;
        Tue, 15 Apr 2025 11:36:01 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:36:01 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 10/10] i2c: scx200_acb: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:47 +0200
Message-ID: <20250415183447.396277-11-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/scx200_acb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 4d6abd7e92ce..06cf221557f2 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -500,10 +500,8 @@ static int scx200_probe(struct platform_device *pdev)
 	struct resource *res;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "can't fetch device resource info\n");
-		return -ENODEV;
-	}
+	if (!res)
+		return dev_err_probe(&pdev->dev, -ENODEV, "can't fetch device resource info\n");
 
 	iface = scx200_create_dev("CS5535", res->start, 0, &pdev->dev);
 	if (!iface)
-- 
2.43.0


