Return-Path: <linux-i2c+bounces-8448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F629ECA3E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 11:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD52164807
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095E5205E06;
	Wed, 11 Dec 2024 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y6SD1s1k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B4236FB2
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733912630; cv=none; b=C8QAAXtPJVy6RR1Md6/QP1GZNIriJDxqyQPZvNGR1dkXzkG5b+9kj7ZKRTF678xA1ofZh3O0jmzOYZ1ste5x8DvB4XS+dc1z3bJvxugmYxWVpXhRiXqfGbHiXOjwvY1GTlaBujtsZ4hhZddO1mOom35HGAExFo6vLtXEfJ5ds+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733912630; c=relaxed/simple;
	bh=GE9nHhh+tAvrTDd3Wg4VS4ZKn+ysGa0R/sXj1ES1Tx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGxWDsEvIw/gthGrn23IyPD/q+9vnO2XSZwn8FcYHQUy5vIFTcnntT7/vrWjD0Hy2XqjLctQRTg9g0zrQSLInDOO3/E2VDbTEdbbJOZ79Zcz4MAH3mbwpU5YBir4iU9EENvsvCBcAn0UIYBMg0kIULZHJrUnVrQ++dkdTqXZLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y6SD1s1k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3863c36a731so2457161f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 02:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733912627; x=1734517427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTKqCe2SELpX+WlhYxUqap5glecVBp4pq97MmKxgypE=;
        b=Y6SD1s1k9l4b+NTA/O1xdNrVp7nekZ2FOa7XLIlPFjzP6LYhWXrzL8ScJ3/udSyDxa
         KIode21kOD3Iv4RSVtA16qSxU3z9Kq9/uLIFQPMMuSy63oq8zppi1N/qqBZkqu2UPXm6
         Y54qeHaYJt5HN8YnUL4gwFTowZmW3KVtLBQ4TMHLvsOQjufmWVMu25PJEX4D3kOqQwz6
         OKD8habDl0x+WZ5nufIhvKH1UHxns9FL6NqLwrkSphuGkMa7ZRx1Lj0GemXJcxF6z6J2
         GbWVjwyUWVpsPRA5+9Ba7KMBA4QOyKU6EV/PPrCpC8b2T1NHaFbOzoeEGS4OprtU8Dyu
         E9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912627; x=1734517427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTKqCe2SELpX+WlhYxUqap5glecVBp4pq97MmKxgypE=;
        b=w6tr87GtrB221RVxTEPvJxB80O225HnCMpLiuZ8SsAQsvhDhUMeA78aRr4JnKaP/vH
         hyM1qAtUgY4fcMGEZNhmKXJyTHfI2pXKKNegq4DJ6AMzIoAxxC+Dg2AUFlRfp+t1lQyG
         zubHRl/ARzH6B/CqInkM//RRO2OSMd7shyUWsUFt7BxIIan6NFpTwdmII5W8b4QLgMIE
         bNhxR6qqFDMYl/OBKzJYfh/mYxKZmI32beQ+BeIthp9uAiTYbDsAX6FS38tH2/xWBs/8
         ddEA49Oms6lZT9G29opQBT9mpwB3EoaAJdYsFKRGz8TpZKURAqU7QAx+neWV7937U9GU
         sEBw==
X-Forwarded-Encrypted: i=1; AJvYcCV/9ub+sQdPNdikHCGdBrY4yTiPZptpkZJQQC4n3Juj8Pj4rVbEPOY0KK+grb1khx9Gzq7cfeYjVR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbikweVjMlUIhFAYiYYJicpXyRxmpaQw8CNPYWIRlQ9fMOMGfz
	z2aj4uZOROTOnt2WFbdvY8U/dOt09hOZESgz6cPgDEKI061Yfw+5Ln0YS5Tk1V0=
X-Gm-Gg: ASbGncv2uM2zuoEdJ9dMLdgNytr7t9yUMLuL7C6AC4iBMThw2HkjlWK0nA+T65cQkbJ
	sE1rCvw5NEYzkAlA72KzJE9dOg7G7MZ6/Eh9vs23nyc4qz5GG93dn+ShehVH4QKqBIUjDxzWQPW
	h1HR8kewVg5KZCWOYX8+oE0b3sJroeiNHmAvJy2LnaIOckSEXB0QP50m1mVeCBDAjLReMz3JSnR
	gQQpgN2do8B+KQ22bWou3vX+qsIBmjqLMMTDVb2quwElR2mfye9SQ==
X-Google-Smtp-Source: AGHT+IGb04BT249VC+YXzPYDilPJen43l7hFegMSZVIrm1PY3iqvihpx9mzJpwggyt25syAnQKuRgA==
X-Received: by 2002:a5d:64e8:0:b0:385:fc70:7eb with SMTP id ffacd0b85a97d-3864ce7fe09mr1468743f8f.12.1733912627500;
        Wed, 11 Dec 2024 02:23:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1b3:c106:bf71:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm935137f8f.66.2024.12.11.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:23:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] i2c: davinci: order includes alphabetically
Date: Wed, 11 Dec 2024 11:23:36 +0100
Message-ID: <20241211102337.37956-2-brgl@bgdev.pl>
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

For better readability order included headers alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/busses/i2c-davinci.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 4b499931fdfd..bab9f785eeec 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -11,22 +11,23 @@
  *
  * ----------------------------------------------------------------------------
  */
+
+#include <linux/clk.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/i2c.h>
-#include <linux/clk.h>
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/err.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/cpufreq.h>
-#include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
 
 /* ----- global defines ----------------------------------------------- */
 
-- 
2.45.2


