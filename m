Return-Path: <linux-i2c+bounces-8449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE49ECA45
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 11:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC222815ED
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 10:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0919211A3E;
	Wed, 11 Dec 2024 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u2vOGOir"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430991EC4E8
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733912632; cv=none; b=Qd0yJaOR2WKEMJ4F/5zmBWm3Y3gDp++E98pJ5vpRBT97fNBI6fnMGTN5RH6rds5iQA/8ZUrBlJ+qKc+FBasK4ZCqw7Ida58456X+KxlND8z4gYVYz6uE6CsWxkgfGPRDNqYG8lYBXT/CLFELDJ2esP6JMTNhyUESfAOEyDUJHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733912632; c=relaxed/simple;
	bh=AvkwhoWiBNLBQ0DMxqKzJFjYJd3orUN55tfFIIyDd00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAPCG0Lwd37me7s36Gfwf1MWUK4I1DsNj+9NnkPDO3OY86U76ipP7IkJy4DFt0RML4gglKr99MV5tzHbsgL3B+I43J/vetvVxoHaOJuQvajZh4M1JpzBjVYDxvvyWTSx/aStm0AtQNUZc6YHcwKraXogduQ2Nv/m9ojAe0nxKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u2vOGOir; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso2934855e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733912628; x=1734517428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoYTxKIN+xa5B1OH/ejn5xfQpSaxCFnsi2/bPSTrz2Y=;
        b=u2vOGOirK819S0RuSFaLClgEbh7kJgUaQp1yNMrAef5O7rCRSRRnQRO3QFeNMB7BuS
         q0yoKwc6FuCIKXDUxVSTqQLov6gD17zYATWbiTwFr70Bt7M9MaWVwl/w0hYOG90foGqM
         HxqqB6fc2Z7kGQn0dE98K9BjVW4yMDLAZpYgMsGtDn4hth/xt/vBk69slj6nykH2IHDb
         kUEDiSK5r6N5lNX5pwvbBx4+V/ad8IKyD6W8AKgxJm0k05+3njbqlC+5YOGAtVvJDBn/
         gBFWUHQAadL0+zwQQMnaPGA2Zh4kDgZSk9p3KFKPm5hWTqaiIZrr0QXVRQBIty0TGRRM
         BXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912628; x=1734517428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoYTxKIN+xa5B1OH/ejn5xfQpSaxCFnsi2/bPSTrz2Y=;
        b=Cqspm+Th7FDuXT7Kw7Aj8IWJf+9Wy124/H3bgmMFzNiJJAlClqn9/wIgV9Dge6kpCQ
         MahkekdG4SIv8/fRKRRmXG+yLtXEv34uvZATIMvwpTnZce/9M/xVuzDItcCB2hgvC/6I
         HVX8K18qmNnmOUCrUa0RlwDc5B2Tt3HJkFnfUsnYYoJOFcdwsxVw7UFZTyLDXlB9SMl9
         ThRvoeXCMf8Eha1u4tKDyR59eXffKBSIiMxDuiFYYB5I3ZQLEr/YC/XVNrYcJUeDRHAo
         aUQ73pd0QwO+Tr0MJsMifDT+GxGqYqYcnj6zKRgGuZnuAOQXMdeWD4HyFPaqxnN+FXPe
         p4vw==
X-Forwarded-Encrypted: i=1; AJvYcCU0We0b1DjgJ79fY+gQyNWcsklG+iZH6sflD1siS+kX1tlj6FN2vhagXQdgwcBDnr+YQQNkxkZUyug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPr+owwvsw8ISp0tFgeEx4RMcbb7QEAKbIzo1GDe74W2a+CLt
	MrcM94CdqiwCizG0tK9sv8HVTA8A1M7wZnBQH3it0oMgE0ykY8vek5VSrsXixTU=
X-Gm-Gg: ASbGncu100ZdP08tOJaNncRKgsOZcX3Wf8A2hA/fsbR5wVgvUC5mwarZVF/dLWn6ydU
	jJ4hn1dvfzxKVuVx9PrtT71FahxsW3F6CBGFe0kn7j2kqm6uhIpmG+HgmGSXYIq51XKMVvFCpEt
	1CojiHKkrgBokKMb/EsuBJ9HDe4h+1n39ABB7E7suMPjHVIEzknXBuLbNEpFNrCYh20TTPSmgZw
	9wuwKZMoMjbYT34WuNcBFKjsQA77fISmlvBUeh0Odu9ozUrIhnUmw==
X-Google-Smtp-Source: AGHT+IFbH76aSaMWfUWSLsltMf1aj67sgeQOV+1fX/o5OmT9HfAeHOm6psOWA85iumCSEI4DBs/c8Q==
X-Received: by 2002:a05:600c:1511:b0:434:9ce6:3ec with SMTP id 5b1f17b1804b1-4361c5b1b37mr13444565e9.7.1733912628390;
        Wed, 11 Dec 2024 02:23:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1b3:c106:bf71:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm935137f8f.66.2024.12.11.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:23:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] i2c: davinci: use generic device property accessors
Date: Wed, 11 Dec 2024 11:23:37 +0100
Message-ID: <20241211102337.37956-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211102337.37956-1-brgl@bgdev.pl>
References: <20241211102337.37956-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use generic OF APIs if the generic device-level ones will do.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/busses/i2c-davinci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index bab9f785eeec..6a909d339681 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -23,9 +23,9 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -173,7 +173,6 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	u32 clkh;
 	u32 clkl;
 	u32 input_clock = clk_get_rate(dev->clk);
-	struct device_node *of_node = dev->dev->of_node;
 
 	/* NOTE: I2C Clock divider programming info
 	 * As per I2C specs the following formulas provide prescaler
@@ -207,7 +206,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 		psc++;	/* better to run under spec than over */
 	d = (psc >= 2) ? 5 : 7 - psc;
 
-	if (of_node && of_device_is_compatible(of_node, "ti,keystone-i2c"))
+	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
 	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
@@ -811,7 +810,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->algo = &i2c_davinci_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->dev.of_node = dev_of_node(&pdev->dev);
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;
-- 
2.45.2


