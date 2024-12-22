Return-Path: <linux-i2c+bounces-8687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA69FA3BC
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 05:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E77188A3B1
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 04:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0232DFC08;
	Sun, 22 Dec 2024 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du/p0onR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC477102;
	Sun, 22 Dec 2024 04:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734840915; cv=none; b=m2BGjOFictXojUIsyJwJ09HhIqV6t7XIBPFpDx9QA7rBP8fnhYs7wP+35SgpXfHaEqRR05KRGy/R1YGKoRkxzsStVmIQboG7A/0m5RoIczDVmZhCjFBprN0ESWU2L1SaXk1cXFQ3ay9PXEeL98tIJPORlVNUZBV3wqnMW9lD0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734840915; c=relaxed/simple;
	bh=TzEOlzXZeeuKxNYm8QZvIWruG0pfPFGDLwKmCyd3LVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjQe8DDPa2jrEFxgE9a11idv2qYeYuPU6HSTsAee162JHNEkGZVs2yHbNFySoizZ1JQmddeyrjN7KL09i/GwnhITlKRle0puRDyoo2OSMW/7RG7d/QzkW2rZcq6T3id8GMiSN0LoXmFk8bLBgzv1hyghn6Gy+o9uuAssqXQJ6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du/p0onR; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5187f6f7bcaso966048e0c.3;
        Sat, 21 Dec 2024 20:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734840913; x=1735445713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV6NL280nK7npdov9EuwnccvaExui01P4gL1f7xO4Q4=;
        b=Du/p0onRHsNFm+wFKHYtcK8uLsvr/KoFbO7HEA4gAfK+Q2Kh7N9bmhO0/JHMH0/YlN
         e0yAAfWn2K71zU50xpEXeXxxhWHhJDsqenR5YBM37ItRzeMgnj4ktHOao+KP0ObG1h9A
         Z/YQFI6YsPs39pY/a+RbybmxcgtH6pp2wNM58kmFVzpVoce/dajEFAOEHkjoXnuUs3Th
         Cdxjc9PZBlmaLm3zg4vBmsBVfAgaQ+xFNQ7VY0G+EcLz757ZJnbfq8eg71olBmTGS4Vi
         vilRjcLKLGYEgSwUK2R1TSU1ZFN19ZXyXRnnLBzbImbXGL4y7lkeMEdJ7T64P8GfyCed
         qwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734840913; x=1735445713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV6NL280nK7npdov9EuwnccvaExui01P4gL1f7xO4Q4=;
        b=JjwR5s6cFchVqIYbjXECtg1q3zn3zohA2j6BQDcKzVRf4JBvWumy2zUP+rKMnt/nh5
         cEq4f23fr0GzpPuTFYS1T67swq+qD4D2yly3sHlPd0SBKRe+801+1nATT2Ws1pwDTl7L
         9ZvFocIA0bRDAKilbF3m4PZw7v1vbmg0OrLLX/5Sf2IC3FaN+XlJHGx9PTH7FJ25ugZ0
         h08mi8dLrapXNPnZyAS24I+Z68r2NP/aFDxK8+KCHSVlUex2ViEh4FQ5cPk6Kkb1K5de
         j8pIcUZkh3TvceMhuVHK/XgeA/S00PBFVkALCfhNzdeQMUFPmj25iG1H0YfWNjFa/f5w
         ZIKg==
X-Forwarded-Encrypted: i=1; AJvYcCVXSb+8DECHUprzO6Om96HM7oUIocYi6xuFNtjCndIEXx33WEHQv2s4k7KAr0TKThUY/nAZZiHmkLY=@vger.kernel.org, AJvYcCXPqsVeErtXTiqhBzVnQ8+F6wmNZNK66+6dxYBWOrdgPbV8ofUoStuDW2CW0e1WRpz0DpLuuZl2wWTAZdZkAhNvrnk=@vger.kernel.org, AJvYcCXlKpJpv3Mu4+30AKm6M2Ou6KUMH1hwErvH3FRO6spDxIUgCEw6GRNImM9PLNIdRp0dj7x1+g25FM+/9ajl@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCK5xbrT5lSv3yCo9LLHYE1P2xXxeNH4Dk4JbSyHeoP536mFA
	Xm9gMcozM545bg2sJdNaErg28Njnx3DWuVmAehCdYQrG1TynTdviw0wRjynSRo2/wcSyQGNmM33
	gaifFCeOsLh3+zM51ycoEq2y7LMVLMw==
X-Gm-Gg: ASbGncvk5MhqqP62aJWnGpw/v6iQUO3wotyOgAs62xrzG1DAShboxgQbn+k8tIBC7Vd
	+mgt1QsUns+FlxZuIlGxdF0BtIlo3H7tYA8IrGTqKN5dDzIssdvcoq4S5eKaiJ76tU1HBHf/c
X-Google-Smtp-Source: AGHT+IGnCeVAQu5F5hBFzpMclAmDxNkGGe3ICawz9cJaI3D0VLHkVg1IjxqEsV5P/ZuIQ18849LSMBQkrsjm2ua8ogo=
X-Received: by 2002:a05:6122:1816:b0:517:4fb0:74bc with SMTP id
 71dfb90a1353d-51b75c3fe42mr8456761e0c.3.1734840912982; Sat, 21 Dec 2024
 20:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <5242fffa-c028-49dd-a7cc-b6d9330f3c1c@tuxon.dev>
In-Reply-To: <5242fffa-c028-49dd-a7cc-b6d9330f3c1c@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 22 Dec 2024 04:14:47 +0000
Message-ID: <CA+V-a8stmK48P3R8-hvf-MjwFkOH2KAXBgjWjuyMWFt4VhuY4w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 9:13=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
>
>
> On 18.12.2024 02:16, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement bus recovery by reinitializing the hardware to reset the bus
> > state and generating 9 clock cycles (and a stop condition) to release
> > the SDA line.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Used single register read to check SDA/SCL lines
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
> >  1 file changed, 90 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c
> > index 586092454bb2..d93c371a22de 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -50,6 +50,7 @@
> >
>
> [ ... ]
>
> > +static int riic_recover_bus(struct i2c_adapter *adap)
> > +{
> > +     struct riic_dev *riic =3D i2c_get_adapdata(adap);
> > +     struct device *dev =3D riic->adapter.dev.parent;
> > +     int ret;
> > +     u8 val;
> > +
> > +     ret =3D riic_init_hw(riic, true);
> > +     if (ret)
> > +             return -EINVAL;
>
> Any reason for not returning directly the ret? It is true the
> riic_init_hw() can, ATM, return only -EINVAL in case of failure.
>
No reason, I will fix that to return ret directly on failure.

Cheers,
Prabhakar

