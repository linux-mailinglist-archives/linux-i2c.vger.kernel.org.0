Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE92679742B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 17:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245442AbjIGPgJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 7 Sep 2023 11:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245291AbjIGPfn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 11:35:43 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DA210F7;
        Thu,  7 Sep 2023 08:35:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58df8cab1f2so11411847b3.3;
        Thu, 07 Sep 2023 08:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100892; x=1694705692;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKxGpUXWeZzW+0YA5pXdJ3qjlQA5sUeEL9TtCazkU90=;
        b=JpyFx4n3vIgWRg6rhpO+aqoIz0X1CrXc6qSFqlo/vPjFuqk+T7qGOduKgiMfQH8/r8
         Gn4HFMVy6oTcpYsB9N2F/+Eiv/32L7BUjQeWkaFz0Of9mD9VwnapvQJ/1AP5n8SkFgAc
         NqcMMMB6SMriXcQhDKhPJo/dbVA8E+NOiIiaNsUQ0i1MEg2nIxYNUCUbY7t2l5w63QNa
         c8vz7D0K3zTEXUHKyZrQlr+LLk1HlgS58UwmmjzmGjv7RnqUzD4YnDcOUz6HsW7EFYNB
         epxoveqfivyHYw9HRJQ8qp3HPXaoE81cZd5BNT6D8i5KFDTvLRfsydbeU1Bka4/WRDkZ
         uqSA==
X-Gm-Message-State: AOJu0YxhtQY8kEvFXwglD8jN8rHLfizPIN1YSvwWj7eCfYJwrknaRwqM
        CVI23Ndh9F25neQxqpKYHoHkEfNiJhzM3A==
X-Google-Smtp-Source: AGHT+IHkEf+1YxgAH2quovVvqouMHG1+J8m9ks9Z8SfgxsdhGMwmT+08B6msM5dOia2K1Qq+M5i3ZA==
X-Received: by 2002:a05:6808:f8b:b0:3a7:77ff:63a3 with SMTP id o11-20020a0568080f8b00b003a777ff63a3mr21672948oiw.30.1694070571435;
        Thu, 07 Sep 2023 00:09:31 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id w15-20020a056808090f00b003a9a35349b1sm5251157oih.24.2023.09.07.00.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 00:09:31 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b9a2416b1cso488726a34.2;
        Thu, 07 Sep 2023 00:09:31 -0700 (PDT)
X-Received: by 2002:a05:6830:1096:b0:6b9:1af3:3307 with SMTP id
 y22-20020a056830109600b006b91af33307mr19067127oto.17.1694070571016; Thu, 07
 Sep 2023 00:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com> <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
 <ZPgl4eLYTyDFXiyC@shikoro>
In-Reply-To: <ZPgl4eLYTyDFXiyC@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 09:09:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3Ka9fh6fmyYj7j5xdm3LEYsMjgXDk90be3AC7gDFozA@mail.gmail.com>
Message-ID: <CAMuHMdV3Ka9fh6fmyYj7j5xdm3LEYsMjgXDk90be3AC7gDFozA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Hi Wolfram,

On Thu, Sep 7, 2023 at 7:39 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
> > >     rcar_i2c_write(priv, ICMCR, MDBS);
> > >     rcar_i2c_write(priv, ICMSR, 0);
> > >     /* start clock */
> > > -   rcar_i2c_write(priv, ICCCR, priv->icccr);
> > > +   if (priv->flags & ID_P_FMPLUS) {
> > > +           rcar_i2c_write(priv, ICCCR, 0);
> > > +           rcar_i2c_write(priv, ICMPR, priv->clock_val);
> > > +           rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> > > +           rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> > > +           rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
> > > +   } else {
> > > +           rcar_i2c_write(priv, ICCCR, priv->clock_val);
> > > +           if (priv->devtype >= I2C_RCAR_GEN3)
> > > +                   rcar_i2c_write(priv, ICCCR2, 0);
> >
> > is this last bit part of the FM+ enabling or is it part of the
> > GEN4 support?
>
> It is "disabling FM+" for lower speeds. Since we never used ICCCR2
> before FM+, we need to make sure it is cleared properly.

This may become clearer if you first introduce support for ICCCR2
on R-Car Gen3 and later, to improve i2c rate accuracy, and add
support for FM+ in a separate patch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
