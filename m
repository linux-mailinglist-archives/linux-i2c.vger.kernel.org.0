Return-Path: <linux-i2c+bounces-10741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C52AA752E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 16:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C2F97B7FFF
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A21256C9A;
	Fri,  2 May 2025 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q2WY/Vwe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA9256C89
	for <linux-i2c@vger.kernel.org>; Fri,  2 May 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196835; cv=none; b=awY83gnn1cohsRpRM5ZLMG64/dQCuJq5MAldJuISorcu4WDgmFIWcZm6K6BoEEqdt4eyLGaoitHpDuo+7HS6BvTK66pauUAY6mYZ1OznXdST8707OA7NGQNPc0fGPknBTRo/zou7b2G1WpyF7lYSvgqlU0E3p5JhmEg41i3eJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196835; c=relaxed/simple;
	bh=39dqUcCyMzTRb5cdM8I0FifJ7XYO5FNlhwLMdUzWL7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YezQ8mX0odb+UVV4ATiHyfp4ZUHSEKY+2tyvL/k/2C+U/Kz4aqFDYvLYulyrmRWHgWta4NjjGqBdmbhs2QWSUdmh0VNAzoh0+/Gr4TeTLT6QU7YzIvnFVv3x/whsNyj1Uev0kvaU7Ao0TZs5Q4ROlNbtbkqhmW7O/Up0NRx2NOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q2WY/Vwe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cWF0
	S/1MBrwO3AaGE2PAgjZIEyMy68anUlG7dJSs91g=; b=Q2WY/Vwe8J5D1vT9P09U
	8kKZDCQVALh8zn4acmMb0P353LbK/DV16VFKsOyhoTa24bqe4HVGyxPX9Gg5P3SV
	uVM1eMjeNCHIgyV7ZIClCSwCQEXrP4qJkrLZoxKP5bNahGCfQO4XJsjCBDQA+LX0
	jkg5A+r9oKPYXKvZ2VVdc7vmkJBhK3VSdQRlQ4it39CYUMPebVl3L4+GwVOO9zPw
	PUSMmFKKEonwan+zaHt1gIMpH5O8swr/584+RY6dFNkiFyLy0iO3tlO2TtytHbI3
	DDwue0PkH/NOab1elzrRqjYtF3zzKcL2hdornlSy1k276CcAcpt0nW5uizfgc0X3
	Lg==
Received: (qmail 1483228 invoked from network); 2 May 2025 16:40:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 May 2025 16:40:30 +0200
X-UD-Smtp-Session: l3s3148p1@C7HKISg0ioAujnsd
Date: Fri, 2 May 2025 16:40:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <aBTZXsMJK3lsiUiU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aAii_iawJdptQyCt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CJGHFGT6dwZtPHAX"
Content-Disposition: inline
In-Reply-To: <aAii_iawJdptQyCt@stanley.mountain>


--CJGHFGT6dwZtPHAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:21:18AM +0300, Dan Carpenter wrote:
> When the list_for_each_entry_reverse() exits without hitting a break
> then the list cursor points to invalid memory.  So this check for
> if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> variable to track if we found what we were looking for or not.
>=20
> Fixes: c3f55241882b ("i2c: Support dynamic address translation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to for-next with Tomi's description added, thanks!


--CJGHFGT6dwZtPHAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgU2V4ACgkQFA3kzBSg
KbYizQ/+NjG++zs7zSh4UTa3D4bQq/KDsq4uK1Lzg5zgy2VNhdkp4gGR5RXuCCO9
UMifyNKEE0NDNInI8xIPc4LA8YtC1inlB7j53dFisRMXDw0KDdFyCtcYT7tG+lcI
209Tc/mpnB1UgbF/LxE6Uj6xuDSWlxdsKENByJ7mBiJEBK162HYe273VHc3m1UjE
dhAK8Y46mMXLwJ9U3XuXh5NVox9suQxeBxtO927yKAGLEzrAhm25Io3u5crwbXbp
pg8jA9+NwTd+RYmlwmqS/Z72CxuLWaJX+T3623KPeiJOo4Fhet7nRcOD3w/CmFHH
G17P3tXboDcoVuu7E15Db/QVg2JN4JdsseuMx/K+wBkn9geOguiZ2ltP5IeN3DyJ
4gS8K3UMxgmUrW2oDlQhAYr2sEBjoBI2sVNtXIfXGSbA2C8ag4lwlhhDcd3IMyI7
bF0gDj3ZmGR4I5ZluA61oTm7+9y41WUhtPELO4WrvPHx2WTtmYex69EqTdnKTdG8
U+4IvQMPmdYdauA5Skr5fexF03cNhZ7WwQUMJM2CSJyA7dufnvzt9jYH9PyLc4ez
HlRVG28nb0mOZ3TWOlqb4RIrYHbFEFJdHx31gitvb62xSNVHKRP08k3Z1qdFtR6A
Cl4xQ/Q//y0ZbqmJmebrOBxi5ylxeFcbMkWmpkOQhx4Qz2is3Po=
=8SXg
-----END PGP SIGNATURE-----

--CJGHFGT6dwZtPHAX--

