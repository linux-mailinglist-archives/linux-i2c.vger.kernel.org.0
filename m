Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4D35B420E
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiIIWCo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbiIIWCV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:02:21 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1410E146D08;
        Fri,  9 Sep 2022 15:02:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id nc14so7170358ejc.4;
        Fri, 09 Sep 2022 15:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=tQNDp3oXurfVK0Smu+vkGPlxbSoN4p3ETIcUgt48RD0=;
        b=U5NLPAwq3xKdX787nxgjNJjfB/0IUZ1wH06ymR+Sys2j5Wr6RKnbl/ZP6OpozE7yn2
         Ugb5pDkq8bcwvjl2JqAOyFCHKVQz0yW+xATcgKO9DyS33+euwU/IWvhB+U93py/KYjhP
         xuWBPGbBIRBvsw4elZbP9W0Y0aKly4BgUY9gnUiIJkfLRMSd1yTvbRWEJiFBHfqV1iq5
         yo1mPabdk+jO82UbKNY+heP2ngZrCSrSHX7rcupYAisIKeB432d2tVi96/uTRxkIN8YJ
         3KplWG4Wnf82OZeFCvaqmH4TkbbqrtjbvdEDDhNLEgS/0zX3MfSoKtyGbTGwYbmJ7pDd
         0H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tQNDp3oXurfVK0Smu+vkGPlxbSoN4p3ETIcUgt48RD0=;
        b=Yf7nYeBwrXV44R7wRFAXeygIVKshLQOGrMHMMfGHgMiAIkxS9B/XnRk6l9IMaMrwzL
         ABsy3lCZCNHzJdxgXxlqH6M5jMg66+pHK6oAnIbq6l/AehMqTWihscuk2oUjJjR9rB7T
         ZASSBBNDZ/IM41aMtRRGICtBJn7qc/Tw4Mf7JFSmmIxXDM/KD283JRlRoz500F8LAwLj
         wVFA/zwX6McAH1E5dGkB2K4R3iMPKDEP6dJn4Fz5K2Lzftw0AygjqgnMyqeSwsTUx8z8
         r/dSw079KPen6QbWSnTAL5W+lRDhLHckpG1iriGZeuXT9IilSDSgUyEOvt2Jm1X2/IDY
         SVNw==
X-Gm-Message-State: ACgBeo1ELDUhYv+OKOEeUm/IjjyHsVhfzYddNpaqK4K+33VBNHKup779
        CW+uHIEHIp7e5fEFRG2aKYE=
X-Google-Smtp-Source: AA6agR5O8Ynrf99BpPY5ZqYMGT6phDOecFf7QFfCj8+kkhvsXO9bYuF7xKmwJ/8RDq3rMUvZ+woJUg==
X-Received: by 2002:a17:906:7714:b0:74f:f771:4e0 with SMTP id q20-20020a170906771400b0074ff77104e0mr10638632ejm.623.1662760936345;
        Fri, 09 Sep 2022 15:02:16 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id eu16-20020a170907299000b0073872f367cesm790690ejc.112.2022.09.09.15.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:16 -0700 (PDT)
Message-ID: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
Date:   Sat, 10 Sep 2022 00:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add
 rockchip,rk3128-dw-mshc
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

Add rockchip,rk3128-dw-mshc compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index bad28bc74..95f59a5e3 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,px30-dw-mshc
               - rockchip,rk1808-dw-mshc
               - rockchip,rk3036-dw-mshc
+              - rockchip,rk3128-dw-mshc
               - rockchip,rk3228-dw-mshc
               - rockchip,rk3308-dw-mshc
               - rockchip,rk3328-dw-mshc
-- 
2.20.1

