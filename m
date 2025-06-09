Return-Path: <linux-i2c+bounces-11308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752AAD23F0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F2337A3E7D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0968E21A931;
	Mon,  9 Jun 2025 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBtE61Lo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B33A1B6;
	Mon,  9 Jun 2025 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486645; cv=none; b=AQvkb1GrOKjc0PiDU/D7X8K0rDfNfOz+gOAmhqzPsUgKGyyRaoft89bGGjRguJc4hCfAxJ3kMJoW1PlMHYtohYyuuL77BelKUCQSw57AYRKC2TkqnGhLkDuLB6HI+gR5HFCx/PoReuUGDXCYoizChLxaA6sP5Uuon59oAObyLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486645; c=relaxed/simple;
	bh=V+MaTXDIBtZO+gC5Vxx97B2/xpKwM81wJPYoo0ifIqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUywfSX4MpmaDXTswoKDv4x2DiOtDpAkpS2ca4Ukm23TWoSug9V0O/7LlwVWs1ulFMdD0UTAkuVhBU+tiNEoFxX+DOS0E9fcQL8M+FZP+F1R1jd7+QajxNcfX3KCJgUibUJpOHvpNjDMSQzr05FLT0b6DSXDBvskxHRSE1hLBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBtE61Lo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3035711f8f.0;
        Mon, 09 Jun 2025 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749486642; x=1750091442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/0iQvu+cvXD/i+mJVAh6RlBPbjrVmW5Jj0JE1c6SSw=;
        b=FBtE61LozQfS3ti/jX/6irm1g35OlHQx/ax8sze1K83gnokkrDV/7EWcz8h9270FUb
         V0GI+9QAWcLkdKethn1ql6uYK+QVjNyWmwfDbfx97qrdpmVKlzE5l0IlUeJCDhJrjBvC
         oMdqbLZxBL+rWXkNEOmwNy8cCJYGAlv03Z2LrLUiTylgX/snVfJNPtaEgQFSuRWSEOMJ
         a46uIsyHIj7GPdn6/T1RXL/v9m8cYH9/5pP/qtY/GlFmhW56pV0smgtCXDYmIQLOXLCz
         nv1r4/gokyN1ytytUjs8pup1K/MoElksihOw+fD9k6ATKfcweftDvu2sbWMONAtCiVKM
         M6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749486642; x=1750091442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/0iQvu+cvXD/i+mJVAh6RlBPbjrVmW5Jj0JE1c6SSw=;
        b=fI/ijdh6PvnM0Y5A0CwQ2i2+b4I6nooqx8apIVgXBd9YjL19MbzJrTxz19+YpeEPfZ
         T65n8JOYv+7d+f9NvkQBrdm0EDzWuDCaa4txQApdhIUTOySd417x3BPLrmomRcUW6QiM
         +U5Giwn4xdIzDp5EM7fvUYQgLayyEDYjbV+Bix/3OCbzT11LIiZ7g+RzFYZsT1U0bS9K
         JTtc8VfL25VQXC+o4qjoDrLpzZl8DDdHPOLszE0yzHKlrfj+HNjoSK4VH4sCf0b819r2
         7A/ESwSVoB6vtgtLgAlH1CakEgFxqNHhX5VF0TToUlAGBOmMth4PKZkd0ZWWTB8B4Aab
         xDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhz24umgmWsfmE0tutuoQEfA7nXuzsD9Wmc1PW5kwFMqqRfIdaOnJ9GdddVQ+1whcssv7+31Sir7ch@vger.kernel.org, AJvYcCX2FOq8jQKOb8npr2BshY57YJUo/x6sOxcZrFEM6jUhoNtW09cYslhmnbJDOWjd8RfRdL78uWMAfajRCPkA858ZCQc=@vger.kernel.org, AJvYcCXCb+Twk6bH7X2hg6qc0XB85lrVqOnuX+ZakH73dXj8baLrAencEEAkdakZHfrPIWO/K0Z9QW2cFTb0@vger.kernel.org, AJvYcCXwrF6s6hInS/0JQHttTeMKV9/wmgSqcQmnXhnZc1hT8ZHo//AIwn99zO7ZrqqFdXEfUJLHBZeSecNWpcI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAHSFAHlCyMYYyYvFDSEyGBoS7xzImbZrynpHhEndT2ujAIgI
	9zrPDwK+tOft5v+iP6HGy9Pdi6gKdx9yuwAL6/Aw/DNuqsNu7kp9dK0tuM6a0n7TVnbXpqYlYck
	cLAY2JGnxS0+Ze+IR+RdlGg4LoJ7pLYo=
X-Gm-Gg: ASbGncvPlBirQBmX0/9n1odfZIALn4Cu0NHP13759yGtbo7ygx1dlaSqzEwjPyxHxRh
	opH2IRxWaaSPzJEJ0SvoybtUtJTJ1AKTjVo8xwOXoWzVu1Xn4enaJ91mgSbeUKzCMq1YHwOrvw+
	RSd+aKzUBnJ6dEXn6vQ2sCJhM0cnSikOe1oyTUvilt3e7Gh0xxhHi5Ob8AfJQunL+xK2LAE8oJs
	TCvZ6B+VWQ+/w==
X-Google-Smtp-Source: AGHT+IGXAIQdE1nRJZmi3jEWcnBZPUZA+Z97ehAjUaK/t9ksInwV3DWMm5/fBKUnqkXbWGVfdlw5oL/ODL8sC+zRY64=
X-Received: by 2002:a05:6000:110d:b0:3a4:eee4:f73a with SMTP id
 ffacd0b85a97d-3a551403297mr154077f8f.22.1749486642265; Mon, 09 Jun 2025
 09:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWeBa2fzSKL1Q9jgr3NgoDuQZsGnZbu42cnEoEJSoiNEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWeBa2fzSKL1Q9jgr3NgoDuQZsGnZbu42cnEoEJSoiNEQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Jun 2025 17:30:16 +0100
X-Gm-Features: AX0GCFv9sC0xEmVpjwgec5NeYMQ8oeaNBeATkzGKmkHKjxLQqVmPDyDvC8comuc
Message-ID: <CA+V-a8tPAg5BQFJVcLsHOzgp4eLBK2w-OJ+G4gsv4911WLhJzw@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: Pass IRQ desc array as part of OF data
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jun 6, 2025 at 2:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
> > which feature a combined error interrupt instead of individual error
> > interrupts per condition, update the driver to support configurable IRQ
> > layouts via OF data.
> >
> > Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
> > allow future SoCs to provide a custom IRQ layout. This patch is a
> > non-functional change for existing SoCs and maintains compatibility wit=
h
> > the current `riic_irqs` array.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c
> > index 23375f7fe3ad..4950b790cfe7 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -102,6 +102,8 @@ enum riic_reg_list {
> >
> >  struct riic_of_data {
> >         const u8 *regs;
> > +       const struct riic_irq_desc *irqs;
> > +       u8 num_irqs;
> >         bool fast_mode_plus;
> >  };
> >
>
> > @@ -607,10 +611,14 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] =3D =
{
> >  static const struct riic_of_data riic_rz_a_info =3D {
> >         .regs =3D riic_rz_a_regs,
> >         .fast_mode_plus =3D true,
> > +       .irqs =3D riic_irqs,
> > +       .num_irqs =3D ARRAY_SIZE(riic_irqs),
>
> Nit: Perhaps initialize the members in the order of declaration?
>
Ok, I will fix this in the next version (and below too).

Cheers,
Prabhakar

