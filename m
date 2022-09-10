Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCADD5B4707
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 16:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiIJOyE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 10:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiIJOyD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 10:54:03 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0AA43E42;
        Sat, 10 Sep 2022 07:54:02 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1280590722dso11541003fac.1;
        Sat, 10 Sep 2022 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CoE1Ttusw0El8RVuwL7vJ+sUMh013wcJJxIsVP3JE8k=;
        b=f2TPMYya3NdSQM81GPZnMiRWH5F1qilfM+O2OkE17zzedH5E5QFsDzQ+tSNThaLyiO
         Vk/Fx1sEwo4u75hf+qbK3oOA1O14ZR1PtpPJA9NlOKqj62MjyEd5TTvOhnrPhvD2iFk8
         pTJfiJlohJS0/WN/eVPliUOywCNnQHjoz/NXwQJW7rVxlHUNfzEK4KviX1Y2j14vh8A8
         aacqaKP5HMya9N04hMLmARB4asf9DGnANJu04W27HcW4nRVoJI0bh3cJV66dSYp3AYgX
         deuDXT8Bu2eATmm+rOyq02cuhg/d0wcjwLyGNoFVNkuNZvJA2RoZ/nYpc8SQzoEE/cwa
         Dl/g==
X-Gm-Message-State: ACgBeo2uAvPaZIufK25SR5pDf7+z9NT9bK6sygP1OpJFUHiJ+ts4wu+u
        kcISyKWOmoN58PeKb7WlMQ==
X-Google-Smtp-Source: AA6agR7QnkJvBeFKVjr4lQWP2YPcXrsjPepKXysHeccFpuHeF5YxdAR1V0QPbwTm0zS3ZRTkGxTbOA==
X-Received: by 2002:a05:6808:1b24:b0:344:8928:69fb with SMTP id bx36-20020a0568081b2400b00344892869fbmr5983433oib.182.1662821641824;
        Sat, 10 Sep 2022 07:54:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a4ad106000000b00448a3ecdc9dsm1321063oor.22.2022.09.10.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 07:54:01 -0700 (PDT)
Received: (nullmailer pid 34699 invoked by uid 1000);
        Sat, 10 Sep 2022 14:53:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org,
        wim@linux-watchdog.org, broonie@kernel.org, sjg@chromium.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        richard@nod.at, kever.yang@rock-chips.com,
        zhangqing@rock-chips.com, vigneshr@ti.com, jamie@jamieiles.com,
        linux-pwm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, miquel.raynal@bootlin.com,
        u.kleine-koenig@pengutronix.de, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, ulf.hansson@linaro.org, kishon@ti.com,
        devicetree@vger.kernel.org, thierry.reding@gmail.com,
        linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu,
        linux-spi@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
Subject: Re: [PATCH v1 05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
Date:   Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.172121.34698.nullmailer@robh.at.kernel.org>
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

On Sat, 10 Sep 2022 00:02:07 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-spi compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


spi@ff1d0000: Unevaluated properties are not allowed ('max-freq' was unexpected)
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb

spi@ff200000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/rockchip/rk3399-evb.dtb
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb

