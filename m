Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD25426D9E7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgIQLLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgIQLLv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:11:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B88CC061756;
        Thu, 17 Sep 2020 04:11:01 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g4so1609622wrs.5;
        Thu, 17 Sep 2020 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cSAbf+VwagpVi5OwclNO3B1suQsjmcg0FLJ59nbKPUk=;
        b=FNIKApCDlsy+3dSx4/pZNoG5TZEV2gkIXPXgGZqNYqksrjvnfmLP3YcPciGeI256UF
         UtfPuKBVqu3yCNSiFZ7nfmYXeC1kHdEDinSgYRSyT2sHUm/1cQBmqJM6JsRqoo8H02v2
         fQTcdGilqHn4v5MIogxlU3xh8drTHoBiCWakfgXB56+OJ4zfSe9mYVuj8v0q1CT2rhJb
         e7ocRfKeQWxkNZbuqYw+Lgny2SRACHZCjSHp145WRE8ZNy3OEdF9s0ubX9ZHWmAXL0uK
         cThRejs0IhEbFsr/N6t5oDfS9a+CFszjMUMCjRuuJd68q2dn1tIH+OM4J5n56vovh0KA
         VwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cSAbf+VwagpVi5OwclNO3B1suQsjmcg0FLJ59nbKPUk=;
        b=H6C9jJJIMg3GDLaDFPKKCm0roE/OI0d8r3+3grXSh9e0aHVkPPcvbEGvvqL80foTdf
         m5ZkY97G83Nmv04KfRrXADzBm/LLzYtJ0YlGNCFQUaII7aMZ5pykn4rbftqFOYcaE3r3
         ifTkp8AKUCzDIALGQ9GPVwWcvGj21MFjt/i3qCjM8tFE1U1/MI8I5wvdr459MU0oR6k1
         xJT8sS1/+6ZnlAJkaC2qCRMDmmKo3Yq4Gxow9O6SGwsef/EDdOpN74vog3PSDV6ImWE/
         urOxNmmzGqEuRpH2/3L72uU0qlyhpIojYZmk6z+Owh+GqjqqWcHpMe0TzL8nodpB6ZY7
         e0KQ==
X-Gm-Message-State: AOAM532CAiHRNlBbCoKXo3aM4qQQnmCYwIFwf/jyEaTyARU0tE99oJos
        g8/bKZNB/y3giTU1MTI8oNReapm4PjIjcA==
X-Google-Smtp-Source: ABdhPJwDH7aNIf/h8X+eZZ/5ak0e9WMZtJjaEbf+KNouecSIHbomby/ah/gxYGjEQRrR44kumOubyw==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr32858029wrs.27.1600341060489;
        Thu, 17 Sep 2020 04:11:00 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f23sm15283173wmc.3.2020.09.17.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:10:59 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:10:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/34] i2c: tegra: Make tegra_i2c_flush_fifos() usable
 in atomic transfer
Message-ID: <20200917111057.GM3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oYAXToTM8kn9Ra/9"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-2-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oYAXToTM8kn9Ra/9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:33AM +0300, Dmitry Osipenko wrote:
> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
> are not updating if interrupts are disabled. Let's switch to use iopoll
> API helpers for register-polling. The iopoll API provides helpers for both
> atomic and non-atomic cases.
>=20
> Note that this patch doesn't fix any known problem because normally FIFO
> is flushed at the time of starting a new transfer.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 00d3e4d7a01e..ab88cdd70376 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
> =20
>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  {
> -	unsigned long timeout =3D jiffies + HZ;
> -	unsigned int offset;
> -	u32 mask, val;
> +	u32 mask, val, offset, reg_offset;

Is there are reason why we need reg_offset? Seems to me like we could
simplify this, see below.

> +	void __iomem *addr;
> +	int err;
> =20
>  	if (i2c_dev->hw->has_mst_fifo) {
>  		mask =3D I2C_MST_FIFO_CONTROL_TX_FLUSH |
> @@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_d=
ev *i2c_dev)
>  	val |=3D mask;
>  	i2c_writel(i2c_dev, val, offset);
> =20
> -	while (i2c_readl(i2c_dev, offset) & mask) {
> -		if (time_after(jiffies, timeout)) {
> -			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
> -			return -ETIMEDOUT;
> -		}
> -		usleep_range(1000, 2000);
> +	reg_offset =3D tegra_i2c_reg_addr(i2c_dev, offset);
> +	addr =3D i2c_dev->base + reg_offset;

Why not just:

	offset =3D tegra_i2c_reg_offset(i2c_dev, offset);
	addr =3D i2c_dev->base + offset;

or even just:

	addr =3D i2c_dev->base + tegra_i2c_reg_offset(i2c_dev, offset);

? That makes the patch much smaller because you don't have to rewrite
the whole variable declaration block and just add the "addr" and "err"
variables while removing "timeout".

Thierry

--oYAXToTM8kn9Ra/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jREEACgkQ3SOs138+
s6FcNw//dQsaWaIy/AQO16/aC91z2Usg0AVFYQSAhkpULp+aIZLrIT7L4e8wBlvb
/avIxzjkvsJ2iOT10fBaLg+R8w7hOs5Fejq4p6VMr35G5Y11IDLayXz6MzBXr3rY
zzrahMFY3hSkk6nxuIHYqWztoFrKIphKPt42de6kwZ758FnUDbQuY5ybg3TKmw2a
X1x3pmXUizrs2ONjCtEAu7e+TrrYBHG39jZX+EdQBCXb41dWCwrBI3VhQWjtxB3F
unuwAfp8Mpc1oRwhh1bdOicD916tLKzVrjN6iBWjd87K17re0VkLGIuAIK7cSP/N
wXUGX761pemW1KGguprq/V7+bU+TDZFzrQMoKXpVvCqxfiVa8yN8n/hcFqyu8f6J
Lf5M72GLOvRxRyQrFP8I/EQV0mkAOFm8R5qcHIh7ntGCJ8wVkZPFwm09R3S63kqs
yhLZH3TIV/9TPJsLharKc3vBLFIP8Scr8AywCBNTYfTRfckgcSWzH1/hDireyTr1
MO1x4AfX6joNOHEGt/qnHq5etrAwDFbt94+/SE+qHNbpyg3HCofTrz/c6V7JP0Q0
Ta1ad7LExFzFI4k9+ZH1fcMqa7CM2cQZxgKGrP1gDrNmKIKjcxbOD9oKP/OWB+vd
Gi4YcQcoWPQ6MdqFy6Ave7f+uxqgjW32UV9H7k6Xzx8H3NJ0hAY=
=2RDZ
-----END PGP SIGNATURE-----

--oYAXToTM8kn9Ra/9--
