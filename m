Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AD725EFA5
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbgIFSxM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbgIFSwL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4D7C0613ED;
        Sun,  6 Sep 2020 11:52:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id t23so13596154ljc.3;
        Sun, 06 Sep 2020 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b2pKs9JKaWiRtugrV5Fpg+pDMxbsh+cby4Ftd2WFM0c=;
        b=XFQ4J7qvMI/sTrOBJMHWZA8RCBMgHAEbXFXtyytj/rVX19Nf1jhyw5XwTY3vYCpUc2
         nqROPRdSIhYcc5jG1ik8ongQ+148iKBowCOvHnW9OIbHGHYUm+21Uy10fLrlxYpglATD
         sSQ8/Gowa0SZALpbvAfxIXZbss6VOb5ZEX+sabG2Sioah6SsQtPTDxaG0lATwNUdWo1X
         n6765fXfomLFiqXhKqzM1qoWhxRWqSEkmaVff3F7FjvYuUdBQm5PppM7nHDm9pE5gZi4
         gSepzSaVgIPPzSnp7IdALzEcrTv0kvj11m7uGo0d27nUgt1wuAZr9N5hMWwViVpRhfU0
         iT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2pKs9JKaWiRtugrV5Fpg+pDMxbsh+cby4Ftd2WFM0c=;
        b=HrIhmq9HBAqX4MO1T5A2MFVikquf8bKXEXlQWeo5dGsOVEVX32hOvOQX+LlZz5X7rD
         RYjemjOkBntQKGI78x1gCEgQ7jwVrRC6gI4RCf06dFXeRh0/OOfbPsgttA66Cn4G+sA3
         R3btuPeDZUN0dxnFNeLjZJocHeg/ahVZnArmJKHCC/rP0dYM+y7at/rF3RmWkNSNAXwG
         B01BQXvCkhsoVmVjgTAki6zUMyoIaToVg/XHtLTOUJvg6YPFyM6G/kxMvnyHCout6S78
         FPD2c2dy7SoQfizdGIg8I9hg6OVoAZfRCjDgBlKwXzoYzFAhYDs3zwnxVX3BIBTG/Fte
         VloA==
X-Gm-Message-State: AOAM533HyirJu8CF6YR/5b5xGNAkJnHEataBoXd0Rw6cpyG3qy+YGc03
        L2F24bpFoOd7SgqwjV7ApL8=
X-Google-Smtp-Source: ABdhPJzc4vm9QNSQ8OwIHtUnPQSYzvNN8XyLskyj83kHeyESujMInd+tLAb2nRr98LsXj4aOxhH6nA==
X-Received: by 2002:a2e:97d0:: with SMTP id m16mr9033420ljj.277.1599418329253;
        Sun, 06 Sep 2020 11:52:09 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 34/36] i2c: tegra: Improve driver module description
Date:   Sun,  6 Sep 2020 21:50:37 +0300
Message-Id: <20200906185039.22700-35-digetx@gmail.com>
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

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1f3110a589af..f15796a19688 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1897,6 +1897,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

