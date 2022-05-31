Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA52B53924C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243782AbiEaNvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344980AbiEaNvH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:51:07 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3988FF9C
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 129-20020a1c0287000000b003974edd7c56so1291452wmc.2
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7hTkqdJSG32FEC0xJwQxsGaVxXfP9pn5uHosSEpvk/o=;
        b=8V4VsGA9OVOOn0SdJ25JIZGwaIM5LceU5cEeIikivz49vnnxZAGp7IY4ojZQryeGnJ
         DP2gZq2HIx2X9KjjPP97ub/aV8GnlaIzRYU2dyi4ll7AaU5prn6VHbRNOuIWY32qdXGP
         lfSx/5pavnyO2+V0r85FCrEZZcgYKBajNvaAwL2INiM/VWtWvlm85BJkhIyhGFv2WlnA
         bgv9mq8TOvr/DR/S/KyRMtMk/feIQVxxIsgVxNxdt57BbR1t/pFrt7PFL6/ATtanGSR2
         VQ114YE12cjm+Zs5zQGB67fBgQPSdash0s6aDAcmmp0Efp6dbTMc/oGaq8ZPhlmKU1vA
         No1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7hTkqdJSG32FEC0xJwQxsGaVxXfP9pn5uHosSEpvk/o=;
        b=BduKewRE0ZWJkHf/R9fxxf8989BMAknFDd4Hr2ksqM2Q8CB+LRz4S4KBu3yYiis3NH
         1C3A5EZP1gvytjzTEJfLJ+78U1FfdVsxRuQdkHu4sfw7K5ef0JfxonV3eMaS1SAPHjsm
         s35MDaEZjyi/Fv0QtaV5VKUkMos/Twgv4ICCOHfBXYgOqeuMmtriimRTnWP+welHmteB
         WcA2XJUjibZN5F0+M6dY1G8jn8S7Vw+oyatrCgU6xdFeI1eej/LWyoQMmD3Au+AI0AP9
         7xw8RdR6Kqr6iGN5jSeA7Pu6Tm5T+jZvMdEL/OdE9VgfEtDX9s8lbb6xWwnNZa+grwUJ
         lL6Q==
X-Gm-Message-State: AOAM533+HwxZQtBej+tLjHcZQkmwyEoJ9pA9Qh198vczck46tj01QaBs
        KPu/cChidBsoK81+cCigHCtOag==
X-Google-Smtp-Source: ABdhPJygJdWIMEqnFljSCeHyRbLD1v7vofyqs6EKiM1gktA+EiK+fDFmHMqxmTLq4ylJWgeaim7/yw==
X-Received: by 2002:a05:600c:354e:b0:397:7c1c:5b66 with SMTP id i14-20020a05600c354e00b003977c1c5b66mr23408175wmq.142.1654005051142;
        Tue, 31 May 2022 06:50:51 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:50 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Lala Lin <lala.lin@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 07/17] dt-bindings: nvmem: mediatek,efuse: add MT8365 bindings
Date:   Tue, 31 May 2022 15:50:16 +0200
Message-Id: <20220531135026.238475-8-fparent@baylibre.com>
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

Add bindings documentation for the efuse driver on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 7c7233e29ecf..444875264493 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -32,6 +32,7 @@ properties:
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
+              - mediatek,mt8365-efuse
           - const: mediatek,efuse
       - const: mediatek,mt8173-efuse
         deprecated: true
-- 
2.36.1

