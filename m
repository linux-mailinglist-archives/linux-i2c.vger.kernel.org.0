Return-Path: <linux-i2c+bounces-8541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC439F38B9
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B5E1648AE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11A9205E3B;
	Mon, 16 Dec 2024 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejjbYXb6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B65513CFBD;
	Mon, 16 Dec 2024 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373056; cv=none; b=W0OAW++z2qHBy+hpaAXPobRZmR+jw2vkGbn1dQwqxu9ro/kTopZSfpmuvx6G/L4WnITKWUaQZO4aizEZdFVuKcArUxtXngbRYTwAtv7R+S4whF6KWfWBDqjsbRHYgETjW3Ivkn6XCYfFuRJdEHtB5b4dQhjOJEzUDZfw4V+2eJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373056; c=relaxed/simple;
	bh=7hnRKzxF4z8TjEWmRea7e02TU2Gji2QwTAFcCU1sjz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=im0IxbPOQHO66as/JM1A+ntXnnsD7CtfZljAGVpFYlwZch6uDr6VQ6o9abThYGMFwZbasAPlFCYis4pC9Kjuli6wvFC7umtQoBKgg49IapDYmyazeTuAu1DiyIgukvIFDYgeA62ijnfMEc/V6tw8nbvEYeRUgqaBjiO1kWrIyLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejjbYXb6; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5160f1870f3so1279247e0c.0;
        Mon, 16 Dec 2024 10:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734373054; x=1734977854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbFSVLaI/+NJQ0pkmWzJ1MJfBPhELj+eGpn/eywq9TE=;
        b=ejjbYXb6zT1JlpgkcYBE7GlrCuf6it6ZGkGmpdxO3T8wepQFZKqtk+hg5OY9RRpuR5
         onwm2ozfjVE0c1JrvgNCCE5bJfsqlW+ijxYw4bf/n8w83AUotxjmdAMLbJpLXDFVHBJW
         qMrreC5fi6rmBnontPRinWJjZQO2+aJ6lhiA/luXjzujQA2cvbctGDKJiVYIEzNkXpco
         NZTlfGhfnIooTsl44UQmOj/TcpGoJ1ON17bzzhUrXuCZpRdnwXPWA5d+xW5yF8h2wXPt
         RgMQvKdiw8zQc62p2/WJe9+S1JxPns65m7CLI97qjsGLkdDTOVHc4obilzW3Sn1PAooX
         Y19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373054; x=1734977854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbFSVLaI/+NJQ0pkmWzJ1MJfBPhELj+eGpn/eywq9TE=;
        b=cNY+baT1rB9E2l8bQZOZmTEDOogbHYOv3lFfI0GQoPYMSy5P45I0nPklT7M8fWf2VJ
         pl1n64nQrY4ZcpxsMgdyIp48T+Bglt6ANW5hzrjJYpKupESiMl8oJ2FdWAoKBXlKil3F
         GJzFdLUFLazz8HZFkz2+xTd3DKbInSUwdoGW8pWgypsc6bGocNb0HjV4u2sFF+w+EtTm
         8m1yw70bNm/nNOwfGKp8MWVYQlVr5OCIAkStj4dd5IXqlBfEZ50E1XRxDLRbugn4mQEm
         QAlIvkecPdLEgg5kpq5/kByPy5D1CenMduLI+ymZdzwgrl6+c4eL1E/neQRk5NV/aMmT
         HEKg==
X-Forwarded-Encrypted: i=1; AJvYcCWbHBUXF2nuPpQkMhPEsQOMpVX2q35Ail7esLJlPtgruePEpR1x8V0Zdxc7G2R/1TWN9xNFjTyBzMu82zFdHKOf3N4=@vger.kernel.org, AJvYcCWvTzZqIBO13qKYfr2mR1mUoqUDCtDxxROJp2CR/3jXd/X3Q7JASOK0zPSo0HjT84LyIAw5bSb8xor7bn8+@vger.kernel.org, AJvYcCX5i5Ho3Ruw/KcOqJLSCObEg+7PPrcxFiUhlyntmAC9MOmbao0d5bA0CWsXYyOVfkbEbw2DQeLqQJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsBKQ0V4tc2Mmo4GjYZDQT2br4UZxjT74ERerQXOJMBiu7MWI
	81jWTcCGrVRZpnqHVcKuONNTJhE6dfcZni1LJKa99O1oQwvXnjMIrRia5Kd9qS9yR9Md6UT/iHD
	zVcC08XB8OYb+ARWFfd8d+fXFFyI=
X-Gm-Gg: ASbGncsv6vyQ1WUp7uFYqI0SGqNHUmB/aVqaLRm1aNi79G/y8CPby4Kn5OSgi2Et3rq
	A2zWm0zSeKDByUpYz3WYnN/MOgid0/hncnzvPvTD9UBRpU0SbrM4gnplqjrMCAXUaByIrUyU=
X-Google-Smtp-Source: AGHT+IH8oajWhXiC4jrk2pMLG9zRz2DuGBWMMHXrC6lojpJQGnHr9zTL4EXoTXq5ozNd52l8s89Qysntc88LexniuSY=
X-Received: by 2002:a05:6122:469e:b0:515:3bfb:d421 with SMTP id
 71dfb90a1353d-518ca1f8130mr13524111e0c.6.1734373053795; Mon, 16 Dec 2024
 10:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241213175828.909987-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXdNyTcwb4Tdg4r-QKkLewEDmHj8qovtL1Z_2_hOr4ZLw@mail.gmail.com>
In-Reply-To: <CAMuHMdXdNyTcwb4Tdg4r-QKkLewEDmHj8qovtL1Z_2_hOr4ZLw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 18:17:07 +0000
Message-ID: <CA+V-a8snQ37-PnUQX4zam8WiPAh3APOpEaMSkOD_xpVxCkhtZg@mail.gmail.com>
Subject: Re: [PATCH 5/9] i2c: riic: Make use of devres helper to request
 deasserted reset line
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

On Mon, Dec 16, 2024 at 3:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify the `riic_i2c_probe()` function by using the
> > `devm_reset_control_get_optional_exclusive_deasserted()` API to request=
 a
> > deasserted reset line. This eliminates the need to manually deassert th=
e
> > reset control and the additional cleanup.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -447,18 +442,10 @@ static int riic_i2c_probe(struct platform_device =
*pdev)
> >                 return dev_err_probe(dev, PTR_ERR(riic->clk),
> >                                      "missing controller clock");
> >
> > -       riic->rstc =3D devm_reset_control_get_optional_exclusive(dev, N=
ULL);
> > +       riic->rstc =3D devm_reset_control_get_optional_exclusive_deasse=
rted(dev, NULL);
> >         if (IS_ERR(riic->rstc))
> >                 return dev_err_probe(dev, PTR_ERR(riic->rstc),
> > -                                    "Error: missing reset ctrl\n");
> > -
> > -       ret =3D reset_control_deassert(riic->rstc);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret =3D devm_add_action_or_reset(dev, riic_reset_control_assert=
, riic->rstc);
> > -       if (ret)
> > -               return ret;
> > +                                    "Failed to acquire deasserted rese=
t control\n");
>
> "failed", as all other error messages start with a lower-case character.
> Perhaps drop the " control" from the message?
>
Sure, I will update the error message using `failed` and drop the `control`=
.

Cheers,
Prabhakar

