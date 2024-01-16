Return-Path: <linux-i2c+bounces-1337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38482F384
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E9551F24623
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 17:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F241CD21;
	Tue, 16 Jan 2024 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zEBGy0AC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680DC1CD05
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427520; cv=none; b=sfAmKIJO+FbKFu150enL/F53UaCaqzjn3Fr0Gx+q3LIZZL5eytpDtpRiB46BZEqEaoYMylx+OTiuFR3RWVunuuDHT3O1ucxAK36Tb0bRIHj9ZPCy/1IYr8+o1mg2vZqySiPEZdDN23dsb6BccRxSt507cVhiHm6uuNd70JgMEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427520; c=relaxed/simple;
	bh=2sDRBRp+27dyz+lLnzucjXQfgDv3cCd+bHegl4Kf514=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=e6WvKeHUvUKwJgzf4SLqLIJq0gTm+8US6GRXjzGYvR1kgaPNN3dx6jTEmlvH/mZc35D8YuYnNGwbfWxaBokEUN1w6LL6qXxeLihgph7+pT+7MVHBTU1uWYW13TfvIkbxbC5eCMjpb/iTsEDl5phM9+3bXiYy/y+09hncR0NNKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zEBGy0AC; arc=none smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5cf495b46caso1505926a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 09:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705427518; x=1706032318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLkbVRAk95ipntvmjbPNO29427ChHJt1Wds4CgPJfoc=;
        b=zEBGy0ACJFvND8Gp4XXtSyoH1DfPa2s2JTE9FOZx9DjrJAZ+W3fEUtEoRMZeO9fV3o
         vWoqziTVjrpByNLuP93DepPziNNCTviZnpjHzNRA+zWzROwjpmpea2+PRO67GDU62/Xn
         cy3jvgGydup4ISRwTqKKOH3+223ABUoSQuUDgvW3LjFYkKp9cZjxKwOZBIqmlBZJdOrE
         MATXC60KMjufrRQpseqS0MuChzKf9HhRdvpz+tk/lQlq23Qs0QD45LHNjNnbOa0QXN0W
         Ntcvfhm9WydD/MAqkW+LWCmfM9wrmELBVg1CZKfBfALhSspSiGXgIhL7XmvUqeNU4Or5
         vYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427518; x=1706032318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLkbVRAk95ipntvmjbPNO29427ChHJt1Wds4CgPJfoc=;
        b=W0dgfRwf8IFy6QQUWJzpLZ5A3EYYYOqbIoliy5pvJUX/yHADJwFzde9lPMEEhYHGqM
         OUaE638wsTedgYOpX7cR5smrRzStAeGt/1Z+aV1Y1wo2W0z6mnlczhR7MDHxFkdRWQQ7
         2U6dBoYM4mUhixzCvY40ikdZmN/ADpcbNMCt4FFAgH29/ayjL6gMWy0xggFyn/yK3uYm
         qbjBH8tomkIM1Iaitr6qT6llzX6SIWF5XnkPKV85s6u7y45L2iWA5JPDymApCp9E/bBf
         e5SrxnTWxdwdYVF6y7CeJPusR09KWxTAk/ItV/quxj0nZta+VjrBeYrAYXxMourh2R3T
         fK4A==
X-Gm-Message-State: AOJu0Ywp5u0tUEWHnMJeVTbSFmjR+dcyzNjQQN+XyNfvmDdB8Ubnw5c1
	BRv/w/Mk6NG96UMrOnz+MVtNq5/fsIJP/kOSHISsIdGhNS0zlw==
X-Google-Smtp-Source: AGHT+IGmhFr1Xzziwh8GD2Vq3OCA1ZM67LySAGd4/+lGJnEIaSy0yYNelNXzR4oJcDfV7SY2HFly/HJIoiYFK8jnXC0=
X-Received: by 2002:a17:90b:1649:b0:28d:bec5:a5be with SMTP id
 il9-20020a17090b164900b0028dbec5a5bemr3687886pjb.68.1705427517801; Tue, 16
 Jan 2024 09:51:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-7-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-7-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:51:46 -0600
Message-ID: <CAPLW+4mYMqZUyeSt0Ws8jcuQw2s7a2h8kqCJ2CAbVv7nV4zBTQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] tty: serial: samsung: add gs101 earlycon support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:00=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible. Always set UPIO_MEM32 iotype for the
> gs101 earlycon.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v3: collect Peter's R-b tag
> v2: update commit message
>
>  drivers/tty/serial/samsung_tty.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index a81b61953a28..fed50423b7c1 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2812,6 +2812,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos421=
0-uart",
>  OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
>                         s5pv210_early_console_setup);
>
> +static int __init gs101_early_console_setup(struct earlycon_device *devi=
ce,
> +                                           const char *opt)
> +{
> +       /* gs101 always expects MMIO32 register accesses. */
> +       device->port.iotype =3D UPIO_MEM32;
> +
> +       return s5pv210_early_console_setup(device, opt);
> +}
> +
> +OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setu=
p);
> +
>  /* Apple S5L */
>  static int __init apple_s5l_early_console_setup(struct earlycon_device *=
device,
>                                                 const char *opt)
> --
> 2.43.0.472.g3155946c3a-goog
>
>

