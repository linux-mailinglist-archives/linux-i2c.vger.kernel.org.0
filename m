Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F084D260880
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgIHCP4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgIHCLq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20176C061755;
        Mon,  7 Sep 2020 19:11:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so17986470lji.11;
        Mon, 07 Sep 2020 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wL/ufnc3lNtiNLFNRaxPcM6Cg+5dtTmA95pTCa3ATE=;
        b=kQQ5yRgToSqKZtbeM1mLp+n9KNsuxWn8CPgaSZSBNnkTnjcxBW25gTCORF3AW/8VCz
         +rU+8hLtyUBf5IZA5FP8yRTocyEZ7UHGbL8q34S8GiggB/eWGx8oKrRmGvgxA8UJ6a9F
         +XG4aN1EaytABjB42SYZm8QbyPxjUXAjQRc2haYJKV8iYb+uWcfmTOsnVEzrLSeqhVex
         ALhV06lKDdQxR8THA1IGXHcJ80T6RHd5JdfVf+nL7Qjd8RZ3YbeectWhhM8k6w5c52TP
         afCyvBLvaeLf4PLswFTw885EpWztfCotnFuyZLCSGStN58DYfRA6uR6uvlimk4unseDm
         fC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wL/ufnc3lNtiNLFNRaxPcM6Cg+5dtTmA95pTCa3ATE=;
        b=QwlyUCSN0zvwkU8BTum5OnNPatl/jj0Zv5TpHnsdIAnojyj+gFtLCCQvVr5/25q/5v
         wnvSmzQa/fDRvSyD1OE1t7ElUqzwAh+dHu1Zi4fSEQ6NVkA3UxPdQkIXKDgWOFxdi16+
         3LTlyU+w9/cUGpXU3iWO54LC+5nJjd/r1VR3wCGnOTi1Ok4A1EEmwsoAdt3eJcq0UFom
         Uva1Shd2TBYAboBNTf9rDnYULByfZ/bW6hw35qU+HXFBzPo96SWyW5LbqqOV2IJnPXKv
         51yOB0lTF4Zxv4TtGElIR4mpkkGi3jajYY9/Dd/HBpJ+bD8Y/ckDkhtvyG6D00fzKRiI
         SLPw==
X-Gm-Message-State: AOAM5306cj6PUdHZqZXGuyytCr/E4N3+JXbwR5a1P3pNC0b7h2D1qBp4
        bCgsQcICNsI7hZ1HvcBA4PY=
X-Google-Smtp-Source: ABdhPJwaDffkzdplR7onoD0M9OXTT8yaHwzKdXcUTIu4i54uPl9TI2+3gvjT9F51anR+Zlh8qZNf6A==
X-Received: by 2002:a2e:8e30:: with SMTP id r16mr10630255ljk.304.1599531103607;
        Mon, 07 Sep 2020 19:11:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/35] i2c: tegra: Use reset_control_reset()
Date:   Tue,  8 Sep 2020 05:09:55 +0300
Message-Id: <20200908021021.9123-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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

