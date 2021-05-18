Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14372387BC6
	for <lists+linux-i2c@lfdr.de>; Tue, 18 May 2021 16:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242468AbhERO6q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 May 2021 10:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244530AbhERO6n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 May 2021 10:58:43 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567D1C061760
        for <linux-i2c@vger.kernel.org>; Tue, 18 May 2021 07:57:23 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q5so10585368wrs.4
        for <linux-i2c@vger.kernel.org>; Tue, 18 May 2021 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/D0C6tEXN/UZQW5bW2HTmCtLgx9o77WgGBJs9UOzZPU=;
        b=VAlse7UHliYrr2QpSXkTgQ56o3em7xamY/ka4A1njfjrXl42CZMzMrueeAbfqF4x42
         Vmhpm1632T+d+TPDK7hedy2SRx9QGlD35XqN+a69C6NKTS2mqHCRc3jmm4FQSuhVRtLD
         PZkG5sN5RhzROrjB+7XkDGk8WyZ0a4YWUMulaGE8+/SRQGs3oTVdQY/xqin0FYwA04gp
         GLrpVq1qu+ln2PbHnRfWgCwyukMz6qCfgKwEQsuMcCvW9KcJn6BsQ6++KIAYzOO96cIv
         hHEmxibD2tatUwbMCVbBl/1b2SjYJrwRllMzsdndewBUbET79k1VLKBD0wKhnvDztjsZ
         xxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/D0C6tEXN/UZQW5bW2HTmCtLgx9o77WgGBJs9UOzZPU=;
        b=NT5ugIvhfURzHu7/oeZR5q1LDNiSZnEYCEbxcz3lYT+iuVp5cfyqBtuIEgX+dmayen
         1vJfqjKtPHk2r8o+rakzQNpf5k0c4M6pT/Uf9LVh4qI1/xHko6gsxM12eHXFrGafuQes
         6bdB8MynJx+DRSpUWm4B/Ta7m/PdOKPAXrrzBQbm9rhb7D1enuztNK79EYWTbley+sg7
         gPAy44rC26vn2YsZ4g2uPN7y5rSKume80wIH4Ny4BGRFWM2TTInM4L7yl7CvCo6N8zep
         fekghxyoUNvIzntf4pUKqXcXrlYcvTFCqO2MZ6/v0MiyKVISNpo5Pi4vJHg9S89kmS9t
         Fdcg==
X-Gm-Message-State: AOAM531oiN0AqqyIT/9bs/ucQVMCABVzQlyZfRFyZJA0kmiwvXKlLhyL
        4mMFjWlwNHx3gk71jdYRbqTVUg==
X-Google-Smtp-Source: ABdhPJwpMJWsGQ+2piFN+d8uOfC4WF5Q6hmay5w6ZlBLGrB2is0Suo5wmQEaFXpTdmckDEth6WsKpA==
X-Received: by 2002:a05:6000:4d:: with SMTP id k13mr7762317wrx.98.1621349842761;
        Tue, 18 May 2021 07:57:22 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id a18sm2928386wmb.13.2021.05.18.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:57:22 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>
Cc:     mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date:   Tue, 18 May 2021 16:55:21 +0200
Message-Id: <20210518145522.2420135-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518145522.2420135-1-fparent@baylibre.com>
References: <20210518145522.2420135-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 0f445d2ab727..ddeda6d7348a 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8173-i2c
           - mediatek,mt8183-i2c
           - mediatek,mt8192-i2c
+          - mediatek,mt8365-i2c
       - items:
           - const: mediatek,mt2701-i2c
           - const: mediatek,mt6577-i2c
-- 
2.31.1

