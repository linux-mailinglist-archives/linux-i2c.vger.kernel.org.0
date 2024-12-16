Return-Path: <linux-i2c+bounces-8542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6599F38D2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C6C918910A4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEC42063F2;
	Mon, 16 Dec 2024 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZgvkOpi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5520626B;
	Mon, 16 Dec 2024 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373157; cv=none; b=D7LlX7YkhUwTNkEmTv8fwrFysJdGVpBF8T5sJCmLKS18RDGu1q8bVIc4V7vQzAgZuJ2cwRaYVD5t1RvxsBEa6h42k3CDsfmVVsbmkgHf3Y46SuvPmtWZ6yOE/E+ctHfm3NDeqcyhaZ5FS9sGiYnVM+3ZiYfd8vlgTZkwZcq+7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373157; c=relaxed/simple;
	bh=Zv7B9tNICPDPrSc3h3UnTsMqDKo2tk/1m7jnN8ytjaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0UEx7ebNxJpA9maLPDdQmHfx1jzN5KRFsqvbjS9PNWcAGhH8t4eQez9jYVcchA2huX99+nyjsrojCUO5zNUkvqz9/SUlV43ZKWHeBGeH3xywW3z/VEfS530D854pA7CK5vXhCisdet3yK+ZJ3karC4wYDVeyOKKKVf26XJjcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZgvkOpi; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afe99e5229so1206125137.3;
        Mon, 16 Dec 2024 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734373154; x=1734977954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdeF5q7i1gbyNrk3Je5nKgO+rHwF/IkRFyoP6STYyN4=;
        b=XZgvkOpiNGn+nucHjfiWnV4aKBoHevHEAktWfnww9KaGjtN6Jp/ZmcxXNKWG+O5iE9
         HPUGU1zqE8wNUEVxqIHQHX5P/Mu9ld+5fIdgD/iNhPkr/BXBQ+NXvXSbYp7TnMY2ZBYA
         GQrwFkOgiav9B3Fg5EpuY30kaAtMf7NKS+xpoFLR68TH3P9iKUHN8K3kl/5wmXJZPW7F
         Kav/wG0pOaoFCzch4KNYOtBLUjJAbN7YuLvg6/3Vuv3U4VBZGiJ5dLQzrGcS8frsH+Qu
         kYy2KXmC+Bii+Fhmfx+ZC+ncWz+Z3bWUel6QbDRSDY693B3+9jlo9qyLyMVC6IvTfnsm
         mpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373154; x=1734977954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdeF5q7i1gbyNrk3Je5nKgO+rHwF/IkRFyoP6STYyN4=;
        b=qulkTgoyPCFofqqfJhW7mJtxnX0oXSKOHpV+PCr+JsOxwYHSUGAkhD9ECru5RRh6So
         LPZJCf8vFQ3VMSAnsvmopmR6oaaQrCGmNS6lU5ZcJT1sTsFZCcCH4H4F0iglyVLKDZvg
         SFWuRccQkJq1THr7I8MPYK/SOsczVUhxlKVB99zHWt7syTYw6ZINseiEmBo1Pz+Knjm2
         2QIx3kyoO2p4s9zDGeUNd89D8PDAW6c37plAa4jeYkG0h9P/YJl9bhHFcmRNvjz3cGy+
         8TUDK1EuX2uOOzdfiHmBl/da8p8Z98FjbGZNbDbYrkU8HND7Iw8N+u1C422ZHhxiC7FB
         cwOw==
X-Forwarded-Encrypted: i=1; AJvYcCWb7qL2qN1OWv0a1aq9UEbs2nBHdH4IRJW5r2yMaGiTEwxGOCB50Ao4iWsJSOavVBbP+Xay2q1lrWM=@vger.kernel.org, AJvYcCWxIulA0JAS/nkvISvmIEthsaB6Li4NwyMsSn1+zBgz5EPtj7CaFiatuGHpBGmvj4+zgFORVFrUgGuxZGOg@vger.kernel.org, AJvYcCX/qawaBC9+8MePDGXB/f4sIz3a46IdN6kEy3ZUHWBGEhgE6+NSBtHciTK4YwZgnzpLJzv/bwy02YeAufc8kxQORNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlTjSNMnYUn39wBylSPtodn+5VtPCBJfN5GwPgeA7fmqG86dE
	r9zqYBw46nIDwELKaEt+pSrCqWC+MxnciFwlz/Nic1gj0TNL8bR0uNwkHO8K1RhPs0U3T2BgpWQ
	XU6wD+8dD95BVCAXzt6iszltJFq+m19Ly
X-Gm-Gg: ASbGncvXdVRdUib4unXUoxlnx5jEmYzDyMQLkFZrcCBZPkaXpV+voWRPPWFBWlEgWgd
	txk8y85w0C0YsB6tMVVJXIrWthvsaTn6kmpDohLgezGJBCMlPmmhMfHyyg2CnLxA/pcmvib8=
X-Google-Smtp-Source: AGHT+IHuRtV0VqTpR8F312k7i39uYNWuYt0c0s3u+r5PirYWGtltTl7ePHRkVUyGmT8xDquaDD6p5TTIZU3FGFqoUrs=
X-Received: by 2002:a05:6122:2a05:b0:518:6286:87a4 with SMTP id
 71dfb90a1353d-518ca251874mr12461414e0c.4.1734373154522; Mon, 16 Dec 2024
 10:19:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com>
In-Reply-To: <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 18:18:48 +0000
Message-ID: <CA+V-a8sAiMTC9Y3vrOKshMZSFLzN0QczMk9B-++LyToG1r+qzw@mail.gmail.com>
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

Thank you for the review.

On Mon, Dec 16, 2024 at 4:09=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
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
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
>
> > @@ -135,6 +138,27 @@ static inline void riic_clear_set_bit(struct riic_=
dev *riic, u8 clear, u8 set, u
> >         riic_writeb(riic, (riic_readb(riic, reg) & ~clear) | set, reg);
> >  }
> >
> > +static int riic_bus_barrier(struct riic_dev *riic)
> > +{
> > +       int ret;
> > +       u8 val;
> > +
> > +       /*
> > +        * The SDA line can still be low even when BBSY =3D 0. Therefor=
e, after checking
> > +        * the BBSY flag, also verify that the SDA and SCL lines are no=
t being held low.
> > +        */
> > +       ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_I=
CCR2], val,
> > +                                !(val & ICCR2_BBSY), 10, riic->adapter=
.timeout);
> > +       if (ret)
> > +               return -EBUSY;
> > +
> > +       if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
> > +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
>
> Surely you can read the register once, and check both bits?
>
Agreed, I will add a helper func for this something like below, as
this can be re-used in patch 9/9

static inline bool riic_lines_ok(struct riic_dev *riic)
{
    u8 reg =3D riic_readb(riic, RIIC_ICCR1);

    if (!(reg & ICCR1_SDAI) || !(reg & ICCR1_SCLI))
        return false;

    return true;
}

Cheers,
Prabhakar

