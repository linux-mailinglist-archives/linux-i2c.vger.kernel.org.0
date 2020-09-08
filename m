Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294162622C5
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729935AbgIHWkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729622AbgIHWk1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:27 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F79C061573;
        Tue,  8 Sep 2020 15:40:26 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so928532ljp.13;
        Tue, 08 Sep 2020 15:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lmosp0zHTCuESLy5/lSjNc1iMwH+IzUsdjaB+ieXAnU=;
        b=rzdlwT25l1DMsCJMzVnTYm9A0ddyNdzkSN5ZNDUuOWWGIMJG61qGef3/66njGxYkj7
         7jvHPJb7iTRdJLPbxzbvMhM0GUhjZ2xJzbxYjizNHvBJOMVNsCLV5b7STwY6u1bo5hY7
         TlBKaNUPnu5sjQvO/jjolI/WS7jsqYvsdGlg2RA5A3rw8ZmkKC8w717HnMIO08Hlxn4k
         mWG6OMoxyg9S79OLdUJr13X7zqcCCLQMvfatCcE4/kAoUpErQEbMJKAuRPME2snEfP8f
         d8q07B/mkSTD+mlw6aduUsaJeesTqtxTdgelSUU+rp5FWlvWRqK4bVp6qd5XIk/+blDL
         EQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lmosp0zHTCuESLy5/lSjNc1iMwH+IzUsdjaB+ieXAnU=;
        b=QcW7bdBeZbcZl/Vbz6G6N8U+dVKGAWrl6AJaEZ0n/lM6TU/JIkWjFAdsPDaoRXwTzH
         b6sDC+CtvMesDWVz/dA4xFPaZ0oCITRZtfPcA3YsdlBknSMzHeAC7ilahxLf5OwcmG6d
         ksDDwgPNZHO7KCI+RxXA1o1eHNJC3XCFbyO06A1XUYGQuZCfV+b87O4O1o1JKiH222vL
         uN0k3tyjnarGdKu8faV/PzXsP3tu6Z9vPCCl4fFGNVkS7vJoXtxq6tdBrn7hKJOgmaam
         52WJg91HYdbD6/AoZkvMtchQhVzZ+C1e3rOmMrroeiNsiBFYt/nbYebzp94Fv0VTVj8v
         FrXw==
X-Gm-Message-State: AOAM533nkYpF9I3UIgbPgFAnvtGipw2kCEBSaPBo1d6SVeT/H7FDzjaA
        rIdQ26cXZ05EqdyCPDuSZRQ=
X-Google-Smtp-Source: ABdhPJz5nBCX3R0V/FlzmRC7J8XLN0h/WAwUFe3PE7jCQ4ZZ4cE+fuywkgJt+pgj3vU4BAx7CuSFYQ==
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr326040ljm.338.1599604825025;
        Tue, 08 Sep 2020 15:40:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/34] i2c: tegra: Add missing pm_runtime_put()
Date:   Wed,  9 Sep 2020 01:39:34 +0300
Message-Id: <20200908224006.25636-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pm_runtime_get_sync() always bumps refcount regardless of whether it
succeeds or fails. Hence driver is responsible for restoring of the RPM
refcounting. This patch adds missing RPM puts which restore refcounting
in a case of pm_runtime_get_sync() error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ab88cdd70376..4e7d0eec0dd3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1375,6 +1375,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "runtime resume failed %d\n", ret);
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
 	}
 
@@ -1786,7 +1787,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		ret = pm_runtime_get_sync(i2c_dev->dev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto disable_rpm;
+			goto put_rpm;
 		}
 	}
 
@@ -1851,7 +1852,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	else
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
-disable_rpm:
 	if (pm_runtime_enabled(&pdev->dev))
 		pm_runtime_disable(&pdev->dev);
 
-- 
2.27.0

