Return-Path: <linux-i2c+bounces-14607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03797CC4F33
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5471D30528F5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C144733DECE;
	Tue, 16 Dec 2025 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzDa+35c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4267E33D6DF;
	Tue, 16 Dec 2025 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765911017; cv=none; b=uyUrAa4yutza4zEM2o3Y4bb/HzuSzT36sjBvkYywe8HJwIKs/ILZ9ENFj0vKPoDH44/KRpidqq+eZSJ4i9amEYzmr0Tlqdgd6Hm0/yHrJy8oNCMfW76MJv7bJTgnHdX14sMiS7kIBfPRS6eoVuP1yfUYUtW7bXZon75q1LKd0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765911017; c=relaxed/simple;
	bh=73NvDbreX+FEusW3ivYeGPD9eGPFlxGEynckH7g0OW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj7A5sg9zsyFK8ecIq/Zq4wADltJ4S3Yno9zhMZUDVeGH/LEays3NCXOeWaDtKiIpIFTKdwmpZQBQx/D3ZGGOE43Phd9Gk4GEVJ7vYUSCMdS38ciEdVzSdw32rkT8CkL7LFIhBOi9YG7svhdYOPaIP20nbz7KyrjcOE4fJNopg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzDa+35c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CEEC4CEF1;
	Tue, 16 Dec 2025 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765911015;
	bh=73NvDbreX+FEusW3ivYeGPD9eGPFlxGEynckH7g0OW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzDa+35chZFByyVjzsfnOqTZAhHdiRKJA0K+AvWG7S8wNf/HcRQKezmRsXaFAezdN
	 Q673JE4a2z5IR0Q0CEuUA9V409zECkXGpqpAT1fbIafTMbEA2Lx7atVT5u//McnAqI
	 HpiYJ5h01/HytQ4m8MWaJVMeVxbLOcneuucsg6RWCyxzW5dOYS/hOLvdKz84v9xLkz
	 42dOTq7tmEDD64kfq5amFriJRRJh+3BG1RgTcOUTZ8hb3QvSi0q+CXZSsxSJoOxGPc
	 aDEVjkJXHN03Z1iPr/lANm1qNSmRztMjbglH4b/8DIA5PRzF37wHiBzZznfvIAG2M9
	 bR4eLoiL2b/qQ==
Date: Tue, 16 Dec 2025 18:50:04 +0000
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
Subject: Re: [PATCH v2 05/19] dt-bindings: arm: microchip: move SparX-5 to
 generic Microchip binding
Message-ID: <20251216-subheader-headstone-f374157d02b3@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-5-robert.marko@sartura.hr>
 <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
 <CA+HBbNGNMGRL11kdg14LwkiTazXJYXOZeVCKsmW6-XF6k5+sVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jYbLw3BJwhyPV9Uj"
Content-Disposition: inline
In-Reply-To: <CA+HBbNGNMGRL11kdg14LwkiTazXJYXOZeVCKsmW6-XF6k5+sVA@mail.gmail.com>


--jYbLw3BJwhyPV9Uj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 06:01:02PM +0100, Robert Marko wrote:
> On Tue, Dec 16, 2025 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 15/12/2025 17:35, Robert Marko wrote:
> > > Now that we have a generic Microchip binding, lets move SparX-5 as we=
ll as
> > > there is no reason to have specific binding file for each SoC series.
> > >
> > > The check for AXI node was dropped.
> >
> > Why?
>=20
> According to Conor, it is pointless [1]
>=20
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/202512031=
22313.1287950-2-robert.marko@sartura.hr/#26691879

Right, but you should say why it is being removed in the commit message.
There's probably a bunch of things you could cite for that, but mainly
it's just not something that is done for "simple-bus" devices. The
address they start at just doesn't matter for functionality and the node
itself does nothing without having children of its own (the presence of
which is enforced nowhere).

--jYbLw3BJwhyPV9Uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGp3AAKCRB4tDGHoIJi
0iDDAQCfPty1kkcLp/3j5Q4v6Hxcajpf7sT4mk3AeZeUhoJzBAD/Vtzah85wk+AI
i86l3jFQsgeNLAYX74DPMv9P27jBHAs=
=q6XF
-----END PGP SIGNATURE-----

--jYbLw3BJwhyPV9Uj--

