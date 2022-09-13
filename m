Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C3F5B7605
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 18:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiIMQD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 12:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbiIMQDU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 12:03:20 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201514F19A;
        Tue, 13 Sep 2022 08:00:02 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1279948d93dso32708173fac.10;
        Tue, 13 Sep 2022 08:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7RWaneRC8/NytetCZObAsUNo67j3yzk6oJ+xsdXrYf4=;
        b=TgUYFvq6mrydc/No8k54t3k+VWuQk58yVVlpsfy++YjZXL+UDdfrsapDf58yiMGI+Y
         fOF+rzudOSEPRJP5Lb8Jo+VTX/xuGdqlRdENfYbpy5OC0sOfBjTYF0mppxxpVrA8IMo3
         8TyhDmfH8X01qYNeuv/WOGDKcWg8JcGF4O4nCmowCjzZ/9t8BHoUr0IhMz9ICR64cjn1
         GlCwZfFoWBw1UXgxoKtNDcAkHkNgQWvWIzKrtCAFpKjVpZUTTuIvLcI0yqfTSXhWuQla
         SVZcEZa8Ay6Z5GHraH4AM5Yqyhpu4+3Iyc+lUZP9T+ZJ9EmBr2Pf4Pzj5f07wXdFmntK
         Gy5g==
X-Gm-Message-State: ACgBeo1YZ5LD2sShRyq1y2qZ/5bVMTZnEql1ylx4/v+mQRSlVzA4zzsC
        2tmm2h8pVqvOsHIM4v+j3J/i1/apOg==
X-Google-Smtp-Source: AA6agR56X4nOuBVmlb1hHNay/YivDzxq3eWYSEJNyeQmir/p3WlQ97jnab+s2pE/O3fUGh03U3FVQA==
X-Received: by 2002:a05:6808:201e:b0:34f:b9bd:d678 with SMTP id q30-20020a056808201e00b0034fb9bdd678mr1641252oiw.1.1663079170617;
        Tue, 13 Sep 2022 07:26:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z26-20020a9d7a5a000000b006370abdc976sm6040184otm.58.2022.09.13.07.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:26:10 -0700 (PDT)
Received: (nullmailer pid 3620059 invoked by uid 1000);
        Tue, 13 Sep 2022 14:26:08 -0000
Date:   Tue, 13 Sep 2022 09:26:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     devicetree@vger.kernel.org, jamie@jamieiles.com, vkoul@kernel.org,
        richard@nod.at, linux-i2c@vger.kernel.org,
        linux-usb@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        zhangqing@rock-chips.com, linux-spi@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, vigneshr@ti.com,
        linux-kernel@vger.kernel.org, kishon@ti.com,
        kever.yang@rock-chips.com, heiko@sntech.de,
        linux-serial@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, linux-pwm@vger.kernel.org,
        philipp.tomsich@vrull.eu, sjg@chromium.org,
        gregkh@linuxfoundation.org, ulf.hansson@linaro.org,
        wim@linux-watchdog.org, broonie@kernel.org,
        linux-rockchip@lists.infradead.org, miquel.raynal@bootlin.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add
 rockchip,rk3128-pwm
Message-ID: <20220913142608.GA3620009-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:02:22 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
