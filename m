Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62DEEA9E14
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 11:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732381AbfIEJSD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 05:18:03 -0400
Received: from sauhun.de ([88.99.104.3]:54158 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbfIEJSD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 05:18:03 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id E0B302C0509;
        Thu,  5 Sep 2019 11:18:00 +0200 (CEST)
Date:   Thu, 5 Sep 2019 11:18:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Provide an option to disable DMA
 processing
Message-ID: <20190905091800.GD1157@kunai>
References: <20190905075213.13260-1-lee.jones@linaro.org>
 <20190905075213.13260-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline
In-Reply-To: <20190905075213.13260-2-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")

Are you sure? From visual inspection, I don't see a correlation between
this commit and the fix here.

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index a89bfce5388e..8822dea82980 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev=
 *gi2c)
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>  				u32 m_param)
>  {
> +	struct device_node *np =3D gi2c->se.dev->of_node;
>  	dma_addr_t rx_dma;
>  	unsigned long time_left;
> -	void *dma_buf;
> +	void *dma_buf =3D NULL;
>  	struct geni_se *se =3D &gi2c->se;
>  	size_t len =3D msg->len;
> =20
> -	dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> +	if (!of_property_read_bool(np, "qcom,geni-se-no-dma"))
> +		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> +
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>  				u32 m_param)
>  {
> +	struct device_node *np =3D gi2c->se.dev->of_node;
>  	dma_addr_t tx_dma;
>  	unsigned long time_left;
> -	void *dma_buf;
> +	void *dma_buf =3D NULL;
>  	struct geni_se *se =3D &gi2c->se;
>  	size_t len =3D msg->len;
> =20
> -	dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> +	if (!of_property_read_bool(np, "qcom,geni-se-no-dma"))
> +		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> +
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> --=20
> 2.17.1
>=20

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1w0sgACgkQFA3kzBSg
KbZAkhAAqLidEFMA6FK2iigoU4Bb521+nLwBTqlnG9ahMrhVVQmIKDARK++TEvwm
6DKw2OxJDCx/hXpnWy5U1TAj8x9Q09BWol8xTjT7paGKdek65kB/EbfvwCqCFfdO
5J34MIIYgu6o6BjvfN3OCcwLFg2ubYm76kIS/wjPpocPVEoUBCtyrK+fXIsp21eB
kmcvGyYY+3O69bjNoGdpdV3SLQyh0LRCmxPKi0ogIU8+hY+S5DpA3HaEkzb75KgV
zla+6XVWtROIA8OnNsPt8lZruy4tbP5JHq+zrxel1/GEDX45jPxLINqz2ei1tZJ2
szJMBeMO6Brq1i1qgbK6/c610FdJV+G/9OhkeY6B0iKp6FaoeuiEGuQLxZvJoEpM
Y+bSw/8i2h+RCZh187XcpOM3M8Ulqzje3Ruk1xsqJXb6bWuy/Tm5BiCAWUCO62gk
R9/wLxQgKg3HpyQYqatk0POPGhj5Wl+vH4A2XO5V36wqV6YMVQn+RFuRREfndDmP
tFAk6i4Rn54l9f3CtKP8cB16zSplO0d9vO8LKEhG3HtFUsvOBxeq+IMW1YA9tTGP
DRjTu3Dbme8P2BrUsB2gWglzNC2xRY489FM9Oik2qL3YrXqLcE2LeGh3bOvuet1R
cESLKwr6DFkLrbvbKv1V/1+e+cUdtt3PGQPLh/08KbKqpdvB16s=
=vkLL
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
