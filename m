Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6198855F806
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 09:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbiF2G7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 02:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiF2G6M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 02:58:12 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10E533890;
        Tue, 28 Jun 2022 23:57:49 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 2so8563906qvc.0;
        Tue, 28 Jun 2022 23:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAl0DXeEP1iLPwgoXgupmgF0KTbHxLpZfpaYD3ShJsE=;
        b=OTxVhQ/ZEvmc31F6e1vp0os8oMrLc60IMhgr21uxW+1GEg3U8S4ZcMaDu+6JxmCWXU
         At4JDqbcjeP+wS2xjcVqaM8bG6FUloFe6yjGarcf739UUvVexWjCmhzbLBx+JGyAnh8v
         fjXt30Rv7VzP2q9i7hMVLM+y5OY9RALts9xPmnl4TEirFXfroFjNUivUS/xjC7UupKhd
         DQ4mbKpd+/B/xWIX1crGbmXshqcVfkLKegSEr72+SFf7OtvsaLGdU/VZkutMJQ4ZnC1L
         s11GlmU55Jm209HqPuLh48426gjM+cYXWczL2sM8OaKaEdkfQIvszscMF8ADZkEnbmNp
         qKPA==
X-Gm-Message-State: AJIora8Y9dmDWARgXmpovCgLl/D5bWl7YHGd70sbUv/5my4/ZGqal3tG
        puTLJwE/zF1FDpKu4Vi0vopvx/mfzRwwgQ==
X-Google-Smtp-Source: AGRyM1u1RVeuTga1wg8IdQGfk9J+YZtYhxkRrNqimPW/6kREgHPaRqBzykiMYturPbUOesG62dL8+Q==
X-Received: by 2002:a05:6214:410c:b0:470:46e6:bbbf with SMTP id kc12-20020a056214410c00b0047046e6bbbfmr6609302qvb.42.1656485868593;
        Tue, 28 Jun 2022 23:57:48 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a20-20020ac84d94000000b0030515120916sm10149793qtw.44.2022.06.28.23.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 23:57:48 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id i15so26355535ybp.1;
        Tue, 28 Jun 2022 23:57:48 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr1809912ybb.202.1656485560287; Tue, 28
 Jun 2022 23:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com> <YrttwplV9zEgCFji@smile.fi.intel.com>
In-Reply-To: <YrttwplV9zEgCFji@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 08:52:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1xkCvico_f359xBzkwU5pG3VVJV7O3dHRyy5a9QvyGw@mail.gmail.com>
Message-ID: <CAMuHMdV1xkCvico_f359xBzkwU5pG3VVJV7O3dHRyy5a9QvyGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Andy,

On Tue, Jun 28, 2022 at 11:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:
> > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

> > +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> > +                       unsigned int *count)
> > +{
> > +     unsigned int i;
> > +     int ret = 0;
>
> Redundant assignment, you may return 0 directly.

Can you prove msg->len is never zero, and the loop below is always
executed at least once?
The driver does set I2C_AQ_NO_ZERO_LEN, but I don't think the static
checkers know ;-)

>
> > +     for (i = 0; i < msg->len; i++) {
> > +             ret = rzv2m_i2c_write_with_ack(priv, msg->buf[i]);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     *count = i;
> > +
> > +     return ret;
> > +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
