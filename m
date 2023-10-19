Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D83E7CF4D6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 12:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345125AbjJSKN0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 19 Oct 2023 06:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345039AbjJSKN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 06:13:26 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F8FAB;
        Thu, 19 Oct 2023 03:13:24 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a84204e7aeso65014587b3.0;
        Thu, 19 Oct 2023 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710404; x=1698315204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueVyERLupOWZhKoj+SNssW24wTSLCgkYTKYz8h4y1RM=;
        b=YnOCKMQiD9C/Sel+jbYLet+aQK3GhU58LTfeboSleJeiAbNaZEkgiA6UdkBGsVQwLh
         ZU4qwGMxaJF2SvjRMl+8nzcZV9uLzqn2wLwvXaxmky/Mi0arvySpkeIFjwvZeGzcCEYL
         HxkPWhxNJTSVwSycZDpb8feVHE1AIXHQbZirM4F+OiVTYU6v1jQayLvMvQC0OJ5HkBEc
         5KHsnHI2+Ow7HwJ0s8RTq27XIFrauSi2tvMVm8qWEyF6p6Es8zPTWtOm086K+cny5pDv
         oxHEAvsAT7W75bfQRlz4o8zZMAgQaRsRog1wwn2gv2jdztocVggKdlSgBzdSuVWU8KOv
         6JMg==
X-Gm-Message-State: AOJu0YxuMQ0vvLWRC5Fp1mb2NRUeRJMqx0qPjC5cMR84jBYbrs3OclmM
        ewLB1JGIuYFM4w69q7p8AFFE8cvhyhpUSw==
X-Google-Smtp-Source: AGHT+IG9PLqA1Eo4NcE78tIWBOofiVo6xqgWFcEzka+pJQ8yHbhjef1YhW25nooaN1vznww+fP333g==
X-Received: by 2002:a05:690c:f0f:b0:5a7:fcae:f3e2 with SMTP id dc15-20020a05690c0f0f00b005a7fcaef3e2mr2516003ywb.43.1697710403897;
        Thu, 19 Oct 2023 03:13:23 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id i83-20020a819156000000b005a7bf9749c8sm2326246ywg.4.2023.10.19.03.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 03:13:23 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7c93507d5so93135847b3.2;
        Thu, 19 Oct 2023 03:13:23 -0700 (PDT)
X-Received: by 2002:a81:4948:0:b0:5a8:d86b:7469 with SMTP id
 w69-20020a814948000000b005a8d86b7469mr2016094ywa.8.1697710401858; Thu, 19 Oct
 2023 03:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230619122212.304962-1-tomi.valkeinen@ideasonboard.com> <20230619122212.304962-6-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230619122212.304962-6-tomi.valkeinen@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Oct 2023 12:13:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9aRup14BwD9Do2hpiu=m2tjy14-VwVbSe1ckAbQQ-kw@mail.gmail.com>
Message-ID: <CAMuHMdV9aRup14BwD9Do2hpiu=m2tjy14-VwVbSe1ckAbQQ-kw@mail.gmail.com>
Subject: Re: [PATCH v15 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Mon, Jun 19, 2023 at 2:27 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch, which is now commit 313e8b32c6166853 ("media:
dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer")
in v6.6-rc1.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml

> +  i2c-alias-pool:
> +    minItems: 1
> +    maxItems: 32
> +
> +  links:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      ti,manual-strobe:
> +        type: boolean
> +        description:
> +          Enable manual strobe position and EQ level
> +
> +    patternProperties:
> +      '^link@[0-3]$':
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          reg:
> +            description: The link number
> +            maxItems: 1
> +
> +          i2c-alias:
> +            description:
> +              The I2C address used for the serializer. Transactions to this
> +              address on the I2C bus where the deserializer resides are
> +              forwarded to the serializer.

make dt_binding_check:

Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:
i2c-alias: missing type definition


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
