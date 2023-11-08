Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03077E5397
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344286AbjKHKoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbjKHKn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:43:58 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7E21BD9
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:43:56 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40842752c6eso51270235e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440235; x=1700045035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VTczEAqOVbvVARsgwQf+QqYx6Pwq1efdiOYWiIKMhjk=;
        b=rdROhjws0/ICfjI1ewaE9rSOKrgp9O/V+UucX2YHu6XtDYgYjJexraF0QxdyqGEMvV
         NI9D+yg28fNdaqsQkHCOoeZFcrnJiWCA2yVWICdmNHK/rnDC51Jl3Y+yLpK3nJapNHFA
         wLrltqMv4A8u3klaS5I3S6Kcb5/cKWNKMw+kgg2lH9YE9xHIp6sKvE4p7dug72fNT9Ch
         PdYD6nbk+TBK6S/xZPJAGZdOP/WHXVTOlV8sxPSesFydHWnOELMJiqCFWdukyiD8/GlF
         JdBVdJy9ResoWu4L2eH7DN5kkXykn+aLE5Sn1cfUBTeN86PvADRQuSpJwdL0ukEmizBQ
         fwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440235; x=1700045035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTczEAqOVbvVARsgwQf+QqYx6Pwq1efdiOYWiIKMhjk=;
        b=rxUTbRvhK4vjoTVDn5/whvH75UJq9INPzvoynfhviEBOBZdQp3Z5Plo1ElD5d1MgtT
         S87+nMqEl9CCDEWMHjzPEc8dhXHDWfbQ+pKdxWa3YQ/cLI04kS6/K6FQW+lkvEYcRKuZ
         ZYuw0d5kaebNp1mG4p3pXqMuTBcwvi5q9f5rwpvuhXZ5B4Vnoe0Oxd4ilMvtln/uM8x8
         YOocBS6W/D3qnK75KaJDtRKbhqm5nSPbGe1hercHGmumud/zhxFvVRecTMH3VRTIaw44
         L6ANYEHpcKNbwOYWDn8RCsQaatPRRG+oVQgZlKuE5uTuzLU1d5ky2ArlWM1mNuhG4LXL
         cTww==
X-Gm-Message-State: AOJu0YxFf+3y2WPAWEBBL85nfCgxoqZNp8Jg13HByVp2lOXrGIbQhtBE
        gomWYax1qhLXwpSQR8ka94NH3A==
X-Google-Smtp-Source: AGHT+IHiDWmBeuBOZUqxDCJkN9irswNWvo/qNXRb1omqiS2LAbu6ncxcqqv9pqzxYLbz6uacwStwug==
X-Received: by 2002:a05:600c:5113:b0:405:336b:8307 with SMTP id o19-20020a05600c511300b00405336b8307mr1360908wms.7.1699440234966;
        Wed, 08 Nov 2023 02:43:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:43:54 -0800 (PST)
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
Subject: [PATCH 00/17] dt-bindings: samsung: add specific compatibles for existing SoC
Date:   Wed,  8 Nov 2023 11:43:26 +0100
Message-Id: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Merging
=======
I propose to take entire patchset through my tree (Samsung SoC), because:
1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
   they will touch the same lines in some of the DT bindings (not all, though).
   It is reasonable for me to take the bindings for the new SoCs, to have clean
   `make dtbs_check` on the new DTS.
2. Having it together helps me to have clean `make dtbs_check` within my tree
   on the existing DTS.
3. No drivers are affected by this change.
4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
   follow up patchsets.

If folks agree, please kindly Ack the patches.

Description
===========
Samsung Exynos SoCs reuse several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is no bug
here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like compatibles.
This will also help reviews of new code using existing DTS as template.  No
functional impact on Linux drivers behavior.

Future
======
If reasonable, I will do similar work for Tesla FSD and ARMv7/ARM32 Exynos
bindings and DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  dt-bindings: hwinfo: samsung,exynos-chipid: add specific compatibles
    for existing SoC
  dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
  dt-bindings: i2c: samsung,s3c2410-i2c: add specific compatibles for
    existing SoC
  dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for
    existing SoC
  dt-bindings: pinctrl: samsung: add specific compatibles for existing
    SoC
  dt-bindings: rtc: s3c-rtc: add specific compatibles for existing SoC
  dt-bindings: serial: samsung: add specific compatibles for existing
    SoC
  dt-bindings: samsung: exynos-pmu: add specific compatibles for
    existing SoC
  dt-bindings: gpu: arm,mali-midgard: add specific compatibles for
    existing Exynos SoC
  dt-bindings: iio: samsung,exynos-adc: add specific compatibles for
    existing SoC
  ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing
    SoC
  dt-bindings: pwm: samsung: add specific compatibles for existing SoC
  arm64: dts: exynos5433: add specific compatibles to several blocks
  arm64: dts: exynos7: add specific compatibles to several blocks
  arm64: dts: exynos7885: add specific compatibles to several blocks
  arm64: dts: exynos850: add specific compatibles to several blocks
  arm64: dts: exynosautov9: add specific compatibles to several blocks

 .../bindings/gpu/arm,mali-midgard.yaml        |  5 ++
 .../hwinfo/samsung,exynos-chipid.yaml         | 17 +++++-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 10 +++-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++---
 .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++----
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 +++++---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 +++++---
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |  2 +
 .../devicetree/bindings/rtc/s3c-rtc.yaml      |  5 ++
 .../bindings/serial/samsung_uart.yaml         | 14 ++++-
 .../bindings/soc/samsung/exynos-pmu.yaml      |  6 ++
 .../bindings/soc/samsung/exynos-usi.yaml      |  2 +-
 .../bindings/sound/samsung-i2s.yaml           | 19 +++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 60 ++++++++++++-------
 arch/arm64/boot/dts/exynos/exynos7.dtsi       | 18 +++---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 45 +++++++++-----
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 34 ++++++-----
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  6 +-
 20 files changed, 233 insertions(+), 115 deletions(-)

-- 
2.34.1

