Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B402C7E53DB
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344581AbjKHKoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344514AbjKHKoO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:44:14 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C631BEE
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:44:12 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4084de32db5so57279045e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440250; x=1700045050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
        b=zvcmuWcd0sa/D/sHSiwIDHuZap1L5e0XOksAP8VqOUKNDOrEhMaOQ20DOc+VkG4pYo
         Sf9kxNuezGAO7krgeyrBM5Rec/kEcA7Aeqbf4KJiH4ScLnhFT28BBT+6970pkcIkuyju
         FvNoV3pIcVxx9pmMSmD2+yoB6dT+GryPm1M0ph9CbSVGSJoZx8hWjB3hZwo/rQTUBnWV
         N2jK8AWQOHh2z4DiWb+lXSuzb7RTmu8d1+BHoeEJxL2WFwZAL2xU439e51BcKtbrmNKz
         edvIx8/TlDrTOSXDmPx3P4x1pQewGeGCgeHuwKFBm/pvIo+FIR1ByI7n7ZypyR3WxLBm
         RScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440250; x=1700045050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
        b=BIn/9OftFgeQWmbMhTyj3XOR3l0I0rOPYpiqmHRSDvQBxK7WR0veuNLhRXzdH2GowX
         AeWI2Cx04YiUX3kcX/19noN7e0E5fYtT1GBCsVbJvCESNNYpO18bBmSexMd33AO/lDmF
         te2Q2Vbp7TKuwvbMF0f4S3tugjepc9IeCj+581Vzl6vORNkXuf2xjW47t2FkmVp5HUnz
         iShClZGc7cjcZAQh3thr2ZP80DwwQTa3WZ1YHe3vtVzQAvXydqVxu4cIMXewEahPJc10
         +excJ5TtHVaW97GO0cs2rUqRxSvmVM0ML+xNyHbUg+FO1ofmcFabG4kZfD1wRHbtQC9v
         4Olw==
X-Gm-Message-State: AOJu0Ywec9UlzpVAbrutC9p8LGcn2aIAmY4CmJK6Us36hWoiWv+S7/ld
        FSDqo3JNyUApyNUZA/O7gAsyIw==
X-Google-Smtp-Source: AGHT+IFviUW0LhnhTYkLsi418du0JsS+pSDR7WBQ3E2YbqFPxwTGmVG55ROJ8WQ2QG79sMX8+5JXdw==
X-Received: by 2002:a05:600c:a49:b0:409:5d7d:b26d with SMTP id c9-20020a05600c0a4900b004095d7db26dmr1253167wmq.15.1699440250466;
        Wed, 08 Nov 2023 02:44:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for existing SoC
Date:   Wed,  8 Nov 2023 11:43:30 +0100
Message-Id: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

While re-indenting the first enum, put also axis,artpec8-dw-mshc in
alphabetical order.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 6ee78a38bd74..5fe65795f796 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -14,15 +14,22 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos4210-dw-mshc
-      - samsung,exynos4412-dw-mshc
-      - samsung,exynos5250-dw-mshc
-      - samsung,exynos5420-dw-mshc
-      - samsung,exynos5420-dw-mshc-smu
-      - samsung,exynos7-dw-mshc
-      - samsung,exynos7-dw-mshc-smu
-      - axis,artpec8-dw-mshc
+    oneOf:
+      - enum:
+          - axis,artpec8-dw-mshc
+          - samsung,exynos4210-dw-mshc
+          - samsung,exynos4412-dw-mshc
+          - samsung,exynos5250-dw-mshc
+          - samsung,exynos5420-dw-mshc
+          - samsung,exynos5420-dw-mshc-smu
+          - samsung,exynos7-dw-mshc
+          - samsung,exynos7-dw-mshc-smu
+      - items:
+          - enum:
+              - samsung,exynos5433-dw-mshc-smu
+              - samsung,exynos7885-dw-mshc-smu
+              - samsung,exynos850-dw-mshc-smu
+          - const: samsung,exynos7-dw-mshc-smu
 
   reg:
     maxItems: 1
-- 
2.34.1

