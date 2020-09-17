Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5967F26DAEA
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgIQL6q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgIQL6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:58:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6BFC06174A;
        Thu, 17 Sep 2020 04:58:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so1682093wmh.4;
        Thu, 17 Sep 2020 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RBptPCK3cQyzDC4iQm1JuF+G8rrPiJFIChJc1eo/SrA=;
        b=lmREtLnOklYbI3srvQzEqSZtK5ujhvC4CyUFkIPqoP7OltUdmTeBd8UX4md/edLziG
         IplQvddLFN6dsr69qRjbGADMu1M+8wJN/5mmHdsaYW10Vlgwgg6rSJKVP+wMM1dk3wWF
         PRrqJtP/x3n82aquu/po2aRNoJWcq5eBR0que/CQb8U8/0ognq8++s0RPGkY4w3iwTeI
         yDChJw0Rb3Zfc+p8HUQnXYIg/aY7fDp6/y1uJSsdOoPbLXsSPd9n53iE71WL8L5DaD4p
         q16pI3lVLdbkq7iD7vkYMv7nhzTAGhbBnMucDPOvACLQgjJ9ACaEBsiBlO0xYv3w/Bcr
         8+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RBptPCK3cQyzDC4iQm1JuF+G8rrPiJFIChJc1eo/SrA=;
        b=KSl2zhA9cfaXtPB932JOnBDV7miMcO7G8x9Nky9nBaFD8pBMwL7KF8sGbYzTDV1DwT
         rZqgRGCFz8LPQnmFHReaimCsqe5aYjVz45tH68u0T5OQsqgnMUx733NxpH3ZdTYPB8mc
         Tzcr3XxV0TJWThPxoIBicxx/YvpWp5884qBOl99mzcxJrzgfVdhrq9/9bLvngB1hFf91
         mgwGsrj6daWa+dsKRAv6P9Ju0wznuMAhDYXONbaP1A2TlBqcg1NFKXpzV8i4/6/dUUzB
         3+gAFhSv9rjg9WtCVTUy4flTI6cUB/7wmDFXz9xl8Ukrhs4/t72bmVNsKQCOCjh0kVet
         L8Yw==
X-Gm-Message-State: AOAM533X4K/vsHBI2HbyFTshpemAcaPu73xXdivr3D7+coOTxIjkQeU0
        Rh88SwJIyvnzzN7Alif15Kc=
X-Google-Smtp-Source: ABdhPJw/mWdAvNtcZT+O7OFBzGYrS+RLxKlsckI0DnnY0PrVS/fmvoVpxWtBYJZ5pGUWUX6fP6YGqg==
X-Received: by 2002:a1c:65c1:: with SMTP id z184mr9225398wmb.61.1600343885657;
        Thu, 17 Sep 2020 04:58:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t16sm38888777wrm.57.2020.09.17.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:58:03 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:58:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 25/34] i2c: tegra: Factor out register polling into
 separate function
Message-ID: <20200917115802.GD3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-26-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="stFzI3XAseUQ09UW"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-26-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--stFzI3XAseUQ09UW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:57AM +0300, Dmitry Osipenko wrote:
> Factor out register polling into a separate function in order to remove
> boilerplate code and make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 405b87e28a98..e071de9ce106 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -514,10 +514,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev =
*i2c_dev)
>  	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
>  }
> =20
> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> +				   u32 reg, u32 mask, u32 delay_us,
> +				   u32 timeout_us)
> +{
> +	void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
> +	u32 val;
> +
> +	if (!i2c_dev->is_curr_atomic_xfer)
> +		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
> +						  delay_us, timeout_us);
> +
> +	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> +						 delay_us, timeout_us);
> +}
> +
>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  {
> -	u32 mask, val, offset, reg_offset;
> -	void __iomem *addr;
> +	u32 mask, val, offset;
>  	int err;
> =20
>  	if (i2c_dev->hw->has_mst_fifo) {
> @@ -534,16 +548,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_de=
v *i2c_dev)
>  	val |=3D mask;
>  	i2c_writel(i2c_dev, val, offset);
> =20
> -	reg_offset =3D tegra_i2c_reg_addr(i2c_dev, offset);
> -	addr =3D i2c_dev->base + reg_offset;
> -
> -	if (i2c_dev->is_curr_atomic_xfer)
> -		err =3D readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> -							1000, 1000000);
> -	else
> -		err =3D readl_relaxed_poll_timeout(addr, val, !(val & mask),
> -						 1000, 1000000);
> -
> +	err =3D tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
>  	if (err) {
>  		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
>  		return err;
> @@ -553,30 +558,18 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_d=
ev *i2c_dev)
> =20
>  static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  {
> -	unsigned long reg_offset;
> -	void __iomem *addr;
> -	u32 val;
>  	int err;
> =20
> -	if (i2c_dev->hw->has_config_load_reg) {
> -		reg_offset =3D tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
> -		addr =3D i2c_dev->base + reg_offset;
> -		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> +	if (!i2c_dev->hw->has_config_load_reg)
> +		return 0;
> =20
> -		if (i2c_dev->is_curr_atomic_xfer)
> -			err =3D readl_relaxed_poll_timeout_atomic(
> -						addr, val, val =3D=3D 0, 1000,
> -						I2C_CONFIG_LOAD_TIMEOUT);
> -		else
> -			err =3D readl_relaxed_poll_timeout(
> -						addr, val, val =3D=3D 0, 1000,
> -						I2C_CONFIG_LOAD_TIMEOUT);
> +	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> =20
> -		if (err) {
> -			dev_warn(i2c_dev->dev,
> -				 "timeout waiting for config load\n");
> -			return err;
> -		}
> +	err =3D tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
> +				      1000, I2C_CONFIG_LOAD_TIMEOUT);
> +	if (err) {
> +		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
> +		return err;
>  	}

The deindentation in this hunk is messing up the diffstat in my opinion.
It would probably be worth splitting that into a separate patch to make
it more evident that this patch actually removes boilerplate.

Thierry

--stFzI3XAseUQ09UW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jT0oACgkQ3SOs138+
s6GUHxAAnwK9bQJoihAW8/1DAfvP9xNcE5rcJoKtrMJAxgpAFcZQQiMUKSerk+8G
z5YRnKmv/JOZp9Yqavl6U6xDCYv9fR+D3TBQ34A3TRIrpazPwhffvt+QkzXaaj76
2ybOQY4x0UmQW6ipWWOxBSzxy0Zql1bpUU4z+Mh7RZaR7vKqv0JuVdwLnERvPZJM
+YV98iZJoJIIVRM5QFJBL8jaL6nqkOh9vmOfONjAL8z/xqYFuYKMWpTkf1vOJ6P3
peyRgTa9tgmvfWU/Rjr8DdBjBM/Y5s8aiJA4YO60S6R29fWEybnOud4UOXOixhM+
D8PMFGiA6B+iwt4EAgwBD7eio8bxwQJ1vz+mqWyzrUvnDpCGMTkd6tzUX3M2v3lr
WmIBQ09e9mK2H7DGn70WGn9GETn8ElMDhERQrAAIe+4u3BD9MhQAcK9nzMcIydyx
OvAcSNghr4of1rmVYvcn5EFluRyPLidGqB8HxZP75BDPsRQ8NBfJP/rTGJi62JZy
mgcfpdAXXCR0nw+efiVuAHYtqNJKnIDzgevU/zqIMEa336WCqaksdCdQLJcctWZ3
z6+z+DVL4ueZ8aiBBk18TQjtxK5fTVZF9fWI/SUU4ZapvJicRIuHw66TMVOBUMFz
R7q09gbPtYxwra6UOCmBIs+yiLLWpn7a+X7mFi8XS5mZOnXjk3g=
=CIb2
-----END PGP SIGNATURE-----

--stFzI3XAseUQ09UW--
