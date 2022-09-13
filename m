Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C78F5B6EF2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbiIMOHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbiIMOG5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:06:57 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA6B5AA1F;
        Tue, 13 Sep 2022 07:06:40 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-127dca21a7dso32332317fac.12;
        Tue, 13 Sep 2022 07:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=s6AlJol1WXkTtPhwmopMK+Eef1rB1gY5f+tJ12KpnB0=;
        b=lSqi0Sz2yBe+ReXDcfe6B2n0K7afcd4mUK8bAIvs1k80BXcmB31u+LnuKrRvlXXmCg
         6mAWuuu+VYGFRaDsRlUkRB5fysuyMuWFW5nMNdOkFu+ZjDBuUyGV+jieM4NpI+bW7OH7
         8fLshbl4fp43QpX/UJHx1wfBZLL4pSIOGQGDEfPVQfTEXVnkx4RH1KQfNL4BbgRJUGcU
         9qIv/f9Gv9ZFAiHOCTso14J3oFAsDmrbiPG79qzmmBuod46JqRlGWSsZXZeRMpJXV1/a
         uFY7IOwRwpF9CSsm0ZAWExlCuqDh4r+kETH9pHwQ2hMIBn5wCot8hzDx1A9D4CP8hayz
         CYHQ==
X-Gm-Message-State: ACgBeo3/JCf+QcIvE/3/lD2tC9A6d7D7R52/RB4nnlj4cehTF35UhA3P
        LODviSrPnrYCsLO4uE2CEQ==
X-Google-Smtp-Source: AA6agR7DEpROfK34CcJc9ua54a54y7oXUr80MDoa0RjLp7zD/zwbGg+f95PbuxN+K1kvWR0jclK1jw==
X-Received: by 2002:a05:6808:d4e:b0:344:cc0a:2a48 with SMTP id w14-20020a0568080d4e00b00344cc0a2a48mr1537325oik.241.1663077998885;
        Tue, 13 Sep 2022 07:06:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bl32-20020a05680830a000b0034d9042758fsm5232514oib.24.2022.09.13.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:38 -0700 (PDT)
Received: (nullmailer pid 3593227 invoked by uid 1000);
        Tue, 13 Sep 2022 14:06:37 -0000
Date:   Tue, 13 Sep 2022 09:06:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     vkoul@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kever.yang@rock-chips.com, broonie@kernel.org,
        ulf.hansson@linaro.org, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux@roeck-us.net, miquel.raynal@bootlin.com,
        linux-serial@vger.kernel.org, linux-phy@lists.infradead.org,
        sjg@chromium.org, vigneshr@ti.com, kishon@ti.com,
        linux-spi@vger.kernel.org, philipp.tomsich@vrull.eu,
        linux-arm-kernel@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        linux-mmc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        jamie@jamieiles.com, zhangqing@rock-chips.com, richard@nod.at,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
Message-ID: <20220913140637.GA3593173-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:01:56 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-wdt compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
