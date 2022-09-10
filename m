Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9BD5B4715
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 16:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiIJOyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 10:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIJOyE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 10:54:04 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9B743E46;
        Sat, 10 Sep 2022 07:53:59 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso2912513otb.6;
        Sat, 10 Sep 2022 07:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pILdS+ykma6wojNncurew9VCgVoLwIUCOBAwYVFiN38=;
        b=yGnDD1ao4GEMx7N1JzK9EuWwA8OyCnBor8z+SK8YXTLojH/t1HKB5T7Mf+4DH1vrtZ
         NC5Z8oFkw3TXK5deXvNA0V4IuGdeDz+siQKlKgpP/gVipYRJiG4/Kzr+RHLzHHOqfziH
         I3mlUDkjvBW9lW7KWAdCxUL+y4oKYfSYUIf5S0KsDVu4WcQc20TJOueC7BiSI1GIXmdz
         SOH7dILLJAtzAUdVmTj1ZnxAHZ78y4Xax+4qF9WhRI73rgEx0Eby8bXSwRpUCjWyADH7
         YMq/Sdd4bhW4bCyn4GsgH5WS+sstkeSdEyDQmZlCG6kljf8mWgwjk0F196wczxvoLkeK
         USmA==
X-Gm-Message-State: ACgBeo0buclPv/mHWoij3+Y9OgTRlhAo17ldJ26Fl6RAeQ68KdG3SJDH
        Bz+25gLPZfijdXDkSwt6fA==
X-Google-Smtp-Source: AA6agR6uLUKNbC4IvKC2wLt/j2kzd2cW1yheQpUF3UEh3yZ8k9afTPnXNhIXR5NohpsvuQZfDM3fvw==
X-Received: by 2002:a05:6830:1496:b0:639:648a:55f4 with SMTP id s22-20020a056830149600b00639648a55f4mr7242714otq.370.1662821638995;
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x2-20020a056870b40200b0012b298699dbsm2159608oap.1.2022.09.10.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
Received: (nullmailer pid 34701 invoked by uid 1000);
        Sat, 10 Sep 2022 14:53:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-mtd@lists.infradead.org, richard@nod.at,
        thierry.reding@gmail.com, linux-rockchip@lists.infradead.org,
        philipp.tomsich@vrull.eu, vigneshr@ti.com, wim@linux-watchdog.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        miquel.raynal@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
        linux-serial@vger.kernel.org, robh+dt@kernel.org, kishon@ti.com,
        linux-spi@vger.kernel.org, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
        kever.yang@rock-chips.com, zhangqing@rock-chips.com,
        linux-kernel@vger.kernel.org, broonie@kernel.org,
        linux@roeck-us.net, gregkh@linuxfoundation.org,
        ulf.hansson@linaro.org, linux-watchdog@vger.kernel.org,
        jamie@jamieiles.com, sjg@chromium.org,
        u.kleine-koenig@pengutronix.de, heiko@sntech.de,
        linux-mmc@vger.kernel.org
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
Date:   Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.180247.34700.nullmailer@robh.at.kernel.org>
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

On Sat, 10 Sep 2022 00:02:22 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


pwm@10280000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280010: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280020: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040010: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040020: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb
	arch/arm64/boot/dts/rockchip/rk3328-a1.dtb
	arch/arm64/boot/dts/rockchip/rk3328-evb.dtb
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb

