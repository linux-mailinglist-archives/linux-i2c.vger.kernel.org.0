Return-Path: <linux-i2c+bounces-8553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953249F3C6F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 22:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2B81643BC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 21:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487571DD0F2;
	Mon, 16 Dec 2024 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0Lkw7tg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B01DD87D;
	Mon, 16 Dec 2024 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383048; cv=none; b=QBzxzGo1KE12CZVia3iQdWN5JpTpFdYnSpGGcYnHEvUYpR3+hpCZy0TBRMTNBds4op/aM+MfECEDd4oX8wTzGOtjHsx4TDC8GQchuqVnrpgW9Tv3UBaMXka9tvJJa/72nX5SAMpGqBzTpiTs9Q9tRGZUaRLn5g3fmWCBnItt61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383048; c=relaxed/simple;
	bh=dvTzohMiD7GUz6DzyJw0JoLjPgfIBuHE4olZyULcQ+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcOh/DuLgfE8/wRvCoDVGHncrpeyabm+SpY2QrnTU8k0asbNICSFmK9er7xt26cIXTg+SNQFPuqFv8fxExA/Nuj45jndJFzidr1g4w49jcQ3PEj7QCZJL9GJuUoC2PwLD0ncbNzQO5JHSgrkoTGN5c2SIfbtvh91OiDvziFxhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0Lkw7tg; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c559ed230so813911241.0;
        Mon, 16 Dec 2024 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734383045; x=1734987845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HvQ4GLhmwe6KpEk8y705jR0aQYVEU3Rm32oAPC7Vuc=;
        b=O0Lkw7tgtx7ZtTwUE+D/01Z8gFTNNP7Hs0deUILvG3d45myj+4Q6Ihx2qfBFEF+rV4
         poRL+nNDO7GlfQvgTX8VTtgKqYuvBGNiLzA+PrQ8Djr/pognLevdeznbtTJ/qnhtQoSg
         8MBPNGNUUUs7wXiuEaDybqG9Nwrd4QPK5mIWPpavMNuzH2W/W7OqDIjQiLS5w8HpjxoK
         66ll39CyNuDU8be9m2xLVuy2imUcKI7el/4ikb3MokPeVZv1QL3i6t0kDzTASf5d6zd9
         CPh66dSgDZEDczz6DKqRPFRoL7KX+KyiykhqQ/2AqrX6em7mEFl2YdT5FxLeQC6rGDdk
         lnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383045; x=1734987845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HvQ4GLhmwe6KpEk8y705jR0aQYVEU3Rm32oAPC7Vuc=;
        b=PXHapTMPc2BFsqs26HikhcMP//HPewoKvTtfeSpuQkO/YPaviCO16Pz7Ef44My9JZG
         KJeQuVkBJTYTvUFl9CTI6kdXi4Nd+cknYUP6y3axPotF1H606NF/IfjjbMwD+KrIj718
         wHYhNk+kcXROpPfhPfblVUI9KHnR6ysxPeUKAlpW4Uu2H4Aqd759ePHTpOOLSUjoaLKN
         CN2EJCeNteZgGscEro+B9f0RYjB3DjxbZ52YNJY/iGN3pjvBeGDL4tPUy2SEId8/KYCz
         xYImyOtZXMoZq4IzEwpCQXpbX7rtx8r+NgaLgTV2hQr8Y4Wk5afMVRalb5m991v3qrdK
         30wg==
X-Forwarded-Encrypted: i=1; AJvYcCUSiwbM9rPZvZ9EqeSpk+zRl9lF2vIOX5g6ZEuxsUoHtuK1poEbNlRsBT3wI6xOrwGpqm6bUCJ1Plw=@vger.kernel.org, AJvYcCV3rpTSau8Galr8lrVV2e8PtwK2USmLy4JcX/nFhAUT/7Jxw+79KzyCrjwn4DjKejdenw95fxAGbLukRwew@vger.kernel.org, AJvYcCVJFxS2dfuP+78uBjYooioBpMf+L1f5Xfl06KS9KtSqruvmp2H//C6rDa+yM39VTc5Hr7wzNEo1uHOM8InYITQyUA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8Yq2A6NyygV5O+Dn10XElqfLLr/DS+FTmrgTcVFn6tuzm+MP
	3/3dDn2HSMcOjtg/Ohw+xzlqW9oC35XeznPDYp1Gh77d1CwmgTAvbPB739QvXDwhWibTgl+gnfG
	jGVFUE+bbz0C30NmR93RbxUQ6/MA=
X-Gm-Gg: ASbGnctiAGJ9ERTsDwKGaXOivdXFAAQYyEB3ayxpe5jsp3ZjuiZittflggAgrKvkxrS
	rp7by2eLtqLtKA3OW2wzexcGqLrbCiRrILoxX2Q==
X-Google-Smtp-Source: AGHT+IEtGNUuLwgR3bxeWohisHij0p4RhAszHNLPYak5i8Hura98Y4YldNWpMkO6ab5mIvf9sOhum11sOxfZ6CiLx38=
X-Received: by 2002:a05:6122:3d0a:b0:518:8bfe:d5f0 with SMTP id
 71dfb90a1353d-51a2404e693mr2060412e0c.0.1734383045239; Mon, 16 Dec 2024
 13:04:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com>
 <CA+V-a8sAiMTC9Y3vrOKshMZSFLzN0QczMk9B-++LyToG1r+qzw@mail.gmail.com> <CAMuHMdXOaphnU=caTuCx3yme_hi-_zdn5PN5P1zhrOSA3duBWg@mail.gmail.com>
In-Reply-To: <CAMuHMdXOaphnU=caTuCx3yme_hi-_zdn5PN5P1zhrOSA3duBWg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 21:03:39 +0000
Message-ID: <CA+V-a8ttbsoo2GfNRA3jcZGnMc627kqxVmkqgCXeCzr1SKbcaQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Dec 16, 2024 at 7:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 16, 2024 at 7:19=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Dec 16, 2024 at 4:09=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Introduce a new `riic_bus_barrier()` function to verify bus availab=
ility
> > > > before initiating an I2C transfer. This function enhances the bus
> > > > arbitration check by ensuring that the SDA and SCL lines are not he=
ld low,
> > > > in addition to checking the BBSY flag using `readb_poll_timeout()`.
> > > >
> > > > Previously, only the BBSY flag was checked to determine bus availab=
ility.
> > > > However, it is possible for the SDA line to remain low even when BB=
SY =3D 0.
> > > > This new implementation performs an additional check on the SDA and=
 SCL
> > > > lines to avoid potential bus contention issues.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/i2c/busses/i2c-riic.c
> > > > +++ b/drivers/i2c/busses/i2c-riic.c
> > >
> > > > @@ -135,6 +138,27 @@ static inline void riic_clear_set_bit(struct r=
iic_dev *riic, u8 clear, u8 set, u
> > > >         riic_writeb(riic, (riic_readb(riic, reg) & ~clear) | set, r=
eg);
> > > >  }
> > > >
> > > > +static int riic_bus_barrier(struct riic_dev *riic)
> > > > +{
> > > > +       int ret;
> > > > +       u8 val;
> > > > +
> > > > +       /*
> > > > +        * The SDA line can still be low even when BBSY =3D 0. Ther=
efore, after checking
> > > > +        * the BBSY flag, also verify that the SDA and SCL lines ar=
e not being held low.
> > > > +        */
> > > > +       ret =3D readb_poll_timeout(riic->base + riic->info->regs[RI=
IC_ICCR2], val,
> > > > +                                !(val & ICCR2_BBSY), 10, riic->ada=
pter.timeout);
> > > > +       if (ret)
> > > > +               return -EBUSY;
> > > > +
> > > > +       if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
> > > > +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
> > >
> > > Surely you can read the register once, and check both bits?
> > >
> > Agreed, I will add a helper func for this something like below, as
> > this can be re-used in patch 9/9
> >
> > static inline bool riic_lines_ok(struct riic_dev *riic)
> > {
> >     u8 reg =3D riic_readb(riic, RIIC_ICCR1);
> >
> >     if (!(reg & ICCR1_SDAI) || !(reg & ICCR1_SCLI))
> >         return false;
> >
> >     return true;
> > }
>
> A helper might be overkill...
>
>     if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
>         ICCR1_SDAI | ICCR1_SCLI)
>             ...
>
Ok, I'll update as suggested above.

Cheers,
Prabhakar

