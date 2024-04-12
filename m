Return-Path: <linux-i2c+bounces-2918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9428A2E9E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DBEF1C21AE6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 12:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223D359B4D;
	Fri, 12 Apr 2024 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrw7zwCj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B075915A;
	Fri, 12 Apr 2024 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712926488; cv=none; b=qsWJla/D/GdwO1JKTJ38hmAmAW2cY8S4vm66eAqjnBaECuTlYLT9oGEPcpCa24gBWFouG6yMN9GYVlsXJRJawgXFK6kIU9AtQi8REuHgeNEJU98Ed6tW+RKkxwVs5gBDqTcSgYS4v/Hw5vv3tp6cR/NSsh9EeAmr/alNWBB+mW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712926488; c=relaxed/simple;
	bh=Ngh8as+dXvRlB5SerxSE46bXBnL0GTaccDHqC6EbXGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8WnpAWGDzGHXeKNFT9lIQc2+VVulpNnt9lTdryHcs74sHZgo6lYI2NmUPTZ/U9pRB5jc4idUwb/6UqnH/6yef460rJpMlcvCMha8rYZq619wiYkTbjiZVfaO7pQfGwuxpQwDg2OnXjI0Oz3umHOMzffmr3dJZwbk/wZ4YAua2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrw7zwCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63160C4AF0A;
	Fri, 12 Apr 2024 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712926488;
	bh=Ngh8as+dXvRlB5SerxSE46bXBnL0GTaccDHqC6EbXGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mrw7zwCj4c2QBgK6ebnLniWioldnKscr9fp4p1xfsM3oK8SK8KHFwuRNe/3rUVQXx
	 mGByPtNBqaNEyPCrvZj+PHb1DKZfO8e3J+7CApHm3qj8V+t4kMKTEWqU17gxTKhyw8
	 /fmekHpA7+x2hucHpUzrvhUHeaJfeDqs2AW1FU1u7r90ZL4o25ERwFDchGSfKH5PXW
	 iHH9FXCK11kzEvqcCCp+JCbHBzFKH9j53SEBK6hZDyDYsx0FYcSXG46os3Vt7bqBt1
	 hhPSv2x1D/Y0+TKWB72PmFCZcDJpDBGJaCOECqNmOW6AGMi4zTPzlpS8tseKUjHPEN
	 YLnbiCbfqBcrg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso9936721fa.1;
        Fri, 12 Apr 2024 05:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaYd27OMdYVB2h5nWrpZrzLEC5NMRHWZ1M0HZj8tfeYgqbFPL+/JIixL1C939JiKN45Ui7kruMN4ZfKgEG3WCbF09kP5nyUebVqGGMVNk5eUIU54yLgAnvmWp+VlTVG+u/MRvw22u19QZwOEgLohK3jGSofmvsauYmrQ1LUxvgY+wUGn9d2UNBCW0SC5Tuo3QIfpBpFSRHUhS7EcwsCIjpuHCRHIp7VvB+FoZZ+KJq2U+AXTTFX5vKKU4=
X-Gm-Message-State: AOJu0Yw80SHNPssX6hmkfoypbxQF2Sp2JeQNj2BH30wYF9FRp9cmE6V/
	raeKRW9FHwBRBaje3d8mhrHTuiiBPgwf1e6H3V7zSHgzILtcdU45TE+TOYmEcwZmM+ieNr93d1R
	NsVZCp6pJ17gLcs05QHaxGuvs9Q==
X-Google-Smtp-Source: AGHT+IFKEm1DXMB/2mOxm4PPotE7iP/WZMY85GkqR30kYOQrBu7XP7hFrfWzxny45Sfy4yA+K/qn1RB0hJXFKEFWYGY=
X-Received: by 2002:a2e:88d4:0:b0:2d9:fe27:7716 with SMTP id
 a20-20020a2e88d4000000b002d9fe277716mr1833708ljk.38.1712926486579; Fri, 12
 Apr 2024 05:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411235623.1260061-1-saravanak@google.com> <20240411235623.1260061-3-saravanak@google.com>
In-Reply-To: <20240411235623.1260061-3-saravanak@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Apr 2024 07:54:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
Message-ID: <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Brown <broonie@kernel.org>, 
	Len Brown <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 6:56=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
>
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c    | 76 +++++++++++++++++++++++++++++++++++++-----
>  drivers/of/overlay.c   | 15 +++++++++
>  include/linux/fwnode.h |  1 +
>  3 files changed, 83 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 5f4e03336e68..1a646f393dd7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -46,6 +46,8 @@ static bool fw_devlink_drv_reg_done;
>  static bool fw_devlink_best_effort;
>  static struct workqueue_struct *device_link_wq;
>
> +#define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)

I think it is better to not have this wrapper. We want it to be clear
when we're acquiring a ref. I know get_device() does that, but I have
to look up what get_dev_from_fwnode() does exactly.

Side note: I didn't know fwnode has a ptr to the struct device. I
wonder if we can kill off of_find_device_by_node() using that. That's
for platform devices though.

Rob

