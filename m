Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE56274C97
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgIVWxS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgIVWxC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:53:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4350FC061755;
        Tue, 22 Sep 2020 15:53:02 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m5so19866085lfp.7;
        Tue, 22 Sep 2020 15:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ZMOQHMaqG4ejJzqXZ0omtNspdRCXUNdXjlNKCcyJPs=;
        b=s/KCTmFIAZq2nI563ceQHT+VTSdShyI7x95WSqdjyey+X1G3pPobQkaZEtJQQgi1UN
         8TnTPqKOscA/Aa62dJ34+tfGIta+7gBlCaVKJsNK/QSBAs6KDZrrxnCdnFMLrezJrWEK
         i7p0wkVnoII15AMSvtFLrsGVnAGSGw7aFOsvH2Gez9Y3n0YSRr7OnNAgjq7i9efPlzJk
         SOtlFn9O0zCuc/t5c4YhifPf9YlZnhpwaGiqQkHSkQKv817jiRbgH85CZo8RdmgnK0D5
         Z9oGKliLmqEGddDAj+jtWdpzFG+NjJ9obHJ18xjrhe1ONDis0kY5E/5nfKKzbqCXZXBX
         WpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ZMOQHMaqG4ejJzqXZ0omtNspdRCXUNdXjlNKCcyJPs=;
        b=YhA4hlXA/HVEpZtoVvzXC+zaVWqrbvKByvdCXY/JzIEZStqyCmGeDEY9VgkDCrlDyD
         AHCptRQCEgVljruDnk7j2Yp9c+hqrvnvy3Jdl90M7qcXkEd/cxbntHOHtT8ysrsWro48
         5cSO5zGABuvCCM2EzkV0M/945kyWmHIoV6ZZOsJTIoxmFH+zaQGBHmdV/H++dpFl8aZF
         /lE7qFJ6xd7D0F3B4d8lp27Kqes5K6kK5yV6/hcmd0kzx9VsIostaQbDkUfDT9Op3dDD
         IsyjzLYJXRdz/uE8LeiffteKO/0emhtObzJooNn8pIaIcZXI0t+T+hANcPLBQmwxhOad
         Dc8w==
X-Gm-Message-State: AOAM533BG4J3323DdWTaf3NGe1hyhdZqYvbMz65WrZl9sopBO57KE9ky
        0C6JqWCFj9bGpgBo3xXGD3kYgimynxc=
X-Google-Smtp-Source: ABdhPJyw9h8PsbsmcscRsDRJA7/iEtSL8dgVuiDr7YDhRO8LuUTfifeIiQHN6f8fvDv7awZPP+2r5Q==
X-Received: by 2002:a19:8502:: with SMTP id h2mr2600210lfd.17.1600815180765;
        Tue, 22 Sep 2020 15:53:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:53:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 32/32] i2c: tegra: Improve driver module description
Date:   Wed, 23 Sep 2020 01:51:55 +0300
Message-Id: <20200922225155.10798-33-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e3f3bee585fb..eb95fc8c0c69 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1912,6 +1912,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

