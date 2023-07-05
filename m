Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75457486B5
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 16:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbjGEOor convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 5 Jul 2023 10:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbjGEOon (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 10:44:43 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4376F1732;
        Wed,  5 Jul 2023 07:44:35 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579de633419so51264807b3.3;
        Wed, 05 Jul 2023 07:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568274; x=1691160274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWhsoBY4ZccttVe0RJL2prtxvZyGTGD0cE8SvtOHPOE=;
        b=Aiop42xfOwzW1TkiU9H/ZZ549zoxagLoLSg964c6Qt9vQ9Bd6qohbyf5Ss/+WaDr1f
         veo+6Mjw15GPoRpt1vTUx/7DxZKfbCSFgu2kvr4Kb3dchdbsgx7ECGil2O6AWYzoE0gU
         b/VYH6EGOJMx/CodJJAjjTWhmowG0e/GDXUOAiTrsXC44sR1fqum0z14gz++oNBuBWHs
         s96D+JRI/JP50cs5i7sa8LI9JK9+gO+3lut4vFHkb+oM2aMxI+cJGbBRWSYhsY0mxMAb
         BffXuYrK5zXqpN0yfEBjUimiliqFDPo2Pz0ISDHFFfBAhD2gBNk8aQJ4OGU+0+1GeIZD
         b3Lg==
X-Gm-Message-State: ABy/qLasnkZZ+bI5pexqHMQ9+9ppW8QkIkhRtDdsmklg+AKXLmJPiPms
        N4WP5pnpHYxsfFql6bCdK7OSJP8wZ2SgZg==
X-Google-Smtp-Source: APBJJlFNdaLQaBGS9PgCKNmp9q31rMh8+X/votnzZc1EdwBaILtFDsvAQ5SBBtolez8E4/FoEj/82g==
X-Received: by 2002:a0d:c702:0:b0:55a:574f:327c with SMTP id j2-20020a0dc702000000b0055a574f327cmr17804265ywd.13.1688568274274;
        Wed, 05 Jul 2023 07:44:34 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id t10-20020a81460a000000b0054bfc94a10dsm6179741ywa.47.2023.07.05.07.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 07:44:33 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5774335bb2aso64288467b3.0;
        Wed, 05 Jul 2023 07:44:33 -0700 (PDT)
X-Received: by 2002:a25:1644:0:b0:bcc:c347:81de with SMTP id
 65-20020a251644000000b00bccc34781demr11995065ybw.36.1688568273531; Wed, 05
 Jul 2023 07:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230705135159.33327-1-frank.li@vivo.com> <20230705135159.33327-8-frank.li@vivo.com>
In-Reply-To: <20230705135159.33327-8-frank.li@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 16:44:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCibwJ0jBYu3Cr3-hW-GykQ7UANeKo=qjJAbQTtmah3A@mail.gmail.com>
Message-ID: <CAMuHMdXCibwJ0jBYu3Cr3-hW-GykQ7UANeKo=qjJAbQTtmah3A@mail.gmail.com>
Subject: Re: [PATCH 08/11] i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Wed, Jul 5, 2023 at 3:56 PM Yangtao Li <frank.li@vivo.com> wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -893,12 +893,10 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
>         pd->dev = &dev->dev;
>         platform_set_drvdata(dev, pd);
>
> -       res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> -
> -       pd->res = res;
> -       pd->reg = devm_ioremap_resource(&dev->dev, res);
> +       pd->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);

"pdev" does not exist in this context.
Please try to at least compile-test your patches before submitting them.

>         if (IS_ERR(pd->reg))
>                 return PTR_ERR(pd->reg);
> +       pd->res = res;

While at it, you could get rid of "res", and replace it by "pd->res" in the
above call to devm_platform_get_and_ioremap_resource().

>
>         ret = of_property_read_u32(dev->dev.of_node, "clock-frequency", &bus_speed);
>         pd->bus_speed = (ret || !bus_speed) ? I2C_MAX_STANDARD_MODE_FREQ : bus_speed;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
