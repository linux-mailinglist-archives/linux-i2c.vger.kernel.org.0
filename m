Return-Path: <linux-i2c+bounces-7278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FE99540D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 18:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19852848C5
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB27B1E0DBA;
	Tue,  8 Oct 2024 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bk0ohTTh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1F1E498
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728403793; cv=none; b=l9qsgIc7qn9nFuJgCQ2yk7oPlbftng5BOmuJp3hQkoLJXefSIrf8Cz+fLv41ZWXW5XH0cu7Jz9qAuuBTOtkfpwFNnQikIY7mvMnbVH9AAIUCvpqHtdj3S3P3aaNfB1vXlB34W00WrA1k+/RnR6zwYbVlvZXf7XwZXs3qp0IzjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728403793; c=relaxed/simple;
	bh=TK//XYpVf4aHBYJhi8srw4wCnQ1U2KT15FO+6llEzHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMQFR/0v1Y85OdFdXxTMOB0TbFhIvyteGfUPHfTq4oM4yOEgNz0DszuLAI7yzF2c+HcyjsuND9HtFmx1u8IpfXprdVlhnpHeGHT8qDz3iZwMTCdzh2GwqSK0bWcW5qWjmqU/bRZwtbEBo8Z2ARUBFTZ8kh8hWjfrJ/RbAZXvmt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bk0ohTTh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb806623eso54567865e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2024 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728403789; x=1729008589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bTm93KFNh2pnhwbgvS+SzjASmC55+EgB0HziHFw8q0=;
        b=bk0ohTThH8memyhn11fu0jRarhiQ2na3zWm2ns9yQybhR70/HbhjBJxNBJLSbKeDLI
         SoOa5zWmO6VaAkqLGzx3awGeDwASwWfuQHqFB8uCXyEgCKg0eeA3O+Alh/6VY1kfh+VZ
         Xm90FCARgeATxVD0OO6E/hZfynsYxZefV0WPw7bhSkpGkbMtp7XUkPZ1DCBDEv0plMr7
         /Hb9KoOB6w9V+NRnOUKat9/TmMK8pbGvHr2rS/jaZL02Unv/h9vZ4eMQ9R40yGhM+VCt
         lx1QzrSzlb0MuIdY4lfmIJSTYIHrVcMVWCZGFiep2qHP8yZbspoyxyOGA3FTe4CajScd
         hZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728403789; x=1729008589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bTm93KFNh2pnhwbgvS+SzjASmC55+EgB0HziHFw8q0=;
        b=VDD0o9bX9ke1k1Xh8JQAIuy5RJl/UMrolKaOSVb+pb/BwE0E8Luhe0z6pyRSwVdcr0
         rlOdW9FBpdaAKQro2l+AFAd2umf4obQbzjZRO3vfg9Vj4GZIJYy7kpZ9b3a8t8dGvE88
         eqyeqjHd1oWYaguQyJmB7vLWeZ9cWXtoVm8lutDbfEivJdjCQvRHspStMc2zru7gFsFi
         Xj+CgA5eUCrD1rFg0jNcPthH8TLa9IJKeTBF+2pLA9JZjmr3Lk4qCkVvwXEb3sKWLdH0
         KG6TuAak7ZGg0YpGQ3s+Pl4As5ZdRHttPHs+PUgMwjxYjMHJRA4Hdh4NHTjrKafSudDj
         YzCA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDWJHMqSNlNd7rtdF3QJij7vjLpHVZeMGtFnP3PmqQBsC6OwAWqCYHC/G35rAiP7Hsx9gs4qHalU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLP0ITKHbMCVmxFMw5Mjz7E+D5I1OVYsW7qVgnlg+ies1mHWSJ
	74nLfTaRpizz35BQ2d6SuN25tbfh9WwhLS9we6e9scP01ftev+69ZZems8SVJRA=
X-Google-Smtp-Source: AGHT+IF4fxR+f/UwJBzpPlCe806BLXeK738PkB/aM2J6XLzTkpowUzOIEcK5QyCo7INk/bfz1SSpvQ==
X-Received: by 2002:a05:600c:3c92:b0:42c:bf0b:c489 with SMTP id 5b1f17b1804b1-42f85ac2629mr122136005e9.18.1728403789546;
        Tue, 08 Oct 2024 09:09:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ec63c3sm113593405e9.38.2024.10.08.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:09:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] i2c: qup: use generic device property accessors
Date: Tue,  8 Oct 2024 18:09:47 +0200
Message-ID: <20241008160947.81045-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to use OF-specific property helpers.
Drop the last one in favor of the generic variant and no longer include
of.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/busses/i2c-qup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 86ec391616b0..da20b4487c9a 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -17,9 +17,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/scatterlist.h>
 
 /* QUP Registers */
@@ -1683,7 +1683,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,i2c-qup-v1.1.1")) {
+	if (device_is_compatible(&pdev->dev, "qcom,i2c-qup-v1.1.1")) {
 		qup->adap.algo = &qup_i2c_algo;
 		qup->adap.quirks = &qup_i2c_quirks;
 		is_qup_v1 = true;
-- 
2.43.0


