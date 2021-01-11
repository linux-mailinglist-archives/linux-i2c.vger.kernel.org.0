Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7AF2F0E34
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 09:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbhAKIch (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 03:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbhAKIch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 03:32:37 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB838C061786;
        Mon, 11 Jan 2021 00:31:56 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id x15so1749298ilk.3;
        Mon, 11 Jan 2021 00:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v/NXBvCLKrac3XyokGdCPBcnqn52lWLwH6gBQ31Muv0=;
        b=JbkQHk9ziGv0q5L+6TJzchHwzF1l03U1EvtxyLPZPe4rKl4XpTcOWd3DWHtZOFVaM0
         QeYN/A6L1tm9CsPBfHZXkuk6+v1ufg4iD9/VoG89coWrihHuouVZzpGVyh1P8NuD23d0
         72d+1fWaHEA9s+sHMWA/3fleC74cLkAvOamvOtyDfPbsMlBmdiJVR1IDuLIe3Nj31vPy
         jqfFtgiS0aHtorZDnyPAjJXThwNw0JReURzrb55vyJnw9ACtlGqlV2D8zs3xePKldBYi
         RvsKUYreIyGWHcmR+SRlpqVIGCe1DAVZ/BQXa1gyVFXOvVPoJL53HtagH2j2Re3QaAGE
         1Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v/NXBvCLKrac3XyokGdCPBcnqn52lWLwH6gBQ31Muv0=;
        b=rLZk+WHrmhfqtRL5GrzxtsttyQh1kIlBkRwx/Kq8JvBc7uNnFTaQB7OYq7jEifhAvv
         J/zOFoLoDU3ryTvcT4iIY1Im+xe9WO0RIoGW4Adp2EElgRn0jR6Gfa7iMyViZBTeZ/lO
         BRkCC1stXcHgPcptuX/QaY6Ep30qTCjSyr+Y27TrdqHp/k+JTihu0k6UwifO9W8tTmMU
         EobKBhIZiwRHvqA8TIw6+F2OSBg1KnOzMu7hZf22GYYYRnoPvY7qvONPhpnGBSl4s8UE
         adq7BDD2vXUiz8j8Q+cGqHC5RhF8wgCPk6Yu3dQrutlFB8bUtfwRxjqUgr8N2G9B36Ru
         NQ8w==
X-Gm-Message-State: AOAM530jVY3f0EVui3HOgEnB40F9ZolvOpkDAzdxiHPCXYgtO7vmPZ2O
        J5MA+Yet8q/rO5JGlo4OW4LidKolT7Q=
X-Google-Smtp-Source: ABdhPJwaTB6TYxQj7LLrW6fBsjRXSSsXBmy+Xih7j3qQmJQZiA4wu6uP7t/L6F7y2f2G3eoP1OLs6w==
X-Received: by 2002:a05:6e02:5d0:: with SMTP id l16mr14185032ils.90.1610353916110;
        Mon, 11 Jan 2021 00:31:56 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a10sm10521499ioc.43.2021.01.11.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 00:31:54 -0800 (PST)
Date:   Mon, 11 Jan 2021 09:31:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        digetx@gmail.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
Message-ID: <X/wM+LBkqF5ixuMf@ulmo>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2H5ZGAP27J0BwHMG"
Content-Disposition: inline
In-Reply-To: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2H5ZGAP27J0BwHMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
> VI I2C don't have DMA support and uses PIO mode all the time.
>=20
> Current driver uses writesl() to fill TX FIFO based on available
> empty slots and with this seeing strange silent hang during any I2C
> register access after filling TX FIFO with 8 words.
>=20
> Using writel() followed by i2c_readl() in a loop to write all words
> to TX FIFO instead of using writesl() helps for large transfers in
> PIO mode.
>=20
> So, this patch updates i2c_writesl() API to use writel() in a loop
> instead of writesl().
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Hi Wolfram,

after discussing a bit more with Sowjanya, I don't think we're going to
have a better solution than this. It should be fairly harmless to have
this additional flushing read of the interrupt status register because
the reads don't have any side-effects (the register is write-1-to-clear)
and these write loops don't happen very often (or when they do we tend
to use DMA anyway), so:

Acked-by: Thierry Reding <treding@nvidia.com>

I did notice that for some reason Sowjanya hadn't listed you as a
recipient, so perhaps you don't have this anywhere in your inbox. I've
quoted the patch fully for reference below and the patchwork link for
this is:

	https://patchwork.ozlabs.org/project/linux-i2c/patch/1603166634-13639-1-gi=
t-send-email-skomatineni@nvidia.com/

If you'd prefer to have this in your inbox for proper review, please
let us know so that Sowjanya can resend this.

Thanks,
Thierry

>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 6f08c0c..274bf3a 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev,=
 unsigned int reg)
>  	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>  }
> =20
> -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>  			unsigned int reg, unsigned int len)
>  {
> -	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
> +	while (len--) {
> +		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +		i2c_readl(i2c_dev, I2C_INT_STATUS);
> +	}
>  }
> =20
>  static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_de=
v *i2c_dev)
>  		i2c_dev->msg_buf_remaining =3D buf_remaining;
>  		i2c_dev->msg_buf =3D buf + words_to_transfer * BYTES_PER_FIFO_WORD;
> =20
> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
> =20
>  		buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>  	}
> --=20
> 2.7.4
>=20

--2H5ZGAP27J0BwHMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/8DPQACgkQ3SOs138+
s6H/pQ//TtAcAyV2STrKLqwdsAY4M7EJsz39gSa4Rs53jgTyD1xidMMOq4Y8SbGz
75lI2ihuk/YoVqsWJJat2PEBA9+cXRorB+DskpDRG+JDbfm5Zoq04VZ51hg0NHlp
+rY+IySRl93clzdxrVuej+6zLi4amNVjBst1BgfWpqEdPDDde3OKLR6ZBCiWK4wz
7jpBhFr/oKq9rg2+bj2a1c9nnQdW4dM5vf2Hb7qIL9tCCcbWIoiql+4KM328N3Dh
saLAJzOYTEcS8GrzMhRSqXfp1J4l9SlKpoLleLJ8/TIOIH8ESrcM9Kj4PSKiKXdC
c6cs2qTe25S7SO/oQ1LGAFGQHgbhKkPQUAMvg22RgrlhScLw+ZoEpcCb+MZ2RDsf
Psjbd69qNxdj6FUZZo41CFj2hO6l7Y1OIsWwJXbZBCwbYfG3q1y1ugzcaYsPx5ei
gJKhfI9IC8wqkhhXN50tE7k+lKSUbywGfB6O+AdWuI2vEqrExnd3rdnbwPgJRht7
kTbGH+34JqYTyRM5fg8PaPuONTRikj2admTJwHB3j9pOhjun0mVQnD12XBRQUAvX
XNTetMXAi9ZcrfJ8mJxJ96fjCanftMS8mnFPhdRP1WIPMxkzVxtaV2RZa8b8PvRF
BQPrKoiL4+yonw+g0C+62QBJyVANQ8p8jD1fnJF3+exB67TcCfA=
=brDH
-----END PGP SIGNATURE-----

--2H5ZGAP27J0BwHMG--
