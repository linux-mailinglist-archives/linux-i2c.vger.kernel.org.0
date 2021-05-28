Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB1B394431
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhE1O10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:27:26 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:40953 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhE1O10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 10:27:26 -0400
Received: by mail-ua1-f45.google.com with SMTP id j2so2215974uak.7;
        Fri, 28 May 2021 07:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6AUYDbxGcKMjp7sXFSR6vCeNgCP0VTfXlRJ7azZ9Yc=;
        b=R2xcStw61XH0kP+f1L+YbumTSxfdw0Y1Kiv2kbOlPGYxeF2DebbxmV6Bg6IcUJD06d
         x5gDb19eP8dbfa8cYl1fJDB0/HMygX1uORXXZnQ2vdZz+su3jpEzvgXhiVgKmG4oNXIR
         Aa+NhpHH9u1Piitsp/fVrDeSbUhp5bRYn4zzXaN22zYfY8QVxq8Y8BnMtxUP9e1fJZPK
         96yYZvFB0DU0xV+fr9crArtjLYWjjEKK3i8JbJl0QyCSR0+KLzgxSHV7/NYa7e08vLRH
         7YkrQfK0AlTmh1WWJesh28Frj9TWKfwCnted66MQlfPH5YMYwQvNVqCvKKVtmM0WmN8F
         oxnA==
X-Gm-Message-State: AOAM530ZJWlX620qm39tCxrvr/IN1pQ0KtXJQqdUPkU0xfkySLXlSZvo
        toT8DmoacGNucE6k8pLfsIUeu/a6hkb8oZUB9WZbdyJcwG8=
X-Google-Smtp-Source: ABdhPJzzA0Dh9P7rJswZkR6by0dwxYDrLbI36caf2MZ4Fa1d7tKltSdC+IF8drbLGdzZ03soNoXAFaGO2MFG1a8O4s4=
X-Received: by 2002:ab0:2242:: with SMTP id z2mr3111908uan.58.1622211951116;
 Fri, 28 May 2021 07:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210528111049.1804800-1-geert@linux-m68k.org> <YLD5N1OMXFg3yHp9@kunai>
In-Reply-To: <YLD5N1OMXFg3yHp9@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 May 2021 16:25:39 +0200
Message-ID: <CAMuHMdXKtbp3zVO6OY3NugVA3wUQjmvy5rLKJPrTjOuYS2wMOg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mux: Remove reset-active-low from
 ssd1307fb examples
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Maxime Ripard <mripard@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, May 28, 2021 at 4:07 PM Wolfram Sang <wsa@kernel.org> wrote:
> On Fri, May 28, 2021 at 01:10:49PM +0200, Geert Uytterhoeven wrote:
> > The "reset-active-low" property was removed from the ssd1307fb bindings
> > in commit 519b4dba586198ee ("fbdev: ssd1307fb: Remove reset-active-low
> > from the DT binding document") and from the ssd1307fb binding examples
> > in commit 7d7e58d30e046d34 ("dt-bindings: display: ssd1307fb: Remove
> > reset-active-low from examples").
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Now we have a conflict with this series from Rob: "[PATCH v2 0/6]
> dt-bindings: Convert mux bindings to schema"

Sorry, I had checked that my patch applies to today's linux-next,
and wasn't aware of Rob's series.

> My suggestion would be that Rob adds this on top of his series?
> Or he provides an immutable branch for me, so I can apply this patch on
> top then?

Alternatively, can you just drop the second chunk?

> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> > @@ -62,7 +62,6 @@ Example:
> >                               reg = <0x3c>;
> >                               pwms = <&pwm 4 3000>;
> >                               reset-gpios = <&gpio2 7 1>;
> > -                             reset-active-low;
> >                       };
> >               };

This one is still valid.

> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> > @@ -80,7 +80,6 @@ Example:
> >                               reg = <0x3c>;
> >                               pwms = <&pwm 4 3000>;
> >                               reset-gpios = <&gpio2 7 1>;
> > -                             reset-active-low;
> >                       };
> >               };

This one no longer is, as Rob dropped the example during the conversion.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
