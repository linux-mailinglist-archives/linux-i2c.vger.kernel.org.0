Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF51274CE0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgIVWyi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgIVWwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:40 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B1EC0613D6;
        Tue, 22 Sep 2020 15:52:40 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y2so19834644lfy.10;
        Tue, 22 Sep 2020 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3faQfohLo+8B5zzH0TFpDjOnEfWKjT1YG4VXv0eCJ2A=;
        b=WC18emTFt9meTDw/FwXFeS41jaJtpogmiYHeArVASi8YEA452opbKVpf9LNH1HJ+1y
         FtQoP++muW77QPXpR5tzvvmiOXOKvJFdU2ePd6VrfaBQHGrq2cdBpBMcgPe2IOYjC8bR
         F/LodvmSH2169X48qbwnFYYxabbKQ+BQ5yEGZx01iPdDZas6/a5YvojJNWhwrrYZ6Pc7
         I8C7XCRokRafsb88iXubzmDnUmrZdkULdohEBiy0OPhbJH7Ceo9snjpdYv2WdfXUPFhL
         naSSOn0XX3rcb+wBTKx5xJWQrO7cpR/jGXn0QLeMdK62w5jH/wxSKmnHMewiCAO6ReSl
         oZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3faQfohLo+8B5zzH0TFpDjOnEfWKjT1YG4VXv0eCJ2A=;
        b=LYoGzAvOm05PMMPwhEXpRXG1yj8erDy/C5EH7nhlrOFqFpYeGlY3/4Xx5SaRI/Mkxh
         ZzaHwJ7lxOdCHI3UDTjIoPd93jDMFk9+8EZ0xWXCrn/PDCIJR3S88oybo/pj6I2dx7tX
         ZcnMJrDRaYxzkqoCaNWqnKtcQoi3pfAtAD/Ei6fLTHwkDL526MCBIA/BYJLwDGHxC+DG
         +V3uvsNUYQfBkiObc4xu4SJPohgkake8ZBTQtUxlTTtZewP3Mi+raNYQc3lh6icdTjZ7
         PRff3EhZqnBA/la+aPLXi5bO+zXhvK/b7jGfDFa/K7p72XawKH5lgBUShwlHRlUjD1cp
         x8qQ==
X-Gm-Message-State: AOAM532kWp+lnkKpSWh0TojgR3lRmMMccZdhRwpOe6LYuDaA95dbtJtr
        ry3bqOuO2EG3roA1n1dmvLI=
X-Google-Smtp-Source: ABdhPJx5yxBdbz+7j+qVDPT6+nYtTCOqcWspuviOSrDXHfI6/KGqJWSTAP0H7sxWYrv/uxZ+Ix+XpA==
X-Received: by 2002:a19:c7d7:: with SMTP id x206mr2254048lff.540.1600815158584;
        Tue, 22 Sep 2020 15:52:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/32] i2c: tegra: Use reset_control_reset()
Date:   Wed, 23 Sep 2020 01:51:32 +0300
Message-Id: <20200922225155.10798-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
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

