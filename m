Return-Path: <linux-i2c+bounces-14900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC7CF42B1
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 15:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9238305B5E0
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 14:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEF3346E7B;
	Mon,  5 Jan 2026 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz5BKJw/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2445346E64;
	Mon,  5 Jan 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617231; cv=none; b=FJKe3vEm/4n+ZKx2rhjh+QAtFT3M4+qxaRp5NGRkfNshiZqlNkncRb6S6d8z0AHHbSTU+GVsWqoIemOSx4qBebrORoPlTNexs28VMo11Ne/iRkK/ks5tb5+q7AIrn9dBSkSfPMMz26FqObyiktWBEhQvVOPpe+dBSpvtCgcMNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617231; c=relaxed/simple;
	bh=DcK9JhgklTlks/dbMU+80cGJYIWzHkB6Fy6SWnC+6X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoCR0KRRlpdsPBo9c2/AmpDVc+hkbQ0MKouk5w5QDWI9LHiKBkM5wcjwyFUbk6SoPHDpo2qywan8s/ULpcLGKbmpEpKr1WuuGwzBcS7xoFP8O2YOYTpUuh5qWGoJIS2ooQMmUTpzIlFtcosgB0PxYjVSweFvV0y8ki+wR1bCS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz5BKJw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3606CC116D0;
	Mon,  5 Jan 2026 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617227;
	bh=DcK9JhgklTlks/dbMU+80cGJYIWzHkB6Fy6SWnC+6X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nz5BKJw/SW7aFh5PDOn4mjTKTV+LFDrfIA0RGg+0ukrtI/PWWaAkWyRxPhjHOORJ2
	 F/w6WBFrMWFgCSU2ISdgFwjDlN6RJQGUpNtbSDFRgxj0nCBCNDcP/L8EDfUCsH9gEc
	 mlu4FBl2Ci2EU2Ws0he3TS3VVhUptlYr949Nb1Pt3prNClT7c60WGSzHXKmRhXNJ6j
	 AahYn0rfC6Gh2cHn5zTWUzZEAv/8eKMksb2N723rGz9Dh7iCNZ/zP1/Y/1u5wxBIyA
	 1Un3saqGObtBBTQaXpEhtVjmp3anbCGER1NIrZ5yjgzlo4HO5YIiuhg64BQYow0aEu
	 K25kQXvV5JU6Q==
Date: Mon, 5 Jan 2026 12:46:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 04/15] dt-bindings: spi: at91: add
 microchip,lan9691-spi
Message-ID: <2ff4b417-871b-4b0e-a4f5-424ce535ebd3@sirena.org.uk>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-5-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L5qsEAHx6q9dJj52"
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-5-robert.marko@sartura.hr>
X-Cookie: So many women


--L5qsEAHx6q9dJj52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 29, 2025 at 07:37:45PM +0100, Robert Marko wrote:

> Document Microchip LAN969x SPI compatible.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--L5qsEAHx6q9dJj52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlbssAACgkQJNaLcl1U
h9D4Xwf/SR39qhC6yLd9TVLdTbJvbv9td/1UUXSFHjr1far0W1wTnHIk9agrEcs+
/CUvNmq9Xga7s68neH9NM4e3phBnJZt74a3J3zzhvBekn3xXCyKfmhw9WFU+rGGC
dLJg/c/VyK4Dzfq6tzvajmvH8NYGkfWsf8TDYMAQkWfyFf3iASqrWODzvobA5l8D
f4Q5wCZqo6GnSlAfW2+galQbUNMK85g0ponFRfi1JfjuTyYb2ZKghpKWLJGOTJzj
PMinOleBkv3jp7jH4T6Lh+DiCyhddXuYJhoGGfDIlnhZrm+1fCifyVtpxwbXKXH3
bT3c73me1CxD3Ncn8Q6E2gOrpidxdg==
=VKTA
-----END PGP SIGNATURE-----

--L5qsEAHx6q9dJj52--

