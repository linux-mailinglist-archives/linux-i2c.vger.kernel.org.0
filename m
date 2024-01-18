Return-Path: <linux-i2c+bounces-1369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F77831697
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 11:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42227282A0A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 10:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF6520B05;
	Thu, 18 Jan 2024 10:22:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A220B01
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jan 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705573367; cv=none; b=pTMn/unNlJBAIzgsu1PPNhw2UxJMgRRsohroFcNA7qKjSqjm9KcySM8b+CDAz3KqvLzF5XQIoAhEGWFWpqxWDUCoCeH3FKNc5qt87Gpugi7oANPF6vvmrJMpeyFMPoBMt166grP41+xTiDz+nViaSoKYicqBHILZsKznL6ytj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705573367; c=relaxed/simple;
	bh=l/wNuE4TWNQEvmm+D1sJRfBIFetg6gKAQneQ5Wjg/pE=;
	h=Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=DRIvqasCFbsy26vEfG+cha4OfCB6xs9DqqsaPrd9ij5SaCLQMl6TOoXtRLrg7zj3Pv8CrOzoD55VyhTerMC4LtFCYGVNKaazbr/zqqz3JJaE99urRX3i1BX/YRGQ+M6MQOCh62PogI3crX8DWfp5VE2wHDy47F8VPX5lHEHmTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQPXg-0006kz-BH; Thu, 18 Jan 2024 11:22:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQPXf-000fTX-DA; Thu, 18 Jan 2024 11:22:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQPXf-002KXW-11;
	Thu, 18 Jan 2024 11:22:35 +0100
Date: Thu, 18 Jan 2024 11:22:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>
References: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz4nhqabmvyvejku"
Content-Disposition: inline
In-Reply-To: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--uz4nhqabmvyvejku
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 08:43:32AM +0100, Alexander Stein wrote:
> Instead of repeatedly calling clk_get_rate for each transfer, lock
> the clock rate and cache the value.
> A deadlock has been observed while adding tlv320aic32x4 audio codec to
> the system. When this clock provider adds its clock, the clk mutex is
> locked already, it needs to access i2c, which in return needs the mutex
> for clk_get_rate as well.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This is an alternative, lightweight approach replacing the patch [1] and
> depends on [2].
> The issue to address is still removing the call to clk_get_rate() during =
each
> transfer, which might reuslt in a deadlock. lockdep also complains about =
this
> call chain.
>=20
> Instead of adding a clock notifier, lock the peripheral clock rate and ca=
che
> the peripheral clock rate.
> Currently LPI2C is available in the following SoC:
> * i.MX7ULP
> * i.MX8ULP
> * i.MX8DXL
> * i.MX8X
> * i.MX8
> * i.MX93
>=20
> Additionally I expect both i.MX91 and i.MX95 to also use this driver.
>=20
> This patch assumes the parent clock rate never changes. This is apparentl=
y true
> for i.MX93 as each I2C has it's own lpi2c*_root clock. On i.MX8 and i.MX8X
> clocks are managed by SCU with it's own dedicated firmware. I can't say i=
f the
> clock never changes though. I have no idea about the other SoC.
>=20
> Best regards,
> Alexander
>=20
> [1] https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@e=
w.tq-group.com/
> [2] https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@=
pengutronix.de/
>=20
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 678b30e90492a..6cbcb27a3b280 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -99,6 +99,7 @@ struct lpi2c_imx_struct {
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
>  	struct completion	complete;
> +	unsigned long		rate_per;
>  	unsigned int		msglen;
>  	unsigned int		delivered;
>  	unsigned int		block_data;
> @@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *=
lpi2c_imx)
> =20
>  	lpi2c_imx_set_mode(lpi2c_imx);
> =20
> -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> +	clk_rate =3D lpi2c_imx->rate_per;
>  	if (!clk_rate)
>  		return -EINVAL;

After the things you did in lpi2c_imx_probe() you can assume that
clk_rate is not zero, so you could drop the if here.

Otherwise looks good to me (if you want even if you keep the if which is
only a minor optimisation).

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uz4nhqabmvyvejku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWo++oACgkQj4D7WH0S
/k7Xiwf+MnYqEochoDiBJpSMAigISfodZV2fpTNcxDSMbBcbph3Y4I6VbV12GvTE
r9TqlbAB7hPHtuYaAYnhsQGe2ocH74R8ezqKZbTXEPD2TeZ+H92QrlyhephUacm7
IUVHkNZWYOE7F0LSK2tl6zHSM9JjMGpha4dyMUCRejgzG3eAEvzKcmSmd8rmioLN
CcDWwZNslAl5x0SM8UWc9kdp5YQb/zndTpqBCjM4AFf6C14NbhDuxZ2IlibbsR6Y
JJiPizL6/ZtkOARt1zEXXqHAO03eLCwm8JFezzZwGN0PBIMMiOZNrjDjq5XFpHps
jWNM7YbvlplKNCBlDDGtPqwLkQyTSQ==
=Z5JK
-----END PGP SIGNATURE-----

--uz4nhqabmvyvejku--

