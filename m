Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C7D5B41FC
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiIIWBU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiIIWBQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608931451EE;
        Fri,  9 Sep 2022 15:01:14 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gh9so7124204ejc.8;
        Fri, 09 Sep 2022 15:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=sz6llQ+1OH71vS4laq85P7K98uLH6vUckiEJ0IbDFPs=;
        b=CmCgdvOgrLT0HmFV0R2flfbz2SUxQH8A18sREaOQ46ko1gPfmTtXZgMqNuf33whZhw
         alDTKt3SSIknPM5/THAcxzKa2H60MFuJoWWIgTjM4SXV9QGhISbWzRtBmakTe+NTgVFO
         4Ju4OYim9nNNH9Hfn85qtQbMPug79hPeMEM5yDQMduIoWN8YwMRD9Ek0q3TDB/m1hHi5
         7pv71T8nuAIlrJZ5PjJwHf87irhEFbQ2J9CNn2uujXBaO1sUdieSQyt4cuzRGOaV+n8w
         SSaSMdDe4WJt/WiQbzAYLHxdjRObOSXjvQ41vMlbkWzYpaxViQ4DQF84MFVgY+Sv+AU8
         g52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sz6llQ+1OH71vS4laq85P7K98uLH6vUckiEJ0IbDFPs=;
        b=P3YnExPb/JL2/qas8jIZ8/H/lKPwfDmcl99G3h7IyLimkYu2Mogv5tue7cRQzXzg4S
         2KnyO3vrLpOCbwoqMrfxPVKdC5riiV80h4eZlCNF4USzjVrJZuHKVscLzG37E81RLq7U
         ONzDyhQwa7PoWIFBtDBUNDvNDqjBbLYOLG8F2A1NMIb3s/tccUR7wS3BHRbvrYWe2uHk
         oInDifYV/eaCfNclWwHqdDhWcQZHs6qX/KiqLK9nR9oDlADAH/X3gZqcnp4XqK0j0a6J
         FONc47R8L7oapzyxF0S7lAPO/W2kVJvGrQx8xTDogEKWFYXRlu66Iy7v09asXbSvARO/
         rAaA==
X-Gm-Message-State: ACgBeo1zu1GHZLrfwlCgHs3YV4diLr9qR/ztrErguDnL60OrwGy/8GFz
        IE1EAOtu8wpwVeAzQHJk5BI=
X-Google-Smtp-Source: AA6agR6FhMuUV5Px9YnLiiO32C6NOYgIOAi16Mb/VEiVwwYtUbx9Mv8cA8oi3K787maWCpui9D74yQ==
X-Received: by 2002:a17:907:b1b:b0:772:1dcc:a512 with SMTP id h27-20020a1709070b1b00b007721dcca512mr8747177ejl.247.1662760872352;
        Fri, 09 Sep 2022 15:01:12 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906541000b0073d7b876621sm781733ejo.205.2022.09.09.15.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:12 -0700 (PDT)
Message-ID: <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 11/11] dt-bindings: mtd: rockchip: add rockchip,rk3128-nfc
To:     kever.yang@rock-chips.com
Cc:     sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Language: en-US
In-Reply-To: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add rockchip,rk3128-nfc compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
index d681a4676..566f33085 100644
--- a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -19,7 +19,9 @@ properties:
       - const: rockchip,rk2928-nfc
       - const: rockchip,rv1108-nfc
       - items:
-          - const: rockchip,rk3036-nfc
+          - enum:
+              - rockchip,rk3036-nfc
+              - rockchip,rk3128-nfc
           - const: rockchip,rk2928-nfc
       - items:
           - const: rockchip,rk3308-nfc
-- 
2.20.1

