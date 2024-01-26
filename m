Return-Path: <linux-i2c+bounces-1456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E483D634
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 10:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DBF11F275A9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 09:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B76208A7;
	Fri, 26 Jan 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHecq1xJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCF208A0;
	Fri, 26 Jan 2024 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259280; cv=none; b=jJdAcHEYaOvLdba96MQgUUa2hoO4Wn6qeyB+qdLPBcP/ESwgQpcwUG+biJGW2/HiBp6LrHQKegrV880i01pTVvyIULarm450R5CyD5dyYxomgXczI4xDfy93/UbHlpsKFNc2F0+QsHcgqWWzvdv9vXXI4OY2D5ick4GXFgo79yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259280; c=relaxed/simple;
	bh=Nco0gGCevkj+Z/D7Efv6Mu6IcwBISDdRJFLmz1/fUAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXHmZvEyLZsEqaTHhSXnajxNF/BzCun/a2MelKmLT84goO0qb7O7bJdFBK5TXUpthQTXBRreWdgpMx6bzgcLmgvX8hUWqDXKMV1s42iqOcRMyJqDcZJE0y2xaZqgx/6iZp3Jph1BtABX14LxaiRsG17/l3lLdInGDbr+VWpVEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHecq1xJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C846C433C7;
	Fri, 26 Jan 2024 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706259279;
	bh=Nco0gGCevkj+Z/D7Efv6Mu6IcwBISDdRJFLmz1/fUAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHecq1xJGmyd9yHQrt6uZSsjIEc8vx46L2qMiRCvpsb/pZd94WTS7RmcxpAEvkLRU
	 8NHNawzrU0SRUFlz3V3eMzdfBMngS8sfoukQTUhJDXbhMFMZSjlW1HcSX8OkAuuBQm
	 9OdHdWmt06gKKVgFnhBTTmFxBqrAOuxuxJ6RPOcehbx1DXr+p/AlSN57Kqek6V8EZV
	 TatdPVNulhyp5x4ivTh1KCKFDt6xGLzSCJDrlixyJ6rUcEHEIxSXQzHCdIxE3sXQy/
	 0kLclXE6aEYRc0xWSZbVg5rB3XNTKPY5jEQHEwJ/+aWws0+fykcynA5HYq8mx+ljF9
	 ULrImWI/cChOA==
Date: Fri, 26 Jan 2024 09:54:36 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update i2c host drivers repository
Message-ID: <ZbNzTKCFxBx9Bz6Y@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <20240124225031.3152667-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Zj7cecOgPW9eitE"
Content-Disposition: inline
In-Reply-To: <20240124225031.3152667-1-andi.shyti@kernel.org>


--9Zj7cecOgPW9eitE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:50:31PM +0100, Andi Shyti wrote:
> The i2c host patches are now set to be merged into the following
> repository:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Andi did a great job with the host controller drivers, and we concluded
that it will be easier for all if he maintains his own branches. I will
normally pull them into my I2C tree. If I am out-of-service for some
reason, he can simply move to Greg instead. Thanks, Andi!

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 39219b144c239..ec0ffff6ded40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10091,7 +10091,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  W:	https://i2c.wiki.kernel.org/
>  Q:	https://patchwork.ozlabs.org/project/linux-i2c/list/
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
>  F:	Documentation/devicetree/bindings/i2c/
>  F:	drivers/i2c/algos/
>  F:	drivers/i2c/busses/
> --=20
> 2.43.0
>=20

--9Zj7cecOgPW9eitE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWzc0wACgkQFA3kzBSg
KbaEKA/+LyN0BMyKrNSUO3DpZm4cP+TYl/8atdYDPiPT68yOSvpFLCPKWug2EY1W
bXtmvAd0PXeWuJicSoZUmsWFWctDG4CTPC65+TeNTXRgqFEF2wTJRCT99VcYxVR8
6qsfUyx296C4FfCwk6ftWl4OMEX98O61h74wms3UvQKDE4diInjN4uyeejCo9zVJ
dZsOGXDQzMrgzuA7Ft5DuSu8SDCQK3eth4XL+W5DXKd/33fPBa8Uev7zKlcG3gQe
f2KG9jQftrBYtnWoXkOcA6URhmEXzMmcFdkMQuiNxd5hbB+QDkay6dfWsHQpRhKx
4yoMKLGgNnkb3R+pC0WGHvHgcOuaFgvxEKG5TVaUQkjE7O5/I6uVh1AllUOKtkcA
5ns32gs6nVF1+Z126F+YJAbeJ+jzPZGucI9pQVaoJ7tjqOp4xHwreO3okEwe1Hf0
2dCZFYqaqvvQs9i+dO+lXDsIsWlgjGLivtWwpfPomkxiArco08ckI5js8VmZk4Vd
z3FQIkLWmtArkKDifs89kmLvpRQGqFGq1m1Aeto29+MeuG9cb1Mp+RSjLWHLTwxO
BtLTKzaUQjtOeJqISQLjb9grgCDh63Pj+oMXIoGZjvPbldrqsvz33f774ijFawno
u7bljlEM3B44WRXt8Tkbnn7+Qyk49eUMIVBaX1odS6+PbWTG1tM=
=Td7Z
-----END PGP SIGNATURE-----

--9Zj7cecOgPW9eitE--

