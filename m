Return-Path: <linux-i2c+bounces-4880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59D92E15B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7987128188B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DF148847;
	Thu, 11 Jul 2024 07:54:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB4014B943;
	Thu, 11 Jul 2024 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684441; cv=none; b=FhrojNOldj1AHV1veNQkQXXIYOdM2zjC3l/rxHl4LHjO9xTJGNllV31aQwWn7WlV7WDhn9CUJkDE9x1S7tCaWl819Lb6LQswQJQV5vogGPVSTRMoMPX0L804iFfFUv5PetHyGesSyLfrLG0r3yH26MScIrI13SrE+scHOorcMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684441; c=relaxed/simple;
	bh=0BgnDHiX/TK+JQoHQMsUy+eteShtWavkLMpjkahy91M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JayWjUhQDYYEJGCFY4tH2VxIl8dePcVqMy0NhWgwQsa2hru0kzhgbgYcK6zSfPpfZPIGD3XY9cU/M5WEEF69v1HdXMYfOVkbA8jCU8I3wMuQBcmhtCBpSPuESE8mx5lnNOg43sFvZuauCZ6oVS7noUC0j42B4I1IJSxmRPs6MmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-650b8e0a6ceso5874147b3.3;
        Thu, 11 Jul 2024 00:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720684438; x=1721289238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fRVbJjcNb5I05e6Xfep3Il3HTd1wTS3dEeZLYGEQtM=;
        b=PHJazHFGAmjv8X4bkxbaxB44Cf7U0Ug2b5psUq5CJGn5i0U0CLxDGz8F5jjQU9QCV4
         17RhVbblJNQVQlJIRArMzHv3oKlscj9Ue4B2SFZz1PIXZS4kgh3z7LfALD+1lZocL/8K
         EAwHQA87fnqgR10yq2Ru06sm7qjQEKUkk0DuFG23Do/c4XLBmLw6jC2XIdivyLqeJLr1
         55oMzKoSbmiEO9q/ewEHnWvyyrJPyi2JYGR1HvBFz3VKkYFCLWP87yzklgdNqmdPbg5I
         drriOOcReUTkJklqDrvv9j6E6k6iVEjSS5o4QA39JwgRSknZZ+jq4ki7D0bM/v7u1mWH
         1DKw==
X-Forwarded-Encrypted: i=1; AJvYcCXDBMQYnO30WcFt0oqS5+NBuTIGoSB2HEVDciE2KtRgLUWF0zFTXEvoHOSXGuBbpblt/qcJlY9wsTVHGyvaU4Odt6C3fg4nRCHrXFfKXwSbFcH3G1aZCPGurxZq74xrH3PRnTEmJyrWr0f6X68e0MRQCbV9kW6YpsNVI3FykAQD4fRWov6yxohpMY3w/k5ZfDkKdPpIZn2oEsirL+t8kAJFzMdM1MtXVB//9NgkDrS9K868Rv7sxc2oKp5vF9CqEkAT
X-Gm-Message-State: AOJu0YwSBnf3ov5Q802WsxFshwxxwxPp8CszsF+U6AUN4yZbH5vOdL9S
	ev2P16PvMe6h9rlPOSj+rwZWWdpp50u9SMzb+Flz/F0qzbRs3HNAG6u0EXfi
X-Google-Smtp-Source: AGHT+IEAVEVDvRPumjsbsdvUEKBWr+nCV0eoncFS6xMhbJf5JHh93sDmEHKqPscdEqfNwYteTbffWg==
X-Received: by 2002:a25:6801:0:b0:e05:6d47:57a4 with SMTP id 3f1490d57ef6-e056d475973mr3452925276.10.1720684437720;
        Thu, 11 Jul 2024 00:53:57 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a8acf85sm925002276.9.2024.07.11.00.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 00:53:56 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64789495923so5634487b3.0;
        Thu, 11 Jul 2024 00:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4AQsv5jhWFuUQz0NAtfh4lw8g73dBZSHrV+2Jm5LEAFZta8ZV8wHZmu8OQpncIPgolXa65Dm91ZogINUS+8oBOSrfVVVC2FDeHGlbtTS4n85KK7/Tpv1WIPc5sO/3t7J1RUauL419dilUXE3zCfYrYa+78/2B6FkRUCIk1ofQ6LIXLmFLKwvn7x+mokD9Z2WTA/+qjwHZ2PrNpgTDLwkQ1ez7mskWCQ54pAkrunEGcxmjbkpACdSo6tMQDIJ7KYQe
X-Received: by 2002:a81:8d49:0:b0:63b:df6e:3f6d with SMTP id
 00721157ae682-658f02f3720mr78529147b3.37.1720684436126; Thu, 11 Jul 2024
 00:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX4hWou9OtdE8XgU7-U0ghJ6vk2kVqgT90U0ZjsxzR5DA@mail.gmail.com> <22db23bd-5872-49a0-990f-2a0e5f51bfb5@tuxon.dev>
In-Reply-To: <22db23bd-5872-49a0-990f-2a0e5f51bfb5@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 09:53:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTYfK6aVi5BzBtQg_zQWjuZX7d7QHr3a4GAb+dQOWyvQ@mail.gmail.com>
Message-ID: <CAMuHMdWTYfK6aVi5BzBtQg_zQWjuZX7d7QHr3a4GAb+dQOWyvQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Jul 10, 2024 at 4:20=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 28.06.2024 12:22, Geert Uytterhoeven wrote:
> > On Tue, Jun 25, 2024 at 2:14=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Fast mode plus is available on most of the IP variants that RIIC drive=
r
> >> is working with. The exception is (according to HW manuals of the SoCs
> >> where this IP is available) the Renesas RZ/A1H. For this, patch
> >> introduces the struct riic_of_data::fast_mode_plus.
> >>
> >> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
> >> instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
> >> fast mode plus capable devices (and the i2c clock frequency was checke=
d on
> >> RZ/G3S).
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/i2c/busses/i2c-riic.c
> >> +++ b/drivers/i2c/busses/i2c-riic.c
> >> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
> >>         riic_writeb(riic, 0, RIIC_ICSER);
> >>         riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
> >>
> >> +       if (info->fast_mode_plus && t->bus_freq_hz =3D=3D I2C_MAX_FAST=
_MODE_PLUS_FREQ)
> >> +               riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
> >
> > Unless FM+ is specified, RIIC_ICFER is never written to.
> > Probably the register should always be initialized, also to make sure
> > the FMPE bit is cleared when it was set by the boot loader, but FM+
> > is not to be used.
>
> Instead of clearing only this bit, what do you think about using
> reset_control_reset() instead of reset_control_deassert() in riic_i2c_pro=
be()?
>
> HW manuals for all the devices listed in
> Documentation/devicetree/bindings/i2c/renesas,riic.yaml specifies that
> ICFER_FMPE register is initialized with a default value by reset. All the
> other registers are initialized with default values at reset (according t=
o
> HW manuals). I've checked it on RZ/G3S and it behaves like this.

RZ/A1 and RZ/A2M do not have reset controller support yet, so calling
reset_control_reset() is a no-op on these SoCs.

However, I overlooked that riic_init_hw() does an internal reset first
by setting the ICCR1_IICRST bit in RIIC_ICCR1.
Is that sufficient to reset the FMPE bit?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

