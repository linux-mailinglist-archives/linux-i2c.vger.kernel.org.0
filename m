Return-Path: <linux-i2c+bounces-8900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C812CA00BDA
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 17:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ADC216452B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 16:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE3F1FAC54;
	Fri,  3 Jan 2025 16:09:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9461C9DF0;
	Fri,  3 Jan 2025 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735920557; cv=none; b=SaMvNfRI1wpqC+8dZ2EB91597Ku4TVbGC9XtfAHBFLrqAWox5El31tJ6g1k/+EHq2v5nlT4P01KYUsJZRHb6AgASg6B3l+619D++3k3QCT8WqPUM0BAx8qUgSHviIVHj5Y6so3LAy5eCbgwmVUacbIWC+yu69DyzcCrbRIak/Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735920557; c=relaxed/simple;
	bh=3s35AclnxaIpa54Zz9QP5JDtcJ/ntfUu7jpucoLYlOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+AHBsYyi/Mhb+/aXpJHCGT5Ks9XwcieMTeII+vJD964RCMDd6PyeAvtcqL8lMn1viNnOzJAJN9I2NnT6v0lr/0UQq6QToefvwh8UX26808SoBQJmmFlEx/EfoLvaPaEDNjpVU1YVEhDdLmb6/Qinu3vsiArcfGXUoAOPgiZ3v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b9bc648736so1002450885a.1;
        Fri, 03 Jan 2025 08:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735920553; x=1736525353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxQNd8HpnHby0FU4BZW1c9BIHCFGgTSw5FwqnxQ06/I=;
        b=dGMjhatWf//Mk2vhiWMofjjS5GgcmJUrytZ6TynYGfSLYxwDwxiI53fRLFEiMrBogS
         JcvHNuHW/VtMcIVntCWHz+uNqH2RpDlBBEhb9dROTvTI2owdaBzpi9fle2lATolySOwW
         c1Iy2iEueZuHuUk6DHqYlb710RFNY4n9DYzagOi00KRY4SfkNa4nL9N3XLnIK4AYEl0x
         ebjLVTuxuLkytLWtjJ9JjkWnOcBWslFJmHVVH62CcCstusksJtFEeb0yTg5CWSXV2ekX
         WzQC+MC1E2GZTL/Fi3HkSgF7MhwQu6tIleEyxSiIK2wugo60KJuy/uci4N6QuILum/27
         EC+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDRNs3KJ7dxJ8fyoQRt+GL3bt7s/EUoocW2hxv1jupHUjT6S9R/PAzPdzNxL3E+/jeD/OZlBTYCVrWJsYH@vger.kernel.org, AJvYcCUhdVvvaoeb3eajHmyyOpxcFyQ8uu8JwJSJX6jNZP50K9q34BeL4RmKBPyxDsdN/R73k9fj2bm6+ME=@vger.kernel.org, AJvYcCWfWimikPvDRftk7+Sq0R7oOvfy20aU7L6xaMyUvPEG5Epcq7M5zSyeGJeP/FnbK7wuo3SDm9sDitl+ehm27NVtXfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19dn0OGtjStVzLslxQyPuitcplpbi1BWetvqwQJcPiktXNtcg
	CKEX3YQ363BXlDQ0kFZleRBSCx5zEnMoJfQUbNW60tRKbrWVv69EjD4gf0JGPYQ=
X-Gm-Gg: ASbGncvVvFZ7cINHid5LcTnAlHlJycFNtrmyxiCiocxjxPZZ4sxHm2MwkgsT7BTgThQ
	pUf8aHqrq0cR//reRGhRgOOWyTw433wCJP8H6Q2xFk1ZGT2Eu7O/7zYD+yUi9dBMJra+OvQwAO4
	OWi5GTChijwJ18qhq0IAyIQ+qIliTxdPE7hOpXt0kwCzDiaFig1mR3Ff3dGizn7Zp2AkjsF92d6
	6YeuW9b0WnvBvCp44sGCVbZt7rnCDwkqCPVSQUOsL5hUylpnaUEAetQXqpA8CZ+uivqAuAJZrgN
	gu2ne6fGFg4/AnL+pEZkJiY=
X-Google-Smtp-Source: AGHT+IEmrKHGz/C1A3WTujAB3u0mVfOanf0XuaBvgLzLocbvCIXf4FKiE5BXCA7sm+1qqyFxw8+xZA==
X-Received: by 2002:a05:620a:2449:b0:7b6:f31a:7804 with SMTP id af79cd13be357-7b9ba716d84mr7375854585a.9.1735920552768;
        Fri, 03 Jan 2025 08:09:12 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2ce6f6sm1276601385a.27.2025.01.03.08.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 08:09:12 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f0afda3fso1232997185a.2;
        Fri, 03 Jan 2025 08:09:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlhQEA0H8xY44aPSTtmF27NoQfpxeDEBi7Y/HTboMHD3BsHAL72sZfzh+Yk7E99JOzH7/IuZtArwVojj1E@vger.kernel.org, AJvYcCVpAjmpYluxWwvyLy6j6Nlcy+ICf6C9uzyfueqemgq4s3c6mEx4AVWV3IuymzOkwrU4dWRH59o4+4xZEPuwPRpMALc=@vger.kernel.org, AJvYcCXyUzmEFDnZcKFutGQAhLtAeAilcA4X3klWlZXfj+DmkwCcgg6/jl1T5YlpSBgFB1FHy3fWbzXOJ+w=@vger.kernel.org
X-Received: by 2002:a05:620a:2492:b0:7ad:832a:4063 with SMTP id
 af79cd13be357-7b9ba716ab4mr8474422585a.7.1735920551818; Fri, 03 Jan 2025
 08:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250103091900.428729-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250103091900.428729-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 17:09:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-1j0aN9Ko3oUnRZ363wiy84ZVDoV4ZsS4xTLn+u3tKw@mail.gmail.com>
Message-ID: <CAMuHMdV-1j0aN9Ko3oUnRZ363wiy84ZVDoV4ZsS4xTLn+u3tKw@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Jan 3, 2025 at 10:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> v3->v4
> - Propogated error code when readb_poll_timeout() failed
> - I've kept the RB/TB tags as the changes were minimal.

OK.

+ you removed a superfluous initialization of riic->err (last change below)=
.

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -149,13 +173,11 @@ static int riic_xfer(struct i2c_adapter *adap, stru=
ct i2c_msg msgs[], int num)
>         if (ret)
>                 return ret;
>
> -       if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
> -               riic->err =3D -EBUSY;
> +       riic->err =3D riic_bus_barrier(riic);
> +       if (riic->err)
>                 goto out;
> -       }
>
>         reinit_completion(&riic->msg_done);
> -       riic->err =3D 0;
>
>         riic_writeb(riic, 0, RIIC_ICSR2);
>

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

