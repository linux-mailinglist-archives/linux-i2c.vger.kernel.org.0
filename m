Return-Path: <linux-i2c+bounces-11267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D169AD033D
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 184493AE9EB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ABD289356;
	Fri,  6 Jun 2025 13:32:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205EF2F2E;
	Fri,  6 Jun 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216733; cv=none; b=Tnlttf9z/fGCU3KM45pjIhFu+Kw9yvhscnlYSXifmrmeiT94qPCmEtCBV6M1T2KXhn86jLxiSu2uz1M2/awyelDfsX45JIxlhTffNFBhOR19WsxAf91fTPQjLEExhq3PESVcGQZvQ/Zu/dE7BNOIDObGqaeYgcUx6L3ZM4BGJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216733; c=relaxed/simple;
	bh=rDhuXebl9LfoDzStrAyuudg6kEWfHwfevtQnt6H057M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kw9Rf61U9wkAQF/Dx/KTpqJsWqxpsmNoD38pYdyAemqeyZuagr8Ba9Lmfh3+5G1MI3tx67CdqCJTmFqgBJJ1YGOM7crrXSMUBxAlL52m8Y8Aoj3Whe8osYY/VgixmWSRbbqTXwNa+8GnAiKM06XIG3vM4eDk8M2JeY4lbkwkzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a43d2d5569so26049341cf.0;
        Fri, 06 Jun 2025 06:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216730; x=1749821530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDtNol4Z+GeSmVmtFuSAOZHVVS18b4JA8DnUVIUdu24=;
        b=glB1ZN3KQB1Xiz3sG7Y2ENUl5+rKrut4MAlLTOk+JLiZbX/iJgfZQ+dydWAULZgHbr
         KssW512vHZU+bsJI6EKTw/KKK7N2eztEsqLojzx0FjpLgkYRJ0pocyNr175ZVNW9X13v
         BinPLhcCCjztzIGkBSIZKqVuAxaHoKwzTlNmgwCEI9/smpngdFMmwm2K62Q8QPX2LwLA
         amBlCe9xiIAFnJHVStbrLpFqtRXxriPSXvHwuI4oAX3EyESLGFcGDoyhxBGk7kkpjUWv
         FWWPfa0dF7m31gUBKgO7Ju5BJAnk+Sdnin/N0jf638KaHQDl34rkRjAhXrcWvPyud8M4
         eaLA==
X-Forwarded-Encrypted: i=1; AJvYcCUEjy6fRM9h1vKpU6AfngZk/EmMlXLYLdaWdf/CFyLLrWapkRuAmH4FNx8Ovg8q0fmtFQZslq2IJU5Moe0Y@vger.kernel.org, AJvYcCWKz5rKeNp8kBKozaipJ8D+mXxnkObmMTQ/PHBKdLm+bnrHkMw4/piw797bwFVP5qxHOF+4lxoN+6QfIjqW1nAyBKc=@vger.kernel.org, AJvYcCX3P+l6w9EbCAbypOBmjvWBtvx5LrLKwki+vwRNV/kqRX2RHxBNi05QElpvTHZ910GqsQqa5AeZq2Of@vger.kernel.org, AJvYcCX65bSQSX/R3ygBD/2RX/CzIuOGgh9r/lCCq/SStWmPcR9h27VImm0nkrKvVG+9Gc2l0l7PgIfv3fYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyfq1jV6w5gZh9n7zvZxBV6mSistDtVrpmrPZopK0+TsFsGEtF
	Kpe0mLybMkz2fXdGKNEX6ZfeGTtmynxNpYyzxLyWdgDPqsKSrkB/44kA+S3gkXOB
X-Gm-Gg: ASbGncuLzNCDZplbs5oBRrUKSk82b8We5a8bokRQ4D3m25qRKxrnZj6beLGuzgSpJ9M
	B4o+LchxxtA5RDjPjLrnQ8lJj52IxrseITesuZKj6zE0n/UshMOkQZUwx7eOI5hlw4jEm8+lX7z
	px+V0lMt4a5+CJJ5jACy7O9ndnN6jQCfgqGGgPxca3pA7kvgbZFUc71gg6D0kpmw2yTrb18CFmV
	xpVXt+mM5g94sSY8V30Jkzx/gmdYgphiLtR2vsywIlZF2yAxJvvRLSvzXRAYDvDt6RJrOKfvjN4
	RQx7las2BTB0CFGhmF/B0IhB3sXdEDtcIyEoDJtTTLDFXXGdtjfyB7GbF6AkrxyTZbSeJsPVZVY
	Ye/mFyKmOaNEe5HsX1MR/+wwEc9HJd+Sa2UPJBTw=
X-Google-Smtp-Source: AGHT+IHXY6E3zBR6z0gcyqUkpE40OHp3HzckSuyUnmS9XnM8THApTgx2xRpW3NXJEopXhhAgFTHZuw==
X-Received: by 2002:a05:622a:4293:b0:497:6a94:dba0 with SMTP id d75a77b69052e-4a5b9d325f1mr49826651cf.25.1749216729537;
        Fri, 06 Jun 2025 06:32:09 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a61116b81asm12917071cf.21.2025.06.06.06.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:32:08 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d09b0a5009so206391685a.1;
        Fri, 06 Jun 2025 06:32:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoBUBpwBjPBG5waqIu8p2X/JHvFmJUgs2A4GTKPb97h4YWXU0NnrRyaTKdppLesOO8gl74B3NugPyinX6w@vger.kernel.org, AJvYcCWkRHq7tZQX15QF3snABw3C3CIXRqx7ZjhK3pKH1H4AuxRrwE53pK9c0RccOBDWSdeWXAinJf4CuVoZHDwYikd65E4=@vger.kernel.org, AJvYcCX7HKBVUyT4Xi7hI240gIDVCKHEnhTEaHPtJM065KGV80te8EH7Jwj8RIn+gtf8f660kWC3Z8Udf1ur@vger.kernel.org, AJvYcCXLAb3utE2AgsDnUNMWLvFWQIE9jXuPCHSHnK3CTbxO7ZqtV93mbYs9NPIyc6TOvP1xzfgtP70T8hI9@vger.kernel.org
X-Received: by 2002:a05:620a:24d5:b0:7c7:a5cb:2b65 with SMTP id
 af79cd13be357-7d2298ad9f1mr465138785a.26.1749216728311; Fri, 06 Jun 2025
 06:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:31:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX61j-6_GwnibUs-m0ASm5JGhGGzLe6i41vjcz1ouZUjQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMLlrc8WWZ659b2wYy_2MgUzXn1Vl-0zrZy5LFvjpEPaA4YkZ5mevdJ28
Message-ID: <CAMuHMdX61j-6_GwnibUs-m0ASm5JGhGGzLe6i41vjcz1ouZUjQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] i2c: riic: Add support for RZ/T2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the Renesas RZ/T2H (R9A09G077) SoC, which features a
> different interrupt layout for the RIIC controller. Unlike other SoCs
> with individual error interrupts, RZ/T2H uses a combined error interrupt
> (EEI).
>
> Introduce a new IRQ descriptor table for RZ/T2H, along with a custom
> ISR (`riic_eei_isr`) to handle STOP and NACK detection from the shared
> interrupt.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -326,6 +327,19 @@ static irqreturn_t riic_stop_isr(int irq, void *data)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t riic_eei_isr(int irq, void *data)
> +{
> +       u8 icsr2 = riic_readb(data, RIIC_ICSR2);
> +
> +       if (icsr2 & ICSR2_NACKF)
> +               return riic_tend_isr(irq, data);
> +
> +       if (icsr2 & ICSR2_STOP)
> +               return riic_stop_isr(irq, data);

Just wondering: can both ICSR2_NACKF and ICSR2_STOP be set?
As riic_tend_isr() clears only ICSR2_NACKF, while riic_stop_isr()
clears all bits, the two calls could be chained, if needed.

> +
> +       return IRQ_NONE;
> +}
> +
>  static u32 riic_func(struct i2c_adapter *adap)
>  {
>         return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

