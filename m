Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26C053920C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344922AbiEaNur (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344910AbiEaNuq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:50:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97C87CB09
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q7so7831344wrg.5
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rhg9XywWcUEQoXHHOkH8KOfZLNdD9cfZxq1k510SeME=;
        b=f2TCBVdVqKs2d3bbpFlUz+bWim4u2lr3QjfXJSMkoYBGOJYBjmbpfVuuCPQ1M+/GfY
         CbyJz8AQWlH91yhnuVv3nNs8GwIZwLBuX3BDAG45srkoVImN6bE4xdnOY1rAlYuj3xoB
         ltsrFFCgDV4Ptd+v9uov9/wx5GOZSM77RWXPgXFKgVPbFwg44eAcSYuTn6oRbXZEGMk1
         Tmj5VB9r+XBDB8Aj7zbDgRMN12yOUFGc3C6F8no0PQe7fyMLm8nrwonj9KIwk/3CR0me
         xu7R27ux8IQaCAI4io7kuQvP2U3r/U5gDA8icYuJ7PrpVi0sDuuLHkOCq84Ayiw7cxHZ
         W13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rhg9XywWcUEQoXHHOkH8KOfZLNdD9cfZxq1k510SeME=;
        b=GIbCUFfDYeCQLWZ4bZzmcgyTRvGUA/+8g8u0AzCeCUedCEGvwq8TM5lkpvCf2gJUSB
         QLkaW/TTfAmBtg5xS6lxfTxTU3ivXA+6ioJp4sGmhM0NhPddALWDaCde2vUV9mRsA59g
         1pnmboePJvsaS/HNsSv9BwU4LQHTvxrZsSx4y6qKG8cwK6wVJXwLMZHphlo8b49UTom1
         O2eCuTUwGF31Ra2RY8yENf61ooZh/ro5/sG46IyZWXagu5u5K9wXZ1V1vVOMDyfgEKwo
         jge74g61dq5ctxFNWNzMFUx1vqjNoMO/0yCrSDDK8uZ9hM6y+MOMvyvUePkx5iCrK1hv
         /LMw==
X-Gm-Message-State: AOAM533t7hslm5ZDcT7KvgmdjAzoTV46DQjK+Sku13RZ4ElHo/RZQutz
        aYuYpp9E28Ef++9SSRBA5D0Iyw==
X-Google-Smtp-Source: ABdhPJzbtZjU9hBgzu5sIg7U9W9xnNGsVfv5g3LxRDNansPDMf8fBBZCHyOij4j/XzBQXQe15IzqMw==
X-Received: by 2002:a5d:55c1:0:b0:210:27e0:ec9c with SMTP id i1-20020a5d55c1000000b0021027e0ec9cmr13763855wrw.420.1654005043342;
        Tue, 31 May 2022 06:50:43 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:42 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Wenbin Mei <wenbin.mei@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 03/17] dt-bindings: mmc: mtk-sd: add bindings for MT8365 SoC
Date:   Tue, 31 May 2022 15:50:12 +0200
Message-Id: <20220531135026.238475-4-fparent@baylibre.com>
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

Add MMC bindings for MT8365 bindings.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 2a2e9fa8c188..3195b80ef057 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -38,6 +38,9 @@ properties:
       - items:
           - const: mediatek,mt8195-mmc
           - const: mediatek,mt8183-mmc
+      - items:
+          - const: mediatek,mt8365-mmc
+          - const: mediatek,mt8183-mmc
 
   reg:
     minItems: 1
-- 
2.36.1

