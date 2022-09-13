Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862025B72C7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 17:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbiIMO7r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbiIMO6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:58:55 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A2B67C97;
        Tue, 13 Sep 2022 07:28:36 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-11e9a7135easo32544794fac.6;
        Tue, 13 Sep 2022 07:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zYRS5/+Q00Jt+sqvHB1fjEMsS/sAzxnNY3oApp6VsX4=;
        b=BDR0mhRW0cZNaNfmjAann9vKWXeLTkg8G8vI1awTj8pz/GDwkR3cK29FJghbA8RlAk
         Vv6Rmd6Uwmcc6Uuc6sY0MxTpHn2MunKE4aXels7LbXsAGaOdo7dmmpV1kz5pjAkgnmFQ
         6gyBnn39DThc73eIFjhxhH0kMV8Wb6tiDJdun2E8rRSc0V/AnUIV5CM3JK+WhtT9Rcmm
         bhtHdsdd4jI161DBuSFcodN9OdBI0/r96rpu7RJhE8i/eXM/56BG6qsNJPDkSqNExxHz
         vrA+b08LI/8IlVxJOGYMmg87BrTNdTrMnk/fZoo2zXiOWjl/6BkYhI06lhsfL6QCpuUu
         J1Dg==
X-Gm-Message-State: ACgBeo3pZ04ZQ0KZa0OFBe4YcYHxfLx51hXFtV9ZUB+NLbMVpHBgj4Av
        4vHRYP6vQhW5UcLQmnoA/czu+59jjw==
X-Google-Smtp-Source: AA6agR6hOpZPvoPt2Eb14Hvai4q1Lk4rE7+yyu9TNmztp+7DqLeOhYDLvEKfa24JcgVwwqI0QlyFNw==
X-Received: by 2002:a05:6808:15aa:b0:34f:b7e3:26f5 with SMTP id t42-20020a05680815aa00b0034fb7e326f5mr1747211oiw.22.1663078560574;
        Tue, 13 Sep 2022 07:16:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i34-20020a056870892200b0012644cc4feasm6980943oao.55.2022.09.13.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:15:59 -0700 (PDT)
Received: (nullmailer pid 3606168 invoked by uid 1000);
        Tue, 13 Sep 2022 14:15:58 -0000
Date:   Tue, 13 Sep 2022 09:15:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kishon@ti.com, wim@linux-watchdog.org, linux@roeck-us.net,
        sjg@chromium.org, heiko@sntech.de, linux-watchdog@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, broonie@kernel.org,
        miquel.raynal@bootlin.com, linux-rockchip@lists.infradead.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, richard@nod.at, ulf.hansson@linaro.org,
        linux-arm-kernel@lists.infradead.org, zhangqing@rock-chips.com,
        jamie@jamieiles.com, thierry.reding@gmail.com,
        linux-mmc@vger.kernel.org, robh+dt@kernel.org,
        kever.yang@rock-chips.com, linux-spi@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, philipp.tomsich@vrull.eu,
        linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, vigneshr@ti.com
Subject: Re: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add
 rockchip,rk3128-dw-mshc
Message-ID: <20220913141558.GA3606130-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
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

On Sat, 10 Sep 2022 00:02:14 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-dw-mshc compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
