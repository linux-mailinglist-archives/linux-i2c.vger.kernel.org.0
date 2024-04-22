Return-Path: <linux-i2c+bounces-3042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A538AD121
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 17:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56841F22B21
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 15:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADCD1534F7;
	Mon, 22 Apr 2024 15:42:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1A152509
	for <linux-i2c@vger.kernel.org>; Mon, 22 Apr 2024 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713800560; cv=none; b=h+rpUZGT4dmkfNTsA8+qNGPv8DNrie6lszuWez8ivzs2ZTIlLuit0H5skpXQ/+YUAthdYcQ316lxvrdSmQXSXwE/n29GOyqatt59A8wQmSrJnKdIMK5IvYjpjXY05OolaSL5efZr8vfiEe2ZBOO9OIGH+0ktTDtixv8dWftO1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713800560; c=relaxed/simple;
	bh=1ZQOHptYXX3HrTQPw5/AkT23LKEv6avumWOtVNiEBQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upW/5xN4S0RJ/lmAdo95LADZrKRCFBlFQRW3rT6WpHfCST0jsZPxyN8XNmA3idqwSQ4SexsOwwqP1ETJJCBB9wNIkBOp+kZwzXjSUtwE5kh3iTr0cOavMWAddrt+QJ4nex3KliwwOkZFIupNHwBlWWdPJ0YwZDwDmZ9sl2nYFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ryvoD-0005wq-Fe; Mon, 22 Apr 2024 17:42:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ryvoC-00DiZl-EC; Mon, 22 Apr 2024 17:42:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ryvoC-006AzV-17;
	Mon, 22 Apr 2024 17:42:20 +0200
Date: Mon, 22 Apr 2024 17:42:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <7lcpupsaepqzxwovzvddtvrdr3f3xaxedxv5nfg4ax73gazu7t@mbc6ajq5suxh>
References: <20240422113629.1629891-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57xlb4vbtmvwwuxp"
Content-Disposition: inline
In-Reply-To: <20240422113629.1629891-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--57xlb4vbtmvwwuxp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

On Mon, Apr 22, 2024 at 01:36:29PM +0200, Alexander Stein wrote:
> The dependency from v2 has already been merged in commit b0cde62e4c548
> ("clk: Add a devm variant of clk_rate_exclusive_get()").

Note that you might also need 7f1dd39aedfccf60772328c5b88d56dbd39954c3
which is part of v6.9-rc5.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--57xlb4vbtmvwwuxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYmhVsACgkQj4D7WH0S
/k55lwf/cekpfnj5lv5y3h8dke+TMq1Scw8/act4h/I4gUCa1ZSMsiI6ilU+Kd+Z
ht4Psn95hw9CtcK2NijLd2MZTV4angPZxGjYAaSddPGTlLQ2+tH1YWqdc+n+S/b+
SGuKmSniD/6wMVUFqJfwLqcIlrCytNPwwj1V+LjUJud8ciuDo8QMmBekhtAyvk2b
rHwSYH2zOn8QNN1P+WLMz2C7SRzdtQrzbUqDlw/y+Yczn7YqCapT+oeJWWDeDfOe
SGvzQtgK81DXDlVzanrHqUHSylo7+w2PR6Gmb7nnGoDVenfiQx4OzpjZ/0vlQ1C6
8KF2nGMS0ZbDl+wdgDUgR/LxyOtjig==
=zY54
-----END PGP SIGNATURE-----

--57xlb4vbtmvwwuxp--

