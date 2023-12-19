Return-Path: <linux-i2c+bounces-883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F3818E07
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAC728284D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6309035295;
	Tue, 19 Dec 2023 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TggN0veb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816434CF7;
	Tue, 19 Dec 2023 17:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADBEC433C7;
	Tue, 19 Dec 2023 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006616;
	bh=20UlB/3GfBU7VYZQewkO6lNFHuoMJTapMIPvG5CgEsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TggN0vebKJ6zeSIXebegrggCNwejrthasvy1lIIA7g8T3m8pdMjO+QzvSkWd6kacP
	 a3V8Cu4UM2V7YHffN0m/T2R07vKhPE5MxMXOJBkiOCdjBFyVQGZNjWM2jV3msavsSv
	 p5MVd8ONuLdnHnCLdlYi/W6DlzUk7laGzv1vMTU6D9U6uatOpuaok2mFiQYtH9P3+T
	 2HYHCcaQwSC8qHB6CcUV6OG3tEWv6Uod+MBQqbRw+CsIfJiHCjIxgsP2xih5nazRSw
	 ozaG412tuzBggoNg+tacIncA+mG2GQnBrcJsRq51UiV5d1jfc2cxiTfAG1gcx+vRYx
	 hFf07aavyy11g==
Date: Tue, 19 Dec 2023 18:23:32 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
Message-ID: <ZYHRlMukbJUZw7cO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lI4kUQ0cF6rdsM1g"
Content-Disposition: inline
In-Reply-To: <20231207082200.16388-1-jensenhuang@friendlyarm.com>


--lI4kUQ0cF6rdsM1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 04:21:59PM +0800, Jensen Huang wrote:
> Possible deadlock scenario (on reboot):
> rk3x_i2c_xfer_common(polling)
>     -> rk3x_i2c_wait_xfer_poll()
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock);
>             ...
>         <rk3x i2c interrupt>
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock); (deadlock here)
>=20
> Store the IRQ number and disable/enable it around the polling transfer.
> This patch has been tested on NanoPC-T4.
>=20
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-current, thanks!

But I'd like to see the follow-up patches somewhen which have been
discussed in this thread.


--lI4kUQ0cF6rdsM1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWB0ZQACgkQFA3kzBSg
KbbOVw/+NVen+AGSOw4eMjuOsuw6K8gqDN/xh3Ljd6DswQnEF9MIELUKGPoq8/Iw
AgJfpJdu+JLIxqZ7n8wxXAzQNeq4cA7/66j+5N4NSPE5C5DV7iAcQIvlQQHi2P93
uxCjDe6OnDoeS2JA3KCwL+Kce2JQvZ7EWLp5A/UaX1sANt2L3aZ4Xs0vj6yFpRg2
keWp0ouKrsMhRt9Vmi5zFWxtd1M0vdiOLywFLcWRq9vbVB6ZKjcMidjLQHPQ96sM
uKm+3QbhLrV4qPZE+BLI+WAFfAr6x9/geqZ7qyFQeJOfWEcFFHFYMWEba+zybCKa
P9zdG4vAkn8ZzRzoRJ/+xhvoXwUh7RbumsdnNiR51pGnSBF68BsQla5A/cg/mhHL
fMrdIg9d/2BBm0rUrOpIE2EuSRLDJWCWaPuVyx+QNKRDzOlVIYM9PyZbREiWNEyP
1n+IZf09ueeTVy5OJRpQVq4tGy6tp0+R4F/kFLfZKUe4UYr6CQdiUH4ctQw6YBt0
01RAzx4GWxyRpXBjp8uH+Ili3ZIqJpLFDfABErhxfUIMluAOsBetPSuNdEIcWny8
7JICmbtPoYvWoLahdHT8DE3YNQcjf25IQZY3j2mCNKicTeibisXBkgsWieRbcAXS
D8p6y+ALiam4Yx9t871AZAMqZlUq/cXQT7TrkxVaXp/OfsviIpo=
=dZSq
-----END PGP SIGNATURE-----

--lI4kUQ0cF6rdsM1g--

