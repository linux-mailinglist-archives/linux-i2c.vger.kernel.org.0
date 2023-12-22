Return-Path: <linux-i2c+bounces-956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE681C872
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24FD61C220F9
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44F614F9C;
	Fri, 22 Dec 2023 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luyCg5jY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DDD1799B;
	Fri, 22 Dec 2023 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA81C433C8;
	Fri, 22 Dec 2023 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241909;
	bh=M71MUxo5tOWJH2JovLHaHBk3D0hqx5xBSMLAXH+CgJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luyCg5jY398Wphp7QI+jDrP903U0YGhFldIIezTNBNPJD3xC9Ul5W5cyHmEJHrRZa
	 N+3D2T7Y4np0/k8Bpcn1RcW4Eg38nWhIRoMs5LPdg9US5muuetfF+motAajufngBTj
	 XW1am0cGyE/2mSZSgipYZF4ougJ07duN606vjcdtu01MYBST11MntHcoQPWT8tZNgr
	 cF38YUTVg1Y+Eu4DmqK9Ry91rhvD3vX1MQlr8oiQDfOtWXkF6YxmG60RPkvEp/Ke4y
	 hKZejDTQkvM5cbYtbozyxu8kH+1tlyOr8fqnpv3f/1tnVSULO9+Pwfw0Uy1RK9/M3O
	 zNDMxOIPTXOeg==
Date: Fri, 22 Dec 2023 11:45:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] i2c: stm32f7: simplify status messages in case of
 errors
Message-ID: <ZYVosiRTD2w9sVV+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0h9cSmyPzHBl4aQv"
Content-Disposition: inline
In-Reply-To: <20231215170617.95868-4-alain.volmat@foss.st.com>


--0h9cSmyPzHBl4aQv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:07PM +0100, Alain Volmat wrote:
> Avoid usage of __func__ when reporting an error message
> since dev_err/dev_dbg are already providing enough details
> to identify the source of the message.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--0h9cSmyPzHBl4aQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaLIACgkQFA3kzBSg
KbYybRAAlzcv6iwM7R/6fGGyGIucoS8nhhjUkg1kFZ/ZwN98KTomRZY3deDkq5We
7h5K9er1K+2KnJE1ovtmM0E4yYP6leoAx2yv3NKIIrMT1X0QysIXGDVf3wm+FjeQ
9jIE7k+bUj4oxY3bKqT5rqTEqtWCdZ1ltecyCoSRvM6UhOAbOlBW+Bk9CKER/5gx
mtF+JWCLqC6U33zO5OGnZMTclr3SfV26E4VqQtExORkoSxicualxoLdU3kC3tPBs
pDi00odfa/Nb7S5djvMnbgezc2BcsD1SzdW/Vl7glrQqmeF9t5Q0IsuxgM0tUnHt
zMhFlNBOY06GNF4y7iGngh63zdUkCGNj92zHnB2aauK6P8nOQ3pjb+lRU2xhu+6g
M0XAhSgGa/2qS7rEoAWujdsCwXDoatv37zMaw5vWMQyCOduMfPAHH1JtA4/AQVH/
qZ0nMBkhY+uG/PjgmZ8P28ZM+/nZDa29C/+bXdkkcWa7Jef1V0LR/iBq53/KM8Ma
xRvXYxf04nWxcArowzTLzqY9YEXUAuPGZI6UtMCY3+Atykro2G5y4HKfHtZNyPn+
UQuILDFRyg3c4iMipjENfEKa1FzU1WPQ/e1vQDmVz7KJ/Xnd9fUMQKG4sx1dE7gf
WaMILCi9lHuX7wj/+PBwAEh0n5ObCrUDJyAZh/oICwJ4emylSaM=
=OmYE
-----END PGP SIGNATURE-----

--0h9cSmyPzHBl4aQv--

