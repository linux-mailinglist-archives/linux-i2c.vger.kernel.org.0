Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6644687C2
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379496AbhLDVyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379310AbhLDVyL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE09C061354
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:44 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 137so5187909wma.1
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9/f5H72OZwAWBfTwWjxjh3Cswg/BAbbKzAOQfyJ7mk4=;
        b=j845AMUScjELCUCmoLjdlY+uvs2lRhE9hbDTxip9EUwCkFV3am2Z7SjrnrqxjvGiKF
         hC23K5/8j2qpLGQ4DYV0+nDP1av5A+O6jV6by6cwYq1Ebw9bziaroWbAfj+cXzu0XbEu
         VWcysmTGbfvGn8TOw7rYo1cFwewtQyxw7X0xjbmkPCNg8kfpWl46sKLyhJKCbiWF3z9F
         tmuKRH34yz0U7GTUbSNlc27T0zJv1KLAlYPaj/0Y+IdcVvyPpjIyVIS2IjWwf8YLpo3v
         bOI5o6jMHUZ604XZ3oRzOPfgKoR4RY04FPWi0eb0KO2xvQk8XOxt42q7sePL7W1hFmPL
         6aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/f5H72OZwAWBfTwWjxjh3Cswg/BAbbKzAOQfyJ7mk4=;
        b=6NEdj9drwy1yoEYYyHqyeVbLSeWYdF2xcf8GJxX+reDVGrw/mLphTTXEPpfpcgpGo2
         /i+1dftOG1u8vNyT+1baWUDMRYX8GxI6bPyNMCPT3ksmdc8Iko3jfM1ecWzETy3afVFi
         Q6J4XDJ8BM+eLx8R3OOFlbKI130XIMHdp2NcSfBkVd2vyRaZ4OGt7PB06BAeaoAz5FVn
         4B+5kYQsEOLnNWKlOoa3zGtHcROou9RxFBT17aS8OuKa/4zX5yMYzwqwLt1MfRfsIeSu
         Ck+MrEp+tTZEIjvximdCIHKefYhOLmmATGAByLJIOxltWPBhCCSOiTqVKfZL7NpNeIdv
         mRdw==
X-Gm-Message-State: AOAM531zhTgMiSBmbdAlDA5yaWtBtvHysmVU5jBCGs3pb0UPsr/NNVxF
        lzMeDal/jSE3Q2D88vKfWZ8Xxw==
X-Google-Smtp-Source: ABdhPJx2IvYVdZYiENMhh0xl6q/Cj6e08pCD+C1CHc9FvHoaLGmv8j15mHZvoetiBjeVL5tQtuhqIA==
X-Received: by 2002:a05:600c:511c:: with SMTP id o28mr26887636wms.96.1638654643548;
        Sat, 04 Dec 2021 13:50:43 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l22sm6370150wmp.34.2021.12.04.13.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:43 -0800 (PST)
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
Subject: [PATCH v2 6/8] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
Date:   Sat,  4 Dec 2021 23:50:31 +0200
Message-Id: <20211204215033.5134-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
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

