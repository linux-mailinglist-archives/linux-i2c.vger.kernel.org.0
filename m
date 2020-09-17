Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6585326DC5D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgIQNDW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 09:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgIQMid (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:38:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B24C06174A;
        Thu, 17 Sep 2020 05:37:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so1917908wrn.0;
        Thu, 17 Sep 2020 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9GaMHSQU0yQ42od5DGkkXCjHUtY9xcpM9T7yfKiSehM=;
        b=IN4ZLkAz/tWOfzYUbMxXPd5bfs4DQIWhCJBsuy6YSkqjdnaHec2YXf/eT72fbLx3kO
         Wu5Ht/Of10FS2IEQIXSilB3zR1ca/CRNcLf+/hvZJDC7MuvUNoUvdGQd/Ecb6wvk1rjF
         kgdpiOuX+fQye2sCL3ezisC9v8rM4aa4sHzgkhdNuf/N2ZZ2IaopX+97JOvKBPPyqMiS
         Ja5KLncRafR0qJ1HRuqRXI6aWKvZKF0uI5lfvbI4eawgALmO4L6QKYLhWn0fVzI+szWs
         hXNLXBHEj28s0I+utTm7Sv/WoODBnZoYSN6IqNuPkVy+sY+fX9Icd0QKP70brRaw58P0
         k/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9GaMHSQU0yQ42od5DGkkXCjHUtY9xcpM9T7yfKiSehM=;
        b=sUBnB1h6+Qy5hLhlF08X9faCe4jtmoVDhP63wTgDV2TRK04xeIiGfw09bsSgYKgLIk
         YZ/cvBTNgMD6+2yO5vUe1oE4W4v9wCueVeKmpY1e9EKEN71KZa9YqJij2EJiIIp/oX8t
         5e4mIV5jQtJSwoS6jrGYCGooSYJpaS5LWoELwXADsK4K/kwPlWvH/ldj38SwSiqv5Z6o
         sUT+4LeLFS4d+COhWbZ8TQeJSeqnm+m1P4aIM+IzjDEi7hKxZ+CLI4qX/dqkfPUweIxD
         AIuHU7+Xl7C2I/53cm8k+PZuJHg0zr0lDfpsHS3XlitZs5XSby2E3v5uHS6f9CPYTr/j
         5VJg==
X-Gm-Message-State: AOAM533OkQm5SHDdW/yJb5ncJHC8cjOhUTE9Mprx5LGQpknI+xX0uMsH
        hxApKWFyvevC50LEBgPJr+/G7tgmt0EWhA==
X-Google-Smtp-Source: ABdhPJw35HZNmzPZdaZfHrek+5zX5Tzrs1EfBQyb7st5d3tkmA2+Mef3YvPp8C7Dy8876H/aKe0qJA==
X-Received: by 2002:a05:6000:124d:: with SMTP id j13mr34048686wrx.182.1600346278299;
        Thu, 17 Sep 2020 05:37:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x16sm37789087wrq.62.2020.09.17.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:37:56 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:37:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
Message-ID: <20200917123755.GO3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-15-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tR2cvQ13k2aMxNOa"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-15-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tR2cvQ13k2aMxNOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:46AM +0300, Dmitry Osipenko wrote:
> The driver's probe function code is a bit difficult to read. This patch
> reorders code of the probe function, forming groups of code that are easy
> to work with. The probe tear-down order now matches the driver-removal
> order.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++-----------------
>  1 file changed, 49 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 79d1cefdc901..7c91bbb3f95c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -440,6 +440,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
> =20
>  	i2c_dev->tx_dma_chan =3D chan;
> =20
> +	i2c_dev->dma_buf_size =3D i2c_dev->hw->quirks->max_write_len +
> +				I2C_PACKET_HEADER_SIZE;
> +
>  	dma_buf =3D dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
>  				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>  	if (!dma_buf) {
> @@ -1693,34 +1696,42 @@ static int tegra_i2c_probe(struct platform_device=
 *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct tegra_i2c_dev *i2c_dev;
>  	struct resource *res;
> -	void __iomem *base;
> -	phys_addr_t base_phys;
> -	int irq;
>  	int ret;
> =20
> -	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	base_phys =3D res->start;
> -
> -	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
>  	i2c_dev =3D devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
>  	if (!i2c_dev)
>  		return -ENOMEM;
> =20
> -	i2c_dev->base =3D base;
> -	i2c_dev->base_phys =3D base_phys;
> -	i2c_dev->adapter.algo =3D &tegra_i2c_algo;
> -	i2c_dev->adapter.retries =3D 1;
> -	i2c_dev->adapter.timeout =3D 6 * HZ;
> -	i2c_dev->irq =3D irq;
> +	platform_set_drvdata(pdev, i2c_dev);
> +
> +	init_completion(&i2c_dev->msg_complete);
> +	init_completion(&i2c_dev->dma_complete);
> +
> +	i2c_dev->hw =3D of_device_get_match_data(&pdev->dev);
>  	i2c_dev->cont_id =3D pdev->id;
>  	i2c_dev->dev =3D &pdev->dev;
> =20
> +	i2c_dev->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2c_dev->base))
> +		return PTR_ERR(i2c_dev->base);
> +
> +	i2c_dev->base_phys =3D res->start;
> +
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_dev->irq =3D ret;
> +
> +	/* interrupt will be enabled during of transfer time */
> +	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
> +
> +	ret =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
> +			       i2c_dev);
> +	if (ret)
> +		return ret;

Is it safe to install the interrupt handler at this point? What if,
perhaps because some bootloader didn't properly quiesce the I2C
controller, an interrupt triggers immediately after this?

Thierry

--tR2cvQ13k2aMxNOa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWKMACgkQ3SOs138+
s6F5mQ//XEhOo4wGZwWcPfyHnm2Oxs/RlGALFYnntenIpB3DoR0nsPKaPHORhmfV
VfdJtQO4i7g37dVJnMcPCrCRbxHnZm77Yz0sWZIH48KSkGDJgaH9s9OwmaQ4URZ3
uZnBcFi/5HoalfaVvrNQkANT86WdvQADTWLEdf8DoFRXzxY6S9PuskcuSaYBsb03
mN2uBbDjdN1BhOLa44nriESFhucfvRK5KuBhIUoGrXpomQc2QRGRyjFoepe8cTsH
xjMjobAeBmYGzMj7iZQO/3yyWu69Ffkh7OrLcwaay6/qfv1P/2D1YxVhsxbDm+9a
7ElJwZ1k5Y1r4koSadyhaL+YTZIikQw9itxo7XoVIm8e0Aob5r5ucf1ieAesrxVI
C2gDO+yqv9Bp7YZ0nDW6sttLI4GTnQEGhrfq4zJf0HcWg2jS6502JS4kiP/C2+6K
L67K9McyxCuA48lpcU+9IXtVULh2GGUjyH2R+SXlLmUBA8uBQWRJf+C5ohjRe6+S
B/QiO59ByIO/zc6nXzgbgtX3A3Y1qO7WhtEtPG0hHL2TsND2mK+ovUHYtiisuXcd
ClzIsUKYVAn4BWBB12oGW5FOROwqVEhJejZ7THdAQJHjjD5y9QwOjTT7+YFlZ1FX
PiNtTx9eUf1mKzUdjAaOTR595iRRWZhp+5/AyczCWxpUSl6zc6Y=
=Qk5V
-----END PGP SIGNATURE-----

--tR2cvQ13k2aMxNOa--
