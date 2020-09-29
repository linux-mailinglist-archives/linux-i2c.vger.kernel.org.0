Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477B727DBBA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgI2WVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbgI2WVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB48EC0613E0;
        Tue, 29 Sep 2020 15:21:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w11so7451264lfn.2;
        Tue, 29 Sep 2020 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lL0y7LxhBRmHfDozPlcKSwPEJ6iL358og3ykeSnwykM=;
        b=FWCK3Rd7cly0kz/eIDYnOvWLI6zAtIcRnxiIKeIKaX82fGlkm9XX2hEPwq7UHJ/Wo6
         cq9aqETKEGASnOnxMbP3bItXunuqK38QnYf0aA6RffH0los2nv35kKS0/wkhfHXZo6zA
         NZJsoZL7J/sCxrY/TNaU4KdXSNp5xQyxxN0JkptVFFjiXGVQyPvFGPngyGpS1erCyPwD
         X38e5AwPuGjKj3+/V2+cDhZ5qdLo7qH6LizZ9rJhNl36klPhNrty4R8LakaO62954Nhy
         xxey5fy/k2cL8UUNR10CYwY2bu9IyYqvCclCiNx5QQrzVOWzE9HuC0bYQo1OlErEFzCk
         ULKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lL0y7LxhBRmHfDozPlcKSwPEJ6iL358og3ykeSnwykM=;
        b=GKiw86BGMiWKPfYsmFV0TbM0WI2lqslDIQuGxRiJJ7jMcZDYa0ItIrlnjLbBcokydC
         gZQ5dCXGzKjVw7C/dGvcgNDTjJ1kkc8XQ2PiDpRJLItg8V+4qyKoqSWE5nlTt7ImWxBu
         p8AjTwDyViqtlQy0CmvQov8g5VZpFBcWcdJnLjy/IEimxUWdX2pv9C5LtbbsdlZSxBhV
         tKqZ9UhMdaZqtAZdk46MOb9amWCz8qe1uaD+uggNR9MvAoTYFjNSEOA7v9IH9tscrCOG
         UesSz0pu2accCmaFAlwWNBV5Z4RDjMIf5l2q0th5e1JjlgYJA8uSnp+K0ItZH+YGIJSg
         LX/Q==
X-Gm-Message-State: AOAM531o3U582qhCgWAbjUs3NGnbhkXqPk+/SsizZQ8r/nbTs23e9UfN
        1ng2XboZpudmYWR/avFmHo8=
X-Google-Smtp-Source: ABdhPJydVSGDiXiebnTQp1TNeRY0HT4+elaOxCH6h3DwK/LaRxo6RHQ4fDM359HaQhac60EEV/z+pA==
X-Received: by 2002:a19:dc13:: with SMTP id t19mr1748172lfg.350.1601418068174;
        Tue, 29 Sep 2020 15:21:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 32/32] i2c: tegra: Improve driver module description
Date:   Wed, 30 Sep 2020 01:19:15 +0300
Message-Id: <20200929221915.10979-33-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b88b38a45fb5..6f08c0c3238d 100644
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

