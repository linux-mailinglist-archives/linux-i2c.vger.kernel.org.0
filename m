Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53BA539232
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344976AbiEaNvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344938AbiEaNvA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:51:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6E85D5E4
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:47 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x17so9726132wrg.6
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=84B5l6CLEYOYUre8rq3yJnmiSsiXoAiqgOdGcXH7KzA=;
        b=wjCDUvAzmwhW8ShvFMODKlOAJvENmeZCAsQFEBBjpmCjVefXiQwTBynBslAevnS/ar
         IXm4cXmqxylBQs193ugMlR1BjEOc3/Vk7U4T9LJteC5aqnNV4CXZ/jFlXuyrmnd+Hd5D
         VCNQQUjf1leoYsHvfEgfO63Psj1/Zace3a/H4c4v0Ewdmwjm2AWqWy+FkXHdgjohoAH1
         iYI0/ouaIN6JdlbiGEIUyAzSCsrHyrO24nEYivf97/369hIv7k81eCdJwjiidtXbLyUS
         /+R4GrIUqCJ7UoFADiWq/7vAKLkpPNArYC6LGy40/7qc4u3ixQEjvWKr2h+AZvt1+nts
         blQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=84B5l6CLEYOYUre8rq3yJnmiSsiXoAiqgOdGcXH7KzA=;
        b=bz6wxTDm+zzZZBjvOx5jxsR8pYYYCCqbLxERq+zlTOMehbNu9I1m1Q1knnDPNl2aDV
         czC87COrqkx0tnu1iGHLI+cfQ2FJZ0ScnHfHZC020VEOU3YWRGDtT3kERfi3LcJb6ky1
         Io8OHUjaeBs0aPKunKOD8MfkqE+KB2f6gVn0ID46j4ohtnceUJKmbJByNc/Gn0x0DG6T
         fYyZ7/mADYO6E1NJZeVjzo6kGN/dhQWRSyth/j57SDSSoZiVfCBDwUjxck6azPUPIq4N
         9PKRoMuJqwcbaznNitU/vUYz+dwMofAtKmbwXXLluXaVUgfLkSxrmwEgiJ/kEjUYJURc
         4jlg==
X-Gm-Message-State: AOAM530z1SQxxNd61RsiRx4OM7Mfgw/joEWWBjAtI4ORfFrws5otnRJ1
        5VmPuwvalxvvE3yATaFc20Y3ug==
X-Google-Smtp-Source: ABdhPJx1HdFDNNiPkbLkJv2ksIxQsCl1lQetWRtoVAAGpHCrR8geKFAxOVuea00BT4mrXnnAAW7uhg==
X-Received: by 2002:adf:ec84:0:b0:210:e87:113b with SMTP id z4-20020adfec84000000b002100e87113bmr20885976wrn.545.1654005047238;
        Tue, 31 May 2022 06:50:47 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:46 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Long Cheng <long.cheng@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 05/17] dt-bindings: dma: mediatek,uart-dma: add MT8365 bindings
Date:   Tue, 31 May 2022 15:50:14 +0200
Message-Id: <20220531135026.238475-6-fparent@baylibre.com>
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

Add binding documentation in order to support the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 54d68fc688b5..19ea8dcbcbce 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
+              - mediatek,mt8365-uart-dma
               - mediatek,mt8516-uart-dma
           - const: mediatek,mt6577-uart-dma
       - enum:
-- 
2.36.1

