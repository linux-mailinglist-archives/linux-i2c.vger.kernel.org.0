Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D44526087A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgIHCMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbgIHCLj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:39 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F47C061755;
        Mon,  7 Sep 2020 19:11:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so18006973ljk.8;
        Mon, 07 Sep 2020 19:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lmosp0zHTCuESLy5/lSjNc1iMwH+IzUsdjaB+ieXAnU=;
        b=njGalvIdcm6ut/39tvF1ZFtPfjvs52Rky4wNb5FqTwhfXWfNO031Nllgei/KMWivpb
         QLEyQ7WV1pIWZ4ZeogfXEC6JaQQDeF1nZ91oufJOpgI7O6a9dX7YP5FyBcpuiQ1+Wujz
         Nusvsywu9fLKk8L93SxEfjnlf9n6l0wG/nJvwjstMI0EOIViu7aV0B2TgVau083vrV5h
         zrpGvWgUa52Zl0hVD4k1m6RlFLzOHqvQTtJ6gzrwPfwrjSThPzOyWiga3PorW8EIXZVk
         GDyiENV+9LNalbYocFTO5pgR3OQyIkp+fgA63m3Cy0UrqhWiVHDAEgYQZ08qqETmTkYK
         NwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lmosp0zHTCuESLy5/lSjNc1iMwH+IzUsdjaB+ieXAnU=;
        b=SM10G8xurhbJw4RmrRIWmOsx9fXhRO3iKaX9rMx4LBkgWuHznpKv5vqBdXjiYGWGXq
         +jjX4bNK95Ja2XP0GGutcEDnaRfWp2SksmxQ1qH+kEB2hio6EQkpCHWUq2q6AlR5pe4U
         PUk+W3SixI2zgQWdscdN9pqpfCp2oCedDiTAvy+RVSytsEDQVy0zk1YDqOxfP2gX0OKB
         FZ9FlYW4KPLXoNEp0SOxqCIBP2XHrlw9+wXjJO/Rnj3yEGcehubP30cgPPEmd6oLrNM/
         6jsQ7n5hop53undFAIeR7LA3RXeVV4JhEANrFKQEY3I+SdHA1HuMFJOhCqW5+fSbBq+q
         B/8w==
X-Gm-Message-State: AOAM530AP63qJgMhP3uDbFfmwWg/ki5fvI/62eSkDsWx2r0pLqKxQdHk
        9BCrUG8vH5QgjIPReNoB21U=
X-Google-Smtp-Source: ABdhPJxjCcvuwQ6ZDiRBXEciJzc2XrhENUGOgLk87wPQP/VE9K86UYQR9oq+wW1kpzFqyZk15Difog==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr5919782lji.452.1599531097413;
        Mon, 07 Sep 2020 19:11:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/35] i2c: tegra: Add missing runtime PM put
Date:   Tue,  8 Sep 2020 05:09:48 +0300
Message-Id: <20200908021021.9123-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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

