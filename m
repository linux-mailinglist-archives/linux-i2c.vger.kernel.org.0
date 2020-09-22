Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2F5274C84
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgIVWwm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgIVWwd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A896C061755;
        Tue, 22 Sep 2020 15:52:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z19so19879815lfr.4;
        Tue, 22 Sep 2020 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fxbl5iVjnQ+NxsUTVaOXHns+qyxrphuUB6cPNnTHHzs=;
        b=TnsqWXHyOc3pUJrEtFvLbESg04ubCclKCuztZssHj47P8rqsaJevMSaifi/1u1ACze
         974oZib2nRA/bbby2fzrgpEyyr4jNRDQqlSm/Me2BhCleFM5/L8AoLe5xmK1XkO7rdLk
         l6mh2c9ecK1duRiBucu0DpQ4eV5E3E1iDpvWU0p41BEkdLNyD4qN0+hfHodUMvEseJm8
         CVOrPD3bo4N6O3qwq0TDrEOOUsgksfoU2Vw62RCySbx8ObR+BhTMHH9orlflNxnjgTU8
         F73t5qbIziDoVAAAVcBrYcyOO3weq5ShgK3PMnADyePJesBAVSIp3/BBYgM3fTSk5+uk
         4sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxbl5iVjnQ+NxsUTVaOXHns+qyxrphuUB6cPNnTHHzs=;
        b=MoNGgBW0OHLah6js9csdZYPKTAZY4bN3yu06JKQEyC3MYffewPZ1rzFiimQ+kBiEb/
         WAeN+BMHV5n5Iks4YSeNSKDaN6ScrZ1qsJ+G9Jt1D8VAFTiYCkK+4ykYJ5ODrKhO76xn
         iCPDCKvvRsiEoFuUuJPuwihLN7Euq/f01sLBktRteyx2x9/IhBlk9oo2fPvhfewk26pU
         v3MMef6xn06pOCsTFvD54+iXYzeuKtX3boC9Gc5E901GYl4bRvJG7dtesm0qY5slcnFl
         RsZptM33S9fCQWoUb7w2dYJt7/bABqi2txXWIf96CdjHMsM0odQWoHp7ls/skY5pfLXG
         ntEg==
X-Gm-Message-State: AOAM530wMVO38XnbK2+th9Xxj76uidFcO3VrAwE5ADsr2ryO92hPF0c9
        jyayMnm2ZUevfs7pVTumOsU=
X-Google-Smtp-Source: ABdhPJyUQpDCs74Y6ciWm+jbq1u4rmVCCf03JDp15EOvdD5cWRvG4bMa0XsYawE0SdavDbF/5Y84HQ==
X-Received: by 2002:ac2:5dd3:: with SMTP id x19mr2745240lfq.340.1600815151845;
        Tue, 22 Sep 2020 15:52:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/32] i2c: tegra: Add missing pm_runtime_put()
Date:   Wed, 23 Sep 2020 01:51:25 +0300
Message-Id: <20200922225155.10798-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pm_runtime_get_sync() always bumps refcount regardless of whether it
succeeds or fails. Hence driver is responsible for restoring of the RPM
refcounting. This patch adds missing RPM puts which restore refcounting
in a case of pm_runtime_get_sync() error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

