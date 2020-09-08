Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B95C26084D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgIHCNn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgIHCMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B1DC0617AA;
        Mon,  7 Sep 2020 19:12:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a22so11626314ljp.13;
        Mon, 07 Sep 2020 19:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UPDOYzKqS621N5af7uifqlaDWkOlluvKF6+RkvUgMCU=;
        b=maek0TmKuA7rhalDld3NkXKqhxRaTLx7wRj05LNTOXpneZ1XILD6AiEL/QFw7sHUj4
         a6NytJZCjDq5T6k/MmNHdGWoZGsmfORjtNWzlfmJRG3pgdZDTUOvRwwCTy4vtmGUlMz9
         m3BsHXBz9d8StOF/PYjqw60GUt+Ei7irBDgReyRYajl0ITsj43nRzRBTbTRXbSRl/CHB
         wDRj2SRwiNYJXksd8W1ys0606z6RfyVUM2213fD4xgimsBh2a4PAVN5h3L3j+q+6YZKE
         3CKrqKxBNcHsOzpycnsHr5oEh8TWWS+0ZPiOw2km2dH3TkRCD+44kiT8uj1ER9Op0jI9
         NDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UPDOYzKqS621N5af7uifqlaDWkOlluvKF6+RkvUgMCU=;
        b=OMr/MxERjiFTcp8YgR0Th+SESrGhzC11BLqLJ4YzTWHHscmciuhdmJxvVDPhycgvtg
         G6xAGbtX/hmadxFfdWKPBauGg2fWZ1VS+3Yd45s/4WAf8mhaVlZYKwEfl11BJa/dLr0A
         xYHubQDdZ32dbZTjnUvmSlr/AvVIo4DrT/8UnqqTU06up1pMXaAGh5Q5Lr0qoy8N2Vxp
         nbn2xzldFe/Wd/5+tW7J9ZdztCsXjJVx8yHb4YDOBgLws11Jj6XlSCCmbn5br5eFYS8n
         N8maoM3Puc/B2buW4TC4L8H4i0uCnqea7QlaJFWBSGGKWxmDpMfWVaDKSK3SE3wXKWAX
         8ZpA==
X-Gm-Message-State: AOAM530HfF8iJrLaSkRa4UQgM/4aysXIPTf9px71goHWc6obMw6dwhaG
        x+i7OjStMN55yW4PMHgJykI=
X-Google-Smtp-Source: ABdhPJy3VtKROhEMDA00gVM33KriqCJ2racvGAk/Kh4WSLSvCRP/AsATyKnp+OmbLokZ9yYQkgS59Q==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr5920472lji.452.1599531127119;
        Mon, 07 Sep 2020 19:12:07 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 35/35] i2c: tegra: Improve driver module description
Date:   Tue,  8 Sep 2020 05:10:21 +0300
Message-Id: <20200908021021.9123-36-digetx@gmail.com>
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

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 179d4bb66ae8..a7ca3eee525c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1913,6 +1913,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

