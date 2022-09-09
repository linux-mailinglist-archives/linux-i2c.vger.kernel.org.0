Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2223C5B4211
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 00:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbiIIWCM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 18:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiIIWB4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 18:01:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2981451C5;
        Fri,  9 Sep 2022 15:01:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y3so7186119ejc.1;
        Fri, 09 Sep 2022 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=aCUkhjCPKv8heAlooNOpe4JIMarq0xiaCBe6KjrLZV4=;
        b=EHsa2gWl9rcNc3s7TTLzOhBv3nPPoCv1uAixUF+0ckqk88oxO2j2fM/kJtiuEzy9gP
         jGp/iPSdx4taMq42TH1sXqG6aOhprmoXL6KHXZtv6kcA507RXwKqA6XK4QTMyPMm6XBb
         Y0da22uIw5aJfiPs8h8NKkjMkyjGu/QMMZ8PYP09nRXFBDkdeWce+PbnuffrR0r/lj/r
         LhsHfsieXaEorDiO1XaZvNOf6TRn+Wo4c9RuR//Ng1TI1hJ9xKuurokeyEaKSF0yXGca
         W3C0QttL050fmkF6kyFA8anosoYPv63P7pen1YadLoUpCtP2hJykKIIE/rCl7rUbqPmd
         o8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aCUkhjCPKv8heAlooNOpe4JIMarq0xiaCBe6KjrLZV4=;
        b=YzmiRx/4tT24lCtFuxkbNBkw9mHEYwZ87o7QJ7BISqprUt39krZiji4PXabxTe1TYA
         U3cEvTw6eUzhksiBl1MuTf56PJ7aQQ1JdAHIJmM6zvPcp3rls7/FHxPRX2vPIO7u/XoX
         BdUeH7zTUY2H08mjQ/7JY5kpaQ1+MpijSTyfPkam3U/4rtZkcouOQqizhWicdppPrLef
         3iuqetPdLjVWdOPleP5TkGATHNDRZHW+/B5qNx5134RGa3KHpgRbCkgKtkQzkIBAc7fZ
         RlL5aBzwASZqA8w+NI8GOb43F1zZ9OukeqxZvv9TBH4/DXJ3uhz5yQxkNFYciE3EZGFe
         4pLA==
X-Gm-Message-State: ACgBeo0cwZDTMshowBYqCkzlLU6Oz5Rh7pIhxV0+qw+l5HN/wbsVwEip
        QCnoAj9XGew7lOEQRblwXRM=
X-Google-Smtp-Source: AA6agR4VJJ7NX/xzm7/ibx9Z/C+sYphKP2BcAfKYeR+D2A3OuXvIF9VUtkzELLARQ4rFQj9hPmyAWA==
X-Received: by 2002:a17:906:591:b0:73d:c3ef:84ae with SMTP id 17-20020a170906059100b0073dc3ef84aemr11261317ejn.155.1662760914101;
        Fri, 09 Sep 2022 15:01:54 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906681000b0072b13ac9ca3sm777833ejr.183.2022.09.09.15.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:53 -0700 (PDT)
Message-ID: <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
Date:   Sat, 10 Sep 2022 00:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 08/11] dt-bindings: arm: rockchip: pmu: add
 rockchip,rk3128-pmu
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

Add rockchip,rk3128-pmu compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 5ece38065..f5800f7cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -21,6 +21,7 @@ select:
         enum:
           - rockchip,px30-pmu
           - rockchip,rk3066-pmu
+          - rockchip,rk3128-pmu
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
@@ -35,6 +36,7 @@ properties:
       - enum:
           - rockchip,px30-pmu
           - rockchip,rk3066-pmu
+          - rockchip,rk3128-pmu
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
-- 
2.20.1

