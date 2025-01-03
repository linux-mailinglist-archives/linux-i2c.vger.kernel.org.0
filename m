Return-Path: <linux-i2c+bounces-8901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB85A00BDE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 17:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3F83A3FC3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 16:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72D81FBC82;
	Fri,  3 Jan 2025 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc/I0t1f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098801C9DF0;
	Fri,  3 Jan 2025 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735920798; cv=none; b=k7EfVoEfwTInFT3ZpNNfwXjllkY1YRCqgP5vpPBu1iarsPSwa45enO7tVon+v1k1YN4p1r/JxAa2gHLBo//J4WV6gkRG4k2EDtp9TM6qTz/VXqE1xbKZ+sWyM6TbeLdbRnOPVUrbTTqNCifPP8Gpdd/CkR1pumWKjZMwt4xY7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735920798; c=relaxed/simple;
	bh=El6XGKYqwcsa7YnZ5x+QSqtLhBAKLucv8kHFEGNCQ1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/JDORY5cH5oan+gmUsT9iKvBa8jNrlekDoSt+ndT3p/0QkE8zSPwAAn78lJvHkfyir1Ig3dK3R82JfqEb4p3sNAf5YEHHuhP+l3VFiykuhzeB32iFXUiKBTPXutm71Fa8LIb/pZPUMUujK8PkF90NZRarxn6mriGEr2p4/BsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc/I0t1f; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51bb020339fso2369379e0c.0;
        Fri, 03 Jan 2025 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735920796; x=1736525596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBjXWT4a+4J3ezwzSf0GlUiUrphS70oI+ZEtuCaTAIg=;
        b=Oc/I0t1fLkuzPSlzZpV7sSvLCZ8w9mVPs60wMUt8lLzTZDe+0Uff1ApxyPPcxfunr0
         /9Gu6KAoPe89tpgWW2cuwgG7ANbdiM6VD4hH5N+NX0nus2tJZdyS8LM9nIwt7R/4dwTB
         KCaui/mi0RviiZdP437+Ud4HGdPmtdPCGQEoIIgaUWJqOi5mlgjf0A/rANsoj8Dxdiei
         wrYNLV0qN96weJOD4XnJz+YQwYzCYOf4Zpxnkupws5CIejt1oiN3gqgk5KxrTsq4qpcu
         X/ggva9WduSx/2lflCBZiEvHbNtclmsmq5Q+U58fiz8EE9GIw5I+UNd/7YM7Vso+DFAT
         qlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735920796; x=1736525596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBjXWT4a+4J3ezwzSf0GlUiUrphS70oI+ZEtuCaTAIg=;
        b=snQQSatAGwLBmsMna/EMDiylw9Fv71Lpp2KwHVotMb8XuJ2/GwseayEhP7ko1+fNYk
         qh8w80K4FHHiV+pd2Bqws1QE8HMamd6ThOMfNIUXCv/kDjFVxi6yYogOQTc7GYDXHvLV
         P7Xsg1qlyJ4B6coNCBEjdbGq8bSxocbn3aWN4+8+ZvqhQOveQmoAmxAUXNlNdfaEahwW
         kOlDte88QRVEfrMzl8mKf2TWmRYQKgpRUXgm3+2zbBYP1erKgiBERpfd62wJrufsxcvD
         2oUt0GaAK84HxnynywqbMdrBpoPUcmSY8hrsEPVedEePimyG3qbprgU2xMjzR7zcwVrJ
         c3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYWvRhzSwYu49LFdBckBe6hFySwmkuHFS4AtNeLeHO5GyE0mbQLS3QYO5W0ZehrvhZ7n57sq4mXKi6d2G@vger.kernel.org, AJvYcCW6FrK16K0JzYaxk52oBaCrvqmnWHRbpPfi3onXxAwolL/AShNBr4tHhWJcV1hHHgd24yp4OYRxYED5skFBn3ku1fk=@vger.kernel.org, AJvYcCXSImAWsLqGTtxT/D4Z9dtpeJwjoFG400h9GaBAN4ZbpHmEBj5Kug/i7R7V/Tq96gr1JyLfj5XGCWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6NTzUTL8McOydPaNpYIiPPbYi9Z4oJOffQLoJ75jeFM5tIX4w
	TZF+5+QrgPGxNB0UwUS6DmRvutEFIYFjSmiVr8bgqnf6PXKL/WoE7h+cXdwD2rAGTauDfGRBATK
	ujKgW6LAN/eSkDiq0lnpjLi/XXaA=
X-Gm-Gg: ASbGncv+kcz4wh3xmpCI0Zgxwb8fnWzNQjVVz2IWy+G/6QKqCn2oo7zrdY3oyDC7+y3
	g/n50ckI+fqMOIbqU4J3Z8zV4UftAboSvLAR5Efw=
X-Google-Smtp-Source: AGHT+IF3ayhM58iUSbyHeENHny4/6p7l/Z58J92zIcF63QOath3D6wd2TYWuROL6vqVvJ04I7VH4lAJrrFyIRjWIYuU=
X-Received: by 2002:a05:6122:4302:b0:518:a0ee:e8e7 with SMTP id
 71dfb90a1353d-51b75abac1bmr34666299e0c.0.1735920794303; Fri, 03 Jan 2025
 08:13:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV-1j0aN9Ko3oUnRZ363wiy84ZVDoV4ZsS4xTLn+u3tKw@mail.gmail.com>
In-Reply-To: <CAMuHMdV-1j0aN9Ko3oUnRZ363wiy84ZVDoV4ZsS4xTLn+u3tKw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 3 Jan 2025 16:12:48 +0000
Message-ID: <CA+V-a8sq918O+iwxNnfG2g6JPrWyCvpetzD149u48_Scbbct6A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jan 3, 2025 at 4:09=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jan 3, 2025 at 10:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce a new `riic_bus_barrier()` function to verify bus availabilit=
y
> > before initiating an I2C transfer. This function enhances the bus
> > arbitration check by ensuring that the SDA and SCL lines are not held l=
ow,
> > in addition to checking the BBSY flag using `readb_poll_timeout()`.
> >
> > Previously, only the BBSY flag was checked to determine bus availabilit=
y.
> > However, it is possible for the SDA line to remain low even when BBSY =
=3D 0.
> > This new implementation performs an additional check on the SDA and SCL
> > lines to avoid potential bus contention issues.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > v3->v4
> > - Propogated error code when readb_poll_timeout() failed
> > - I've kept the RB/TB tags as the changes were minimal.
>
> OK.
>
> + you removed a superfluous initialization of riic->err (last change belo=
w).
>
This change  was requested by Wolfram on v2.

[0] https://lore.kernel.org/all/Z2XhI4L9nzUqa22Z@ninjato/

Cheers,
Prabhakar

> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -149,13 +173,11 @@ static int riic_xfer(struct i2c_adapter *adap, st=
ruct i2c_msg msgs[], int num)
> >         if (ret)
> >                 return ret;
> >
> > -       if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
> > -               riic->err =3D -EBUSY;
> > +       riic->err =3D riic_bus_barrier(riic);
> > +       if (riic->err)
> >                 goto out;
> > -       }
> >
> >         reinit_completion(&riic->msg_done);
> > -       riic->err =3D 0;
> >
> >         riic_writeb(riic, 0, RIIC_ICSR2);
> >
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

