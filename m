Return-Path: <linux-i2c+bounces-8847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AD9FF3EF
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2025 13:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DEBC3A2833
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2025 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2E1E0DDF;
	Wed,  1 Jan 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2V+TIWa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1D3A1CD;
	Wed,  1 Jan 2025 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735733487; cv=none; b=nWa6jcUlRvK1fOr04ErfBq6E5JnU40KLbr5F5AvFPR7EhMmAeArRlp9EpBzYewQ0102G7g3Fj3bEUs67XfBJFKDmn3bpR4PObXzBxjXz5riw/6qjVkDH6cws4sSc09zv5djkvaeBB5EH/NDeAQX4+jSgJT56nVMueTauZRLY+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735733487; c=relaxed/simple;
	bh=Oz7gKXe7a3QEY0vRx+A/7GdXBb1qnkgZgAb3jcav0lU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfMeJtKTH6GWw5wefJ9e8qfeAEqeaR4sA5dkRVWgeuCyWObyChtsocsvQA6u6IMR7wmOm1sbxr3Rp5Po9xBw732p6BlYml9O+p2wvlyWCLueudUjriUik1EyWrs+AUSPoG/rLlxZ6oCbE+gC1fIfmXZFuT40q40YbnyfpAHMiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2V+TIWa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso69538655e9.3;
        Wed, 01 Jan 2025 04:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735733484; x=1736338284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFdvfXeI+AxT5HLi4EcIiHzcO/MZa3wVZqBRQ3G98lg=;
        b=a2V+TIWaRc9p+x2+Uc5AChoRLFjxuhbfRdkKXNrkbwY8TCeYHWrxUDnWjapQN1XIxT
         o3JNiez7MvvYnpyia7ExGJDN6iTkxuGBgFBwLGOJP529XA6jnlurjXlfeVDrkaecVxJ0
         tG+kEnquBaIgZPLcSfk5HZIcNxUP8mAcDFJgcmanaaBxVfiMRg+tq2zxJDfo/Q3WpgYH
         h/CzYYTHlff3w6sMR/m/sXEFCHnqi77VfxCytxFK3Feuw3wYam7tnySLthxo4bQKh2EY
         EfCVbRDs4QhjAblibtXCnS3I0sMqIV9bfqHqa1ZwT81s3aYzouukzfExQDuexZ1qzJ4H
         wzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735733484; x=1736338284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFdvfXeI+AxT5HLi4EcIiHzcO/MZa3wVZqBRQ3G98lg=;
        b=qp3JDbhYooHR6KCT31fNg3G4p5tPXrjEwvtKxTcxxgHjoxh4RCY48nu+2eSen5ydaf
         vzm5YJlsoqBYA4RrguRy8vDNlG0r17GMpGMmhaF07dp+xxjGGn889R3nm0ZYhBS/JDrc
         XtsPyOSWBKvPOZvfOCnFap2CsS94SVfNCLxyQ23/07zqWTpi4cREd/z588Zb+fO96VQz
         FOHP05pnE2qyrpxySLy0jcVi5dmhaR5QqXhV/8pT4PPvU15qnWgXQ1GK3sKcdrOzbCsU
         9gNX582/OLnnEPzF2SG1jeRlUs27f15JyJ3urnHuEj+1Cju6gAnNqAQmWQxNIq4DEwH4
         mTJw==
X-Forwarded-Encrypted: i=1; AJvYcCUcMfTMIjvuEbOGdRPOqAlaWbus3aRkMmSsJ7AJ3aKeeKmOece3B0UW9ikVdHnVbzZvYPLMFd3jPaI=@vger.kernel.org, AJvYcCVclYqFRGx7SllrZU3lkpM6mDWLu7Wvn0pXmsdhpiQpyEZ3pMLSP6onuLD2x+efrzqAt+70x4TJbObrtx5y@vger.kernel.org, AJvYcCVgIdGFwgZmQGHaofADkWySvQl7skcaB7VF89JguKYK32LZ2MylGcEjvOKkXuCbVPEvfJS0WI33+0KINGU22rCFOCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlaje7C00IGJYZDo54wmhAUEjGqRIZOUnJWqMIGiaFqxiW5Rfp
	9xjAqJEcX9nrlnX+StWoZYKldzfrNqocNG2Zq4AcvTNnDK5UZBrIGhDjrg==
X-Gm-Gg: ASbGncuanG2wGvMrRjdwkw/9jtoO6DGy5w7KfbSeToJLA+TZ7WPBsZr5aGjVWJT3zRw
	v7iShwcJA/i7yu/GVsveSfLkoDk9NZ9AI3BoMyBUSKU8uwPF6cQH6FL0bX2Tkn0LZUy7wJtQ0CI
	guC7S85mMaDYlhLbojdYqRmyDe241LFOVbuilCkg6yIOnxh3YxaGZNr7Ma7DzrxZ00DY+7g4eFz
	twI7Q1duDqZcZ8OdTA1qlVG+lIiMrTJeUAh/jOGXIKoeUlTG1vwQHWiwbkzD5KUxZE0h3tO5tsJ
	P8ZwojoQqp8cYhgqfhLO9qs=
X-Google-Smtp-Source: AGHT+IEerbd9E2mgW1yzUEPQtSM6HTET8hI4JwOAClM1XuKF4QW3firpdmcPFievAEtiKggNxKRLUg==
X-Received: by 2002:a05:6000:1f84:b0:385:f349:ffef with SMTP id ffacd0b85a97d-38a223ffa57mr29295105f8f.41.1735733484223;
        Wed, 01 Jan 2025 04:11:24 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm452183925e9.27.2025.01.01.04.11.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 04:11:23 -0800 (PST)
Date: Wed, 1 Jan 2025 12:11:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti
 <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 4/8] i2c: riic: Use GENMASK() macro for bitmask
 definitions
Message-ID: <20250101121122.3c3a8e0a@dsl-u17-10>
In-Reply-To: <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Dec 2024 11:51:50 +0000
Prabhakar <prabhakar.csengg@gmail.com> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> v2->v3
> - Collected RB and tested tags
> 
> v1->v2
> - Collected RB tag from Geert
> ---
>  drivers/i2c/busses/i2c-riic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 954e066d61a8..ddae4b74a86b 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -55,7 +55,7 @@
>  #define ICCR2_RS	BIT(2)
>  #define ICCR2_ST	BIT(1)
>  
> -#define ICMR1_CKS_MASK	0x70
> +#define ICMR1_CKS_MASK	GENMASK(6, 4)
>  #define ICMR1_BCWP	BIT(3)
>  #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)

I'm really not at all sure how this makes it 'more readable'.
Call me 'old fashioned' but I like hex constants - especially for bytes.
In this case it might be best to be consistent with the hardware datasheet.

Pretty much the only time I've actually used anything like BIT() was
for a spec that numbered the bits from 1 to 32 with bit 1 being the most
significant.

>  
> @@ -73,7 +73,7 @@
>  
>  #define ICSR2_NACKF	BIT(4)
>  
> -#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
> +#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */

	'Should all be set on writes' ?

	David

>  
>  #define RIIC_INIT_MSG	-1
>  


