Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F58027DBA4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgI2WU5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgI2WUr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:47 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD461C061755;
        Tue, 29 Sep 2020 15:20:46 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so7409898lfb.6;
        Tue, 29 Sep 2020 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hpEFlBqr5610OaC3GuR4L/vl5j3QoS+QUksfo7Xm+Us=;
        b=Psq+1YbUtxOxoyND7i/FfzpJg9JPAh3LTq3IRVKyYc+3SHSBh4nJf2iJn0yKRCsqe0
         XnJFsB+UoxDt4+fY3WS4FGCHOVRYpKliUBywmdQInbjS4YjAVO5PL58bN0U4I/mVuWLA
         qU7Mqh3cIJHi92rIXLuzKfN7Bt1ILgHTm7m5dRPr7VZ1PphHGc/Sc/MB1QXVZ5I9XP0m
         Nxib9v86VkxotYuL0OrjX9g+xCv3E4BS0gPaRATugOn4bCbo2wXo0rIMqcoploDeNCvb
         wBeEVSzbCGNE3JItiTLYjHU3nXNDjPOguMUFhq7r6hOJnQkdOZZ6S3jw6xTFadGQKPuA
         vHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hpEFlBqr5610OaC3GuR4L/vl5j3QoS+QUksfo7Xm+Us=;
        b=krbceVhToBcFw5ylakBYtn6bqRXDA+lUJMZLSQBTMdPU872vnbgrgvrei/nYrtVUnH
         cz4khDRIsPGd0dX0ct6oPg9+K27FFKt89LaO8yvjnP/Vwp8VLN6j3yQrJDNVcrR6BUZB
         9bXpLz3ZwFwbN2SozT6JHFackbPv2jZQa/WJpfNVqgk2Crm9QAk1F+9paq8NcTuTCANU
         pdZqEVX7/Hw3n8+P59qv+D7juq0hGVV5cFHUmvqoQUZCY80rweX7+cOKdf2jYXd3Ck7C
         nXRoybg5zN1+eT4rX+FzsTVL3oknuLeClr3O7jLCKdZKW+c4yfkNQ+O7TrbpHk8aXgMp
         icsQ==
X-Gm-Message-State: AOAM531J0DFjOoZZKRsVAvGQ2J8MnNxU+vyQiCfNcYqYDMuDQu3L715U
        VFcCaUY6J0MTiiEcmE9Hw4y/YdCoxp0=
X-Google-Smtp-Source: ABdhPJwhl1NJAQmlaVpi/mIHvw5Gtpzr71zGEW88i6p5lvwy5cRFQNu3mk83uo2xqbTRFhdifrf6Pw==
X-Received: by 2002:ac2:5b4d:: with SMTP id i13mr2217275lfp.12.1601418045151;
        Tue, 29 Sep 2020 15:20:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 09/32] i2c: tegra: Use reset_control_reset()
Date:   Wed, 30 Sep 2020 01:18:52 +0300
Message-Id: <20200929221915.10979-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

