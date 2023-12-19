Return-Path: <linux-i2c+bounces-888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCD8191D9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2679C1C24E0D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 21:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C24B39FD3;
	Tue, 19 Dec 2023 21:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe1h/d2N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F203A262;
	Tue, 19 Dec 2023 21:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46BFC433C8;
	Tue, 19 Dec 2023 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703019687;
	bh=lCKCo7ckizVWRpPEUPMezC6c+Ikwd4cEM0GhD64Wcpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pe1h/d2NiKPz8zQPLeOKd+xemnO6jG6C1KnaaD3bcF5PqRauc/XAqHAYvSx4ELXZ3
	 JItABcOM2aTcR7CIzxhsuPc63t9NvHYVdnSjb+Bo3h0H1BeGuSAYkAar1XD7toX99K
	 2pxCq9W11iUUFEALv4fPfM/3qKGSmru0lWmAD/fQzFh+BNYpf19nbTVu+XTsQjuW8F
	 C43FS4U9Xlu4nu0PFOoKUC3pd7QsLnm4gqKF4G0M9Hg0CKBev3hItdsirnG2oZMEC3
	 s9v6zwq6tveNd70P/UEFE/Hjq/GxtEJrcrxP18nlBN4P2gMNSnn9PU4E3sTgIA2jpL
	 rwKf0FyPEPaSg==
Date: Tue, 19 Dec 2023 22:01:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	linux-i2c@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] i2c: make i2c_bus_type const
Message-ID: <ZYIEo8H6Vz0psGOB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	linux-i2c@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
References: <2023121942-jumble-unethical-3163@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJv6Wj12fyHLJMkX"
Content-Disposition: inline
In-Reply-To: <2023121942-jumble-unethical-3163@gregkh>


--gJv6Wj12fyHLJMkX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 04:22:43PM +0100, Greg Kroah-Hartman wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the i2c_bus_type variable to be a constant structure as well, placing
> it into read-only memory which can not be modified at runtime.
>=20
> Note, the sound/soc/rockchip/rk3399_gru_sound.c also needed tweaking as
> it decided to save off a pointer to a bus type for internal stuff, and
> it was using the i2c_bus_type as well.
>=20
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to for-next, thanks!


--gJv6Wj12fyHLJMkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCBKMACgkQFA3kzBSg
Kbbzvw/8DPBh44kdD/FS9nh7venOLDxhoqI+4TPeK6q6PfcV5hYrx5IA0J35w3r4
eYBdFl6McEWJvQnUwhPAj3UAiUcMxNbEIbnBH/HB1OawmqyTlzuLD+c0arONMWEe
eWCyBiqadts9huWTsy/WN1BZXDPF/QDzLA5sfn5L7kGbjcVi5iLQWsQ7h5FD06H8
hbYFG+PkejM3XwNKbrY2M+N2nhcJpmpdVKntoHSNE4oF0LSp/FY40zgcTgwW6txX
Bd83AYDqwEtKDefGYoYu+FefhdMyiIV7GJhf/A2Tg/Zt1a5Aah5i2dGIb2gmppZr
fF6WiElKjh2bSdihivyYviwpidVtzwv2ZQnkLarY+zLKcu2GXv3QrZBzy2zJz3Qd
CPuwwLv6MEeue2aEc49LUgsq83AenKmDxUwi37FNBDGhI3WOdC92AZipdqptbES/
Z9yNoJamBfn26kBVq8NyIUjg4XR9eO7WD9GC1q+WgM4hY30KglREC0xL3pJUgGfu
mlI+4t2A9k40qEOKSS7l6QdbHq1tcz4bt5NlIU4TBGwiUDdvLgXgo0fhqj9KD3kc
+tgdNT8e/ADcIvv0auqyzMjyF3ff/p4WkJxBLeqWEgAA5xvTZEw1qzgzdVPYYOGs
WWjco3V8ZTAKy3V8qkX9hsKZIUtuLl1DvdbZMQeSgxTr8aNJMw0=
=f8qM
-----END PGP SIGNATURE-----

--gJv6Wj12fyHLJMkX--

