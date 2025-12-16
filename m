Return-Path: <linux-i2c+bounces-14608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2627CC4F60
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8908B304EFCF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D908533DED5;
	Tue, 16 Dec 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzAUPjSW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E552652B7;
	Tue, 16 Dec 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765911184; cv=none; b=jzmQDeV1eV0FjRaEsLd1TIE5L/2Nw8Nm2ZjN4UNEn3zG77m8+PwGHRRwQULfDxzTSxqTpDOoGfB4ptXtewT1dkv4/5BRU1xMQDL7cJG/eNURxdnh0Cvq8vr2J24XqDdP4e67DeR7krrk5uGfPJ9gHsp4+kHZBM+GG4libll/e28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765911184; c=relaxed/simple;
	bh=V72KZIkvRJxTqzRbnLjRwswTaHH6wcpmi2d+xQOkaQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA7ibdS6HPJu9AxTvEHlIsj2JoSYYRGtRJJ8r2Ju9+6scQdq+ZgiOD6wv64As4KHfog5dj+Ub3sW3wB5G2SrxReZgjFFMHvyczbESkXF767d5oxW8SAFFzP3oO6zVI6TJSxha3rTrkbbEqhFQLxFyUriM7sJJc+xozhzTG5FTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzAUPjSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE011C4CEF1;
	Tue, 16 Dec 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765911183;
	bh=V72KZIkvRJxTqzRbnLjRwswTaHH6wcpmi2d+xQOkaQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzAUPjSW1CSsiObqjSMX67ja4VWZr2wKq1Z78pd+ElLow0iLJhg0Y/a6hFpwoaKsP
	 /p4DtUPm6jT2ZzSWQmF6hnJz7joEO+l5Caauglhhe/LcV341yHqgxkRRq6/JhwhNwG
	 8JGLMJJghiOG/uZUOlinlzwYMyH5OKdW1H3El0MiKvEZ5VglXADnsTj0gy+sRjdbi0
	 7Xryg/W26d8Mt/1Re/0iFMOpqXKyMyFwC1Pz7cu9urLqrCBnRep63sORbUvWNyIi4W
	 TdLORrw6IC9obpGp+VjFh5X4Fv4j/ecLEuxrDd1/hP9lwp/EmsJhbvrEmz5hXTBGKD
	 pRawtF4SfVH1g==
Date: Tue, 16 Dec 2025 18:52:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org,
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com, romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com, lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org, charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	mwalle@kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 03/19] dt-bindings: arm: AT91: relicense to dual
 GPL-2.0/BSD-2-Clause
Message-ID: <20251216-dictation-flatbed-adb40e164970@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-3-robert.marko@sartura.hr>
 <d9665340-5a96-4105-88e9-ec14a715df5a@kernel.org>
 <CA+HBbNF2EeP=miC9GpEm2HpPTmZAefV2fwxKjm0vHB6tj_1usQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEeirbPNqgZXqmm8"
Content-Disposition: inline
In-Reply-To: <CA+HBbNF2EeP=miC9GpEm2HpPTmZAefV2fwxKjm0vHB6tj_1usQ@mail.gmail.com>


--HEeirbPNqgZXqmm8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 06:02:57PM +0100, Robert Marko wrote:
> On Tue, Dec 16, 2025 at 4:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 15/12/2025 17:35, Robert Marko wrote:
> > > As it is preferred to have bindings dual licensed, lets relicense the=
 AT91
> > > bindings from GPL-2.0 only to GPL-2.0/BSD-2 Clause.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> > You need all contributors to ack this...
>=20
> I understand, all of the contributors were CC-ed.

I pointed it out last time, but for Krzysztof's sake there's only two
(Wolfram and Michael) that I am not aware of having stated that their
binding contributions can be converted to dual license.

--HEeirbPNqgZXqmm8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGqhAAKCRB4tDGHoIJi
0jwWAQCZik4ZGOhimmWnpw0y4lz1SWuwmfJxq6ZgMB0P8RvK6gD8CE4M0v/QTsRw
ssYPM7Vn9Y7M6VvaNEs2U68pR1Fp4Q8=
=NxNo
-----END PGP SIGNATURE-----

--HEeirbPNqgZXqmm8--

