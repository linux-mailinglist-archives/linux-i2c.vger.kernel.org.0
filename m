Return-Path: <linux-i2c+bounces-11309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49092AD2541
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 19:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB62718898DD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112FB21ABD5;
	Mon,  9 Jun 2025 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZ5wom+H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E1149C53;
	Mon,  9 Jun 2025 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491945; cv=none; b=A4OJ7XSx7COs0K1ZLJU2jAmQoGTR9sTsj0pZwADELIgV65bG2bH4bOiVShMHXZeOGWGnQQ+efFQvVPKGYNEAHIL7gPR6xh/291sQ4GDETkazQaSYNYzcxqmn5YW+p9Env09Tjo0TpuW3UMOmgcc7p63ui76TwXu6DMnOzRCJyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491945; c=relaxed/simple;
	bh=wjJiBM3SCsbx2Gfhgp55WbfbW9P1zm+NDaB0wNVkxCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I12fYeHiG7yVNnQ+QZmfUFEmuKWHOqMWQqiROEZRtnryK59s6K7sQl02YsxNhGko+tOlMwfIApsq8ltmCoGbKc45JRYZlGoiKedpXyWjxq+u9wn8cSkPPkZBb9cKb9hQQU2eSH8HyQb7Gc8cCmU8SCpGK8CmsuWFT+1LsP5YIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZ5wom+H; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a35c894313so4124871f8f.2;
        Mon, 09 Jun 2025 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749491942; x=1750096742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kEamOVCHw/4zlvotX9q4weM03p9hs3gDWtDM1Wv15o=;
        b=LZ5wom+H9l1+nvm3IeLTMimVV+JgzPMZOnejA2lV/E98ndv8g8Rz8yv5VgQwOYDy5L
         BopfJfdnE3xPTPc819zR8UkcJMv+dwNWgzx9P8lFWW37rPe5eBhwGL6iSL2VDIJ9aPKC
         eGpkFu+4vn9y8mrR1gQCAhmShUTexsI4aT7fz0PHV9uHDGpNHC9obUOeDuSEyyISmqKC
         86UrGfQH58VhkbUzWFuBlUz7adZlAsNa8zvMMtlcOJdqH2N7MJbCvgjPPOw85J5NpZSl
         xHPW7lqNO3OUFrDT7nYhSibBD8HpFcK5NKWSC5KblUmvHIkWQW6sKWQgM/fuetuEMi7w
         vUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491942; x=1750096742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kEamOVCHw/4zlvotX9q4weM03p9hs3gDWtDM1Wv15o=;
        b=BoHZqA/RTVAjPN0IHVMRTz9FMpRZKhRC2zKdhtJs+7FcVK7AqRCYSSPnKMDhywZ5jS
         0aavwTAML+DW6ry/SzMHlsK1P1er4edull8KPuHexB1oJOn3ujxC/M6/96tdzEYe+Bhl
         YgNj29Phz4jdHHqKYRcnF2kCBC72WXl9IbLeE4dPYTABYACDpfaOn+nUYDtLcBBv45IC
         qZRrC0wrPODhlDQMaczpHiYTVMwHbI0ek4v9YWDm6eJRqbeVVoWKrcg3eoqgjQwI+NVo
         +3p0lk3Ceoa4va01Q7GTONHtatetT+C9/W5EXIwWptp7P+QNdH4roLrLP5INpo7vN8B9
         TBFA==
X-Forwarded-Encrypted: i=1; AJvYcCU26iS+d9b1rtGghRYyNggeePaxK00P81s/99TdxdoLHPnVkIXcllhJPm/6QSvQNhJ4aEpmSz/Z+Xu7@vger.kernel.org, AJvYcCVV7HtQoriu6lVebnRhU+cqN4yhVnxMfMsdIXVDH5uPugLaDOcuHzEmGLvQjjaTGac8R0i5hDPAlwR7wMPh7SxBSm8=@vger.kernel.org, AJvYcCVgP//QgAqZ11qM77FEMqQYWEfqSE8tvtFsnRtwqiRsPf9jnV+bYvsT1m9NBWaVNqr9C0b4fn6locLe@vger.kernel.org, AJvYcCXGrau0CCFddQ28lOkwK4ILNDsop4XgXzhbN6lwI61D2s9tmhxUbkN5qhs2gRv7qwLTOOerVB4ShpYKQYM/@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUO7c20+KV67GOwFR0OZrWApT6ORsmgV8TrFleAYKLlflBCic
	oiJ5g9I8m4jZXPKJIUXLktPvUk5mDgGXRVdBcrULYQWXSQW0I8HQ/uue/rEa6+hTHT0SRU3F+sb
	hlxHraJvmm9GoaygIMiohbMoX+QFAckU=
X-Gm-Gg: ASbGncv6Bm98Q6UfQChLuhakvvF2rLIqbTSoi1ohrW8De7t5mteyFaSyVQqbEU3wnzr
	AIQh+YrUe4kM1MHOUuwcHZB86eGen196vVlQJBiGs7V+3cn4hPc4Ubxk9qNobR6pSlRaMCQjUvH
	u0d2Q1vABdGyYCOadWczdzomDdfr6gWIkvueEEo1yydcJ1kDhpPhlAswXhn9KGCZRURx1UwFH8O
	iI=
X-Google-Smtp-Source: AGHT+IHBm2KRx7wL1lda1RUovfI97fLLM2f0+lA/iR+BErMYL9/N7+VvPf9VeD/d2zFkv+FBRuAxpIfgKLD3ZJjK9/A=
X-Received: by 2002:a05:6000:2410:b0:3a4:f379:65bc with SMTP id
 ffacd0b85a97d-3a531cdd100mr11572082f8f.40.1749491942323; Mon, 09 Jun 2025
 10:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX61j-6_GwnibUs-m0ASm5JGhGGzLe6i41vjcz1ouZUjQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX61j-6_GwnibUs-m0ASm5JGhGGzLe6i41vjcz1ouZUjQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Jun 2025 18:58:36 +0100
X-Gm-Features: AX0GCFtz8mfUhx41DEp6fo99hxevsASKBaktWopZmYFZwVDj-m4Ow5dQ9UbjWi4
Message-ID: <CA+V-a8u1g+LDZpR8o8GZtTRvsSgbw8DQ1osWiXjXXUnhBrjEsg@mail.gmail.com>
Subject: Re: [PATCH 6/6] i2c: riic: Add support for RZ/T2H SoC
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

On Fri, Jun 6, 2025 at 2:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the Renesas RZ/T2H (R9A09G077) SoC, which features a
> > different interrupt layout for the RIIC controller. Unlike other SoCs
> > with individual error interrupts, RZ/T2H uses a combined error interrup=
t
> > (EEI).
> >
> > Introduce a new IRQ descriptor table for RZ/T2H, along with a custom
> > ISR (`riic_eei_isr`) to handle STOP and NACK detection from the shared
> > interrupt.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -326,6 +327,19 @@ static irqreturn_t riic_stop_isr(int irq, void *da=
ta)
> >         return IRQ_HANDLED;
> >  }
> >
> > +static irqreturn_t riic_eei_isr(int irq, void *data)
> > +{
> > +       u8 icsr2 =3D riic_readb(data, RIIC_ICSR2);
> > +
> > +       if (icsr2 & ICSR2_NACKF)
> > +               return riic_tend_isr(irq, data);
> > +
> > +       if (icsr2 & ICSR2_STOP)
> > +               return riic_stop_isr(irq, data);
>
> Just wondering: can both ICSR2_NACKF and ICSR2_STOP be set?
> As riic_tend_isr() clears only ICSR2_NACKF, while riic_stop_isr()
> clears all bits, the two calls could be chained, if needed.
>
In the normal working scenario when verified both these bits were
never set together, hence I took this path.

Cheers,
Prabhakar

