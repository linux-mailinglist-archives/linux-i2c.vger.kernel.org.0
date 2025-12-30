Return-Path: <linux-i2c+bounces-14884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED38CEA5C6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 18:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 996EF3026B27
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 17:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9892F32C305;
	Tue, 30 Dec 2025 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iskjk0uk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D57225779;
	Tue, 30 Dec 2025 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116886; cv=none; b=SqqqdKk16oDoO3YlEMPNGF4xRIcZWCqSmN4hugdZQUT+w9SBR7Szm09no6BoQ79eYTZN8XAbvhvg2iUhR5CxCheKOJqj4dSzZuHu05nOkgX99UzYFr/owt1qki9SXx5+TFtitGLqRgRKCXZzfJhHtxTiMleXWrx3YZEGOlJLDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116886; c=relaxed/simple;
	bh=N7UUAxBiz2VNPSI7n0ZU15lbc01uDl6QBt1Zyg5SYlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+cwxI+GdV1So9MTthJ48p9dBpPNI/AddJxHzdNb0xyB/kUg7SUHeMJX/pVPDePCkL/cFubwVnMz/Ea3h4HiAtPGet/JY08LQHgtcoQnZBRyAeia++/HFGgbsxn7PpkK4iBP4tjQOxJmQDQShO4K7u/7Ojf4eN+dCJGOhysn+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iskjk0uk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA01BC4CEFB;
	Tue, 30 Dec 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767116885;
	bh=N7UUAxBiz2VNPSI7n0ZU15lbc01uDl6QBt1Zyg5SYlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iskjk0ukY1R3GMaQ4173SEL1UBw1S23M3vuCmZpUxD6ByaTFqGNWya1PiPjLxhx2X
	 LR6my8/W09bViFJbO3An9D/BSikw8KBehDvWvmzYHw4KmWmnchIBsYGbEo9UCrVVPe
	 ikCNEbAeSkSDXJEXgJi1/RIU13aRPX+QQJ/i0D8WAjFwFvt9mhJBLrbRy1vmGemVIY
	 Wwh7XDzIRw+ZrzYM9xSgPnZT9IIyvBm8uIYl2/sQligLHSKK4qUlwYsLQesw4OGUUl
	 bwq4aN/0jDRyQD1Hl6RlBXHKdH7xySJ7mEia1rzZARx3dbdtC5wnYwG14sVzJWsJMi
	 +pH9dnWceBcgQ==
Date: Tue, 30 Dec 2025 17:47:56 +0000
From: Conor Dooley <conor@kernel.org>
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
	broonie@kernel.org, lars.povlsen@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
Message-ID: <20251230-imprecise-cohesive-25a1f0ec1896@spud>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZWjypDN5GPfEBIGy"
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>


--ZWjypDN5GPfEBIGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZWjypDN5GPfEBIGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVQQTAAKCRB4tDGHoIJi
0ufVAP41AIR3LR0nvj27ohIxrkUaPNdUAsA77vMxPkkpcl6SgAEA2oZF4ChuF/6n
1N8HRuxXSCp7DSjp7VlfsdsWNtMzeQo=
=pUr1
-----END PGP SIGNATURE-----

--ZWjypDN5GPfEBIGy--

