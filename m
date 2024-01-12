Return-Path: <linux-i2c+bounces-1280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5CA82C504
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 18:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472061F21B2E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E9417C85;
	Fri, 12 Jan 2024 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cG9A6iap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697B2263D;
	Fri, 12 Jan 2024 17:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F5FC433F1;
	Fri, 12 Jan 2024 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705081827;
	bh=GZ6Ouo8eQK4R+P9Tx4PS6afuH0vvh/IfABUDSekGxEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cG9A6iaprfYQmCFxymyAp1BHAYy5u6lXTSHuuhHje9BJ7EzkKXOZjNGH38ptV2JCs
	 IZKNF4mc/wZ6ydpJs4SfgNxoFbm4WPyiw0lN99FBG4D7j0shHoq7WitGNx3GfJ0Dm7
	 RcKOzr9zRvU+ldZUCjmSMsjaSqk4NnsKQeP1F2YszU0k93mB657HpKUqgxkkEGSkBD
	 8HGIUn3DJlktzGwYJQ+r8jAGayfH9glqjFUPlTqTjasTb7iQDgM0kC/zI4uuwKmdmb
	 fl/nMZLa6zeJTqiEuaYNRr/ae22okqTfkD0VT/LT52+ymFoG8gNzpolvJlhNz1YUEp
	 tehOsR3K/jhLA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso7484252e87.1;
        Fri, 12 Jan 2024 09:50:26 -0800 (PST)
X-Gm-Message-State: AOJu0YyjIshXF6pceUlYpruSe4JI9Gd6zHBW7r/EShXr+T1bBBIt4ndU
	zqIrBF2xSZNf48GN47dTK8Frh8lWWZgd4P0/hX4=
X-Google-Smtp-Source: AGHT+IHNMMoIG6gwTjPiDIYY4Pr1xr4YBA96xtCAZsgUidD3xh+KybavM+PwCvyZ8lUyAQMCCQE/JJOp2D5j5adNYDo=
X-Received: by 2002:a05:6512:39ca:b0:50e:a9c0:70ad with SMTP id
 k10-20020a05651239ca00b0050ea9c070admr1167312lfu.32.1705081824525; Fri, 12
 Jan 2024 09:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 12 Jan 2024 18:50:13 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGj8YYQiUf07H+0=MOvytr32fwnTp9JhO7ipZf=ZOGUag@mail.gmail.com>
Message-ID: <CAMj1kXGj8YYQiUf07H+0=MOvytr32fwnTp9JhO7ipZf=ZOGUag@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andi Shyti <andi.shyti@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Jan 2024 at 13:48, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after the clk_prepare_enable() call, it should be undone
> by a corresponding clk_disable_unprepare() call, as already done in the
> remove() function.
>
> As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
> handle it automatically and fix the probe.
>
> Update the remove() function accordingly and remove the now useless
> clk_disable_unprepare() call.
>
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index bbea521b05dd..a73f5bb9a164 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -550,17 +550,13 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>         device_property_read_u32(&pdev->dev, "socionext,pclk-rate",
>                                  &i2c->pclkrate);
>
> -       i2c->pclk = devm_clk_get(&pdev->dev, "pclk");
> -       if (PTR_ERR(i2c->pclk) == -EPROBE_DEFER)
> -               return -EPROBE_DEFER;
> -       if (!IS_ERR_OR_NULL(i2c->pclk)) {
> -               dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
> -
> -               ret = clk_prepare_enable(i2c->pclk);
> -               if (ret)
> -                       return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
> -               i2c->pclkrate = clk_get_rate(i2c->pclk);
> -       }
> +       i2c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +       if (IS_ERR(i2c->pclk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
> +                                    "failed to get and enable clock\n");
> +
> +       dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
> +       i2c->pclkrate = clk_get_rate(i2c->pclk);
>
>         if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
>             i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE)
> @@ -615,8 +611,6 @@ static void synquacer_i2c_remove(struct platform_device *pdev)
>         struct synquacer_i2c *i2c = platform_get_drvdata(pdev);
>
>         i2c_del_adapter(&i2c->adapter);
> -       if (!IS_ERR(i2c->pclk))
> -               clk_disable_unprepare(i2c->pclk);
>  };
>
>  static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused = {
> --
> 2.34.1
>

