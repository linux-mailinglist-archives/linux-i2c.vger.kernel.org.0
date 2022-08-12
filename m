Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382BB5912C4
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 17:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbiHLPOd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 11:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238973AbiHLPOK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 11:14:10 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06EBA8316;
        Fri, 12 Aug 2022 08:14:06 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id g18so618283ilk.4;
        Fri, 12 Aug 2022 08:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=0eLVaMC01PNGjZpFs/ysIl+m8N63WCqY/TMChEbDYg0=;
        b=6XOb/BfDAjqwhJt7CY9OG9mHZ7mn0EHYFyyL0UC9bLGIfUzKEnGwh5l7hZYqiXXXZT
         61UCZ480x5xw69WD61cVx+LIy94m31YDwZZ3HvhXpm5I4m/vz/If1bz5xp3IdVqKif51
         wWksbt3jL0VvN0ZY1Ela3vclO6bXgtiWsSDY2zZAG4fGK9aj4pNey0MdxzidHw7PeAlF
         PpXAzeTqCVO7xQGbiu8AlRW2e4YP68wKjK12HTcXps2DByDRejxN6CkbwGBKK6q/lIit
         1HXTVnYQBaxwGuoY/3OO5gqzDX4VEDucuGfQNuSXiPru0iuh5ufyvFcDdpMvw8gJvdcT
         Auvw==
X-Gm-Message-State: ACgBeo0A0ybVhgjLlUrOb8y0AJ3zNBM4WPOJ4m4le+vLPBcb0vja10dI
        XXCUoUffNgg9zUE/4ez+ww==
X-Google-Smtp-Source: AA6agR4kHmLj4/xFXi7YoJuj7sFcfvXQr++r7N1bmpGlXs50al2WmMAyv2dnRWOggoYOOBAkPkA9Zw==
X-Received: by 2002:a05:6e02:180a:b0:2de:20c8:572 with SMTP id a10-20020a056e02180a00b002de20c80572mr1957188ilv.213.1660317246428;
        Fri, 12 Aug 2022 08:14:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n12-20020a056638110c00b00342913963c7sm5141jal.16.2022.08.12.08.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:14:06 -0700 (PDT)
Received: (nullmailer pid 168988 invoked by uid 1000);
        Fri, 12 Aug 2022 15:13:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, festevam@gmail.com,
        Peng Fan <peng.fan@nxp.com>, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, xiaoning.wang@nxp.com,
        shawnguo@kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
        krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20220812043424.4078034-2-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com> <20220812043424.4078034-2-peng.fan@oss.nxp.com>
Subject: Re: [PATCH 1/6] dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
Date:   Fri, 12 Aug 2022 09:13:53 -0600
Message-Id: <1660317233.465911.168987.nullmailer@robh.at.kernel.org>
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

On Fri, 12 Aug 2022 12:34:19 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX LPI2C actually requires dual clock: per clock and ipg clock, so add
> both.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


i2c@40a40000: clock-names:0: 'per' was expected
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a40000: clock-names: ['ipg'] is too short
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a40000: clocks: [[14, 2]] is too short
	arch/arm/boot/dts/imx7ulp-com.dtb

i2c@40a40000: clocks: [[18, 2]] is too short
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a40000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a50000: clock-names:0: 'per' was expected
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a50000: clock-names: ['ipg'] is too short
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a50000: clocks: [[14, 3]] is too short
	arch/arm/boot/dts/imx7ulp-com.dtb

i2c@40a50000: clocks: [[18, 3]] is too short
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@40a50000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm/boot/dts/imx7ulp-com.dtb
	arch/arm/boot/dts/imx7ulp-evk.dtb

i2c@5a800000: clock-names: ['per'] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a800000: clocks: [[15, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb

i2c@5a800000: clocks: [[35, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb

i2c@5a800000: clocks: [[37, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a800000: clocks: [[38, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb

i2c@5a800000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a810000: clock-names: ['per'] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a810000: clocks: [[16, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb

i2c@5a810000: clocks: [[36, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb

i2c@5a810000: clocks: [[38, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a810000: clocks: [[43, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb

i2c@5a810000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a820000: clock-names: ['per'] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a820000: clocks: [[17, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb

i2c@5a820000: clocks: [[37, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb

i2c@5a820000: clocks: [[43, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a820000: clocks: [[45, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb

i2c@5a820000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a830000: clock-names: ['per'] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a830000: clocks: [[18, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb

i2c@5a830000: clocks: [[38, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb

i2c@5a830000: clocks: [[44, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

i2c@5a830000: clocks: [[46, 0]] is too short
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb

i2c@5a830000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb

