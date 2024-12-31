Return-Path: <linux-i2c+bounces-8845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6449FEFF3
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 15:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73D9D7A13EA
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 14:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3EC5BAF0;
	Tue, 31 Dec 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbmvX0ky"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073ACCA4B;
	Tue, 31 Dec 2024 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735654857; cv=none; b=Le12Vj38IsrWPQpQDwzqkiq//bKEk57kswLRu9whK9TASUx9cRDVm9NXiK38LJQstqCG0DHw1rowqI1wq9tsMmUUy3MJpxkv6ZCWKieiQVxbN+B+mVhJwI6BDQnx/lKqCLhS2NgDPe8qeJZkhZM8jRaackznUJc6HrOcinRUcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735654857; c=relaxed/simple;
	bh=b7graTQoDG6f37hqLC6zkdGD84TncPK76j55g02uB6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbF0eDZnlIJzRO+zJoc1NgK1XAtMCWy/h9zCMd1PuoaUWaTgU3DiV4vTT1FTCBxUOWLuDtDYxEkjOwqhKQC7V+V2LS7p+E+eXnynKWjYxDg2q6z9BPNhGndLzkJmoSMz1GjCtgcbI8SZgh8F9FdRKGLqO40jImE/CultQjx4INg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbmvX0ky; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so2924869e0c.1;
        Tue, 31 Dec 2024 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735654855; x=1736259655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2J3cBm8R8L86eG0ET7FujK8+Gq3+WlHTX5PiJH3SfY=;
        b=AbmvX0ky5Lh8ct9u36oBjz6Z1wT5bgN283u9+tqt2pmV/23IIoheEvBzAll9ztSvxE
         R8YbYk+jHB6Qj8W+dXbce2MejbxubBxvn50MX5S/yRyOKLML/d9RaCKssAS7LBtwWl03
         wovj8yfzH4SCMts1o88TnF4cI/7N3TrbjDUgw8VxAKZMmlm3JbWupHLeiWz2lQGdZ9aG
         /BT6afrhljHiMgZOCus7gvrs6JS5UrHruDSzBN8ZvgidHSt552aHE+2pn/YFLNa3Y1q4
         Lt8r6eyzrklSaWa0kScpkYe528u+jGex2cuPQZEwTBMwk1MR2a8Zh5VvVP6LxiDUVYHc
         0uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735654855; x=1736259655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2J3cBm8R8L86eG0ET7FujK8+Gq3+WlHTX5PiJH3SfY=;
        b=V3jADQXV+hYy/wda6GT/N8zXSjI7zkWnw8/JkQ2Dy4Ea4M8CagMdkt+0HjOg48w76L
         zFefnssIoX0M4Ndj8+Wlsuwcx+KbI2Ak07j/4PQywLkpjqOG3Bd5CcelIm0aPJQAuiWn
         WmLfKIKnPLCST/6IOriPoVguRtW4TiE/5rgdTEU15e8U6prKq8Ol6Oy6bbvNfgKdTiQj
         UNxY1lDuu88iFkVtDtEufBNznoq7br5X2FF+nloxk9aKEOXc2IFL+0UXN/vrBggndybB
         9UUZ0NXyXW/IAs/BozTK6BlijKlj5RVw87/r+4tzN0V46c6S4E4gkcIflsuDOH9asjCl
         l43A==
X-Forwarded-Encrypted: i=1; AJvYcCU3ca/NS8Mks+NaLJqO13L4oWtIhzsKSkkqrXLnP9Lmj7956nOqSECk/Z9JH0oODSTMklZVlwo1u+M=@vger.kernel.org, AJvYcCW2SUgXokb4Cvi3EAObbtFq6JmmSIw8YZNwApeUAvIUSm985jQD4jDJoqrStPmFYok5xOY1o7/ysTD9yQS907O1B1c=@vger.kernel.org, AJvYcCWLhYt6TfHBD+sGIDEZH7m0cVzxYBZVGhB1v1/Qw091LI7xsj271+sAlk3gpoejfwyoT0XxwMgqv5gKi9EF@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ6AA8H5Ra2QmRcm+6H3YCbF0uIFZot4J8A/tzj1c5D4Uj+LER
	8Z+cnKVv+3SO/w3s7ziL0U/tNgrIjjNQExWy/BxSDcsvLmg59r51CQ1iLiGwGnYLUNLL3WlEdvO
	8MJe0aMyBXPkZ2oicNpuzFUcL9ynRPQS7KlM=
X-Gm-Gg: ASbGncsRZQ5VqogmMSLkCm1fWVwnB/YbH0uc0DvdNdM+xNoyEbzGXSVYYSdlsPUumMV
	9b842k3pd6a5FUSEA9xjZvuC7DI+P+/XSVy/MD6xk3Gi03RxPYgXaWr961p+E6VEW2UT8
X-Google-Smtp-Source: AGHT+IEKgaO6U8I1b7i3N3RIFbmM1ze2nUoEj3SBycwdB1nzM2yMpnDuHSyqnwVc3GVYUhhuHRnEd1KFUEQ7S8TKNa4=
X-Received: by 2002:a05:6122:4889:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-51b75c5afc3mr33297600e0c.4.1735654854933; Tue, 31 Dec 2024
 06:20:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3CKnu60lVuDBedn@surfacebook.localdomain>
In-Reply-To: <Z3CKnu60lVuDBedn@surfacebook.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Dec 2024 14:20:28 +0000
Message-ID: <CA+V-a8v0_9Y5qsDGtwLL76-LY5u8Tf4odbDvU9sbVE73BZ=ZHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] i2c: riic: Use dev_err_probe in probe and
 riic_init_hw functions
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

On Sat, Dec 28, 2024 at 11:35=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Fri, Dec 27, 2024 at 11:51:47AM +0000, Prabhakar kirjoitti:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor error handling in the riic_i2c_probe() and riic_init_hw()
> > functions by replacing multiple dev_err() calls with dev_err_probe().
> >
> > Additionally, update the riic_init_hw() function to use a local `dev`
> > pointer instead of `riic->adapter.dev` for dev_err_probe(), as the I2C
> > adapter is not initialized at this stage.
>
> ...
>
> > +     if (brl > (0x1F + 3))
> > +             return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). =
Too slow.\n",
> > +                                  (unsigned long)t->bus_freq_hz);
>
> There is nothing special about bus_freq_hz. Why casting?
>
Ok, I'll update it like below:

    if (brl > (0x1F + 3))
        return dev_err_probe(dev, -EINVAL, "invalid speed (%uHz). Too slow.=
\n",
                     t->bus_freq_hz);

> ...
>
> >               ret =3D devm_request_irq(dev, ret, riic_irqs[i].isr,
>
> I hate code doing
>
>                 ret =3D foo(ret);
>
> >                                      0, riic_irqs[i].name, riic);
>
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "failed to request=
 irq %s\n",
> > +                                          riic_irqs[i].name);
>
> While this following the original code, with the above change (introducin=
g a
> separate variable for IRQ) this might also print it.
>
Ok, I'll create a new patch for this and have something like below:


    for (i =3D 0; i < ARRAY_SIZE(riic_irqs); i++) {
        int irq =3D platform_get_irq(pdev, riic_irqs[i].res_num);

        ret =3D devm_request_irq(dev, irq, riic_irqs[i].isr,
                       0, riic_irqs[i].name, riic);
        if (ret)
            return ret;
    }

Cheers,
Prabhakar

