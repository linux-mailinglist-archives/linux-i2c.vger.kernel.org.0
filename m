Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB01829360F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Oct 2020 09:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbgJTHsu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Oct 2020 03:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgJTHst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Oct 2020 03:48:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD80FC061755;
        Tue, 20 Oct 2020 00:48:50 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z5so1257328ejw.7;
        Tue, 20 Oct 2020 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=twqsZzBZbpmbth9P3/d5RUUDvLm4p+PgbnCnaNPBX8A=;
        b=EeAzwdsLl5ESHsfOeD0E5yAQUYMH5ZRnPAjcTxuxk7IkErmRxSc0jTAfqERc62WQoL
         36h4Sfm3Md44eOkHIvDkVDEEDhcGERmHPGg9/6BB0Iwyqdkl2hyZQDib7ZcJ/biZrfbh
         Z1KNuvhabN38BC4OF3hZ5avFEOPv/B1rctHN53qigToSC5A4Cb1fUBI0+jmta74HJ4pt
         K8I+JZ2/ZSP2bHxrTahWGvv1aC2gcv3Fava6nkJixwxaoPfNEClzE33ZOMENpL8U4OSw
         xqo+WoAfedCMENg8YVojkndECHXQ6Ri0qiIRqAKKw2Lh77c7Y+gZ8WH38314v121oU4O
         lyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=twqsZzBZbpmbth9P3/d5RUUDvLm4p+PgbnCnaNPBX8A=;
        b=d/rktKsDgf03xlfWjyw8mFheubHJwuHbBfyDWx6wdAG0tiNLWt0bp1ihaf7iX5gqu5
         A17/P1AqLbfK+f3EZaUhE3UytyumSM9PgOqUlMIesT4LL8hmPMBzSve83chXIe6CrLnk
         kwH7aoEjDRv/wiSD0dz5x3vCjjEa5+R01K8H39Cs3IgKCMBep/ix9lMk9LaSVbMbQH8j
         1pfoopg13asRtiYnlG8EuFdTvnjs99i2eC2lqW5RcxJob3sK3Hi821hxsrNQdDD+yVXA
         2vYaAQulWitVrRogZFt2MGd0XqallBDnpyP940MXm0/BmHZlEJ3pnfUpOUWyAhXN7iWP
         NNdw==
X-Gm-Message-State: AOAM533DLcF6O+vItC3IbbWERq/1SGe0pjG5x31VHHZd4pTph90yxf7O
        ywfifDh2JbwkEd5+q4zj21A=
X-Google-Smtp-Source: ABdhPJzCsnGCLKKzoyNkL5YtRW1r9cg3qeQsfhw/ATmq+hOtMiG65FcwkNTY4HrbNhEy1+cJryxsqQ==
X-Received: by 2002:a17:906:7254:: with SMTP id n20mr1789979ejk.382.1603180129400;
        Tue, 20 Oct 2020 00:48:49 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o13sm1426008ejr.120.2020.10.20.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 00:48:47 -0700 (PDT)
Date:   Tue, 20 Oct 2020 09:48:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
Message-ID: <20201020074846.GA1877013@ulmo>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wac7ysb48OaltWcw
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

I've thought a bit more about this and I wonder if we're simply reading
out the wrong value for tx_fifo_avail and therefore end up overflowing
the TX FIFO. Have you checked what the value is for tx_fifo_avail when
this silent hang occurs? Given that this is specific to the VI I2C I'm
wondering if this is perhaps a hardware bug where we read the wrong TX
FIFO available count.

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+OlloACgkQ3SOs138+
s6HCaw/+LQuIAv3gsJoa2SGq9zYaceHoXp93kkAyTvGO9HDT29Q8gf+faoLrk/cH
rSCfYtwqcwJvGfxUg3Z9gbRwuc6B/xph0RKQbS9YxC7sVxU710Qp3jGWMayc1efk
akO2WhDX9Dj1MNX+KDSR0jX9I0sAoBorjyiUovuPKTHkMkqUN7dP9PZPzvqwXVR+
W/40fWxPP3WFc8rL4Z4VdPLSTStnvtjQx1nc+2IF0nqLnU/bm+5cMiOSpwdw5RLW
ursbuj+gyZDLZRHplw4xCjc/kjycGDHFEJyA2rNnepefBQZXWjDGlJGXRvwl6FPw
AmI4Vbc/dZkbi+Y/j8mVZeNk6RF7PaRjJUBsg/OvNZh4ebDvQpsHp+9AreLZ99a7
l4NsR43yD/oS8EuRZISryRU1R2p3WsPeMx/uRr9jpdJwj6Cld39uAh9w3oDcjdCx
EYx3AKLz2u6QMdYABkIa3iFbq7kwe2pZ5aNHuNTyjMmHYdaSnLP2CU1Hna7Dzs3D
vsODCc0NPCzfAtpF8X/I8u2qZyZzDNH3gXxXE0hH7aPaiy1sSyf8uATyrp3dVj1q
EQ0B8lUHp6gI1NM7wZeiJMbFqTdUqmcNAn62M/A+Mx/7Am+JgdEJhf8LoJOJvq90
EDnmtVv9Ru8I0ucLKRKRQnW03RVh5GkKbwi5Z5ItNTg6efUqYVU=
=PrtH
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
