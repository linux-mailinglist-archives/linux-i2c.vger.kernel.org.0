Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679F36A0463
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 10:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbjBWJDY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 04:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbjBWJDX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 04:03:23 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442F24FA95;
        Thu, 23 Feb 2023 01:03:21 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id f13so39103348edz.6;
        Thu, 23 Feb 2023 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD+8GeanCE/x70uegO9U5MTQbLl+734GZzOwj0hQ4pc=;
        b=mBD1BQ37iIDR7JWXX/OlXKvNa8NVaHt1sKz+6t6eagPmuzwSpIqozkFoQL9xibTUeN
         3fC98PAzmuSCFN4uVDugWglgh9ZFCbprkbnk/HgZzNcPy5Huhtt0QJWw1RPYKXXur4cK
         +HAym9Bz/wfblPBHSOhXPxjJuaX78FsDr+BYgJtMDtKxHNZE7gfIAvlE2nSR6CXR+wwc
         Mv+2mycXUCH3tu7Ybl2pKGWT1+cIJj6ZrSYn9k7mCzXsqPeJjQs1COycHwtlzYY4Ra6b
         sXB0vmOmHGpThhwfR4G96Dcq6EU0tq+PKyatlmxBBpDd+4aVumxQQH/rX8+lPgn+9Hu6
         dlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD+8GeanCE/x70uegO9U5MTQbLl+734GZzOwj0hQ4pc=;
        b=0e+NX9NGqvBKLWRgerkCH0ydggIExM1uuuEw5Z06skOvTML6kd3mUjvlI9gDkHnN9w
         JstECEQkbPHasjH+KpkfhpaxyVsiUnb0ko8X7FMclx2NEFWML6TJqlpcM3eXHuuzBd5z
         17lTZggcxy557WXEIg3kIERd+XZCnCTaXo6RC2LB35sp/uwEHbzrh/uq0L6uye8bokq7
         zp3GcqhZ4deJdAcLY/D+UHTQ7y6EA5E2w5Xaf+Y19xHyxHkPGHJ0F8jEY57fMJEht19g
         RIJz2a3B4bMxPW5MqVKWt95d57uUG66AekO4WFp3jrGJS7OfrdDZvC1u2RG1nBTZADQT
         oPmg==
X-Gm-Message-State: AO0yUKWQkBBHApuTZ9NgZ3THKdbUj5s8bZ87WbBhRKDoURJSXOAEs1T0
        U/aVsJ+ioGIe+SNbc0Q/3NA=
X-Google-Smtp-Source: AK7set86PvyMLRzK9dDTPURDEy4nuoWHHr4XakacxhoLyoAJkDCWB6Fov3n50dy0+RO0ic4uWzJuwg==
X-Received: by 2002:aa7:d74a:0:b0:4ad:7481:c2fe with SMTP id a10-20020aa7d74a000000b004ad7481c2femr9298095eds.22.1677142999215;
        Thu, 23 Feb 2023 01:03:19 -0800 (PST)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n27-20020a50935b000000b0049ef70a2894sm4139786eda.38.2023.02.23.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 01:03:18 -0800 (PST)
Date:   Thu, 23 Feb 2023 10:03:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Share same DMA channel for Rx and Tx
Message-ID: <Y/cr1EKI7R6rtg+O@orome>
References: <20230222102759.23165-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HaVAMW8fbvrZJ5yn"
Content-Disposition: inline
In-Reply-To: <20230222102759.23165-1-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HaVAMW8fbvrZJ5yn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 03:57:59PM +0530, Akhil R wrote:
> Allocate only one DMA channel for I2C and share it for both Tx and Rx.
> Since I2C supports only half duplex, there is no impact on perf with
> this.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v1->v2: Remove WARN_ON for DMA channel mismatch. There is only one
> channel in use with this change.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 54 ++++++++++------------------------
>  1 file changed, 15 insertions(+), 39 deletions(-)

I'm a little confused by this. All device trees already list the very
same reference for both TX and RX DMA channels in the I2C nodes, so
these channels are already effectively shared, aren't they?

So all this does is to get rid of the duplicated pointer? In practice,
is the DMA channel pointer going to point to the exact same memory or
are these separate objects that happen to point to the same hardware
resource?

In either case, I think the commit message should clarify that. Also, a
few minor nits below...

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 6aab84c8d22b..f52b835f1700 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -248,8 +248,7 @@ struct tegra_i2c_hw_feature {
>   * @msg_read: indicates that the transfer is a read access
>   * @timings: i2c timings information like bus frequency
>   * @multimaster_mode: indicates that I2C controller is in multi-master m=
ode
> - * @tx_dma_chan: DMA transmit channel
> - * @rx_dma_chan: DMA receive channel
> + * @dma_chan: DMA channel
>   * @dma_phys: handle to DMA resources
>   * @dma_buf: pointer to allocated DMA buffer
>   * @dma_buf_size: DMA buffer size
> @@ -281,8 +280,7 @@ struct tegra_i2c_dev {
>  	u8 *msg_buf;
> =20
>  	struct completion dma_complete;
> -	struct dma_chan *tx_dma_chan;
> -	struct dma_chan *rx_dma_chan;
> +	struct dma_chan *dma_chan;
>  	unsigned int dma_buf_size;
>  	struct device *dma_dev;
>  	dma_addr_t dma_phys;
> @@ -398,7 +396,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev =
*i2c_dev, size_t len)
>  	reinit_completion(&i2c_dev->dma_complete);
> =20
>  	dir =3D i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> -	chan =3D i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_cha=
n;
> +	chan =3D i2c_dev->dma_chan;

Is there any point in keeping around the local variable? It doesn't
serve any purpose anymore.

> =20
>  	dma_desc =3D dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
>  					       len, dir, DMA_PREP_INTERRUPT |
> @@ -426,14 +424,9 @@ static void tegra_i2c_release_dma(struct tegra_i2c_d=
ev *i2c_dev)
>  		i2c_dev->dma_buf =3D NULL;
>  	}
> =20
> -	if (i2c_dev->tx_dma_chan) {
> -		dma_release_channel(i2c_dev->tx_dma_chan);
> -		i2c_dev->tx_dma_chan =3D NULL;
> -	}
> -
> -	if (i2c_dev->rx_dma_chan) {
> -		dma_release_channel(i2c_dev->rx_dma_chan);
> -		i2c_dev->rx_dma_chan =3D NULL;
> +	if (i2c_dev->dma_chan) {
> +		dma_release_channel(i2c_dev->dma_chan);
> +		i2c_dev->dma_chan =3D NULL;
>  	}
>  }
> =20
> @@ -457,25 +450,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev =
*i2c_dev)
>  		return 0;
>  	}
> =20
> -	chan =3D dma_request_chan(i2c_dev->dev, "rx");
> -	if (IS_ERR(chan)) {
> -		err =3D PTR_ERR(chan);
> -		goto err_out;
> -	}
> -
> -	i2c_dev->rx_dma_chan =3D chan;
> -
> +	/* The same channel will be used for both Rx and Tx.
> +	 * Keeping the name as tx for backward compatibility with
> +	 * existing devicetrees.
> +	 */

Block comments should have the starting /* on a line of its own. Also,
s/Rx/RX/ and s/Tx/TX/ for consistency. Looks like you also used "Rx" and
"Tx" in the commit message. The driver uses "RX" and "TX" elsewhere, so
better switch to that in both this comment and the commit message.

Also, perhaps quote the "tx" reference above to highlight that it's the
literal string in DT that you're referring to.

Thierry

--HaVAMW8fbvrZJ5yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmP3K9IACgkQ3SOs138+
s6GUoxAAudDGSGiO3PEE4ksIGRgrtEcXb9K/XuoFrT8ULh2NOTqG8JmhnNWwYeER
UrujHgnAP3o0OKiv1VBmygpiNawKSccuf3ztFr3ZsiFiobbscutexweT1hbXviWs
H7+FMfA1x7H1vbRQl6wP1/HMXQwbqWPZFd1AGGwaJaOtkLr4l83Tr3K2GZ074tI+
Zspl7vc29lHhgOuQ7T2eYeJVDRkHG7ikE55ROJVyp+ZlV+nbvGXnInmOj4Vfg0Is
0YHobXhgJ97rBi5RXbZS+fRFGZyJpsGedk1WvzaZ8lTpHVYHSRw3Ozav/Yygl6WQ
JpY+XEIxLBV1fIhhZpaINulc59K4oHh4tQrlZDIQP/xjgA6IJpflfFz6LVSZBOta
fQ8r2GIpq0RrOdWR1EyyIHw+BUH3yT0SaavCdkoOtjV70PHEByCGBYvF2EWvfONw
M//DXdV10RzKpuaNO1CkaKcDWn+0umeyHn3aBW9OzMksPHoui4yP5ud8fSyzxx2d
CwIn6eZwT5cXujN5/AKeZcNzr4zdw4MyDi2+/NifGv42kSl1Ji5CldWKwJxTWRGF
yrmndC7ZxzOtZvdRV/iSyBdSVlt4MxXnwFle6ovqJrgjV5t+oEROaPFhFfaCbPZD
Ej2AUVdjj1WMWNvqsBBifDPb97jrjIRHQcM+eMsq9/DLzKroN90=
=kWnv
-----END PGP SIGNATURE-----

--HaVAMW8fbvrZJ5yn--
