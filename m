Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DDE262320
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgIHWog (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgIHWkd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F00C061796;
        Tue,  8 Sep 2020 15:40:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d15so518968lfq.11;
        Tue, 08 Sep 2020 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wL/ufnc3lNtiNLFNRaxPcM6Cg+5dtTmA95pTCa3ATE=;
        b=k0FXwgXU4mcLT2A1bI1T5cGF4NpYgRsLXvTsSxLorCYWjIvUzbrx1kOANwqigl2kJO
         LMlx2XKGehgjtV8npzI9eIRDkoR4wtKFX/fJpElnqc6r2sExJ7sQEgsrrXUq1FuN6p7x
         y/P/wCQ9MQuT+iykAIr4SLMHNbfpfpI/cA9/z6gEwhHbb9nOXCy6Lg9dlGawONsjenC/
         CuR594I6HyXGla4cbNnA0ZFzI1EmG9gxHEl8U+j3SRIj9JuySePM5z8SiRqcQXTRyXWa
         MAnWKBSBFnyQsMXeTUvrst9hHnjUWt/pRf6moV9IMRu7JsLgiFZ9ykpFu0DE05xklISp
         6mFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wL/ufnc3lNtiNLFNRaxPcM6Cg+5dtTmA95pTCa3ATE=;
        b=PPrRrx4fnf3AMMJZWf8W+zAnUERiDG9M1deUtp0qPh/rO7B3cTy/VMY2rvHX9ZqRne
         75Re6DUq5Ynq0sDwtjCxEJY/TJU86IREJn3oB25izpsEvkcY7Yn/o6a4YN0rNDaqfaTy
         6KQ7V2Ntd3/w/52KqaOQxaHpntrSkvV1pJdCUZhZlMeIUetofI6lIX2w6nUkVh3e+bKE
         sbhIreuZzNWxSjJc3n2f4ERowE+Y93UK22sdD3JJI7NO93d4S7NCdI/md8rY8XTtBiuM
         95iDMhI0DLPwAKEu4DVQ4p7d1GC9f8lW+sSXdyAkCVydWRzQK8iMupbVEsqRs0dkud3k
         DH9A==
X-Gm-Message-State: AOAM532MO8/rHWGO8MPVf4knVwl2wH++4c4WrVn/hgJl2zR4zOORR9d6
        UyNvrNY9uOGjqUcIyS2n0uI=
X-Google-Smtp-Source: ABdhPJy51+CIlV3Kafu6FPuvjssxWd9ZnLRfgcIdHX58Me6ywjavsG+4DHx4qhjtT8wZLRHdoyT+6Q==
X-Received: by 2002:a19:587:: with SMTP id 129mr541797lff.200.1599604831525;
        Tue, 08 Sep 2020 15:40:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/34] i2c: tegra: Use reset_control_reset()
Date:   Wed,  9 Sep 2020 01:39:41 +0300
Message-Id: <20200908224006.25636-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
shouldn't matter because one microsecond is a default reset time for most
of Tegra peripherals and TRM doesn't mention anything special in regards
to I2C controller's reset propagation time.

In addition don't ignore potential error of the reset control by emitting
a noisy warning if it fails, which will indicate an existence of a severe
problem, while still allow machine to boot up.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b813c0976c10..90ba2f5327c5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -785,9 +785,16 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	reset_control_assert(i2c_dev->rst);
-	udelay(2);
-	reset_control_deassert(i2c_dev->rst);
+	/*
+	 * The reset shouldn't ever fail in practice. The failure will be a
+	 * sign of a severe problem that needs to be resolved. Still we don't
+	 * want to fail the initialization completely because this may break
+	 * kernel boot up since voltage regulators use I2C. Hence, we will
+	 * emit a noisy warning on error, which won't stay unnoticed and
+	 * won't hose machine entirely.
+	 */
+	err = reset_control_reset(i2c_dev->rst);
+	WARN_ON_ONCE(err);
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
-- 
2.27.0

