Return-Path: <linux-i2c+bounces-96-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DDD7E944A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 02:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5AC1C2088C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 01:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8007346A6;
	Mon, 13 Nov 2023 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFRWmE7e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5F4695
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 01:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA40C433C8;
	Mon, 13 Nov 2023 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699840421;
	bh=XM9slHSuHenZFKSKWvvQ6DDBmN0fQyrYpW8MWDgIWQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFRWmE7eQJ/aTD5Mxtenkz//2MYKZtNl9tyxUnpeh+LWPlfHtucmPCkEE+tVMCwJh
	 HFQ6Chd6SaagJ4siodStopahCVtR4TKSfxAWdH9XHU+xsQbiUECq9tPpJN+Esgz4yT
	 lyHWQ578XPnYCRzXc1yl0GYslbTxoF+B+7ZhvdfUEq3TRb6JJmIte5qz+PyQXnQN3k
	 qAd2UZVT0FCrDo+cTEuy1gYr/j46xVHrjUYNlOFRnOWT5nLUp01qu7nlgD75nnyV08
	 PlI32ybE7TzLEFCdrdkAQoM1k6WllfNkdB6ZKZtwlC97sbZyUteT4gGlOvpdK84bnW
	 obwuJcxqfz8bQ==
Date: Sun, 12 Nov 2023 20:53:24 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
	linus.walleij@linaro.org, codrin.ciubotariu@microchip.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: pxa: move to generic GPIO recovery"
Message-ID: <ZVGBlBQ+8tWodl4H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk, linus.walleij@linaro.org,
	codrin.ciubotariu@microchip.com, stable@vger.kernel.org
References: <20231110093039.190076-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEUhyd/zH8KpS+AA"
Content-Disposition: inline
In-Reply-To: <20231110093039.190076-1-robert.marko@sartura.hr>


--qEUhyd/zH8KpS+AA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 10:30:11AM +0100, Robert Marko wrote:
> This reverts commit 0b01392c18b9993a584f36ace1d61118772ad0ca.
>=20
> Conversion of PXA to generic I2C recovery, makes the I2C bus completely
> lock up if recovery pinctrl is present in the DT and I2C recovery is
> enabled.
>=20
> So, until the generic I2C recovery can also work with PXA lets revert
> to have working I2C and I2C recovery again.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: stable@vger.kernel.org # 5.11+

Applied to for-current, thanks!


--qEUhyd/zH8KpS+AA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVRgZAACgkQFA3kzBSg
Kbatng//Zrp13u+PGqC/LepdrqLGxOqtkeZgDDl6YzZ5fv9ZQDwJfO/zGcnKm4Oh
+iT68p2iyjerdzwRNXs7Y82ifKRcg+XnuqO67XTfTLKT+lDnbXC2D09GAPO7naF5
dA03JyfwloaPQZuF5KEe0NGg6Mz3EzunGpO4DwQUI7TEP8DqbtuLLCW6nStrSCvd
aF1D5To7bi7jCMkj4XIJcdb6iocePcie0dZD7WvXMY+gIfCt8OupJEmq51u07wR1
pPhi0NTDcAQRszjgUNAHp0S224dIFSuhDxclwn7naLmgAofS860uX1exhK4Ff2Qh
ugAPrZKF8Y6wXdlAITVtAoMIYKGXiD2PQhKSFQYiMaFygwfem/q8kYB/SbciMtYY
y4GR6g9IHjD5gybfijqzIbvbNKoZGiTaeMHhoY+s8padSW5X/AqDeS4GlVa/S0eH
yQMSmJJ75pfGUVajfFp5SDD9jYfLooUPhAS8yoOw1hR+lcjTSRllXuhIxPqeE/Zm
uElJ9fA3imCZOdO6UQ1kEDLL0+NnF2aB30Qe1/vjUQWHMW47+oE2fLhOwxwKLWRy
OmYVfLd67yT6kHRUJ72EQJ0KGW5lvCUdbK0InIK3d7FclZWKXuNA5GqOKiLeZ65r
z2BDNlRf6XGQ7hOPGibKHC2y7RP6q95UtzEVxVFvs7XSK6q8vL4=
=sbB+
-----END PGP SIGNATURE-----

--qEUhyd/zH8KpS+AA--

