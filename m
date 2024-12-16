Return-Path: <linux-i2c+bounces-8549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989139F3983
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 20:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4315D188CB1F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E7207DE8;
	Mon, 16 Dec 2024 19:13:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3433206F2D;
	Mon, 16 Dec 2024 19:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376387; cv=none; b=XE55h2eYdjJVDL56uaLTNIYxelTsvapW9bPPcZzzEkphWkvp1GOfUaSZHA6RYKNeUzqNBOhQCUvD9VXEZAjDQKTxuQehDsd8JK3PD4FU6wOPXfluGpqlTyNrodIzky2ttHCCBELwfa1AtQ70KtsPQo/E7+r71unWmpLm/qJREiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376387; c=relaxed/simple;
	bh=02wYEqqVCf18XL+fYMqYuyLpjITDEP3akrjr7yHXmx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X51/9GaMNnPc85xSBjhDy7pOEO/5tBqAxdkUgPfPYNrfmdtTtIgbGeGly/w6nSW9EUU8UhxHFTDqbG7ey9+xCr53rJbHCnhsma56d+gDIZaH/RpnX5UsoTN18R4Rs3WkcHshYRpCNXa/eAmikp/0u9iSQdtPbs23SlRzjzd0g6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a1d43821so36105481cf.1;
        Mon, 16 Dec 2024 11:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734376382; x=1734981182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAwBVTsR1hBIF1OWZc14smHZk5O1YXVKm4ctcyzbmRA=;
        b=D0OEh1NcDhRmcbKmrf4OGl5JDhJoHDiJIpBKSzjkj1T/6L0mcbbSbkiKNE+0kkEg70
         AOJ/z1Um6M9jP5Pts0rpJ8gOTGmUFiigoq9Ppc3JvSbMlxQiP9u/tYzbbr+Gp5eDsDxj
         oen19QDqT3wfgYy75bJiTd3LzJ+3lpglifbOsvLFxpjc5CLnzUx0ngo2+H9P2h4BfhUE
         Z2XoFmbtH4UEV070oEfNeqq7ZoO8Xqj/7b8wd7s2jejGk3bgVfz863b3Wf8VAhxWhXkG
         hPzD9tjik7aVMyYB6WOQ1eKlgU6dQWr3pn/IOV6WhvZffFxyquuR46QI0siUKkYqLns7
         fjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8YaN5dsgXwIrhmdFO8J0YgSPSkCnRdBk/BEJaMhBdbZMa5iUOA+goZ+EP8TDJqgTj49QsJ0bLG40yzEBq@vger.kernel.org, AJvYcCXRfcP1fGMtMtsPfuMTSmPl4yreMmDHnIquiyePqgf1ZUKnDqkptwjGr3zcAF9b/lsAwny4hPVIrl8=@vger.kernel.org, AJvYcCXdOzYeh5FMFwE2y3UDb2Dypzan52dm2kCDhDdOg+gsmDLo4tSGeNkWjqsoJ4z428yiJ5Tp7RYXGPoUGT+XTUrxv1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwmCMQPZhFE3jX6KeInhQJaxOcJoYva8hz9DXxk7nOU/jKdFp
	qjnrZPISuLWukoFrTv4jr03iiwGSATCXVwWAQXbFmGaqGIORSmd+RY26nnxR
X-Gm-Gg: ASbGncuB4h0Scwx2xzIPC7T6pGi0ruYLC92PaUFBjFlS6XCMdQNhsCnL88o1neuKvXF
	n6SlC0+8aeB5MARaRduAJQDDeSf/TCXcpwRoDrm8kcCzpHsXy0vp5AvA49NbFCPu9mlaukKDgVe
	Y88whDilOegY+HsG1ZNKfE76w1aP/yZ25VYVlcxV+GujdA+tKuJWaZbTa9FYzGfXsI5gwV5VsZT
	UJovfHL/mmYmu4YcCd39JTJvrL+IsUG8+WorAlYdz3VQ7lS7yV1CN47x78/1dM2fu4SQO1+BM3f
	H213vlbfUsDQJrIJkU/bIvc=
X-Google-Smtp-Source: AGHT+IGdTYwQkMnScByrKibMbb6F0bey8EM5NDsGIXyQtnZcjsdMW4v0y80qhWDs3OUumzQdEKh5FA==
X-Received: by 2002:ac8:7c49:0:b0:467:603d:1cd5 with SMTP id d75a77b69052e-468f8dd49eamr8251021cf.26.1734376382330;
        Mon, 16 Dec 2024 11:13:02 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e83176sm31041511cf.66.2024.12.16.11.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:13:02 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6ef047e9bso409265185a.1;
        Mon, 16 Dec 2024 11:13:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKU6XZELax/MLqws0tGh4w5XNDUlrH6V7e5hqdoJKl7K3f9J8o62wOEJrqdre1jxr6Bn/nNjlPfig=@vger.kernel.org, AJvYcCX3VGCpHgj7dkGt/GRhmrN3yTyyOB54+H1g/1I0t+6+QtfAywiQf0LspkSghG5237+NiJ3gnfnXuh2HwNsS2VF6Dk8=@vger.kernel.org, AJvYcCXw+NMBAXQSaNTq6NI3PMigHWykt6cCfjlScEmvTpzZ2QRu0O/jwjoOBEnsuHK+/S86dhG0r3LBmk2e1cTF@vger.kernel.org
X-Received: by 2002:a05:620a:27c6:b0:7b6:eba3:2dfa with SMTP id
 af79cd13be357-7b859623825mr76092585a.22.1734376381674; Mon, 16 Dec 2024
 11:13:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com> <CA+V-a8sAiMTC9Y3vrOKshMZSFLzN0QczMk9B-++LyToG1r+qzw@mail.gmail.com>
In-Reply-To: <CA+V-a8sAiMTC9Y3vrOKshMZSFLzN0QczMk9B-++LyToG1r+qzw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 20:12:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOaphnU=caTuCx3yme_hi-_zdn5PN5P1zhrOSA3duBWg@mail.gmail.com>
Message-ID: <CAMuHMdXOaphnU=caTuCx3yme_hi-_zdn5PN5P1zhrOSA3duBWg@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Dec 16, 2024 at 7:19=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Dec 16, 2024 at 4:09=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Introduce a new `riic_bus_barrier()` function to verify bus availabil=
ity
> > > before initiating an I2C transfer. This function enhances the bus
> > > arbitration check by ensuring that the SDA and SCL lines are not held=
 low,
> > > in addition to checking the BBSY flag using `readb_poll_timeout()`.
> > >
> > > Previously, only the BBSY flag was checked to determine bus availabil=
ity.
> > > However, it is possible for the SDA line to remain low even when BBSY=
 =3D 0.
> > > This new implementation performs an additional check on the SDA and S=
CL
> > > lines to avoid potential bus contention issues.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/i2c/busses/i2c-riic.c
> > > +++ b/drivers/i2c/busses/i2c-riic.c
> >
> > > @@ -135,6 +138,27 @@ static inline void riic_clear_set_bit(struct rii=
c_dev *riic, u8 clear, u8 set, u
> > >         riic_writeb(riic, (riic_readb(riic, reg) & ~clear) | set, reg=
);
> > >  }
> > >
> > > +static int riic_bus_barrier(struct riic_dev *riic)
> > > +{
> > > +       int ret;
> > > +       u8 val;
> > > +
> > > +       /*
> > > +        * The SDA line can still be low even when BBSY =3D 0. Theref=
ore, after checking
> > > +        * the BBSY flag, also verify that the SDA and SCL lines are =
not being held low.
> > > +        */
> > > +       ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC=
_ICCR2], val,
> > > +                                !(val & ICCR2_BBSY), 10, riic->adapt=
er.timeout);
> > > +       if (ret)
> > > +               return -EBUSY;
> > > +
> > > +       if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
> > > +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
> >
> > Surely you can read the register once, and check both bits?
> >
> Agreed, I will add a helper func for this something like below, as
> this can be re-used in patch 9/9
>
> static inline bool riic_lines_ok(struct riic_dev *riic)
> {
>     u8 reg =3D riic_readb(riic, RIIC_ICCR1);
>
>     if (!(reg & ICCR1_SDAI) || !(reg & ICCR1_SCLI))
>         return false;
>
>     return true;
> }

A helper might be overkill...

    if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
        ICCR1_SDAI | ICCR1_SCLI)
            ...

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

