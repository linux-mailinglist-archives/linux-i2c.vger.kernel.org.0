Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1625B4200
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbiIIWDR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbiIIWCh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:02:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB2A1451E1;
        Fri,  9 Sep 2022 15:02:26 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z97so4498706ede.8;
        Fri, 09 Sep 2022 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=Fs8pAg8991d6hPaGLSjixDt92luWuK1ATlOmGa3JgXs=;
        b=MB3oR7785j4SJnsqLPSJb504gcGumCClB14257XrKJtcEiC/kF6bEdlL09RLv6sa3c
         DjHJrzfKZu0ESnqMyHtBPF2sl3Dx35xpv04+dk2X7Blqfi2FMU69dKGJ/yVH06uh59DW
         dxEGQeJWVJK4VXG+rdAS1TRdE7dqqdVQ0nq1oCNMcl+wXxdXAYdiw4cOLFRPWidwYc32
         Rl97DJdm1LT4ZxT/HBdftH5gNV2RB4JinQd3viocth9NDF00zS7JT1kAxgamXKyi7EpI
         jf7n4yCUNhaFR1+tLpygHnw+tAb6wBq7fsKKd6oFtT8TsPTYh2Dwf72uMGU2OUJJ76RV
         lfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Fs8pAg8991d6hPaGLSjixDt92luWuK1ATlOmGa3JgXs=;
        b=ddybEzfl4vw0+W3BByt7U26dn8iEqyjyUjR5TUxZkDTfsZTNnHB3AZFi5MGxJyvnft
         udpQM85zKh8wdTZ3wZPLbTQDxbd5T0LoEWL7iNceVJNOfkokRV2ogYsEWtx38BGawvhH
         4AQXvrAqupDYE8ASytv+TedQ+HETtOdHJaQfqvOHte9Ifo0VqecryvX8whMG2w5Vfizn
         ufkRV6dKTdeHrus5yVs+kXVDHFXJvsSUB2pfiK/I3+v9Cfir5eKC4423BCEZll/+LKK2
         tgDI8IY4b2H63nqf1G7HgUwHSztYYX4XVpewhf01NEmh5Wo61xHsribpv20wrpT6DQQJ
         nOQQ==
X-Gm-Message-State: ACgBeo0Hc8/aB4BTb/FlpqLk0uInJcWiyZRvvcwagfR01PfSc0G0+4J2
        1x/rqMh1nGOgmJQ19FagRkE=
X-Google-Smtp-Source: AA6agR69cDbvBaFqHukimCR0ASFhSn0OKiFTxMEiefYWYalPtMQi1Y52hZWynrN+zwAm9XjrsvdtWA==
X-Received: by 2002:a05:6402:501d:b0:443:1c7:ccb9 with SMTP id p29-20020a056402501d00b0044301c7ccb9mr13046040eda.101.1662760945016;
        Fri, 09 Sep 2022 15:02:25 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709062ed300b0073c10031dc9sm805766eji.80.2022.09.09.15.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:24 -0700 (PDT)
Message-ID: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
Date:   Sat, 10 Sep 2022 00:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
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

Add rockchip,rk3128-pwm compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index a336ff936..f86170871 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -21,6 +21,7 @@ properties:
           - const: rockchip,rk2928-pwm
       - items:
           - enum:
+              - rockchip,rk3128-pwm
               - rockchip,rk3368-pwm
               - rockchip,rk3399-pwm
               - rockchip,rv1108-pwm
-- 
2.20.1

