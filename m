Return-Path: <linux-i2c+bounces-860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9228818537
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078F01C22AA8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 10:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370A314A90;
	Tue, 19 Dec 2023 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvponOVs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBE1429B;
	Tue, 19 Dec 2023 10:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF72C433C7;
	Tue, 19 Dec 2023 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702981280;
	bh=gZeK5clkD/uu2z40FQVqIntH9HPz1O4KCvUi/zNGLMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvponOVsqh9GkVQ/7+K8rhxhBFN7YG7FKUsOyD2XR/y41ysT0uBpcakdessirTzvg
	 iKrjv4Xc01Wuz6C3Hfl8JcSG4RdaskhvxX6ia5UKrotuHCyKORNv7jdZCeWirD9Ca7
	 Wg+gej2zwMBXtSDRdEdPM+BKqS/n4o8LFICXT4Mr7XNeIRtuTpkDy3/P6D+AvNBKla
	 XiUW6vUmv2jZhQ5/LQE1pmiLxfTnu8tMz9f4Xchqug2oyZEC6d72eDNTNSQw23U8Uc
	 iSOvH6TT97yGaIpF5CO06ecnhgbBZCzkt8su5mBEMSukRNF+hKAMHwc6Vpjaa710wA
	 m8hjDsd10DIkA==
Date: Tue, 19 Dec 2023 11:21:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-fsd@tesla.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: i2c: exynos5: add specific compatible
 for Tesla FSD
Message-ID: <ZYFunIR3WTWEQZ27@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-fsd@tesla.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
 <20231205092229.19135-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e0jaSCCZf1PJUyzj"
Content-Disposition: inline
In-Reply-To: <20231205092229.19135-2-krzysztof.kozlowski@linaro.org>


--e0jaSCCZf1PJUyzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 10:22:24AM +0100, Krzysztof Kozlowski wrote:
> Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
> others it reuses several devices from older designs.  Historically we
> kept the old (block's) compatible only.  This works fine and there is no
> bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add Tesla FSD compatible specific to be used with an existing fallback.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--e0jaSCCZf1PJUyzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBbpgACgkQFA3kzBSg
Kbay8BAAl6hb97thKirgRbgydIp3RV6plHUmPsCCvb1syX83MRmXvfuFpK0q3XHM
Q2LO216TmVPqOtoX9njmTJBgQevTK3UhRCiQ/sY6o08iq0zMLUPdWAVvnQZbZJzm
I8cTKXU23K/nxWnccup5WbVcJIyklvDIK/+U8RsLD9+Rgzj/feynWuh7dMTTBdQf
LXmxSiw3e0EKQlov6CYi+cGrRthDSZ1cC0g2aQ909cNz4/jAZMFrn2MAW1X5xrRc
VNUlqK09MfNSSpH8RmBC1K8bxYrMiX5VElOZvE+9iFvjfvb2kfuoHK/TiWAv/HTM
z9ATejmPxB15c7MY5hJIjE4W0SWQvWqTG38n2AXNVydat0ZNWYs+2aSgMlu8L2R+
pI+35+Weehn18Zl0ajcXEfjTfVmx9s+7CA80S4b2ieRWXbS0IGFdCT55plW2ojWQ
kQe/wql3+EPmih8QW32laDFVguvrfIUgRFEBpf9XeORSygcQuquN3m5Lt1KVFdUW
k/EZ+rN9ecZ3h8g6zGaCOVUdWRjTW2hU9RrW0fJpZjGAiwyXqbdQK+yDDgAXIh4e
o5XrhxtySQmVSmR06WGkUwPVBxYUWiwST5ImOEJlMaJcobX8ldTCwhpcgOr6iJiO
pY9lpfcicVqh6SZLv/Vqh/Ph0EQcdY/5/i4jBhOr6pTuHFKLMBY=
=0p7B
-----END PGP SIGNATURE-----

--e0jaSCCZf1PJUyzj--

