Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614554687B5
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378767AbhLDVyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378395AbhLDVyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:05 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08CC0613F8
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u17so6339079wrt.3
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OIuM9QzqoLSFp3o3v/6I/jeSHjCIRjfuq2y/Qtcg3dU=;
        b=yL/BDPrGOO82E81s2CoZ0i1sJJ8ntfqIiWS4CjUiNhPjUrrYnXiynwHbAIZ7kreR3Q
         iBFV3FnSCucGcL0aunn+NnYlAbUcCkBgRgxlRHHONde1/IKdqUneyGB13jkeuGeNyg2Z
         k3GBJ8qCh7CB8mkMyxYm2UFbk3LImIPueitqZ9+GKs59PG5w+7t707ofHVsS+V12c3PP
         lsZnWBfjhMITxYiY0nN6pdECd0Ul1e1d+Tma8LhVxcxPkXhf2J3sOA8D7/JBvL02bEqT
         EEwDof0edILDCtp0Tnrkc9VpflPNrNF8PgtG5VNyrx/i6alfgQ15F5Gu8MdFwg5zz+5P
         GMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIuM9QzqoLSFp3o3v/6I/jeSHjCIRjfuq2y/Qtcg3dU=;
        b=G/MoxU11WkgPFLVLsKh9N6kP6CHdd3gc/+nHGyavlcAghJUdy7N22VmRzpkGNMnlei
         010vBmu3557xcWbphzGcdFgGUhlaQPcyY28/XfKKOq3+2hMPthdDzlJIQxXPvjn4qUQ8
         rDfQ2g0+bnmA6PPO3lfjJd+4SAAQluJb1dcEngsxr9GQZ9A3GIhI+4TBBrOsdW6O02RR
         VwXUbyR6Rs9n15NDryozxMxqLyYlcHGWbzLYolgEpQG3oDsABL+BlTve45MOGQ5Krvz5
         NTa08/kGZBFN871Vxd5h1Fy/CftWD2V/SyUJ6Pl97z/mgGnHteQ8xqXunp9GsLGEd58V
         H0WQ==
X-Gm-Message-State: AOAM533Ess5tbwVZJyPOj3/Bka+HzJHhvKXE7cuH1dR+aVt4gjOBGd3a
        wy7ASdqMUE6FpoYSqgmaz5plCA==
X-Google-Smtp-Source: ABdhPJw9WaGvY+CHZ6OaiYhj1a7k8vu4++czl8ryj1+oiKXrw5x15nKAzvGtiMtFB/xQXM2GDcOSXw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr30584948wrm.412.1638654637884;
        Sat, 04 Dec 2021 13:50:37 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id n32sm6355190wms.42.2021.12.04.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:37 -0800 (PST)
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
Subject: [PATCH v2 2/8] dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
Date:   Sat,  4 Dec 2021 23:50:27 +0200
Message-Id: <20211204215033.5134-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds new "samsung,exynosautov9-hsi2c" compatible.
It is for i2c compatible with HSI2C available on Exynos SoC with USI.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Removed quotes around compatible strings
  - Added Exynos850 to comment

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 16853f6edc53..bb6c22fbc442 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -13,6 +13,11 @@ description: |
   The Samsung's High Speed I2C controller is used to interface with I2C devices
   at various speeds ranging from 100kHz to 3.4MHz.
 
+  In case the HSI2C controller is encapsulated within USI block (it's the case
+  e.g. for Exynos850 and Exynos Auto V9 SoCs), it might be also necessary to
+  define USI node in device tree file, choosing "i2c" configuration. Please see
+  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml for details.
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
@@ -23,6 +28,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynosautov9-hsi2c  # ExynosAutoV9 and Exynos850
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
 
-- 
2.30.2

