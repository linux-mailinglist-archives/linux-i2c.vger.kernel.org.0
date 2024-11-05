Return-Path: <linux-i2c+bounces-7806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83719BD7A4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 22:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7601F226A8
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 21:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20DC1E0B65;
	Tue,  5 Nov 2024 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oPytReiI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D21D1F56
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730842201; cv=none; b=ZSuTxHFdu2gtjK7iDRZ3fvtwa6Tql7RPCQFEQs1bk9dNGtyJktmGzXk6nndoPJsdhnu4NU6/n7k8+uUDDCaCEbWXqBvHpA3j8v3OIDtttwzadbhgniKYZgB2DW4XJcX53jwQ03N/LMWNto2StZ3GSxMjmM9nxnvRjyXO7S/cLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730842201; c=relaxed/simple;
	bh=h7AwGN4io3/uPTbQx+qrX5kizmH08R1HDFUD/HNRelQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXiGvXHkJl77W+YUGnriwuU3bs73STcL+tiwTNg8c9DnNvANANdfMjSFf49C6a7A6NRxXUJuec3Ztld5KG4nFroPk2/pEmf0vQTRnHx2x0mpGXt8X1JzLdRTq7Om36PnCphe17ZaWrypvtGg/nZEcqIVKR/8lnLmg0pCQZH9qHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oPytReiI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so63427531fa.3
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730842197; x=1731446997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Tfp+kt6EeLErLEVv0I8PpE8RVWyGWlaG6f1mvrWPCE=;
        b=oPytReiIHjz9L4bsD9nTpD1CF8AuLVoPl7SFtjHY3NVWwSQ/g/wz8LTMe5HWRhLY9P
         Ngph/0jz/VXIM1Yer3+tT+T+dEoN5CF8vQeNZkpuMpMNohmM/s6xE4K4+iMjWTST05Gn
         WQ5iTnycYmMPFMtP5MvzaTPSyJkXOC8Zy4HYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730842197; x=1731446997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Tfp+kt6EeLErLEVv0I8PpE8RVWyGWlaG6f1mvrWPCE=;
        b=oClZ61VqZA1mKJ+LAvLoMHtm3AK3xfo4WV4pJ7MT+I1QqvLaAo5aln9cGS4WcEibPU
         /tEbJTEfR7sxNaM6K4nLSixVoybPyFQCMgL+22dNDNvP52XsrGkEAOgtMICUEamiJ/SL
         /wfWczr/deeZDwL5If0ougboLlqQOZa4rLnGy3chxvKxzzcJTRUn5z1U9bfbKVhk62e8
         giEBeqQpltFzBgxKf8NraYV+H0kXP4h2+nagX8ZeCm8F269cbH3pRXEr9hyfUO+TA5zv
         ZSAbSLu0Aee9E2oR2yANJkCDTfJxsMFSL436oe6Hlak2EiC6VUYBQcUgsViZy/nM1Jqz
         SvRg==
X-Forwarded-Encrypted: i=1; AJvYcCV6xiuB2/JXzJVp9vjI+pILeAtizaYVFts48nQ4ggODzonE17yMRJmjPNNSDOPEmbOJYB9TycaAjrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDIrlXArDvGcoovUEhIuOfkQ7oGDIC/k+92+/MKyGjpiWffIA
	waZYwWXH7MT3agBFGFfph42TYrjLrM4kJJsshak/3iBzO4gkCBTm5urgJYaLyLQC5C+ZRWzndo3
	FAA==
X-Google-Smtp-Source: AGHT+IFopnKOiX9YZYyovUZadQlMOEe1gOOQCI22WFY4EuFtXhzMlwkBcumZh3f3bgWXIXB96uPmHQ==
X-Received: by 2002:a05:651c:909:b0:2fb:2a96:37fc with SMTP id 38308e7fff4ca-2fedb783624mr81082871fa.16.1730842197023;
        Tue, 05 Nov 2024 13:29:57 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d624esm22356921fa.38.2024.11.05.13.29.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 13:29:56 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so56444561fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 13:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXArT7Arzi7vGzJXrqIYrkup+Vi3htspjFbnQyKC8PGvh63/02uYfiRz8BXFkV6dgMVcBJDb1mK3Hg=@vger.kernel.org
X-Received: by 2002:a2e:bd08:0:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2fedb758b32mr81564941fa.2.1730842195431; Tue, 05 Nov 2024
 13:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com> <20241105161820.32512-3-jiashengjiangcool@gmail.com>
In-Reply-To: <20241105161820.32512-3-jiashengjiangcool@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Nov 2024 13:29:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
Message-ID: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: andi.shyti@kernel.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 5, 2024 at 8:18=E2=80=AFAM Jiasheng Jiang
<jiashengjiangcool@gmail.com> wrote:
>
> Add check for the return value of clk_enable() in order to catch the
> potential exception. Moreover, convert the return type of
> rk3x_i2c_adapt_div() into int and add the check.
>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
>
> v1 -> v2:
>
> 1. Remove the Fixes tag.
> 2. Use dev_err_probe to simplify error handling.
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 14 deletions(-)

Wow, this is a whole lot of code to add to check for an error that
can't really happen as far as I'm aware. Turning on a clock is just
some MMIO writes and can't fail, right? Is this really worth it? Maybe
just wrap clk_enable() and spam an error to the logs if it fails? If
we ever see that error we can figure out what's going on and if
there's a sensible reason it could fail we could add the more complex
code.


> @@ -883,7 +883,9 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, =
unsigned long clk_rate)
>         ret =3D i2c->soc_data->calc_timings(clk_rate, t, &calc);
>         WARN_ONCE(ret !=3D 0, "Could not reach SCL freq %u", t->bus_freq_=
hz);
>
> -       clk_enable(i2c->pclk);
> +       ret =3D clk_enable(i2c->pclk);
> +       if (ret)
> +               return dev_err_probe(i2c->dev, ret, "Can't enable bus clk=
 for rk3399: %d\n", ret);

Officially you're only supposed to use "dev_err_probe()" from probe or
calls indirectly called from probe. You're now using it in a whole lot
of other places.

...also note that dev_err_probe() already prints the error so you
don't need to include it in your error message.


> @@ -942,19 +946,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier=
_block *nb, unsigned long
>                         return NOTIFY_STOP;
>
>                 /* scale up */
> -               if (ndata->new_rate > ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->new_rate);
> +               if (ndata->new_rate > ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
> +                               return NOTIFY_STOP;
> +               }
>
>                 return NOTIFY_OK;
>         case POST_RATE_CHANGE:
>                 /* scale down */
> -               if (ndata->new_rate < ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->new_rate);
> +               if (ndata->new_rate < ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
> +                               return NOTIFY_STOP;
> +               }
> +
>                 return NOTIFY_OK;
>         case ABORT_RATE_CHANGE:
>                 /* scale up */
> -               if (ndata->new_rate > ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->old_rate);
> +               if (ndata->new_rate > ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->old_rate))
> +                               return NOTIFY_STOP;

I'm not convinced you can actually return NODIFY_STOP from the
POST_RATE_CHANGE or ABORT_RATE_CHANGE. Have you confirmed that is
actually sensible?


> @@ -1365,9 +1385,12 @@ static int rk3x_i2c_probe(struct platform_device *=
pdev)
>         }
>
>         clk_rate =3D clk_get_rate(i2c->clk);
> -       rk3x_i2c_adapt_div(i2c, clk_rate);
> +       ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
>         clk_disable(i2c->clk);
>
> +       if (ret)
> +               goto err_clk_notifier;

This one seems especially comical to add since the only way
rk3x_i2c_adapt_div() could fail would be if a nested clk_enable()
failed. ...and I'm 99% sure that's not possible.

-Doug

