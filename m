Return-Path: <linux-i2c+bounces-1377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557F832542
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 08:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC733B24863
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 07:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31264D51A;
	Fri, 19 Jan 2024 07:48:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD0C13B
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705650505; cv=none; b=izha0M5051OSChqGYyelReJKhRHfDPkkgmXp4k9QMUd/uV+BvKmc5Ya7QnsfgHd22AVlj/5Mu+RqXp7hllC/SVA3LqJXpiInRozB3ccy76yvZ2g9KaeGfuTsqk8UogglnwE4KXm8B8ZRo3eOVlGOHKuXlupyy8pM4/XW00aFqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705650505; c=relaxed/simple;
	bh=98x17gfSn37fP/15pq0Qdb4F/N6T4BWQT5oZafYwklc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvKXCnsMH3VWqr3YPe03/K9AmurfT+PHVSVv0s/AMZkMZL+c42SHPlyc71GSrLQqQMcJd95ZX7Yr5TWgXoGwh8MDXqVgISjvZjdt5wMlOiOW32THTXIJzZ/iS4UhywfA7139h+dKaJTrb8QRhsS9MQbnsD2KtRGy9Euk18LdcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQjbf-0002NN-7C; Fri, 19 Jan 2024 08:48:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQjbe-000ru1-BA; Fri, 19 Jan 2024 08:48:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQjbe-0034dW-0o;
	Fri, 19 Jan 2024 08:48:02 +0100
Date: Fri, 19 Jan 2024 08:48:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <iw3yolk5ijgksusesossqot6cvemktjnlt74djofr3zhqk3w7p@tnc4fl6n7hyw>
References: <20240119072223.3986183-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7idu3t4wkvu2sonr"
Content-Disposition: inline
In-Reply-To: <20240119072223.3986183-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--7idu3t4wkvu2sonr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

On Fri, Jan 19, 2024 at 08:22:23AM +0100, Alexander Stein wrote:
> Instead of repeatedly calling clk_get_rate for each transfer, lock
> the clock rate and cache the value.
> A deadlock has been observed while adding tlv320aic32x4 audio codec to
> the system. When this clock provider adds its clock, the clk mutex is
> locked already, it needs to access i2c, which in return needs the mutex
> for clk_get_rate as well.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
> This is an alternative, lightweight approach replacing the patch [1] and
> depends on [2].

If the kernel build bots find your patch they will likely trip over not
being able to parse that. If you want to prevent this, you could make
use of git format-patch's --base parameter.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7idu3t4wkvu2sonr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWqKTEACgkQj4D7WH0S
/k4lcQf9GxclO7LmiPA+7+Xa9A1xcgeHY0QZD7eWQE+MfELh1CDB93k/hJNiyVE0
4TwMFC8a0TFCx7E4pFo5H2rRd2uKLoqAlglH1qKaA+2iMIQQ6fNYqSmoKNLC5dop
GClEdALtIP4i+YHjgDYRK7gcNCoGiT/R7l/unoeRuBeu7JuKV+NTwy0XTSno2ReS
v2EZ80DLHJ/Pkz1CDTCW2Yq5/gh/pCJUYNNUvLT+auoz/0C9O4QkxR9haaSDSmYH
IqmE2dTWi/M98jTcBJPDay39Fhjsa6PgB+etXr+tzocGgTZrVGfbVsKhU3QiTsgL
w0+j9cvA41uh54CnKSbzUdiVY7FhWw==
=QDjl
-----END PGP SIGNATURE-----

--7idu3t4wkvu2sonr--

