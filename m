Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C7A465618
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 20:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352645AbhLATIq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 14:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352648AbhLATIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 14:08:31 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F07C061763
        for <linux-i2c@vger.kernel.org>; Wed,  1 Dec 2021 11:05:07 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id r26so65449077lfn.8
        for <linux-i2c@vger.kernel.org>; Wed, 01 Dec 2021 11:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6fIBufmD5QRMsiw/gE/8E+34ToRCzmP+LytC0+70WA=;
        b=fEwES4k7XV41oxKjE9076qaNcNBSMHNFAhXgS+OoH/wfCgfA7Omf9+QTWzXH+1O22P
         bJjzldE4J2xo8XME/WQRtuDpwzg/NmNVjUy4lYve9X5mM0vKBfgszZ1EedRZtYjS8gxS
         SCwbVv4WXThSbX1fPCzbqzfjGrAF/W3wS9IXCT63GL5QfNE1Dig8v92tAGkB/eP15+V2
         FSEVaqfrRFO3fKoBr6aZQscuTG5tH1c3ICI4w1lZie+wqeFub5gCYdGU5QV43JlY/B3a
         BzlOkHaNCmMXicSPAPKmrq3an0KR1khryejau7fF09f5PyZi3MyLFKD660GpUOew1+HU
         Gefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6fIBufmD5QRMsiw/gE/8E+34ToRCzmP+LytC0+70WA=;
        b=QvrXBzLvaR8n7tdbEvCMSQH2KoMAaX5pG/lnqL+JT1SzyISQBvVZWQVZ5rntQk+8WP
         xt5CYEKIEt4ESrAymXz5wbf3tZFK3QbpgzwlJ0u3wjTU2t5niNQKA7508SbLFnTly7n+
         DhsC7aU1Icg0U4Skq3VFePivJMMo2Y2wsTIgm0nOGvY4KRYYiI2u/w03xVw6LrAuaO31
         ZxVwGiUf1HSEyHSnr/99Fi9S9BMbULHvFhnEIWEIhC+hhGCCrBhpDDt6z3U6dWs1tryW
         aOJaIqF+PbigHTuZr6M70xLMDjb9yA+IazxXnrr/zxUaq1MdfmNiFzWnZjFQs3QWVHVD
         TCmQ==
X-Gm-Message-State: AOAM531dHOLNEKwKu2rpJZqEhhxCOp+qAtDb/E0z6PnaUsTsBMdF3TZC
        W2aFZZrWdnhkiS5IbRKr9EX4vg==
X-Google-Smtp-Source: ABdhPJyvjE/0qbt84gWoIGc+pyqYk+/D639fFxWAkgip4SenMEvpmY1/UWceA3HcjGJREntdEe18JQ==
X-Received: by 2002:ac2:5bce:: with SMTP id u14mr7529672lfn.467.1638385506127;
        Wed, 01 Dec 2021 11:05:06 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q1sm68855lfo.255.2021.12.01.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 11:05:05 -0800 (PST)
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
Subject: [PATCH 6/6] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
Date:   Wed,  1 Dec 2021 21:04:55 +0200
Message-Id: <20211201190455.31646-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201190455.31646-1-semen.protsenko@linaro.org>
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
symbol help section.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

