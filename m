Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C065B6EFC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbiIMOGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbiIMOGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:06:14 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91C65809E;
        Tue, 13 Sep 2022 07:06:13 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1279948d93dso32314240fac.10;
        Tue, 13 Sep 2022 07:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gPHBD3/yThDshlFcYv9k71widUkhofw1FDDYpv8K6pk=;
        b=TUI5PpTIg8SVmLtA8lnwA9PB+tLf9VcA1y2TGwu5S8bY83wulWPMUec7LLJTodlls9
         Z/R1fcSSv91xPOZxEb8olTolm+reKrB/l9CiF7bumvAR2kwaRxxW3TUsxzQTQ1AYZhWl
         /dmC1kvSBHYUR+zEogeY5hDo9QmvA6MyKemqE7zu7d0Dpr0Jncod4h5lgQBRel+Sua16
         9VNGLPyxb3V743Dww5s1O8nVNiW/cFNJ3pNgkBr5FngvmK2g8HAB5SNDVyY7VParuwY8
         VZBK2pTayD19Y7vmNWL5hLpsg6FMIu4m3AR1aYwGN86C+uY9jzrrsgPyIZRknou9jZD2
         yVvw==
X-Gm-Message-State: ACgBeo09XMhY3aHrqwItqxRTIbh5Oyd4RalICD3iFIlZLcL20oHPth15
        dchcJf3Ds465VKUtQNC2bg==
X-Google-Smtp-Source: AA6agR7aYuCePPGemiIdeL1jOXYKj30AqVdS1PK/922ZOdsnkY7FMM5ZgzSpgpw9aw4LGK2gnAELfg==
X-Received: by 2002:a05:6870:c884:b0:118:ae35:e200 with SMTP id er4-20020a056870c88400b00118ae35e200mr2011500oab.244.1663077973166;
        Tue, 13 Sep 2022 07:06:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0d85000000b0063975d170a8sm5980941ots.7.2022.09.13.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:12 -0700 (PDT)
Received: (nullmailer pid 3592371 invoked by uid 1000);
        Tue, 13 Sep 2022 14:06:11 -0000
Date:   Tue, 13 Sep 2022 09:06:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     zhangqing@rock-chips.com, broonie@kernel.org,
        u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
        philipp.tomsich@vrull.eu, miquel.raynal@bootlin.com,
        heiko@sntech.de, linux-mmc@vger.kernel.org, sjg@chromium.org,
        linux-rockchip@lists.infradead.org, gregkh@linuxfoundation.org,
        linux@roeck-us.net, linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org,
        linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
        richard@nod.at, kever.yang@rock-chips.com,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        kishon@ti.com, linux-arm-kernel@lists.infradead.org,
        jamie@jamieiles.com, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
        vkoul@kernel.org, linux-usb@vger.kernel.org,
        thierry.reding@gmail.com, vigneshr@ti.com, ulf.hansson@linaro.org
Subject: Re: [PATCH v1 09/11] dt-bindings: phy: phy-rockchip-inno-usb2: add
 rockchip,rk3128-usb2phy
Message-ID: <20220913140611.GA3592344-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:01:45 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-usb2phy compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
