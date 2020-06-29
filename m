Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3B320DF98
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 23:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgF2UiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731761AbgF2TOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:14:20 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CADC0076FD;
        Mon, 29 Jun 2020 04:28:28 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id k15so15087679otp.8;
        Mon, 29 Jun 2020 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUOFgBAon7H8BmxSht9yRn787q41Dfxrba2uWvIKf7I=;
        b=MgY4TeM2oqnGohr5MJ5PTJrL55M+EPq4g50K7MF1dlzWzUNfVGXbm5A0PPNhYJSTI5
         tLrVHP7kf39x0KjSFXEgE3GU2voDMasc4C01HfHbw70RW1cylfHTdaXKweQ6KE2mNfqe
         lUn2f0PjUiGr4hHWvzPXElKzjOo7E+eXs/BUvLYhuu0IdhLaofUg0X2yF4H/vXRpgPQw
         O+oZ+GZGzi3JTxyu2GbVw1aRECUQ1jqqAYuF7jWgdxQSqJ2kIUjgiaAu554qYW+eUc2+
         NJblX8QL3rRgFIaOT34k18MiRfYFId2mLxl4hBdzsxc/PgTISVnpS0eAnFIELpoEi7DE
         /TAg==
X-Gm-Message-State: AOAM533vGMIu03KnsmwbrM51MnGdMpkNhrSF1v2x2dRPuVHvD1q0TxTv
        /w494MiDzjY6V6SUYEqeW4iYzHsVmIORP3NiXDP4xtq+
X-Google-Smtp-Source: ABdhPJw3YbqisB0rK2AsRQEp7Js/wTXayWafaNgtmPHh6jn6+bGHRcepv+OetrHOKKSuy2xQds4VqBIN958wXwmsnB8=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr12059234otb.107.1593430107969;
 Mon, 29 Jun 2020 04:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXFgR__hnUO-o+2ukxOYc_6U63wjP1PJyip3KGg277gDA@mail.gmail.com> <20200629112119.GA1932@ninjato>
In-Reply-To: <20200629112119.GA1932@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 13:28:16 +0200
Message-ID: <CAMuHMdXaXxDJ_bgR=wLnyCjmfH0kC-SuVBPRZv96qzKbvbWsHQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 29, 2020 at 1:21 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > >  config I2C_SLAVE
> > >         bool "I2C slave support"
> > >
> >
> > Why the blank line here ^^^?
>
> Sure, I can fix before applying.
>
> >
> > > +       help
> > > +         This enables Linux to act as an I2C slave device. Note that your I2C
> > > +         bus master driver also needs to support this functionality. Please
> > > +         read Documentation/i2c/slave-interface.rst for further details.
> > > +
> > >  if I2C_SLAVE
> > >
> > >  config I2C_SLAVE_EEPROM
> >
> > The rest looks fine to me.
>
> Thanks, Geert!
>
> > As you don't like conditional R-b's, I'll add mine on v2 ;-)
>
> I don't? I can't recall that :) Maybe there was a corner case once...

Lore does not forgive, and does not forget ;-)
https://lore.kernel.org/r/20190802133656.GA23542@kunai

Hence with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
