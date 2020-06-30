Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FDB20FD3E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 21:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgF3T6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 15:58:49 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45714 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbgF3T6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 15:58:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id j11so15851032oiw.12;
        Tue, 30 Jun 2020 12:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8P84lbXdopf9xm3H9H/4Fl7/z4QR1K2/q+QCfjbLtU=;
        b=MtLNHjA/27gNHCHMA9rAvxykdXYP7y/ijshd+U5MK6rnyyJvcGrA0P4/w4I5VkR+DT
         Z6y80E0v5h0vqk1W4vrGW9ri9jwQ84BglKi8iB908PCJQpZCy7Emt2jABXsQXOqSYodq
         JuNP60KB3zmIPjqegoEer7E+9TJedcVeudvlp/+fF3Hb8F10ai+pYqCgv+XC6/7G3YEY
         Wx8jnB3nCCgijwYSoc9htgKzZFoQBTbNyr8EFnobiiXQDhJWCEMi+p1YB1zxp2+lXKDR
         ohgq1LAeYOvgabrPDBArFL8B6b928hFbTFFA87qZzIBIXwa4vSPCofrTUm/trRJFj1Kr
         +K4A==
X-Gm-Message-State: AOAM5335vf9xDyDlAvdKAdF8FUQNWY6fH6CG008ArQexPFksZjf2XC0v
        hwBefuT/oJJx24xDFARzDxznc2qlD0QagWGQ8GO4QkEn
X-Google-Smtp-Source: ABdhPJxDeKi05m0Q4XZGeUMo+RA5ECKcFS85EPriaIopHaQFEUuvaw4iqh8JHtU1Ok6cVTuTs0Y8AFkeY8Hkc9QpU4g=
X-Received: by 2002:aca:1801:: with SMTP id h1mr12683870oih.148.1593547127392;
 Tue, 30 Jun 2020 12:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150532.2923-1-uli+renesas@fpond.eu> <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <20200625070636.GB970@ninjato> <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
 <20200625151658.GB1041@ninjato> <20200630194528.GB999@ninjato>
In-Reply-To: <20200630194528.GB999@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jun 2020 21:58:36 +0200
Message-ID: <CAMuHMdVmtwhTncN=Vu8=wFX9MhnNDHTG019xN+pL0ahRUHpSzw@mail.gmail.com>
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

On Tue, Jun 30, 2020 at 9:45 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Jun 25, 2020 at 05:16:58PM +0200, Wolfram Sang wrote:
> > I spend some more thoughts on this.
> >
> > > > > In general, pm_runtime_get_sync() is not safe to call from atomic
> > > > > context.
> > > > > For Renesas SoCs, I think both the power and clock domains are safe, as
> > > > > the respective drivers don't sleep.  The PM core might, though.
> > > >
> > > > Still, that sounds to me like we should protect these calls as in V1?
> >
> > I still think we should guard these calls just because it is not safe to
> > call them from atomic contexts.
> >
> > > And talk to the i2c controller while it is disabled?
> >
> > Is there maybe some "always-on" property which we could add to the
> > respective IIC clock?
>
> Ping to this question...

You mean in DT? DT describes hardware, not software policy.

Anyway, won't help on R-Mobile A1, as there's a real power domain.

> > > That does seem to work on R-Car Gen2 (similar to SMP bringup accessing
> > > registers of a disabled WDT?), though.
> >
> > Yes. Uli's patch will not cause a regression because we are already
> > calling i2c_transfer very late. And we do call the runtime_pm functions
> > currently. So, it will improve the situation there.
> >
> > > Needs testing on R-Mobile A1....
> >
> > That's armadillo, right? I don't have that, sadly.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
