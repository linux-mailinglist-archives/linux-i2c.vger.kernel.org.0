Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF7A3546AA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhDESOS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 14:14:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33038 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbhDESOR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Apr 2021 14:14:17 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lTTjm-0004jB-HB
        for linux-i2c@vger.kernel.org; Mon, 05 Apr 2021 18:14:10 +0000
Received: by mail-wr1-f71.google.com with SMTP id t2so616437wrr.1
        for <linux-i2c@vger.kernel.org>; Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gG8foTXIek76KK7nrOQoCVDJLrfCMKqkVOw6WNO7XaE=;
        b=c1kI2f/h6O0rta/JdkT+1zW2VL+g2JH0Q4F6YMV7nFvDAFBstij86kgVX6a9OOeTGT
         UiUqZEdpstne1UfZzpBHaH5qtlO3WQkhj0gG/NwO6oahBlPA5I2LhW9XvtjLxIrIAQIz
         MASwsIF81Vx18CD1/eAYziiy0X5eVD/+avtHpwld+DFcQHCle1NUAfr+PteNCdvyMfXL
         exqu052ar5LizftcFEVPkUzzTBu1VK8hmPoVNMtFRJZvZqxjtCxldR2hM/A2U6ZMwHyJ
         WFMlZcGA7GUtz/BZ5NuX2NplXcGU0J8+uA8q/cLgqY/cH0Y11w2gjkTrt1uH4afn18U2
         TdZg==
X-Gm-Message-State: AOAM530LBwHt6oL7FDc+/XvHbtPTC68RIMG50akgkQWfUMGBDtwiprEW
        nh1vTi7KbKFtuWLf0rAEofeCJpd8hOp+j/qv0x8W7j8r7DtZA7XGOzX3HIeyWM2lWPgYHk+OKb+
        uzXyyxtxaWMBS74xvTEiMEZib6YFz9c2kVurMtQ==
X-Received: by 2002:adf:f682:: with SMTP id v2mr6608050wrp.263.1617646450237;
        Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN3QoJP7AbUP2fJpUtZvnPoTvp8sPGHtOVCpQs4vwVbulMlz7NKWTIrPsFa5QmNowx6rn/Dw==
X-Received: by 2002:adf:f682:: with SMTP id v2mr6608037wrp.263.1617646450126;
        Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id h62sm374140wmf.37.2021.04.05.11.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 11:14:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: exynos5: correct top kerneldoc
Date:   Mon,  5 Apr 2021 20:14:05 +0200
Message-Id: <20210405181405.52189-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The top comment is not a kerneldoc, as W=1 build reports:

  drivers/i2c/busses/i2c-exynos5.c:39: warning:
    expecting prototype for i2c(). Prototype was for HSI2C_CTL() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 5ac30d95650c..97d4f3ac0abd 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * i2c-exynos5.c - Samsung Exynos5 I2C Controller Driver
  *
  * Copyright (C) 2013 Samsung Electronics Co., Ltd.
-- 
2.25.1

