Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5383943E7
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbhE1OQs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:16:48 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:41638 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhE1OQs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 10:16:48 -0400
Received: by mail-ua1-f41.google.com with SMTP id g34so2203418uah.8;
        Fri, 28 May 2021 07:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qBo7OeIX4Ym22FQ+QNowtCfIZyHTAuCXsUMFxid9Jlw=;
        b=sVQyOeJ7UVTJM8YpFfJf/ld0wI87HPT5M5P2LTNxCVvOYD2ac8M1dEBc2pzggMm0RU
         tYaDZju7bS3sRmAFleKgKJapsz+UOWm7EhJmxSI2sTsTREcsCdnJGvidvIIZRf4ejFo0
         CTYnL26CcTHMAUTaKDIPRYRPTVpfSqCPdPhkvao/ScbLH0oGTZ59bw7mWWIbIYX6alqd
         eRzslY8JUOhOe38EuCEfEOuvKqxP7nkrSYHLAsTlItfT1dr851LjdvxjfvQolcw1QKHe
         7/UFOh8WyjlIn8BgTzVNU/UrYAl975/BaGck8U+xl0H8T9HL7qSbacFSZrZaMXi/Efxc
         c7aQ==
X-Gm-Message-State: AOAM531NRgWv9rUvN0vCmeDQyJK1UYzrSg3U7zyQbuGkjnt4JYoZb/Qs
        hT7NvtKuthANZYmtd1avjKHkUtCMO0LXyjjgJ4c=
X-Google-Smtp-Source: ABdhPJzivupCL8G870iZ6lPRvpqaM8xb7SKT8hcQYpeOkiuVxE6lfutGg2ALVN95bnJJ4xuriujHuU3lcW2PODdIYaE=
X-Received: by 2002:ab0:284a:: with SMTP id c10mr3352249uaq.106.1622211310248;
 Fri, 28 May 2021 07:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138454.git.geert+renesas@glider.be> <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
 <20210505073327.GE1009@ninjato> <CAMuHMdX3jw_Cm4hrg4QLr5H45nydmdbJzd7Rd-HY-rncOoKxvQ@mail.gmail.com>
 <YLD1dCO8O6uZppEV@kunai>
In-Reply-To: <YLD1dCO8O6uZppEV@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 May 2021 16:14:58 +0200
Message-ID: <CAMuHMdWsX=jaZVpbMeFp0kgKppbTyE9RwUX7oWNabcP3m9EQbA@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, May 28, 2021 at 3:51 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > In addition, Wolfram tried transmitting something on R-Car H2 from
> > the U-Boot prompt, and noticed the ICINT.ADTE bit is set afterwards,
> > indicating success.
>
> Note that I tested this basic test on E2 as well.
>
> > As the Linux (or other OS?) i2c driver doesn't use automatic
> > transmission, and it's very unlikely it ever will (anyone with a
> > use case?), I'm inclined to simplify, and declare all IIC instances
> > compatible with the generic version.
> > If we ever want to implement support for automatic transmission,
> > we can still differentiate by the SoC-specific compatible values,
> > as they are present anyway, and may have to resort to checking
> > e.g. instance base addresses anyway.
> >
> > Thoughts? Thanks!
>
> I agree. So, if nobody speaks up in the next days, I will apply this
> patch as is.

Actually I'm more inclined to drop the special handling for the compatible
values in the fourth set of items.  I.e. move them to the second and third
set, and update the DTS files....

> Thanks for your investigating!

You're welcome.
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
