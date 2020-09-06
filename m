Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74BF25EFEC
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgIFS4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbgIFSvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8403C061573;
        Sun,  6 Sep 2020 11:51:47 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w3so13552317ljo.5;
        Sun, 06 Sep 2020 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rJKPwN+nPaNjxoMs4Xv1x5Jfq6/lV8HurvilwbgyoAQ=;
        b=qF8n3T0tCSyvevDa/UstDarKzos4zXypzFwXEXhyHm+eqWk/++B0KwCQP8DwdPaZh2
         tBnzrFv30m9Lst8uhyV+OJTR8a1SOnDubTqHRmLFnUzwHbmF5/wYGFdkzzB6qvVI1vyz
         0XIs8+8CQq+Sob7rDKqCRykELL4kQQmgJaDza4xv8rwuPH1BfZNkhiXVB6lqAbXyqEgU
         e8ihlc6DDAGSKpyOeFKEH0BjOxzUHAWcL2vhw0ygJMeMkmjTy2gbKbtIU+oP02eMJAnO
         1fRnTIGpS2WEZddbclWZMAhp4ytY2ZU049u9DAvR/00mk2AJarP3AUmkTbkaRmKx7VH8
         WKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rJKPwN+nPaNjxoMs4Xv1x5Jfq6/lV8HurvilwbgyoAQ=;
        b=PKVa28spxQL4wNZ8ZR9Jd8UNPkgtFy2jgHYb9Pty2dIQc+bMoJ33gm0Q9C6N0h3a4b
         LJeyMyDuIvit+9/C1EI5VuXyhtGNtwP/18Aqi79ymMXZczozYs6/E7nXZ3szg8BgSfxm
         G1WYpWKeSBptVSacC1jX0e87KOlD0QuMjASeg2TFKn278Bk1tr28eCZkqZs6chf+VKys
         NLRGT7pZTfQgRlVx20t2KfkpqWk2RtVBMU9V9gQ1urMsXalAlM25clzwQIvSyhqMv1S3
         v5Gg600/MLSQmxmcKAuDga7P0fYW//IWOzPp2TRHjmMvGm9tRY86w+/6/Xl35gazg7ed
         J1rA==
X-Gm-Message-State: AOAM532WmeL0garD4yioV+24tRPgk9nCYCSgquRKN6oLGKx1p7o9hr/Q
        o4I3Lt0VYerj5eSgeQa5bq8=
X-Google-Smtp-Source: ABdhPJzRQQMaQcto68Tq4pxlZDIQqgUdIhvWU8vqGAF51gEcRri5DhN3FwoSrnde2EkIPPtqN2V7Xw==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr8373313ljp.281.1599418306259;
        Sun, 06 Sep 2020 11:51:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/36] i2c: tegra: Use reset_control_reset()
Date:   Sun,  6 Sep 2020 21:50:11 +0300
Message-Id: <20200906185039.22700-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a single reset_control_reset() instead of assert/deasset couple in
order to make code cleaner a tad. Note that the reset_control_reset()
uses 1 microsecond delay instead of 2 that was used previously, but this
shouldn't matter. In addition don't ignore potential error of the reset
control by emitting a noisy warning if it fails, which shouldn't ever
happen in practice.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 043b5ce52a6e..52e15ec246b3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -785,9 +785,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	reset_control_assert(i2c_dev->rst);
-	udelay(2);
-	reset_control_deassert(i2c_dev->rst);
+	err = reset_control_reset(i2c_dev->rst);
+	WARN_ON_ONCE(err);
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
-- 
2.27.0

