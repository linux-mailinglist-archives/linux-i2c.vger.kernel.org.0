Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559CC673F8D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 18:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjASRJR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 12:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjASRJQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 12:09:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A1B808B3
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r9so2525536wrw.4
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbD+DW6kRi8WktiZxNWXXSbOmEZ8Ih8ud6GlSgUdI9o=;
        b=YZC0yjtCR5ZC5+IGqwbhSVZ3qM78zr2yGAKBM3gkATEvj7B5eHWppakAIJVGHQNWfC
         VtWA/Q8aoR0z7bK3ibou6zaFcO+ilBntnTCFXE/O0SjRw091X4Oz0rrlhoPSnfI9Qt6J
         Y2u1IrQv0Tn8kWLdKuVB6rbAge1FRCWZ304wZQPk68TPVfqO42i1y1iPyix0AU9NWFO6
         AcveKrquzrkzoflyNqv1iBaA+IpdwGsZ9b/gs0N4f9cOkfeMYlZRUr9yuQKT/ELTzNpA
         rvcmmXAWM0wByruRmEXyg87+a0QeUaGMQJ5ZYoWU2dGFtK+h0aI1oQuhp8+PjX/6NebX
         cGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbD+DW6kRi8WktiZxNWXXSbOmEZ8Ih8ud6GlSgUdI9o=;
        b=fQOYxh1IRohwbX7wvsU0n/8x80InoSS5YUuRuAEM4QdKLgjmC+ykHCkYH6mWAcocBz
         Z6cvjmnrsGOaPyHrbDnqAPOb5/W4VGj1mkpmB+rqQ18aSQwycsqWY39gpoDn2Bc56QFx
         EAVH+jEh6MdzbUb/ffuxOMeTAPNprYd0/3vXJFuW68+Ezr11nuYyR9yPjW1Tn/VPNIIf
         LwbT/yCKyH7mBgVzm3yQZggdngDyc+UPdkRxj9XI9Qg0YfOJzN5M2GqSF3uYjuvEAA3+
         km79G8IH5yWjO7VKz+TbQrVBRUs9iv0e9sTVgosecKsUAw7LqCa1YCX6slJpTnTmGDhK
         aMaw==
X-Gm-Message-State: AFqh2krhh0yzRMkvm91PIww1mUGLJP6FlnRh/yCtvIrhZS+xG0urbUCd
        701oa5F2qW3dU+2/r6luMglj5Q==
X-Google-Smtp-Source: AMrXdXtZ45FHDMDTTs7pqeSXu1NIqrWu0Kr3eR7aTnJku39FmwWKGvDZX2rIf2nGojdlUiU+4QUC1w==
X-Received: by 2002:a5d:53d1:0:b0:24f:a289:b422 with SMTP id a17-20020a5d53d1000000b0024fa289b422mr9594458wrw.16.1674148152986;
        Thu, 19 Jan 2023 09:09:12 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:12 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 19 Jan 2023 18:08:52 +0100
Subject: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=w1ZiqWA2bE004ri1B4ESDbnqlp6EYjeGLKUKJD1Y6mw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2vLWvBYdixkUMWWeiPBfDt/ZlB6QQzrHTyGvD
 AINYpuGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURQFqD/
 43HvhF730JTqu82W+wSGG0WugG9LqdbtIwhRh2PApy/wnJ+OzO97fDQNuMkrOZ+IwOzQvHuvX7jSu9
 DXRdCth2gWERiv2PwRlS61FMpI4osgPOgDvC3z9Cx8ah8jdMDmppQ/M7Cb8RpoRVvY0u57YqHSFhAe
 xNyHoWSsT2ukmRZKPp1wcJ+JVLTbR9ibAzBWFWQ7C+DWYiFSGd26TtF/vgxfZObsZDcxMMW+78/UN+
 KAoIWpLvGGVNDoWcXOJ9XHuuoDUoZu2Dc4Tapihdw7DygQp4EJkO3aFRwq/H5+mEYM/MvvWopjy5Qj
 +a0J0Yd+OvjswSHMj0i1taF3IgfDUafy3s5ghKBCLOYAcR2lVeckVO1lGeh4JKlc55V61oFxzT/R3p
 q1ppDVrLURe+z+jO2JeVVNE6vJ5DHE9I+Etrt63grOeMRMGYLbNMaNKYfRyUN9ldyqAl0+w40LP4fq
 Jhp2uL+stooWYuizoIhKhSwINMUe7MhhEjPbnH52dP+6zP0tBvw5MXfDBP4zi8ky1yHS2rXDzW0kck
 ZFXY0JSkImSIkRiJoYrkOtBYB5h0jDqgqf6h5JWaMJ8Zv7aSc5X6tiT2Fbi4WdZ6t5nRtQzM5fsmHK
 P5yLnSvleMp06Hgn2KWq4SYUpce4cT+ZQYPvCHLDDd97ZoJFn9ux28LzDgMw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 421563bf576c..72ae2e01cf22 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -41,6 +41,10 @@ properties:
               - mediatek,mt6797-i2c
               - mediatek,mt7623-i2c
           - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c

-- 
b4 0.10.1
