Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15577E5404
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235680AbjKHKpV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbjKHKov (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:44:51 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E1A2123
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:44:23 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c54c8934abso94883401fa.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440262; x=1700045062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
        b=EhaNtd0bfrAm6px/3RYUsAwCR4nSvu+SAtQY7zQxmXwMSDX3RxmwPOJxfDWG+rHUtq
         ZR0WGiK5hakg8RqL7b1HXhHvryvlQrjQMmdE7HM9F3hx4jjJpMHfuuD7wbjN4OxPv1JW
         VBxOYeByEVZOUu+DLYfGVEwqXx/Wvx9rEo1SEXNC3xQUlGZfnwfWhI0AsoZJUraZrt0Q
         Q3zTvDhpnSP9qeC27LQ7+8HgM+LBMMjoDpLH7xCbf7x6+NZmboPp5VC6ilUHP7VDlr9h
         bFTWvu7Jh07B5vQBaZ5YrDrLU3OX2QfVKO/K0jOm+uMx3qscz7WuCgoFRGyqWsR/oNyf
         K6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440262; x=1700045062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
        b=IpEXJOb7xA1IrTJiAR5GA0dCbZju4vx3sXTWOsZDG7BwYFCNMcGm88ydoZCFQbGWul
         utunFMxBqy4+T+eWKPySesSi5n5zhRhsyjnfT8pUNis2i6V+03wMixIk77UGs9aNhss6
         93sUmj/+7GIclCIf7uqqD271duQc1ejv5JymVPyBIaW3Y5ouaCkE58RQS43iR3sJ9PiI
         MQG3jU5TaWfytvmLH5nX3b17BVpkJzg7c4g8Vvi6bZoxGjU9ihEiR/xO64RJ0d5clF+a
         X/NddHITJHlmWwLLUnoJg/n079sa4E9M+SQHhGnAKugDqPIGeOfV66D8ZdkfhN69Ke5v
         O9DQ==
X-Gm-Message-State: AOJu0YzatoivbU12ubm1pCDp0dGQZzK1ZMOaVjv2e0wYfSZ/dFVecX2T
        /7r/1L7048XJaJnajUXRb7/JfQ==
X-Google-Smtp-Source: AGHT+IGCpSGI0CR0667rdoPAw+/9BwGIOQ5vf5WLNiqXBsw+h3xPKE36aRvV/bSi7NnLY3zOJHYzOg==
X-Received: by 2002:a05:651c:504:b0:2c5:14e3:f1b8 with SMTP id o4-20020a05651c050400b002c514e3f1b8mr1507701ljp.7.1699440261813;
        Wed, 08 Nov 2023 02:44:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:21 -0800 (PST)
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
Subject: [PATCH 07/17] dt-bindings: serial: samsung: add specific compatibles for existing SoC
Date:   Wed,  8 Nov 2023 11:43:33 +0100
Message-Id: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
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

Re-shuffle also the entries in compatibles, so the one-compatible-enum
is the first.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ac60ab1e35e3..0d0215b23ab7 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -18,9 +18,6 @@ description: |+
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: samsung,exynosautov9-uart
-          - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
@@ -29,6 +26,17 @@ properties:
           - samsung,exynos4210-uart
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos7-uart
+          - const: samsung,exynos4210-uart
+      - items:
+          - enum:
+              - samsung,exynos7885-uart
+          - const: samsung,exynos5433-uart
+      - items:
+          - const: samsung,exynosautov9-uart
+          - const: samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.34.1

