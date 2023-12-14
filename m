Return-Path: <linux-i2c+bounces-788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B188130EC
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 14:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F441C216B0
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 13:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4279A52F83;
	Thu, 14 Dec 2023 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiul8Eew"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6041224;
	Thu, 14 Dec 2023 13:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829CFC433C9;
	Thu, 14 Dec 2023 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702559218;
	bh=4DmhfcKP5a7QiKawraF+mw/pvVqMPyK0S58+roaapOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiul8EewigOeqOx6Mi9PQ6UZF0YQOATTHlzqVv7wkqi4OqclyCpebjS1KjirRDmEJ
	 SvN6nIAF5QFu3Rcpr05GHKOL9eWgDgCzQnhmYlLvXsoBM5YepIaVkkk87flH4foOMk
	 HaEEHOk0t2MkerO7erR4Tg+mK9QVlxsBk7Li9xJ41U0gwmHV/F1W6wdcrgGytQYVC6
	 l+8sai6EDx5PdMp0sZGLrrvruoCIlp5nUBPWXV5vXuL6jbYuhR4pxOxmDPiJk4Tuig
	 EUYn8D2ZMCCIcBnTMtuI4S6P9Gk70pgl1fWKnsQog7jGOaMaIc+kHPMXoL5wrB9y7/
	 vLwEC5YUsRGug==
Date: Thu, 14 Dec 2023 14:06:54 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	s.nawrocki@samsung.com, tomasz.figa@gmail.com,
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com,
	willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: i2c: exynos5: add google,gs101-hsi2c
 compatible
Message-ID: <ZXr97owdnLq3viNc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
	andi.shyti@kernel.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
	tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
	semen.protsenko@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-4-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HQnYG9fD4BDlpmSL"
Content-Disposition: inline
In-Reply-To: <20231214105243.3707730-4-tudor.ambarus@linaro.org>


--HQnYG9fD4BDlpmSL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 10:52:33AM +0000, Tudor Ambarus wrote:
> Add google,gs101-hsi2c dedicated compatible for representing
> I2C of Google GS101 SoC.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--HQnYG9fD4BDlpmSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmV6/ekACgkQFA3kzBSg
Kbac1hAAtEeMMhA9NKxHiemKCgdvzxVb71vVFzKZTa0rM9HstusgWrnxcXTU4XWd
tQMUwAVVs6G5Lxho0WuFLuJXRVmc/XOFSyDLeo75vHop/khJpREg5/4x5S953V7j
SDY4ThYVJuYdXFhZKFsiH04nV3O4zrxm3leDvT0q9C9P09Xh7DYeMu2PnHPV/Gu1
JFGknNxP4nAb86hKMMsZIkhWZ9Wk+XZAluArjyu17rKeSQHcbE6QJoR95AEydEUy
PolkM4ZOh/SHRffnMO+FG1+IX2lIEMM9dOX2eLpjZzMRI4iW0I39iQaoPz7WSqQs
fWa8LdXndWGIZvQmYN4lRjQFhzDKDEOheg/SglzLuGa+48tkqrrcRKGRM+Kx/cGo
yHbtA6qimdxi/o8+YmUWl+X57X8JIbgmSHsucm/+lNCG6JFtfMyOskeS1hsIgWws
PV3BPNAY32hJLbEnTf2royzKnJbWMt75RZJTsu/8j54DPydhhLO9IqdHDqngnHpp
d5WPhOebKuYdqH5YHqVG6C7hOYTR903tWy0annEcAKm64bboWZ9EWYs5Z0IP2/af
i/i9y1Nou+YYvlSmkp0asWHhpHySkIR3rkThW9eIHVBEWkSS2si6WJSfWQBvDGro
hEYeczzfDuUcb3v6vuIinWdDcVoHWyrlRbJS5GLIT8LoVAc8ohs=
=msdb
-----END PGP SIGNATURE-----

--HQnYG9fD4BDlpmSL--

