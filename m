Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0FE4F8F5E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Apr 2022 09:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiDHHUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Apr 2022 03:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiDHHUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Apr 2022 03:20:30 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896A121FF50;
        Fri,  8 Apr 2022 00:18:27 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id q10so2160327vkh.0;
        Fri, 08 Apr 2022 00:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=d3gNHoy16ZlsDLV8bQepLcY1WMSrBsifmbORH9+6qxw=;
        b=yEHmvUbRlGG/64Tp/hE7IQilX4hPaFUk9Kplh6hHXG+y9jzxyhOmkMxvo6UKdquqD0
         GqbhIQvTg9Ir1fiKk2mOm8Vd5zCLpQD6oI4m11KSes0a5wFcz0L+kRlptA0t7HHZJkZL
         Ex8wdx6+eQ9P9LQ6iQQvd39WKHmu8wrAo/qdVQpniC9tH6uJy/fdDQEe6cCXAoLQ6PmI
         aKZzSzYLiw2Hiw1vCouRUkJ+PGr+F1Q0NDF3Y1UWhlsnTH+yfy8dUTcBeCKI8lDfMMA1
         bAoDpxqqhuGywM9AcEwgqUmpO/CGhk1L7bkJJgGfAJI/HhF4/zqm6BM4viKkLxOz+YLx
         mobg==
X-Gm-Message-State: AOAM5305y6X9OEJqN8iKzQar0h2gTVN9qvIKdCFIAYIP3R9lfJO7yxht
        w0aTwJqLXs27e+RXd3SNQKbDv3I1+/JWoA==
X-Google-Smtp-Source: ABdhPJw4nW6JPKtb3JaLOFRJubHdhfutGfqcOb/CxCgc7qJdWXGvxzx4A5tgytHWyDyuluBP+Y6uiw==
X-Received: by 2002:a1f:2c4b:0:b0:345:698:582a with SMTP id s72-20020a1f2c4b000000b003450698582amr2249252vks.25.1649402306187;
        Fri, 08 Apr 2022 00:18:26 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id x6-20020a67c086000000b003227f6f6b44sm2408043vsi.17.2022.04.08.00.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 00:18:25 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id r25so4563594vsa.13;
        Fri, 08 Apr 2022 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6102:32c3:b0:325:c919:bef4 with SMTP id
 o3-20020a05610232c300b00325c919bef4mr5902203vss.60.1649402305499; Fri, 08 Apr
 2022 00:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com> <20220326102229.421718-3-tanure@linux.com>
 <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
In-Reply-To: <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
Reply-To: tanure@linux.com
From:   Lucas Tanure <tanure@linux.com>
Date:   Fri, 8 Apr 2022 08:18:14 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3WHCKmg3Fq5jPTY=PNjow2HdLkgFVLd9GQRuGg_q96=Q@mail.gmail.com>
Message-ID: <CAJX_Q+3WHCKmg3Fq5jPTY=PNjow2HdLkgFVLd9GQRuGg_q96=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 6, 2022 at 12:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 26/03/2022 11:22, Lucas Tanure wrote:
> > The duty cycle of 33% is less than the required
> > by the I2C specs for the LOW period of the SCL
> > clock.
> >
> > Move the duty cyle to 50% for 100Khz or lower
> > clocks, and (40% High SCL / 60% Low SCL) duty
> > cycle for clocks above 100Khz.
> >
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >   drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
> >   1 file changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> > index 4b4a5b2d77ab..b913ba20f06e 100644
> > --- a/drivers/i2c/busses/i2c-meson.c
> > +++ b/drivers/i2c/busses/i2c-meson.c
> > @@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
> >   static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> >   {
> >       unsigned long clk_rate = clk_get_rate(i2c->clk);
> > -     unsigned int div;
> > +     unsigned int div_h, div_l;
> >
> > -     div = DIV_ROUND_UP(clk_rate, freq);
> > -     div -= FILTER_DELAY;
> > -     div = DIV_ROUND_UP(div, i2c->data->div_factor);
> > +     if (freq <= 100000) {
>
> You should use I2C_MAX_STANDARD_MODE_FREQ instead here
>
> > +             div_h = DIV_ROUND_UP(clk_rate, freq);
> > +             div_l = DIV_ROUND_UP(div_h, 4);
> > +             div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> > +     } else {
> > +     /* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> > +      * minimum HIGH is least 0.6us.
> > +      * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> > +      * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> > +      * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> > +      * Duty = H/(H + L) = 2/5
> > +      */
>
> Please move the comment before the if()
>
> > +             div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> > +             div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> > +     }
> >
> >       /* clock divider has 12 bits */
> > -     if (div > GENMASK(11, 0)) {
> > +     if (div_h > GENMASK(11, 0)) {
> >               dev_err(i2c->dev, "requested bus frequency too low\n");
> > -             div = GENMASK(11, 0);
> > +             div_h = GENMASK(11, 0);
> > +     }
> > +     if (div_l > GENMASK(11, 0)) {
> > +             dev_err(i2c->dev, "requested bus frequency too low\n");
> > +             div_l = GENMASK(11, 0);
> >       }
> >
> >       meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> > -                        FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
> > +                        FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
> >
> >       meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> > -                        FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
> > +                        FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> > +
> > +
> > +     /* set SCL low delay */
> > +     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> > +                        (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);
>
> You could use FIELD_PREP() here
>
> >
> > -     /* Disable HIGH/LOW mode */
> > -     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> > +     /* Enable HIGH/LOW mode */
> > +     meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
> >
> > -     dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> > -             clk_rate, freq, div);
> > +     dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> > +             clk_rate, freq, div_h, div_l);
> >   }
> >
> >   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)
>
> I looked at different amlogic downstream sources, and those match the recommended
> calculations.
>
> So with the legacy back for Meson6, it will be OK.
>
> Neil

Ok, I will do the modifications this weekend.
I only tested i2c3 and i2c_ao and will execute more measures and show
the results.

Thanks
Lucas
