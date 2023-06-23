Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3EA73C4DB
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 01:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjFWXnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 19:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjFWXnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 19:43:18 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EF02703;
        Fri, 23 Jun 2023 16:43:17 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78333585d28so32790139f.1;
        Fri, 23 Jun 2023 16:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563796; x=1690155796;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTiyezCl+ncjMsIOOS0sUB9bYyrGCDjIJOvndxohyZs=;
        b=JsAIoLHPQR83cIFWCg7WWq9dOFpHwbGPHK2yoY125gC8xVqx2+ttlxJX+sxoETmQlV
         0nzPjnhz39qU6o87QsXUo3XE8rc8xVe1tCFq0v/HUv/SqKNKfCrP1E1R7lgXcGuOx6y2
         Ye3G6ypunxQdjQzz2ukdGGZuVQNU006TpPpL8MAHc+uIiGpnV85+2gp/WvADNQ/2sRCU
         AoLsbcQUu6qTlfBlobD2G6x4CJs0P6/7LAU5AFlr+R6jVOZVLv1PoQKKkeOqS1a/I5G5
         iHh6o5EBG3JC2u0sVTRVWCc72uLnf7/POT8WGjwChV0ytJvnTeM9K3NQ4zI7JypbiFa8
         xFfg==
X-Gm-Message-State: AC+VfDw5DExrdMCkSqQcgXx602OXDOFT2Gsg8bbCY0m4jzAMeRS+bMz2
        HjkFdCKixSxi9ODyQ8CMJA==
X-Google-Smtp-Source: ACHHUZ704nUo/Qe+1L5BBq/vh9K03eeZluxsw6d51akGW3mbLVGxB1UGHdSEiXEdc5xMZV7l5fDOHg==
X-Received: by 2002:a5d:9483:0:b0:760:e308:107e with SMTP id v3-20020a5d9483000000b00760e308107emr15001057ioj.0.1687563796356;
        Fri, 23 Jun 2023 16:43:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r27-20020a02c85b000000b0041407c67451sm72416jao.165.2023.06.23.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:43:15 -0700 (PDT)
Received: (nullmailer pid 1606691 invoked by uid 1000);
        Fri, 23 Jun 2023 23:43:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Varshini Rajendran <varshini.rajendran@microchip.com>
Cc:     ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        edumazet@google.com, broonie@kernel.org, arnd@arndb.de,
        maz@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
        alain.volmat@foss.st.com, p.zabel@pengutronix.de,
        mihai.sain@microchip.com, soc@kernel.org,
        linux-mtd@lists.infradead.org, cristian.birsan@microchip.com,
        jerry.ray@microchip.com, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        balamanikandan.gunasundar@microchip.com, lee@kernel.org,
        olivia@selenic.com, sboyd@kernel.org, mturquette@baylibre.com,
        kuba@kernel.org, Hari.PrasathGE@microchip.com,
        linux-kernel@vger.kernel.org, balakrishnan.s@microchip.com,
        alsa-devel@alsa-project.org, durai.manickamkr@microchip.com,
        sre@kernel.org, vkoul@kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, andrew@lunn.ch,
        devicetree@vger.kernel.org, nayabbasha.sayed@microchip.com,
        linux-gpio@vger.kernel.org, nicolas.ferre@microchip.com,
        davem@davemloft.net, pabeni@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux@roeck-us.net,
        wim@linux-watchdog.org, tglx@linutronix.de,
        horatiu.vultur@microchip.com, radu_nicolae.pirea@upb.ro,
        dharma.b@microchip.com, a.zummo@towertech.it,
        linux-mmc@vger.kernel.org, richard.genoud@gmail.com,
        claudiu.beznea@microchip.com, linus.walleij@linaro.org,
        conor+dt@kernel.org, herbert@gondor.apana.org.au,
        eugen.hristev@collabora.com, dmaengine@vger.kernel.org,
        netdev@vger.kernel.org, linux-spi@vger.kernel.org,
        linux@armlinux.org.uk, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        neil.armstrong@linaro.org, vigneshr@ti.com,
        manikandan.m@microchip.com, linux-clk@vger.kernel.org,
        olof@lixom.net
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
Message-Id: <168756378936.1606652.14221929175769628362.robh@kernel.org>
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7
 compatible
Date:   Fri, 23 Jun 2023 17:43:09 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Sat, 24 Jun 2023 02:00:42 +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.example.dtb: sound@fc048000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,sama5d2-classd'] is too short
	from schema $id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230623203056.689705-32-varshini.rajendran@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

