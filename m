Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1571D539225
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344887AbiEaNu7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344882AbiEaNuo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:50:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D825357B14
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:40 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k16so14448727wrg.7
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=zwHfoJRh4qEpqnVW4tO8Ww9mFoI0xkeYeX75NLKUzehMYnvddYiXCNrP2wQktLHmL4
         xUHKKb7OGLzcssDx/jyB4RczL28TaZiSTc9JCpmzDJYjcwk/WdM34S2cFCTARqFkGFl1
         LdctYQzJ9woSuCXBJJsxCZRZHlDhQYnY+IAfX3K1OOxNV0l0E0RleUd2ISc2Rgk1qo4K
         fJhqz0GMYoawCe4viZIZ0erbtsOEipTnqJ8vO42ycO5gH009W5gktb3F6y4C7C3zfS+j
         5f6GW9K2Xo/l6wVaOyzBpfe3OMOKhDMwN9sL4RSAhrtp1Bm0pcpeYrF7Ky+FohTwGoxI
         YHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cScg/ppMZgoA29VxGDOmoca/GEpRNiY6uz4ypL3t+ho=;
        b=t+cncELhFJD4U34WSgZvV4Pbhf834Z+eqEeDoBJdaClPqFdTpwZxqXSsp4X/kDizO2
         LsppTjDSL0p1pvsMbDfqFtCPaSraHQrSpD5f4cFFEAvOaWVCr5mQ4ESGFBLIUQIpesSO
         Q6rr5KzGzY+2EPQ9yp5J5eOhMcj9QflUZ0udluqycpsQ+C0ZiWt6luKV0t9I/z4MJ64M
         htt1xaonNq/j4A7v4gz4Wu0q99ILFzGEzUuGkvZud8pfMY5L0FatG/CE7OQNlBhIL3bS
         dk91OkAGylApAd+V7PDb8lFAeaIIteuWBwdVvBmposho4Fnzo9zGAFpnGl11VrRu+1Vs
         9ksg==
X-Gm-Message-State: AOAM533TdjmQ6FeQA5rRmVCaFX5sa4ve4HQtosVVN6lLNYTh80Yv94RJ
        863jisN6yjm85p2XHySfQ3BSNg==
X-Google-Smtp-Source: ABdhPJyHAelw16D3P0Yimp6zHFw2pjrB1y1+t5Sxv+QQxbBuBodm5ZmZ3Iw3GAh8m1iPVVk6MgPgrA==
X-Received: by 2002:adf:d1ee:0:b0:210:d63:6570 with SMTP id g14-20020adfd1ee000000b002100d636570mr20704871wrd.673.1654005039097;
        Tue, 31 May 2022 06:50:39 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:38 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 01/17] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date:   Tue, 31 May 2022 15:50:10 +0200
Message-Id: <20220531135026.238475-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 16a1a3118204..a6fe0d8b0cbe 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -43,6 +43,10 @@ properties:
           - enum:
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
 
   reg:
     items:
-- 
2.36.1

