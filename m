Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E929F711068
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbjEYQHI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 25 May 2023 12:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240242AbjEYQHE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:07:04 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015711BB;
        Thu, 25 May 2023 09:07:00 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56190515833so10791047b3.0;
        Thu, 25 May 2023 09:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030820; x=1687622820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks8ki8suO9WOT8NQ14GPKicaRZdGwBVr6CRJN8aj+AI=;
        b=VJIxwJ7oaJkyocJgg7jrt5U5RE7kRrcVVyCvPtND4Nc0Ldiyk7BsuI3qK3LgZ9Xmk6
         b6tJ2NWelEQsVyVOePSmd++3ZOKOeBXDaOpDpAr9mrP4kdqP6o+0vY/w29nZ9Zr8FDmy
         Qk10IgMjHFKDoZezR/VwhqQgHI5WqmlpEnxxJDHGqcq3gr3JzVGgwRCnburGgkrzTlgJ
         erXsYja90RHCHs/vESAb1/nJXQV711l4FLf6PZn3ijaKCeKWhSogO+Qbq/KqI3O+ABuQ
         bQkJoINa2qvrxm4aLujpQWkz3+0OkQvWQf4WRwGJxVxBw0igHRPwti3ynlbxB/gKZCGX
         4KXw==
X-Gm-Message-State: AC+VfDye3wLmHlRZdEToGl5dND7oTf97NIK9914uIFIrimJQz73Vg1wQ
        CobLR8NqqoRbOC7Ly3EYsXFCVfj4JV8rXA==
X-Google-Smtp-Source: ACHHUZ7V/P7k0SwKSMXIi1iHzBsVJoS3S5pZz9Aq2fsKsRhxP/kAOPH5qUGAwCZI1pswQxcU0SQ2zg==
X-Received: by 2002:a81:8303:0:b0:565:9874:ff6a with SMTP id t3-20020a818303000000b005659874ff6amr119817ywf.7.1685030819887;
        Thu, 25 May 2023 09:06:59 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id x126-20020a0dd584000000b00565271801b6sm479302ywd.59.2023.05.25.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 09:06:59 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-561b7729a12so10589367b3.1;
        Thu, 25 May 2023 09:06:58 -0700 (PDT)
X-Received: by 2002:a0d:df82:0:b0:559:d19a:37ee with SMTP id
 i124-20020a0ddf82000000b00559d19a37eemr18122ywe.15.1685030818706; Thu, 25 May
 2023 09:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com> <20230525135108.240651-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230525135108.240651-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 18:06:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMPnXiHk2CYPEnoVKFnN5jF1W3efdwVJAoOrF1TB56+A@mail.gmail.com>
Message-ID: <CAMuHMdVMPnXiHk2CYPEnoVKFnN5jF1W3efdwVJAoOrF1TB56+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: rzv2m: Rename macro names in all uppercase
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Thu, May 25, 2023 at 3:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Normally we'd put macro names in all uppercase.
> Rename bit_setl->BIT_SETL and bit_clrl->BIT_CLRL.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rzv2m.c
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -50,8 +50,8 @@
>  #define IICB0MDSC      BIT(7)          /* Bus Mode */
>  #define IICB0SLSE      BIT(1)          /* Start condition output */
>
> -#define bit_setl(addr, val)            writel(readl(addr) | (val), (addr))
> -#define bit_clrl(addr, val)            writel(readl(addr) & ~(val), (addr))
> +#define BIT_SETL(addr, val)            writel(readl(addr) | (val), (addr))
> +#define BIT_CLRL(addr, val)            writel(readl(addr) & ~(val), (addr))

I'd rather change them to static inline functions instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
