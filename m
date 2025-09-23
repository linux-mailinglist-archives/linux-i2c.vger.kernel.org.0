Return-Path: <linux-i2c+bounces-13123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76457B974F8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 21:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A954C734A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 19:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1174D303A1D;
	Tue, 23 Sep 2025 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ONh4mnwL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF066257437
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758654867; cv=none; b=WLCW6+FHpC7FALG/wrJ873+64h49AF/fNt0zD10AW912u8oUZ5K4GJKqcjC3Bz3yhhUg2ZneyZn7iu9UAC+KTyZVuZz71XbF/opuVmP5vPjVYM2L1/uuStODOdYxiC8IFoLOdFuyewvYQZGv4u+ZsH+9Gab6OIqCAa+xtc3eB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758654867; c=relaxed/simple;
	bh=jJ9cN/DYo2vq0Mrw3OGwNIh02VJj1UV39hWhXZ3qfo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGFO8C9L3CJ798Ly+L4lkNwom2Xq/GkzyGV7ifIYM/Z4jj0NyQPpq52GmX3ruuQT0J5FcBfq7Q100vduQpOpy9kjDo7Gol/aoEWBnSyEbb3HDF9NE7ojkuj3hyuBKxfdbX0mtW7KU21+e5xWg9xeFT7NxlIHMPdvNY4rUjU7cH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ONh4mnwL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jJ9c
	N/DYo2vq0Mrw3OGwNIh02VJj1UV39hWhXZ3qfo8=; b=ONh4mnwLtQjjme5jBfjj
	/V97gDh495tc0pCNXdvUH530j/BFt9+imSrij29NxltvgTXJQUokojbeS8xVJ1t3
	uGSzs0JUNvA5CkGpmEcepLereVkHdGejyD2CHYVERlpJ/yDQ0YvxEe0iWda05Uqx
	xBkG1mlzB/PMxpK7N3/Qiybx3Su/a0I99mgrQlyuXIeDExU7XJgmRSpHYyelym2E
	oHGQSyJSMjEWwkjYKFFXZyyXKxR6FUZHbD3/UdCGHSvsp8PS14EVsV31KXIf7M5P
	amJttrK2XQTQYaS2KESpN3p/BYddhvFmPpUuesvrpn02u/kaeZDCjMP1tmFvtxuO
	XA==
Received: (qmail 1217279 invoked from network); 23 Sep 2025 21:14:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:14:22 +0200
X-UD-Smtp-Session: l3s3148p1@8JJevnw/Uqsujnsp
Date: Tue, 23 Sep 2025 21:14:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, wsa@kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] i2c: riic: Allow setting frequencies lower than 50KHz
Message-ID: <aNLxjmOj5Vy26BpE@shikoro>
References: <20250923141826.3765925-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hkrmgQDHtEnJrbgn"
Content-Disposition: inline
In-Reply-To: <20250923141826.3765925-1-claudiu.beznea.uj@bp.renesas.com>


--hkrmgQDHtEnJrbgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 05:18:26PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The MR1.CKS field is 3 bits wide and all the possible values (from 0 to
> 7) are valid. This is true for all the SoCs currently integrated in
> upstream Linux. Take into account CKS=3D7 which allows setting bus
> frequencies lower than 50KHz. This may be useful at least for debugging.
>=20
> Fixes: d982d6651419 ("i2c: riic: remove clock and frequency restrictions")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Applied to for-current, thanks!


--hkrmgQDHtEnJrbgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjS8Y4ACgkQFA3kzBSg
Kba9nw/6Ah5MqRiLYqFos9kaw02e/QAN/iTO9X9TSSX1uzG4KoFseArQM0Nk05Qy
vwCKmv66MquakRFcmlZX70evqxehap1ciJPB5CkrmFpA3g+HKIkGSfZcXNttX0Dx
hhbx1ZQXnwi6eK3t370bCT27aGJcA4SyVVZJXteDh7urbQQ1/S3CdQTfCDrn37Yi
u1wdLly4F5sZY+PYYfDv0+mNHlELQxhdiC43vYnGadgunIzFOGfZ3DVSF3iOwKMv
XYRzaviM2A5q/5i3+CnjlLUKONe8QtjZgfHlfZl89TdTUFsgTvM2Qm6sgAGclU9l
fcmFBlSG1MquQThuufQwhncBeDUfxqo3rAHd/otSeUcGSxrhnHLLdP9cH+Qrd+i5
cC8BDW1JopxSDRPq1ofiQiGV9L5qn5uu0ctCM34xbFy3q4khuDMccAPUnWcLIcMm
1Mq1wrDfAkF1zSYWybKOGxIbbA3NZCGJBwsx+PV8BfZSFB9aNf+0ssLTzQnyGGdt
ytqtHnp8IOYWSXJbXN1B26llgSztecaZRnAmIO7gjMfVNTR4MY+yzPeoLBYvXOi8
Uh3ShU9O/vxisQrn0YTWmJSQkrNmPaOygReZpQOegFtYik0kotrkvuhXs2/V+AGS
2DBKr0kMtL0658bbPeVTbzx302DiLM9/eWVocrw3vSZ+e7kRI+E=
=iUJO
-----END PGP SIGNATURE-----

--hkrmgQDHtEnJrbgn--

