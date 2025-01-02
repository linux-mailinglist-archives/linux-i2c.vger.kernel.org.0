Return-Path: <linux-i2c+bounces-8855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB59FF816
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 11:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C963A20EA
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 10:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739AD19F12D;
	Thu,  2 Jan 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMQxs7XP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E5195F0D;
	Thu,  2 Jan 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735813984; cv=none; b=CfDptP4RY/hspF+KZFk8fbA1IvgbIsHvJ37itE/XcaUxiv83tXH4w7sseUMcSi6gyv1G01Ei95TtXHX98ngb75w+6Ow820/AU+Nn8OASg7tYBEnjeRfO/XrMAN0rwv5NsYksgE32ljsX6wS1OWVVtsE1dS+464I7QP7b+rmDI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735813984; c=relaxed/simple;
	bh=HLWvJVNFwoktW8wEOo0bWlwwovqzAKaPoCfXmBG2liE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g446bJnap9p3O9ZPEmg9DD1PtExpkXoQMzeERGn+s4agdclcvc0hvY42ExIO0ZOkWvkZQFc1EVsBR98MUDuSKwbcoc2O6z/kGA6CBKQ1aBQtF/kak/QTv6lfPvC21eGys0eVMGCwFAD9HpDcOAl52w4EktXcAHlzvfAC4hKuhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMQxs7XP; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso6013336e0c.2;
        Thu, 02 Jan 2025 02:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735813982; x=1736418782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1V0K6yo6Wf/PUo+YoETdrngUBEdR+h+JumeuooVghc=;
        b=LMQxs7XPmBo4IUCSgtxpvgD/djkdczUHVN1oZzk2gODhZLFLk7Xg1SVw1g9fKxJr9w
         s/3lB44ix+eIZ5kye6JROgIMzsW6I/oRiXKGwxLKymstb1xAjzErHrC7RUPQpxzFUDxB
         jxMRiVOWkCt3bPmCA11cbjB+fMu4ga3Rx/R3QA1ziIgIKaCy1MoxUEzGarT+vGr3PPYb
         3Q1y9JTYYAxblj5Zc2dR4fKJ5mk6JgfBO1K6L404E6YTfrtzfRM9MYqmU4etI2Mq8lw/
         KSB6OOC8fB/GlWldCWZqMVw1aQM4FKPdyhOWtm5Nn578XefzPimkfMfLN72z+jDYmtUi
         uMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735813982; x=1736418782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1V0K6yo6Wf/PUo+YoETdrngUBEdR+h+JumeuooVghc=;
        b=I/siLjbCFF/sa77Lx/J6vTA8y35p89D+7q0EXwnfMMhOQejATZx2545bV1wua+XUMD
         z6GMiM+fX8QeHgIPzoYuUP7sLOJl3nzs3NiyQzGS7oyumeH54POyfhf7eF36kxvuRHZQ
         WfBFKi5OQfIW5s2EtbkR9IPAzbRs+U1aQwK2Y7OOnjmA3FfCHnYH1LJXsBxM01mWXYSL
         ZoMfeqY/aHJKZxxJ0AzsGh7xii08zuIZ44UNlXPj+V1UBsLgZVYTV3+Yzw/ktt3cwAaV
         SAAzK0bFesQRyRuW6iSPMuor+DeciaXI896cFuwnfCM9fAe3+7tES4rwUeL+GYzjAvPa
         GvVw==
X-Forwarded-Encrypted: i=1; AJvYcCUfPo6Vc9b19RUSvZuv5vabLR6cDGzpJnZfg3+qxcgl69C0L3KWWxa2UyqwNzIyxWOrDTkQpH77gTxfMuHP@vger.kernel.org, AJvYcCVeJp1JugmdtQACItk12Sl9QoWW6vcabMekM4YVDTBK40ZW6Mjgwu/Ft8hLuCVaLO6+Vz3V+am6Xko=@vger.kernel.org, AJvYcCWrK3JjlGed1GcQzwyM4cm2wduXLfuMmvbibj/kyXY1f+DqM3SU0SUjX4SPjUNf4W6hMGKaBcxx/lvHUFx3QTGU4Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GtDrk1qZKD4afndlsnGj1AJkab7RmiGhiN8M4AFcstfiokcw
	2gFoBRDLHuKoIktP7cDlngm+tOaPUKfzOKxmNaaKliqpt92S58a+w6zjz3uoifcsoZ7GX4h+acG
	+zOb7RiwzklntDWdXUQP+pd+qUd0=
X-Gm-Gg: ASbGncueEXBubcuujNpR+oB6FWRoiewjno0cljafyngSqwexB8umCOUFR5YiilV8xNZ
	SY0Un5LVQn1nQfHcxV+2NfcDE4fr/4C65Ih9Mf8JeDpbTeO7wTskn+goBhk3OOA6GS5DUlTE=
X-Google-Smtp-Source: AGHT+IH7Y3W65L1qDcWaixfPlYcRws1PWLqAsZg+e5De3ff5eJEByU5I0MkcfUBq14eHPSiNmYy3JjlvRZeJRfaMujU=
X-Received: by 2002:a05:6122:4302:b0:518:859e:87b5 with SMTP id
 71dfb90a1353d-51b75c6a74cmr32286037e0c.4.1735813981749; Thu, 02 Jan 2025
 02:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3CMUDX4evaVdizJ@surfacebook.localdomain>
In-Reply-To: <Z3CMUDX4evaVdizJ@surfacebook.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 10:32:36 +0000
Message-ID: <CA+V-a8t-eZ7nq+-OgzYq+FzpK7GEnSrzBFJJKfTSv-hzBktjpg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Sat, Dec 28, 2024 at 11:40=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Fri, Dec 27, 2024 at 11:51:54AM +0000, Prabhakar kirjoitti:
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
>
> ...
>
> > +     /*
> > +      * The SDA line can still be low even when BBSY =3D 0. Therefore,=
 after checking
> > +      * the BBSY flag, also verify that the SDA and SCL lines are not =
being held low.
> > +      */
> > +     ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICC=
R2], val,
> > +                              !(val & ICCR2_BBSY), 10, riic->adapter.t=
imeout);
> > +     if (ret)
> > +             return -EBUSY;
>
> Why the return code is shadowed? Is it requirement by ABI?
>
I will propagate the error instead of shadowing it.

Cheers,
Prabhakar

