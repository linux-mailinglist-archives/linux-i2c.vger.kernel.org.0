Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCF04687E9
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355824AbhLDWB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 17:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355715AbhLDWB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 17:01:57 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8671C061359
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:58:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id c4so13632839wrd.9
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9/f5H72OZwAWBfTwWjxjh3Cswg/BAbbKzAOQfyJ7mk4=;
        b=ZJlC4rC2PXt1RjD2+UWrNsa/LM459NF7DnXeIQfRYGAiE9sx/BYQ+C+mQtDYcMj9Hi
         v7EXQYfbFbeP7N0LR2hbB3pN2aJeQNs/GvlK19PH1wOrgqEWfMTI+wQ6a+z8NBSGO6fH
         0iFsq6CqkgVljx/aPBSuVMeI/NgHVsT8ZVlKy7hhuPVe4i3lRwQ6ue2c16mi5uUFtMwh
         8q46jczClgBno+Ysx/F02cXEX5JL9JdJHSvDkapep/okYaMQweCzCgx+dFAp7tB+xwY9
         Tx0nB5dwWz24mYJ7Zdk6K3G75J0zcLpZg4WIYVaD7pk07kRlU70UxXr7Bex46nBQc+DE
         BIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/f5H72OZwAWBfTwWjxjh3Cswg/BAbbKzAOQfyJ7mk4=;
        b=0xeO+vcrXk95z/qFHS3qpi7912jD8p5wJdMPgSw/yrpMeRUrMZHo6okdnq0U3bMw3m
         OeC7EtUwVbzSqtGF8xFc1CNcIiHJ6vYZl7sXZpv957YE5wgB4UKS6JnXebMp2nyRWyYI
         kQN7q2x9Zb4v07/UrNLlFKpwNDw/1BfaSVHLeQY5HswEEysUYXfTFotIl+lfPYrv3mSV
         0ppgQehsNS1006W12lhi+T6SjrwWWSIX+6KQ/BhUE0seqaPRNgRp3IR3tyAliIcBtPxB
         GmmdBrRDK6q8M8xwtvumZ6KLD9dDZe7UOIs6M9eOr99OixNi24SCxRbqHx51MrRNow1y
         GqUA==
X-Gm-Message-State: AOAM533buHyKOPbGZNxDTEvvanPU8yzDnzJQNp08s5MqV1qfCQZYAzMC
        msFJOb0dGx2/nCY/UOW+HJwL7w==
X-Google-Smtp-Source: ABdhPJxB/usi+hZ8EWMMZVaIgdfFZX4pZuoM5qDXgzwjZsgq3S5URnO0esJb+8LnrFOkCg5hol8XLg==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr31800541wrn.90.1638655109393;
        Sat, 04 Dec 2021 13:58:29 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z6sm7924914wmp.9.2021.12.04.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:58:29 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 6/8] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
Date:   Sat,  4 Dec 2021 23:58:18 +0200
Message-Id: <20211204215820.17378-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215820.17378-1-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
symbol help section.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added R-b tag by Chanho Park

 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index df89cb809330..42da31c1ab70 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -617,7 +617,7 @@ config I2C_EXYNOS5
 	help
 	  High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
 	  Exynos5250, Exynos5260, Exynos5410, Exynos542x, Exynos5800,
-	  Exynos5433 and Exynos7.
+	  Exynos5433, Exynos7, Exynos850 and ExynosAutoV9.
 	  Choose Y here only if you build for such Samsung SoC.
 
 config I2C_GPIO
-- 
2.30.2

