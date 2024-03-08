Return-Path: <linux-i2c+bounces-2300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EE876B56
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 20:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCFE21F220B9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 19:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC1A5A7B8;
	Fri,  8 Mar 2024 19:47:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5A58101;
	Fri,  8 Mar 2024 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709927254; cv=none; b=ckCN/4ZBGtH+KBrx1JQDeupo5blfuq3TIw0TVZTiQsOT9qvyXo11e85lxcrZVR8i06X4rlNt34dJTqoAodVnUGHKnMRygZ4Ltdp3IIW6graj9X8VnPTatF4URpLNNL4WVuLzX95BEAYV/iuZuDOfYRRJkBeQ3Uky3/NCSRQwEAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709927254; c=relaxed/simple;
	bh=O4xOZXNHe+mQx9qXAudERYPby8r6e7A7CB/hy3BpV8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bi/QVz/dhfDhgORQSngqcX3SzlZGxemMUd7U7SWjuu+kMqli9EKx6zgJidQZmKM+BTwmZvAEgVLWi3qFIwZferVtqxN4bO4efiADYK0UPu31k+watuGYmg38hYSXvyCrelMI6PyGfA2iOeLHTovRek5df9iGh8YddF6/XEWYtzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609f4155b76so18619697b3.1;
        Fri, 08 Mar 2024 11:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709927251; x=1710532051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty02So1zUpD5TmqGuHBaQOIfx7xbcqTEq1O0XtduwXI=;
        b=SGNgQF49DxT9gRq7uMaw+YYzJn+f+rGo93+q7eZVcoBebRNl4Nq3mBj32lSp1pNGTX
         NpuUuLkM9CMGJ6kyUpPnKiAd6ueCYoyTzCrmdJT/non+GKhPT6+BTV8uUpQRBTmVqA1X
         03gLar9I4bf0TjOmDWkxmBvoSUpF7nVUyYm0Ev9T20/K25hIxeJ/4N6qY/Mulec5OpaO
         hyxcEYS69g2YAN92Mw9cidXRrtFZgzPakzhec1hyhDnOGBqNhgKJwdO9DwSs/kXC+PCq
         bYqVl0eOnYkLyM5+xatR04U7xMs9EKkOJtgLZdr+IGlNwXFvVGZ+K/2dO+HOuu+3hpao
         aweg==
X-Forwarded-Encrypted: i=1; AJvYcCXruWLLWNo0o43z3zPpnwP90if158qW63TZSIaLEAlAkEPh+UVY5qIQ79T4MWJGIu2MKUidLunupxAM6nenxKU9h1JdWJQrBj3iUjuMznjHu2FTibGNCNJfU8ghkzVFNddvKLMw57HFyPZcD0eyPzkZrgGOG2vPSBYGTH9bBARZJbI49Y2XNJdnKAXDB21TzwN9W/5Iyf4NfCsrFj73/mGKEpwNMnv+
X-Gm-Message-State: AOJu0Yx3MxZy4DreazElT7VLJwkXMmwbTBjjmBICFTow+ebwa/AU1bnS
	eZJ0xemZ2hD4hS2YS4Ws9uFKLQ4YW3z6I7rRA4cfNpQlZrwviH3QZ638uT8hn7s=
X-Google-Smtp-Source: AGHT+IHT9xe7bm98X7yrDJyR78j0MigMCeoBhhVgkUhLeDGgJkBypZAeqqYCQyGrI7GDMaCdxQs5Og==
X-Received: by 2002:a81:a157:0:b0:60a:5b:7d71 with SMTP id y84-20020a81a157000000b0060a005b7d71mr208641ywg.28.1709927250640;
        Fri, 08 Mar 2024 11:47:30 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id r83-20020a0de856000000b00609f45c6b89sm22764ywe.88.2024.03.08.11.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 11:47:30 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609f1b77728so22480377b3.3;
        Fri, 08 Mar 2024 11:47:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzMo3H9ZRuXSKJpdnlxGmy8iLw1moBs6G6031vehlU9HPlebr9U4amkBhZUYssUpLPVycqmUt/ZHWwoXd4aNlWzSYGTn53fWP9MkoNapkrj7QGSYLilClhp8MRYuhffDBqAmfZAIfymVefTi8Ag5iKh2Yd1Fm5RDe3jmev1u/0YlR8oC7JsFNhPgEUIZWq2fSn5hh4pH0kIw8hbLrRUW129Q67s2UN
X-Received: by 2002:a25:cd05:0:b0:dcf:3ef5:4d30 with SMTP id
 d5-20020a25cd05000000b00dcf3ef54d30mr18075109ybf.17.1709927249774; Fri, 08
 Mar 2024 11:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240308172726.225357-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240308172726.225357-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Mar 2024 20:47:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW56ihcdZE_=y5MgURbmFjuPXkVjnHtA8HZ+BWznrvTXA@mail.gmail.com>
Message-ID: <CAMuHMdW56ihcdZE_=y5MgURbmFjuPXkVjnHtA8HZ+BWznrvTXA@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: riic: Introduce helper functions for I2C
 read/write operations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Mar 8, 2024 at 6:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce helper functions for performing I2C read and write operations
> in the RIIC driver.
>
> These helper functions lay the groundwork for adding support for the
> RZ/V2H SoC. This is essential because the register offsets for the RZ/V2H
> SoC differ from those of the RZ/A SoC. By abstracting the read and write
> operations, we can seamlessly adapt the driver to support different SoC
> variants without extensive modifications.
>
> This patch is part of the preparation process for integrating support for
> the RZ/V2H SoC into the RIIC driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -105,9 +105,19 @@ struct riic_irq_desc {
>         char *name;
>  };
>
> +static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 off=
set)

Having "riic" in the middle is definitely the wrong order of parameters ;-)
Please make "riic" the first parameter.

> +{
> +       writeb(val, riic->base + offset);
> +}
> +
> +static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)
> +{
> +       return readb(riic->base + offset);
> +}


> -       writeb(0, riic->base + RIIC_ICSR2);
> +       riic_writeb_reg(0, riic, RIIC_ICSR2);

This clearly shows that the new accessors involve more typing work.
Why not just call them riic_writeb() and riic_readb()?

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

