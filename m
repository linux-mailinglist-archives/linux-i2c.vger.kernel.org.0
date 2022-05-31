Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B8D539275
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbiEaNwe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245166AbiEaNv1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:51:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5A06E8ED
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:55 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h5so10706042wrb.0
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lW0yAksGLkkUyy22NDdYQDHyZq2zc0vWqxg9iWVW56I=;
        b=0Rpx6jMIsXbKBWz1Z4MydcV9MC4lfQ3IYbK0315TxxRiBKVFtYDLzjN7CG4UB2UfWq
         06uhmo1Q6/Mi1Jb09Hw7bavVWC473lzLKiVfHrsQ5in01UXAMACueQStByBDdPzDrBqp
         twnBLWRJxnAEiZ0+mPXx6cIxmUygABTTEFKvNZa/MjJr/Y2grABaHGjDVverTv4ebyxt
         TnzynXxR7yWbhOz4huGXpOoRp1SIMztgg1r5aLLCiQ3CmPtGzWQoJt1KE4PCgOXkFwQg
         zaN3g5ow5FcEEOLYDOomGD2Td/iJJorkSyXXnQpmbUAJFuBArGG5g3rkIgU01hKSc2lm
         Z3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lW0yAksGLkkUyy22NDdYQDHyZq2zc0vWqxg9iWVW56I=;
        b=oFnhf7cRCmML1sHWEU5gbfOcQDbAvZv+wEhjZAZXLZHZncnNI9FembfQLNg+UNOEAN
         u159q5yVG0CDbeTd5J0ARCNpLZZbVUmhZ5r5N6DAIDOQDveWrbuRU4QBgmjnt5Tmhyno
         dcEpIlJavHYENs0EyPfWh15z+pI0wrnuzc6a3/KawwDfD6qxR96bbhFM2FF9g9dh68E1
         aJ6EJOOQfm4Wb0mCComhTvhHmkEEXMAgp3Bk7qn27coOaoofp4X2HzkqG9Vfo9mWKSCj
         jB5A+XzYbzCk4ySeONqBj7VcsWvjxZWIsoS//Vc8leefLNrKvW0zlpk2OvWo9QbeC6Ze
         OCOA==
X-Gm-Message-State: AOAM532KiGqc3rgp1srfPZTxFiPAtia3KT/c8sCmuVS4aAU+HlLHPT2v
        Wx43rQByMUdQZXH4JzKiKeVj4Q==
X-Google-Smtp-Source: ABdhPJx92GIJhNJSvoi0FLCIeGZ8dl9Y3pv8+Zk660zC6fx9w1PvGGZpm6/Ia+aYM0mB7Jhr4qPWOw==
X-Received: by 2002:a5d:448d:0:b0:20d:744:7663 with SMTP id j13-20020a5d448d000000b0020d07447663mr50722292wrq.654.1654005055117;
        Tue, 31 May 2022 06:50:55 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:54 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Leilk Liu <leilk.liu@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 09/17] dt-bindings: spi: mt65xx: add MT8365 SoC bindings
Date:   Tue, 31 May 2022 15:50:18 +0200
Message-Id: <20220531135026.238475-10-fparent@baylibre.com>
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 94ef0552bd42..d3d34a3a0b7f 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7629-spi
+              - mediatek,mt8365-spi
           - const: mediatek,mt7622-spi
       - items:
           - enum:
-- 
2.36.1

