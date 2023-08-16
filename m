Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8554A77DBF6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 10:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242818AbjHPISC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 16 Aug 2023 04:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242815AbjHPIRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 04:17:41 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EE5EE;
        Wed, 16 Aug 2023 01:17:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so5962554276.3;
        Wed, 16 Aug 2023 01:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692173859; x=1692778659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESkmRThEK2MchFSExrknLIvAqB3viLgPmFCCHLR0kO8=;
        b=JKh99PyYmpZeyEzht0IWaQyjzt4SUmH7VxROsZIYqJAYXL5vzhucicviTJGUgxL1vv
         y+yUntYPPGwvkTl6Aa6ChA7laCTJY5mk2BWKg08kuSLUlJhRmOjhFzlb9ReqEIaxMMn+
         g4b5LkVwvuwvYihAc4gjW7doYBwBD+/goJcWVLId7vYLIkDhrFFWxjpzNWOot09i2tin
         +jjhCflQZcwh2hY+qamAqch9SdTX6tm9RWZmSE4pTePjfUrXD3Fg1y+G5EPSJQwrbRS0
         c/Yc+fY+mxZV40+8InSceCnJN10SXcSaEY1OPkMXKTI0+8wfCHvQI3bXlU8Jg4wyTOTJ
         r6aQ==
X-Gm-Message-State: AOJu0YzpJO0ZKCwKJ290Xy8ZYwiBEnTmp33FpzHdZ5wVW98JOz0qr+e1
        iB5KWnctHBxBQrqf/MoY8fhRcD3eR3XiTQ==
X-Google-Smtp-Source: AGHT+IH8ju866j1akP8V6M5GO+x71PVC13yCx6JCEg0INx9zZn8cnKzSjVR5R11rjc7aV1GLfYE/KQ==
X-Received: by 2002:a25:cf0e:0:b0:d07:e343:1cf0 with SMTP id f14-20020a25cf0e000000b00d07e3431cf0mr1166730ybg.8.1692173859278;
        Wed, 16 Aug 2023 01:17:39 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id e191-20020a2537c8000000b00d071631665fsm3372319yba.59.2023.08.16.01.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 01:17:38 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so5962538276.3;
        Wed, 16 Aug 2023 01:17:38 -0700 (PDT)
X-Received: by 2002:a25:cc0d:0:b0:d3c:2cb2:f678 with SMTP id
 l13-20020a25cc0d000000b00d3c2cb2f678mr1001926ybf.64.1692173858196; Wed, 16
 Aug 2023 01:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
 <94dd2237-2a4a-fb45-ceb1-f224fafd4e36@ideasonboard.com>
In-Reply-To: <94dd2237-2a4a-fb45-ceb1-f224fafd4e36@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 10:17:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkqQ0v0k4a-JDo+nqC4=t9jRmjFCmo=og64e8hJ4iHmQ@mail.gmail.com>
Message-ID: <CAMuHMdWkqQ0v0k4a-JDo+nqC4=t9jRmjFCmo=og64e8hJ4iHmQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: Make I2C_ATR invisible
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Aug 15, 2023 at 6:00 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/08/2023 18:29, Geert Uytterhoeven wrote:
> > I2C Address Translator (ATR) support is not a stand-alone driver, but a
> > library.  All of its users select I2C_ATR.  Hence there is no need for
> > the user to enable this symbol manually, except when compile-testing.
> >
> > Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Do we care yet about out-of-tree drivers that need this functionality?
> > ---
> >   drivers/i2c/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> > index c6d1a345ea6d8aee..9388823bb0bb960c 100644
> > --- a/drivers/i2c/Kconfig
> > +++ b/drivers/i2c/Kconfig
> > @@ -72,7 +72,7 @@ config I2C_MUX
> >   source "drivers/i2c/muxes/Kconfig"
> >
> >   config I2C_ATR
> > -     tristate "I2C Address Translator (ATR) support"
> > +     tristate "I2C Address Translator (ATR) support" if COMPILE_TEST
> >       help
> >         Enable support for I2C Address Translator (ATR) chips.
> >
>
> Isn't this normally done with just "tristate", without the text? Is
> there a need to make configs manually selectable when compile-test is
> enabled?

"tristate" without the text would make the symbol invisible, too.
However, then the user has no way to enable it for compile-testing
(unless also enabling one of the symbols that select it, which may
 not be possible due to other dependencies).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
