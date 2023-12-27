Return-Path: <linux-i2c+bounces-1026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4481F177
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 20:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CDB51F23048
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 19:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE38E47A51;
	Wed, 27 Dec 2023 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWPlmCCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F847A44
	for <linux-i2c@vger.kernel.org>; Wed, 27 Dec 2023 19:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B52C433C7;
	Wed, 27 Dec 2023 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703703643;
	bh=RNSA2rpQhTOet2HCAOeMmijB0R8DCjK6qRgbfJqtEww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWPlmCCwdUVpu30y/LkWOmNcGWULKqvBNOO2NZJPyM0dkuKNp7d3f1xt3V48b/fLk
	 Fzap3jcRGfcHRk388HRgi7upl0yUFJjPZCAiZy3udoQxOSoNIt8p1YSPSv6ZjnFYvO
	 rsTOdFQ8Ccp1cYOd3OPoeU6dpECBoLlNBZWlQxGz4Kzn9O8PlFE3nGeUS36fasVh+Z
	 +k/yfdsdAPciX37paYik3dBywsee+H4rv4oi+XjSpsP84UZb+r9Z+KcVbLQstKd7dy
	 p5rlmrtKTZ1LhfM740aGSFDVxPY7wMiH9DTs2j9Luxk3cEO5LrJq/mtbz36KkzB0oO
	 vKEZnGNu+BEwg==
Date: Wed, 27 Dec 2023 20:00:36 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v4 1/8] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <ZYx0VPVmyQhtG+B9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, linux-i2c@vger.kernel.org,
	andi.shyti@kernel.org, cobechen@zhaoxin.com
References: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
 <acef54645a54bb85b2ae81b530f155c4dcdf9086.1703647471.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WXlnMaNyf6K/qCcY"
Content-Disposition: inline
In-Reply-To: <acef54645a54bb85b2ae81b530f155c4dcdf9086.1703647471.git.hanshu-oc@zhaoxin.com>


--WXlnMaNyf6K/qCcY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 12:39:44PM +0800, Hans Hu wrote:
> Some common initialization actions are put in the function
> wmt_i2c_init(), which is convenient to share with zhaoxin.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

I get a build error:

  CC      drivers/i2c/busses/i2c-wmt.o
drivers/i2c/busses/i2c-wmt.c:289:5: error: no previous prototype for =E2=80=
=98wmt_i2c_init=E2=80=99 [-Werror=3Dmissing-prototypes]
  289 | int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev *=
*pi2c_dev)
      |     ^~~~~~~~~~~~

--WXlnMaNyf6K/qCcY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWMdFAACgkQFA3kzBSg
KbZEpxAAnri/mRKaa8XJTp/QOtdvhoksnWpt85QOGM+AdTxJ5lcadcWg95dWXbxC
DL9HFAomfgyFHVeIfnVLgh7cPsxeIhACUxDarDAQyeGKYoKw1VLH28M1sc1oUF/B
DoEPmY26ye2eA7PJpEzFLa4wTTuFzewbEEgtJ9sd1Rf+u29oohujkOInHYdqRkQz
qVjPDnHYZ+B3Jhft3lirNcG7cMm1QPlpuDnXD0vNuaUDW5Cn+YBWuyTz2x+JrVZJ
0/Sis6F9/xBy62XlL962kEyY12iOeuzdTCkFTL9feMqAAOA1IETJsYLpSI8AZMZZ
TBn1LBrZf5YX2F5+lsGkcn2GYyKRCwnKlD8IklKcSYQ32dAFAw7fasjIcOuNpJ3R
XqplCJQLa9cR4TzwZj5qJayR6jIuzi3eB94IIxudCPR6a4CMps+6E2grIO2g/IQE
BTAyuGfhupGV45dO4wLSLgI83tWFD7Di1maOWKI7dB+tO/yFotkd5CJ2xzQpwKI5
jqo6gASxZxrbQT23rDp50W838BSW5E4gU1qblBF3ehykM7f37jW6oTL8asXarQOu
JtmAxp31qN1n0S5FI4UCIYhonb5epH+aqkMYlvX3tAjuqW2Tl9328oSArLZu5ofe
YeJWrKBvWBlmPeEwqrf7X/L5bEyrI6gZbPZ9U2X2q4W663cZnW4=
=47d0
-----END PGP SIGNATURE-----

--WXlnMaNyf6K/qCcY--

