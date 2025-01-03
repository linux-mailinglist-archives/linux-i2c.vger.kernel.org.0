Return-Path: <linux-i2c+bounces-8880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5AA0080D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A6A3A3EE9
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFBF1F940B;
	Fri,  3 Jan 2025 10:48:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4D191F7C;
	Fri,  3 Jan 2025 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901294; cv=none; b=mKU+LE0n5vfBFGx99z3R4O2xKA8kxv2QJsku4Ki4gE2J5sGN2hUsDwE/a8wsiNyW2pNp9aXydTCRH77W0xFcCoOdM4KSoutqrC3ZtK+9vcRq/Noqli1SFgVrmHXJg99z5aEgVFPDdNaS308C9lmxz4b2ei4MJQe6f8SwLn9dbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901294; c=relaxed/simple;
	bh=jMPEiX23Xoxi7cTnRcQ1bMRKJZvGgSkBV3xvLwf1ZD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IX9Oh6h+AYU1/8ewgFw9mHvF3cl6C1QxtP9LypUP+YuZEyyuNaaup4JirvmmkrG7//8JMLajd8ntNPArvzyi+NbrmgBKDBdXPKimU15IiXK15uvL40ITV3e9rj0/afaEaZsLR4q4jOUt7Kk3+0JYQYaXPqgQgkzsQo6vRnS8CF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso5778701241.2;
        Fri, 03 Jan 2025 02:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901291; x=1736506091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAcAj/MqSC96a/EvlQ+UuWXNItDuIHW1FQXLhuR/orY=;
        b=sEv4MEEVxoa83/SeZSZFrGqAGPUjwFcyVhWWxh0t1NHmxQG6I/jS0fvm/3tUKIWZJ2
         q+Gv/HriudEFOLIj0eLtPlvHRLPvBwOQf9oiSHMa7QTCuHYXRn1BERVWn9RmafLmTI/n
         FGlOIhu6VearIjBi0m0LSQE021mTAakZaoP8IEQDd3UOgjfqjQnnrV3Qjm/GKGRcokTl
         1/SC7Ib50Vi3Dm/D9LpJw9UH+sWBpNfYVYo6hnRMXcIIKrEjv0iVao9ROflYO1QFaL36
         RdsCPRmfEV+jcQ8G0Csfpkzppaqi7E9wQgo7PYJszrLsOTeOhJriGwAyM7nYrCMu1C16
         dknQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQkMhrF3KzuUv/ZGbpSRuely9E2rIyneiLOMubRyofCJ+F8qp2KvO5iomPtox3nQ+jzBDSoydvRTkRQNo0@vger.kernel.org, AJvYcCUtF8x4BmJVob475GR2JGY6F+Zc6a3wkUxA1+AOMDX48k7BmCGPWrF36XsI/0wXVsa8C4w2/oRSMPQ=@vger.kernel.org, AJvYcCWD5BJyFw8rjWzLu92w45a9jEXi0F7f1N2S7wv+vVpK2Tj53cNdK+d5fRZ5WnOReNFkF6CRTRjkvO+611N/aLD9qW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhIiyCuq0Zg3A0m4D5famag/Lupe4/b9Fggd2c6mTYBDC0tkh
	re0O/57r4Txk3SVAmXSrqhdKNq8UC0JPN73Ma1GIRnxTeGQ36ML/AMftHFIVV+k=
X-Gm-Gg: ASbGncvXl9+V2IOOTzOnnqhUw+Q27P6JfrEehYK3qIV2DqlMH4XSq5lsAE8lkTLUun8
	37wGfW9brZciPse/IWhwjnxT4lneQM9iPyy5BErCoFbrBYjCS+w+jfn8ERgqLYLIDeK8qI30BYd
	GgarmBac4JMQk/qH4DLFFs//RSPo7mn7/RwJyKKEOU1l3eJltx6hNl7ecUH4hUjSkqoBrQkdrVU
	fzVd8IntGDVP9se//p8MqwGuknHIabEWcJmXV+Ml3zsp6hih6HJksq+UgHk0728i30ntlbob1O+
	jY3gydp6J8ZjaqTzFfE=
X-Google-Smtp-Source: AGHT+IGiM2TCu9x6FtzaSKFq8bn6iL7GEMKvv5MPCmtPuPaWMHHZov+2c/ocUxVRPMQnt7spIHIbEA==
X-Received: by 2002:a05:6102:3713:b0:4b2:5d65:2c7d with SMTP id ada2fe7eead31-4b2cc35fa74mr38435137137.8.1735901290785;
        Fri, 03 Jan 2025 02:48:10 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8ce8esm5624989137.24.2025.01.03.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 02:48:10 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso5275242241.3;
        Fri, 03 Jan 2025 02:48:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF1nNSpdGt7eMYf6+RZulwYbYXPETpcx5u5edLwUUxxjpBiHfBpZ6+ynYrp2RyeLvawjZYK8NZeYtCuMyWpn3R/VE=@vger.kernel.org, AJvYcCVXIBCEOqtAHhH0zkClsyFrbDTSfMzmpwMnhyS7cfbuHk/7w32JaFB5iBESZyNB8WJLrG9TuErMldg=@vger.kernel.org, AJvYcCWmRqKfhdzWfmCnazOEQQA7d32QWNar/t2bRRjw+w4Za8iUDnkTySYHBRNG8HhgdAx4+FOKcVz2q5EYzryk@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:4b2:5c4b:517d with SMTP id
 ada2fe7eead31-4b2cc361c72mr34951296137.10.1735901290194; Fri, 03 Jan 2025
 02:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250103091900.428729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250103091900.428729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 11:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJbdQybi6CBLQD1z1yF1t+C9LyowRnqAAnKV_=zs1Qjg@mail.gmail.com>
Message-ID: <CAMuHMdWJbdQybi6CBLQD1z1yF1t+C9LyowRnqAAnKV_=zs1Qjg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] i2c: riic: Introduce a separate variable for IRQ
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Fri, Jan 3, 2025 at 10:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the IRQ handling in riic_i2c_probe by introducing a local variab=
le
> `irq` to store IRQ numbers instead of assigning them to `ret`. This chang=
e
> improves code readability and clarity.
>
> Remove explicit error handling after `platform_get_irq()` since
> `devm_request_irq()` already handles such errors.

Where does it handle such errors?
I only found the following check in request_threaded_irq():

        desc =3D irq_to_desc(irq);
        if (!desc)
                return -EINVAL;

Although irq_to_desc() takes an unsigned int, it should indeed catch
invalid (negative) interrupt numbers, but the code above would not
propagate the correct error code (e.g. -EPROBE_DEFER).

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>


> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -464,11 +464,9 @@ static int riic_i2c_probe(struct platform_device *pd=
ev)
>                 return ret;
>
>         for (i =3D 0; i < ARRAY_SIZE(riic_irqs); i++) {
> -               ret =3D platform_get_irq(pdev, riic_irqs[i].res_num);
> -               if (ret < 0)
> -                       return ret;
> +               int irq =3D platform_get_irq(pdev, riic_irqs[i].res_num);

So I think you need to keep a check for irq < 0.

>
> -               ret =3D devm_request_irq(dev, ret, riic_irqs[i].isr,
> +               ret =3D devm_request_irq(dev, irq, riic_irqs[i].isr,
>                                        0, riic_irqs[i].name, riic);
>                 if (ret) {
>                         dev_err(dev, "failed to request irq %s\n", riic_i=
rqs[i].name);

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

