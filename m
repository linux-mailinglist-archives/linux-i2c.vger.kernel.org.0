Return-Path: <linux-i2c+bounces-5727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CE95C812
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 10:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E779B2818D3
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 08:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B24F1448ED;
	Fri, 23 Aug 2024 08:30:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7DC143875;
	Fri, 23 Aug 2024 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401805; cv=none; b=e5cCQYv/nannWhOQ9msV5rL/Jl1lPJLLOTMdiqUQKPKPCbbCnymaleKW9QZDd7PP3ycd81611r3sB9kq3Oym3Zvha8In5h67Vm1GSIeIIE+PKkA8kSYK8JcZ4o9RpvsMn2k8l8aaUtO5Q5QI0Y+Jqan8Z9438lEDkG8hwrDiIaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401805; c=relaxed/simple;
	bh=vwvYyfUrP6IBcdtCkGejYt79aWvt0AZyZWj8ALtoo/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fO5q7wT5vXzsnMzNxAyRRODQxIoaVXQsOg0ZPLR0M6NVQ4MhZEvzdoLBaW0JKs1iWkM/jtHbz3SsZtStCjgIJyky4hhmRqSiB4Ki5AEuDHZ9SZHgZK+cWIKX2DvFzguyR2pODV0ZO6m5ADEnQDk9Q2Nk9NIsNuV0E6N6sARF4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e13e11b23faso1744281276.3;
        Fri, 23 Aug 2024 01:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401802; x=1725006602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wMOSfp7wWLrfvKZda/G3lCoA2LeDaO0B8B7dm7ip3M=;
        b=fs9hIxHcTnTUVUGQUFoyz+abeX0nM2WzrNQiac0yg1T6+ap19pDzTk3YFm0yRkTT3M
         tynhSQ6mff5b5DLO/1PTI8K9Lh8X1Stbbhyiz4ATpQF5pmB9nMxd0D8UznUV19RJ5zvD
         gvl0wrXLDF006smy72csjn96hs2HFOFUKjveKaTZ2TbmGgSyf8Yy/rGWFzVbJHPtxa8w
         A+9xyd3cqmOKclYviVOq12Qn47sich3UELtcrTMpsIIjlnRxm2UELoHqrubRm8FPATnA
         LuQ7mExsMts+/9e6bmXj4gYJOSsAyIWsEjlFh3c7Xi/YzDbBNiE8jUYrYBnXoliOvCqr
         +CQw==
X-Forwarded-Encrypted: i=1; AJvYcCXF3TJ638J4PB9p2plPmAIzR2v7dz0BzCqgpfgSnXsrVG/v3uJ/PhinMKO/x9DMh/VFBmEcj9+ztt8=@vger.kernel.org, AJvYcCXJHDvYZBbFswqQwo0j1XTT5xFTitxlOiIvZ0Db9b7Kuv9MWnsNVJ6M7dvb87Iui0SN1CbftRbQoa9jZJfwmJ2hxpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG+ahysyPxslyZs13vBPviRZjMWKBsdoMxkJNRAPM7AzatAuP
	RjqJ+hy+CfWb5YZiqLWyWWmXSSYjxuhiR5rd5qwW1Aosa7HaMSGP0pQNmMRf
X-Google-Smtp-Source: AGHT+IGvNJHvt6QDvIsxsCzxyGtSpLcQXPVXF+heJVTD7HTXh3us/pXnHpnIcWjktNyBracA9mUihg==
X-Received: by 2002:a05:6902:15c4:b0:e15:4b86:2b59 with SMTP id 3f1490d57ef6-e17a83bcb24mr1891090276.4.1724401802077;
        Fri, 23 Aug 2024 01:30:02 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4b71b0sm599692276.36.2024.08.23.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 01:30:01 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6b747f2e2b7so16297647b3.3;
        Fri, 23 Aug 2024 01:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9BXLTosbcpIGgZtiQmcS3hFuqRtlSYnmpvVST6agmS2tWLjqtcFqrMhbcS075Ul5YNY8Ja7aIcj5z0oUsDp3EdMA=@vger.kernel.org, AJvYcCWT4MQFpd0jES3H7qmZjXSwCoT6UwKicLepN+jOnYzKadDb65+DOVLQ+CRCg0G5YhB5UOq8KAXnJXQ=@vger.kernel.org
X-Received: by 2002:a05:690c:f84:b0:698:bde0:a2dd with SMTP id
 00721157ae682-6c62422b00bmr16286527b3.7.1724401801673; Fri, 23 Aug 2024
 01:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <875xsuknvt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xsuknvt.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 10:29:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtaM7V+g6+Bre=Z-kUL0G8qC2oaF1xhYzp_BssPn8Jzg@mail.gmail.com>
Message-ID: <CAMuHMdWtaM7V+g6+Bre=Z-kUL0G8qC2oaF1xhYzp_BssPn8Jzg@mail.gmail.com>
Subject: Re: [PATCH 1/1] i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Jul 25, 2024 at 8:05=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> rcar_i2c_probe() has priv->devtype operation, but handling (A) and (C)
> in same place is more easy-to-understand ((A)(C) and (B) are independent)=
.
>
> (A)     if (priv->devtype < I2C_RCAR_GEN3) {
>                 ...
>         }
>
> (B)     ...
>
> (C)     if (priv->devtype >=3D I2C_RCAR_GEN3) {
>                 ...
>         }
>
> Let's merge it with if-else
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1168,7 +1163,10 @@ static int rcar_i2c_probe(struct platform_device *=
pdev)
>         if (of_property_read_bool(dev->of_node, "smbus"))
>                 priv->flags |=3D ID_P_HOST_NOTIFY;
>
> -       if (priv->devtype >=3D I2C_RCAR_GEN3) {
> +       if (priv->devtype < I2C_RCAR_GEN3) {
> +               irqflags |=3D IRQF_NO_THREAD;
> +               irqhandler =3D rcar_i2c_gen2_irq;
> +       } else {
>                 priv->rstc =3D devm_reset_control_get_exclusive(&pdev->de=
v, NULL);
>                 if (IS_ERR(priv->rstc)) {
>                         ret =3D PTR_ERR(priv->rstc);

This hunk won't apply as-is, as a comment was added in commit
ea5ea84c9d3570dc ("i2c: rcar: ensure Gen3+ reset does not disturb
local targets") in v6.10.  Hence please rebase your patch.

For the logic:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

