Return-Path: <linux-i2c+bounces-2271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C982875C37
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 03:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EB8282E0A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 02:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC90722EED;
	Fri,  8 Mar 2024 02:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwBN8Q+C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F0139F
	for <linux-i2c@vger.kernel.org>; Fri,  8 Mar 2024 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709863490; cv=none; b=DhXOVV/LBBkB5s5t9e0K4D2k/j/ZuEpLfRkVN6HKKWg5Ybg7mVVPxkoM+3uH4LwQvu8BIZdHWEAW3OUMTgKSftollVamqfxwBvlzksdv+OZklGbgOeBPok6wVGUOGLRSt600Y3DRWcS+VeQFsucG/A9Wk+5ncJBYMbcAMm4wwIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709863490; c=relaxed/simple;
	bh=Vk9TOG2Z266HZLfIbozIujwFfzBXAMiQgFROOwjXoKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAs/cdRISBUfOjgSColfBfdnmwnMFzHIkaq57KGuRIILjVKdeY6RdTyjjHQf1wfN/OY7sYGj0fnmqJ2XqqOquCWxzyKrN6pzKq/CMztQfFPv7Fr86aTuy0ivDxaL9Eqao4Ee9CX8/yTLe2V4AXnE6VcukE/QWZWLc95Ii+xIEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwBN8Q+C; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-220461b7597so717592fac.3
        for <linux-i2c@vger.kernel.org>; Thu, 07 Mar 2024 18:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709863488; x=1710468288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55HF+XxUfnvgcQronqYrFoV+N6GvZw/ZcPNoFRF8tYg=;
        b=bwBN8Q+Cr5W9LKODg6g7ZBU4GiRdcYgcaqKV7WGo63bq/NB+7BGlQesZusXcbj79a/
         dSupccBjdnsy+DuEXLZIQKaVoe1c+RPtdE0va4psCdZZoSCVe+qyr642XzI0TS/0twoI
         FTAE7mTpT6Z47sjSK5aaN38GmlneTYmb1UEGTW653WX7BZBTAeY3LagdopllD2JAkdjj
         w9lKQNCNhG4jxIDeloGKeHK2knsryV2VRSyP4bO/Q9pT/Pmortg9GvavpUaYGofTzswr
         rbXZz+AgDEDNXIbMd0CQpGT90uKyC6WpM9s+DX0zhkCTixeK5OFeJgstlcL+ISX1t3kI
         7dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709863488; x=1710468288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55HF+XxUfnvgcQronqYrFoV+N6GvZw/ZcPNoFRF8tYg=;
        b=WdIDCLC4b5fz0wdJ6nK41E3ZQsNro8wRUrorRmViKKS6hnJ+H/vTlqBaqC/xh6LyWS
         xojR1TTt5u0UnTWQ+FW3RP3nmBe95RtcvXQf9nlNj94XsiIZy/XLWzhR+0iHpzaJBPs9
         XLUpyd6UlR/oPWqoptiGXd0yFIWgoc5f7Dk3xoLPxIxSFci1f04LJ8elEcYz4a5ZMSG8
         BltPFOHopJI8GmY/z/DNyxjXFQCj6hr6USHDMek/eufwz5/exUj/qBnyUsvGf5r3FJYY
         827m3wFASzwwBUjM4w30pWK0RCSzQBIK7zaUUpiZWwLkmOeQEvDn1JE3eJqcEkQ9A0tB
         EYfg==
X-Forwarded-Encrypted: i=1; AJvYcCW07RDVTVEOpbrhUJEW3VI70LZE474iznhL5oPJ1zGYNra6Ky3s65Uj/pdUS2X4rOtqGxAdxhau3zdIptG4TtGvhGSZZh467yOG
X-Gm-Message-State: AOJu0YwHdUN2u6vwE0Ooh8PRa1C9xuFnu/816CL5dAj+vf7kdkb/0RAf
	xBBorVHHmHlRmenZqT44PqAdeTHLfXV38ebwsvzIfCgFT8iPCowgO+63O08F4h+TWgWXgtXQhos
	EWdPIQ8x8QOpALC4Sz+NLp9bEnJc=
X-Google-Smtp-Source: AGHT+IHznAuvQiYsmZ54fXu23+wAKTKJDpGtdwp7GIRIILSiFDYVyze/gzVXXLJJJnnWOOewUX1jE8kHMpZbYgNwMb8=
X-Received: by 2002:a05:6870:e38c:b0:220:8d0d:e25e with SMTP id
 x12-20020a056870e38c00b002208d0de25emr1891632oad.47.1709863488175; Thu, 07
 Mar 2024 18:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306180241.83327-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240306180241.83327-2-u.kleine-koenig@pengutronix.de>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 8 Mar 2024 10:04:12 +0800
Message-ID: <CAAfSe-sCboYuaCu1SjUWYpE=pHn4J+eQYXMPUvx1RXwj2H+UCw@mail.gmail.com>
Subject: Re: [PATCH] i2c: sprd: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Mar 2024 at 02:02, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/i2c/busses/i2c-sprd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.=
c
> index c52d1bec60b4..28c88901d9bc 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -570,7 +570,7 @@ static int sprd_i2c_probe(struct platform_device *pde=
v)
>         return ret;
>  }
>
> -static int sprd_i2c_remove(struct platform_device *pdev)
> +static void sprd_i2c_remove(struct platform_device *pdev)
>  {
>         struct sprd_i2c *i2c_dev =3D platform_get_drvdata(pdev);
>         int ret;
> @@ -586,8 +586,6 @@ static int sprd_i2c_remove(struct platform_device *pd=
ev)
>
>         pm_runtime_put_noidle(i2c_dev->dev);
>         pm_runtime_disable(i2c_dev->dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused sprd_i2c_suspend_noirq(struct device *dev)
> @@ -645,7 +643,7 @@ MODULE_DEVICE_TABLE(of, sprd_i2c_of_match);
>
>  static struct platform_driver sprd_i2c_driver =3D {
>         .probe =3D sprd_i2c_probe,
> -       .remove =3D sprd_i2c_remove,
> +       .remove_new =3D sprd_i2c_remove,
>         .driver =3D {
>                    .name =3D "sprd-i2c",
>                    .of_match_table =3D sprd_i2c_of_match,
>
> base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
> --
> 2.43.0
>

