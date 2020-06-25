Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C88209B36
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 10:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390496AbgFYISv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 04:18:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32940 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390456AbgFYISv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jun 2020 04:18:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id n6so4516848otl.0;
        Thu, 25 Jun 2020 01:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1WCINvW1NV+KNDRJY46u6W7ForVUuEnLGYaMRoBhEY=;
        b=dzDTwe6UzYCC5h5uYTUnTm0Av62B4gbRzsrzBULdDFmOoYloAQgz+ELF1NPa8Ef2ha
         ldCvul+WB8q+yaTmiv9Q11uso9kINQ9DclY9FnjaUrgk0ktizkfSFGdQRX/F1jA4fyq+
         oXJ2b/A7VaB79XSK6CI0UV4YCJNSJxDaMGVtoUxfYWYthGLX2Fj/wACyxptZjwXohRRt
         CYRpLg3d8NHoX/ABVEd5y5hA6uXoUaalRZc66XbUfglzckVihKG9HuNBgRqU5xdltXLF
         GRkF6JiaO9LKr6nNUDXvNKhaJuAcpE4bJb8KE1hz0BgT5PerLepfnzM7Hsj992mRb9QI
         5LsQ==
X-Gm-Message-State: AOAM530jngCZrGcg0eQM8VbnHDTWKf3FoIanENeOROimw0FImhZBg6Hc
        7aqkzplMhlIeBTRi2CtOxDkND7cQJIS1Ox9mZ/fL8Q==
X-Google-Smtp-Source: ABdhPJyQAflwoRb37MrkQ1wYsa35EXG0LA/GhS+ko6skQzxkAkOL+vYYYMLbw36w9TOfc/0+qsh2eZERxiieQkyDxs8=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr721287otb.107.1593073130107;
 Thu, 25 Jun 2020 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150532.2923-1-uli+renesas@fpond.eu> <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <20200625070636.GB970@ninjato>
In-Reply-To: <20200625070636.GB970@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Jun 2020 10:18:38 +0200
Message-ID: <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Jun 25, 2020 at 9:06 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> ...
>
> > After removing that check, it starts complaining:
> >
> >     BUG: sleeping function called from invalid context at
> > kernel/locking/mutex.c:281
> >     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1, name:
> > systemd-shutdow
> >
> > In general, pm_runtime_get_sync() is not safe to call from atomic
> > context.
> > For Renesas SoCs, I think both the power and clock domains are safe, as
> > the respective drivers don't sleep.  The PM core might, though.
>
> Still, that sounds to me like we should protect these calls as in V1?

And talk to the i2c controller while it is disabled?
That does seem to work on R-Car Gen2 (similar to SMP bringup accessing
registers of a disabled WDT?), though.
Needs testing on R-Mobile A1....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
