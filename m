Return-Path: <linux-i2c+bounces-1281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705482C507
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 18:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD9A285E04
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B546917C88;
	Fri, 12 Jan 2024 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQlwM+hr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771321AABC;
	Fri, 12 Jan 2024 17:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C928FC433C7;
	Fri, 12 Jan 2024 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705081835;
	bh=HyfbarF/lhyfTeVNYIXesdRRp8IwmWJBW9rEVWz1xB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZQlwM+hrvu7qOAHPOFV9QEJT3BSfGJhYJfyX/URBMmyOSRYKseFb/5XoSuerNm+L6
	 0rFkHMqPXJQI6A1tqX+LKw9Wq4TaTV3Y+ffD1GNH3qoojK3pXfo5eTisuoIrvmFHMM
	 TRtDIatiBy7WWmV33RSjFlHhE1OLPeaw2FlkMG1iGFImglIS4LpmVceOpbqmqg9nmI
	 /299Yzs7jEjNSSsvuts8PcUaxZkEsN3QoWUgPeZCzPKX+sUaSlilNGUTHamX7qDM+s
	 CJyW1cAoyUVgfaCXXEC4XnHaJ80pAApaXhGNIlmr9rri3GEZVOAb6K1JvVmsTKtwQJ
	 hCeqsGOS2G9tQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd2f472665so73049001fa.2;
        Fri, 12 Jan 2024 09:50:35 -0800 (PST)
X-Gm-Message-State: AOJu0Yyd2G+mroXlRTgAXAQzxWtJcPb+d7TR/qP5oxW4yWB2MSfpeq1J
	BekCWW/tzfmoOSWlnc3mjdq9R0sBBYVmOREAOnc=
X-Google-Smtp-Source: AGHT+IHRSo4if8kdw+K5Tc5Y2Vsm327Pk+9bhMXlIJXNXS75l/Wceqft1Kj4DTRCnPFvGmCa3IVu1aFQnWDuXFZKUOg=
X-Received: by 2002:a2e:7d18:0:b0:2cc:e9d9:8293 with SMTP id
 y24-20020a2e7d18000000b002cce9d98293mr818143ljc.31.1705081834022; Fri, 12 Jan
 2024 09:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
 <01e5b93d75eaeb071c6864f8b43355a7c24e0c91.1704545258.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <01e5b93d75eaeb071c6864f8b43355a7c24e0c91.1704545258.git.christophe.jaillet@wanadoo.fr>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 12 Jan 2024 18:50:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEcu0UDif0PZBi3tZZHF8tQ1mAqnd0O2ezhRWhYnAXkOQ@mail.gmail.com>
Message-ID: <CAMj1kXEcu0UDif0PZBi3tZZHF8tQ1mAqnd0O2ezhRWhYnAXkOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: synquacer: Remove a clk reference from struct synquacer_i2c
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Jan 2024 at 13:48, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'pclk' is only used locally in the probe. Remove it from the
> 'synquacer_i2c' structure.
>
> Also remove a useless debug message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index a73f5bb9a164..e774b9f499b6 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -138,7 +138,6 @@ struct synquacer_i2c {
>         int                     irq;
>         struct device           *dev;
>         void __iomem            *base;
> -       struct clk              *pclk;
>         u32                     pclkrate;
>         u32                     speed_khz;
>         u32                     timeout_ms;
> @@ -535,6 +534,7 @@ static const struct i2c_adapter synquacer_i2c_ops = {
>  static int synquacer_i2c_probe(struct platform_device *pdev)
>  {
>         struct synquacer_i2c *i2c;
> +       struct clk *pclk;
>         u32 bus_speed;
>         int ret;
>
> @@ -550,13 +550,12 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>         device_property_read_u32(&pdev->dev, "socionext,pclk-rate",
>                                  &i2c->pclkrate);
>
> -       i2c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> -       if (IS_ERR(i2c->pclk))
> -               return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
> +       pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +       if (IS_ERR(pclk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(pclk),
>                                      "failed to get and enable clock\n");
>
> -       dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
> -       i2c->pclkrate = clk_get_rate(i2c->pclk);
> +       i2c->pclkrate = clk_get_rate(pclk);
>
>         if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
>             i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE)
> --
> 2.34.1
>

