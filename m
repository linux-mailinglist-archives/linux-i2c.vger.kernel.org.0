Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D284E25EFEA
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgIFS43 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbgIFSvv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6EAC061575;
        Sun,  6 Sep 2020 11:51:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so13532508ljg.9;
        Sun, 06 Sep 2020 11:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6yHdMqqWZ77i/nIyrubIBSN9r27M7GiL+PUPI8e/TLE=;
        b=NK+C0wj2CK0zLFnP0+4xV5+ntOaUMVf09Neir1x64OJ6ZyORklg2YbD2QzyFeSVXCI
         KzpwcC7RlKVV0/a/o880aREtGrHivbqVPF3/1Y//t2xXIoQcwHeQZTrLjfLdzssMli9V
         aZbOok3Z3Kc918GBFBCNZSYvrQ+54XaIGtqFo2p9pEx0A7xGMbdu58TZ4FSwOXWIeJgn
         CpgWFdmr4TTjO42S6Gc4Se/P+VfGr/GtJXIfouTzAiML3Uc0mWvPMC+NOgFMR6UaU6t0
         CDUf2jpF5NQEq3td3Gp7SNIot1y4uChQMCYlujM66pOVnexpcjwsNFnf0VCdCMIG+FYi
         M+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yHdMqqWZ77i/nIyrubIBSN9r27M7GiL+PUPI8e/TLE=;
        b=rWwkhNoUdbw7+M4Z0wr69UQbw/K9UOwf4xBOkgTCeT09TOTkCme0RRwT/auYix3Dm0
         z0sa88RhJ2zSpjEcDhGgpScnQW2bSaU36+vVJGebS6E6if+nLAg71MvNMNuPfqWsZJ6q
         i0ydPoYvfZWyf0SIdnDslTELcOwskCpuTnS5tPyVuG3v029alDheFI2JhBNF7Qcu3sPL
         HM+XuP5+Vd5Q0Wh57P3wxsuGhW59TrcLXmipMa3rcAyCWebO0Pw3Ax9amy6IrIU267QB
         yA8ynhkw/qMRsuCpSfcdBLpuVsI4NGn9LZtathrtcNVKBw3jb5HfTMBG9mS+5XrXBuG/
         1DXQ==
X-Gm-Message-State: AOAM531RwMuPa34g5Kr0i68uf6tj9Fr71jof8/rTvBNCfj3VZuxsgA8h
        zuSrtWfoEdqn/7V0SdleeUk=
X-Google-Smtp-Source: ABdhPJy8bvdgMnJmhh+xJINUFwtNaS5MFoXbxUlf4FmIpIAck9TdEmL2ASmeiKUagxRubD/l8XLnRQ==
X-Received: by 2002:a2e:9655:: with SMTP id z21mr8606590ljh.410.1599418308131;
        Sun, 06 Sep 2020 11:51:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/36] i2c: tegra: Use platform_get_irq()
Date:   Sun,  6 Sep 2020 21:50:13 +0300
Message-Id: <20200906185039.22700-11-digetx@gmail.com>
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

Use common helper for retrieval of the interrupt number in order to make
code cleaner. Note that platform_get_irq() prints error message by itself.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2cfc96bdd9e0..435449d7d895 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1674,12 +1674,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	base_phys = res->start;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
-		return -EINVAL;
-	}
-	irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-- 
2.27.0

