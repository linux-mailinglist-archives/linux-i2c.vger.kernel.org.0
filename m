Return-Path: <linux-i2c+bounces-958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AE81C87C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B0F1C22272
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC81642B;
	Fri, 22 Dec 2023 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPKPh2hI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F8182AF;
	Fri, 22 Dec 2023 10:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97A6C433C8;
	Fri, 22 Dec 2023 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241930;
	bh=5MLgpsJTYLuqYRrWpxRsWF1/TFK8+CG7MDHyVoSKsoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPKPh2hI3QHdMEB76+M0JQZ+MWd6lohMTxUY+JzFqI67ED3EhuNKax9NrQy992QXz
	 GvjEbocXBA2+AMv5FH2V9QODoDXBV0HI3rc7dRG7s6uRcijx0WOqrrxV81wAlXmaUI
	 EOoLrIw1lNe08PbUVcwcSc1aXCdb7WNW+2vfq0bFHADRcI13ipjCPDcj2hpxoNGTwP
	 Gy3o5pTYx5V1QXHMi5vBXUnoO8f/mbOgj7P1VHVLeBvbjMwNMMsx4HHAxUduRenfxa
	 5FE+t6CLO9CRUM5xeT+9pzb5HhpYyJDdT4QddL80UpuElvHJIuHz7fQzLTUI7ZUKB9
	 szezi2UuaqLDg==
Date: Fri, 22 Dec 2023 11:45:27 +0100
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
Subject: Re: [PATCH v3 5/9] i2c: stm32f7: perform I2C_ISR read once at
 beginning of event isr
Message-ID: <ZYVox185zFjRZUJ4@shikoro>
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
 <20231215170617.95868-6-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SE4QN9cT3rppdLX"
Content-Disposition: inline
In-Reply-To: <20231215170617.95868-6-alain.volmat@foss.st.com>


--/SE4QN9cT3rppdLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:09PM +0100, Alain Volmat wrote:
> Move readl_relaxed of I2C_ISR register at beginning of event isr
> so that it done once for both master & slave handling.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--/SE4QN9cT3rppdLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaMcACgkQFA3kzBSg
Kba4Gg/7BkltCTe7oP8JOFK7FbYBVgFF1OLvT02kjyOP/I30dy+XGdXXMHfDdtnO
KGsvZ9RGX8tnpUBaPKnqt/BKBkic3uwkCTIt2fSM64qLtrHmpDESkGY+Nxrjaz7i
/cGk4/2PEFniKLUJ6BgQ273UUz9kDCzVRJ1UjSUfFeg/BxTYR4pHEDTMFSpR0ZGV
9QcjsIoq1rvaIthBlm8ZYf9AoAsIQrpYQzlespfiJotVXzKwRr7W0EOojYZWOzSp
k/LQVcX1pFsfzSZUgg9niClPFSdpBl7a2vYSvx/FEhKcxO/is7TZ28Y8e6kZU3b5
HoBOuzcv/OUXqDCUag0RE4uvqwk8dvVfE888Zzqt/YO0OxbtX7e5FbK+wL4jzNg+
zTBQJfYQwmGmrQqLCVzo0nPh58IsS+gwFdHbKXSiRKM5CfDJRpIpFSVGss01RKVi
PDe1g/1nFNnDa772zvC4v/LvQqWD1qu4e4IxkyxexXDvMk1HnlWcNp7vx0FYbDsE
r8tR/XBbMrJ50QX0wjXXseLBKBOO92hau6aLacK7Cg0CTKB2Wn9cDC/iVgJhjwKu
qLUxSIrbK6vW1Rx7poH3uylk/ICR6+1udzFnPoRXMiUw1R9kewQKjdl/y7Iajq1T
/yodi9NiR5H/KLQcRevPGTqXkn42zR6o9ZtK7s1H5HUlR+qU57M=
=FAWm
-----END PGP SIGNATURE-----

--/SE4QN9cT3rppdLX--

