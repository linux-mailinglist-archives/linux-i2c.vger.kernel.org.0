Return-Path: <linux-i2c+bounces-14603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82289CC4DDD
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390EF3052B1A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59B346789;
	Tue, 16 Dec 2025 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2RhQMl+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB4346767;
	Tue, 16 Dec 2025 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908329; cv=none; b=tZyZdiYXyXzAAaG0H7rR+DjxYD6cOAeHBGVcejWmfow42jPVRblC8Fp2zEzgb4iroV1kLRbXJ1+STR6dtIjgsaIDK8vfYw3/G3tyk5BNLpz9YquDBDbiQ5dCoAO/F4FfGPAO+JxoKDNjsdcfY4KW0sENmtIDAUpTZDJTcbvbL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908329; c=relaxed/simple;
	bh=IIKsGeVs732nHqynWFITOGGtfnYJaCZKO5zClj4IegE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeDgTtlJzEOmH3wwtQ13JwzUkwFR2JjUCS+8GX2usJFLjkuqoizcskspoIsiJ55m/xQgDONcbWyB1j9fy8avVjH6T9WTAAAjr5yoqAI4SPv8vMoiwkAvAQn8OUnHOQR5EZwddEugSURj2vPXDIqoJsZn9FwhKpnu6u7NrOcd5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2RhQMl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A9C4CEFB;
	Tue, 16 Dec 2025 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908329;
	bh=IIKsGeVs732nHqynWFITOGGtfnYJaCZKO5zClj4IegE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2RhQMl+Rrb2GD7ywOe4+s4O/0F41ZFIx4zdRVbJdrKgT0ce3G7CQiHxmAmqE3Qdy
	 TtNfS2Qly54j8niCO02Otm+WMXVYMOQFprx4619QK/Vgh4kJQg9iygdNFw9+CWjAIR
	 FO48rhQdvR5tfw9Ou/xYJP12nu/Fd/I601f7I2L8g/Ky/c/5KQbePFQ/6r8Zw5cj3J
	 yP1/eddGd8s/WvISB+mKdwCXwysmxUNNovpSubPD5WDbMRhVzyfAa6jo0Gj5q2WeFE
	 hh1uuMQWfLkEO1go4JjJ28q17Jvd7qs3lbARWXo7iCI+AmOxzLDMIgATdEdGe91DUv
	 4VdStN9zMXqow==
Date: Tue, 16 Dec 2025 18:05:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
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
Subject: Re: [PATCH v2 09/19] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <20251216-profound-composite-4c95ea7cb3ad@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-9-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U8D8inP0i3dwPV2F"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-9-robert.marko@sartura.hr>


--U8D8inP0i3dwPV2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--U8D8inP0i3dwPV2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGfXgAKCRB4tDGHoIJi
0qFmAQD37h4rqyy/Gmz3T1gQN60+3DeSG9OxLTc3vLWwdASt9wEAkicG2N3urSEl
9hpkK2+kBG3dg9yUgxHr9tjSERubFw4=
=rgNN
-----END PGP SIGNATURE-----

--U8D8inP0i3dwPV2F--

