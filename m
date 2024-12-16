Return-Path: <linux-i2c+bounces-8526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB49F3515
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD92161927
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AAD1494D4;
	Mon, 16 Dec 2024 15:56:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71C84A5E;
	Mon, 16 Dec 2024 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364594; cv=none; b=ODLL+JD7NImKIIIzImFDxVA9xjP+5saT61OgIYbrsTLSoCeZRNSo68DHTQ4/YYAVjY91oDHqkbyvkLX8HU/gOZZYH5kYW59G4GAz83Snrp3+CRMV6wKdivW8gkIq/1PHuGQl0n7Uqz9hKdGJMe2/3ZHZ4T+uPdX24Ku0x8+fukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364594; c=relaxed/simple;
	bh=Ow0c9kPDhT6pNowAlxkI0gHnxRhRQHv5ASQTiv8g124=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fN/qvhXijgxRDQuTboNu7URcEQW9dO7B3/e6xtNIyO5cpuu1Gh3DsYAt+uZEyWCQtj9mlZktSQnbGKoPaj8K20EdyqjD7+yEBsDz6qDSqcC0yQj1yfBKAvcTmPL273UxMnMSy4DyyIvhxVb3ePzCPY51ejvoBxysmwTlwpe/lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-518799f2828so2226267e0c.0;
        Mon, 16 Dec 2024 07:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364591; x=1734969391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77zeHGoE8RWx5kfLcJgFkdi/Mfmk+nkTuhojOOqLYzs=;
        b=au6I1p+Qch6r8ZTlB6lNPmyO33FEEfZ2B3xADroyzTsei2UF7BJZqRIC0+SuRXONFR
         M5gAFBTTL+Lq+pbS06OoeXZpj9IN47E1w7NxSOrFa9WBs/uFv7MepH18TNKkq69jK54W
         22E7UUbayFkXJZJwztnlKzXmkSKBZqRnTi4sYT8veoSUvilums1I/S6OjtjJMenkjg0N
         i3OBwlOBqjB696IZZY8ygnkJiKyjNI227Jqy0lIoONWzwXq/N/Ye2jDHL4R5g/Hn239E
         8W61Dk5Xh4xyEtPgUa1SKr65eKmBpgo3IY8QgOg2z8Bh+1mSwKKNeKawhSqYrrByJamp
         9Fqw==
X-Forwarded-Encrypted: i=1; AJvYcCVDd7zo6Xw5xTH2dakodrzAmUCB7tWHNXhyhp96fsbURDTJ2iGWf3e1PetMaXZqYGjIYL9po0t53iE9zJC9prvCYbk=@vger.kernel.org, AJvYcCVPZFLtkw28B1u+1IA/r4UnVrVdaMyQ9mPoxADpgV5382T5ovb1uZa2W8npU0MfHY4il4YJpHmwBRZZhs8G@vger.kernel.org, AJvYcCWyblXSryoyhk/l9RSy8O3+tNk4G0x8cMar0ChWQvhnmL8m9Jv9CxH8yqLmqgBD0wATKeEZyC+zwcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5fxj9Fjz/3GnOPrS4FioOz4xmOGHRxIfGvOeeJdDHYnBDGfD
	ZyxoH6btIKYr46dL1HbbaFLNERyTE2ccKsuJ6/984ep0lnqOn6SedtYqmsdj
X-Gm-Gg: ASbGnctSn3T1/5xy7w79WdpfP31oh/VL858drQ/9aLjZ3Pwx4ce+t64b+pWT1K3G5NA
	fibbTRVNzyiKyggwcFdLtHuqlOqjDvkxgTAGiRfpAd7MWRWgM3wZH73z4e1638Tnw6sIEDfa0gx
	tXKsujm4yuiF+ss80GIE1HknvEj8IWLviFuv68xLFY/fadNWs0F85zIgzIYXl/8OHPAf3USaArk
	hWxYzm/t00h5AAb8oZjUN/qVZEJbQQAAETsj1hb3k447v6wvPZCpfKo8MSg16oSG4TM/ayXW+if
	oZa2NcKQMy5WDwZ6IXI=
X-Google-Smtp-Source: AGHT+IHPqLKCzqh+fAr1kH7ptHIYFynyJRRnbQDVT3Tio9GiGtd/3+atYgVNo8sXjVwVgBN+J6yNxw==
X-Received: by 2002:a05:6122:7c6:b0:518:8753:34b0 with SMTP id 71dfb90a1353d-518cc31166emr9598090e0c.4.1734364591447;
        Mon, 16 Dec 2024 07:56:31 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb729c25sm671973e0c.50.2024.12.16.07.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:56:30 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-860af3331feso1152458241.1;
        Mon, 16 Dec 2024 07:56:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4ulLg5NxdAtC7jwc47wZltEbshh2hS6CBUYq5Ken5wcgUjWOCFyG57ILMQASvUlKURWTWQNHk31yy+STHFeOqzT8=@vger.kernel.org, AJvYcCVHcPAjnEC2m2dR8K1PMWRhCnyBkWyrl/Aliny5tSPnFmVdxRhksyhbrVVzCziD018Ip92cQQaoIGWaI4L/@vger.kernel.org, AJvYcCW6Cuim9RIcoEeexWXmloxqJgy3pnosp/N0Dy3smyRuRRvqfIVShL2l4I6RX2oujJEPQXaBDjDVLIw=@vger.kernel.org
X-Received: by 2002:a05:6122:6090:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-518c5bd8a1dmr16177528e0c.2.1734364590572; Mon, 16 Dec 2024
 07:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:56:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdNyTcwb4Tdg4r-QKkLewEDmHj8qovtL1Z_2_hOr4ZLw@mail.gmail.com>
Message-ID: <CAMuHMdXdNyTcwb4Tdg4r-QKkLewEDmHj8qovtL1Z_2_hOr4ZLw@mail.gmail.com>
Subject: Re: [PATCH 5/9] i2c: riic: Make use of devres helper to request
 deasserted reset line
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
> Simplify the `riic_i2c_probe()` function by using the
> `devm_reset_control_get_optional_exclusive_deasserted()` API to request a
> deasserted reset line. This eliminates the need to manually deassert the
> reset control and the additional cleanup.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -447,18 +442,10 @@ static int riic_i2c_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(dev, PTR_ERR(riic->clk),
>                                      "missing controller clock");
>
> -       riic->rstc =3D devm_reset_control_get_optional_exclusive(dev, NUL=
L);
> +       riic->rstc =3D devm_reset_control_get_optional_exclusive_deassert=
ed(dev, NULL);
>         if (IS_ERR(riic->rstc))
>                 return dev_err_probe(dev, PTR_ERR(riic->rstc),
> -                                    "Error: missing reset ctrl\n");
> -
> -       ret =3D reset_control_deassert(riic->rstc);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D devm_add_action_or_reset(dev, riic_reset_control_assert, =
riic->rstc);
> -       if (ret)
> -               return ret;
> +                                    "Failed to acquire deasserted reset =
control\n");

"failed", as all other error messages start with a lower-case character.
Perhaps drop the " control" from the message?

>
>         for (i =3D 0; i < ARRAY_SIZE(riic_irqs); i++) {
>                 ret =3D platform_get_irq(pdev, riic_irqs[i].res_num);

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

