Return-Path: <linux-i2c+bounces-8529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF99F3561
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19E7C188A188
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8123814A4D4;
	Mon, 16 Dec 2024 16:09:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501F13B2AF;
	Mon, 16 Dec 2024 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734365379; cv=none; b=R/u2hdYGW9abpRCobuy7ukXwSMnzop6tGiGeceuFfEmHH9HlnZEu99GXTkKoKJXJ8218oxr2w9uMybvTWwLmbiqEw4LqSJtt1S6YTrYzSXOZUbF0Z/TXz9unuWagZHaV3fXw1YpBVgkLA/AWOi30FX8rOh+tSXl+Y3adWdJKAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734365379; c=relaxed/simple;
	bh=+f7ii+gax4V44YgbhK/O8a/lotMIo0sZ4LujF0shVbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSxN/JVpVML80usI4wPa6yhLBlPBeaOn8O0nfQJfF0gYvQSLI36YXNnRSJ8sL2Vj2dVR4Xm6BKym7lK2JEsiSXV5TigBHqRaDI54kUibwUV9A7/OFf76pUmAA84bLLjiJujgHOzP4ePq3e930r7kLp5LwFuXEf0dtSF+6QHvLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d918f066c1so22305116d6.2;
        Mon, 16 Dec 2024 08:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365376; x=1734970176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLgApYlGPqs1NjC9q6dePArqCqRbwzwTGI6deXwORmk=;
        b=gF592cW1Xd3UqApzPE067OKKVSmP7wiAfT/LPS5czvsdtK2Czg9RPPYD74/y70SWGu
         cd7FaQ21efIoS7/a28xc61OQlVTY4A2abEFLx44W9H4DAn50DtvWqdyqKaw3eAX3ac/w
         7ldHEKQLY7WqpkvwNHEMoR7A26IgQLx45HCVfgGaxIIw6K/EbSO2k4r4SjT4tfVcTRTg
         I0e4Xswnz+TknrHY2JWcnUNiffSCMTldnY0CyGfzFROnJbI6rk8V9cLVJJGd6acE/yAR
         sy4MGiHZVEmUHPwSjCzAiHU+UFRb8cgARS2YZLVrTiKB+wt6rtVyYL65xhz8baccdhIR
         m1uw==
X-Forwarded-Encrypted: i=1; AJvYcCW4uqXqjNRX2KG/4SA0wNmHZFpTuGBxT0tIp5SRw3nBmpqOdd6sbNWTd0HgxbGpOK5YU+DvbavYYUg=@vger.kernel.org, AJvYcCWECVIanS5oHP4VJA+zidmAg6GLeXqRUflG97Sn4ecuRsfdb5pqzp7N1P0tGu1pZTthaphubY5yV9TG8kDljxFXNxI=@vger.kernel.org, AJvYcCXFlpnTqJSE8Wz2loD9Hm/dXIGfRPHNhyS18tWYGayQhSR4maIo1oKUR0+2Sl2k38wtRxujT5dI9U8wX4vv@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGdNVUEBBq9LiXose0JNUcd5hovl/KYm8Mk6lBVDDE1HR9++I
	XL4nbnZsm/M3TDcIEOGHUV0030XQ8FyiirfgmaOAbxryXiSP+M8OsjUb/LWT
X-Gm-Gg: ASbGncvbOTjAKyTIJZBOXcRt4itvSkLzkY/sP/gnEtklI/wc2KRaCAKQThC+nq1avzm
	wnJ4MopBtR8HWgg1rjW+bINjJMLZcO7gFzVooOInBWidaU7j94wYdidseoowgKDOBBK6NN9ZNV1
	Usr4IT+7GXkYDIWqhD5yDubXEIdBNpjv3cFom3I5DXaOi0zJOjeOM7/SDofOCqplE3VPpP75Bn4
	hUf+oPOPxFrOxJRnLouLj1GdGh90q4JWOZGG2bq2rSuL/lEOt89TGQNTD2EYgP5vXw6y+sterQM
	gId0z1TQpV2xbVT4LRJ5jeU=
X-Google-Smtp-Source: AGHT+IE94fN7nvaivhS8g8+Ep0yH3DBv1GPrcfIKiel0G61A3UTp/0mzcwpbo7+3LYygpbiUJ5tpLg==
X-Received: by 2002:a05:6214:4006:b0:6d1:87f7:2924 with SMTP id 6a1803df08f44-6dc9685152dmr264275476d6.47.1734365376288;
        Mon, 16 Dec 2024 08:09:36 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a9c21sm28703396d6.128.2024.12.16.08.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:09:36 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6c3629816so179864385a.1;
        Mon, 16 Dec 2024 08:09:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkvcxEOlNdqYa8GsjbQBWdd75DawdFgHStTl9Z9zdvIZ1o/ZiTZwW6IcTO8XQmq6VE/hC78LBU5EMKRhJ7@vger.kernel.org, AJvYcCX+Er9GBD2iKogDMIzai1UYfvfHfV1Gd2sqshb4iyxL8Gf5c9P1EMz0qttqym1R/8NG8eRvcbXTlEo=@vger.kernel.org, AJvYcCXJpIDL9ElOiLtBmKJF47Bu6akm2bCST1P6c2sonGSShqhL0WyPfkWM9BdlTa0j+KSX+6+WhzmSpBioU1eN+6yCIFc=@vger.kernel.org
X-Received: by 2002:a05:620a:4494:b0:7b6:5d83:123e with SMTP id
 af79cd13be357-7b6fbf459a4mr1991746185a.54.1734365375755; Mon, 16 Dec 2024
 08:09:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:09:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com>
Message-ID: <CAMuHMdWudD=AB9WKB8qYj8zoDVX+sCH+RyyjHEhU2DD=0Y++aA@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a new `riic_bus_barrier()` function to verify bus availability
> before initiating an I2C transfer. This function enhances the bus
> arbitration check by ensuring that the SDA and SCL lines are not held low=
,
> in addition to checking the BBSY flag using `readb_poll_timeout()`.
>
> Previously, only the BBSY flag was checked to determine bus availability.
> However, it is possible for the SDA line to remain low even when BBSY =3D=
 0.
> This new implementation performs an additional check on the SDA and SCL
> lines to avoid potential bus contention issues.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c

> @@ -135,6 +138,27 @@ static inline void riic_clear_set_bit(struct riic_de=
v *riic, u8 clear, u8 set, u
>         riic_writeb(riic, (riic_readb(riic, reg) & ~clear) | set, reg);
>  }
>
> +static int riic_bus_barrier(struct riic_dev *riic)
> +{
> +       int ret;
> +       u8 val;
> +
> +       /*
> +        * The SDA line can still be low even when BBSY =3D 0. Therefore,=
 after checking
> +        * the BBSY flag, also verify that the SDA and SCL lines are not =
being held low.
> +        */
> +       ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICC=
R2], val,
> +                                !(val & ICCR2_BBSY), 10, riic->adapter.t=
imeout);
> +       if (ret)
> +               return -EBUSY;
> +
> +       if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
> +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))

Surely you can read the register once, and check both bits?

> +               return -EBUSY;
> +
> +       return 0;
> +}
> +
>  static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], in=
t num)
>  {
>         struct riic_dev *riic =3D i2c_get_adapdata(adap);

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

