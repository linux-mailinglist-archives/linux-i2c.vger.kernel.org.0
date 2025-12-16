Return-Path: <linux-i2c+bounces-14596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928FCC4B7B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C40EF3051157
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B831A33507C;
	Tue, 16 Dec 2025 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="febV6MCM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2939334C2D;
	Tue, 16 Dec 2025 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906470; cv=none; b=MtgT56kMBVxkA08IuBuX0ti4AgDhq1z9hvPFW0KylGTiyftU9rq3mluVV9cTulpKtOeFOmYoLVrzOfFWogXAsy0MJcKwxLw2d+VSRmqaTAz34OmC9W2/+50m1kjmkzQoSSHGy+7CK9RETmwKKa0EuzcFXX6YN5LDOJuLf/ldcUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906470; c=relaxed/simple;
	bh=g6ZtBBX2jVAPn/Ila5wPPre3FE9IUgXTw++mSYa9c0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsrGm7nOmmQxXG3bpR85+FaUUwpmTH9EzqCXP9CKhBfdXYTc/x/IYCc+ZsO5UCjhfg9wBczcdFlZbLZyy5kwd1tVo+UQYfoYSSjkIfd6hjYK4o00/qb/gqXiahit4ufrMJI0tIxyf9YbSv066zNwb+avgvhc8h3/Ap+h3JqZ9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=febV6MCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96C0C4CEF1;
	Tue, 16 Dec 2025 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765906469;
	bh=g6ZtBBX2jVAPn/Ila5wPPre3FE9IUgXTw++mSYa9c0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=febV6MCM1WEGhx1RvRJ1WLMuqhY+1T8tUzw3UA41UrwK8IGBWJZozi/m8Lu9Hkpyf
	 IaIf9uAyUhmZjnBkwtMvKeZyz+QGhgxrUvn+ik9FY4q5tw6Pj508fC5NsqmdyjB/Uo
	 hCDbtKiQYefS7ATmQ6KMoXE6yG66whuLFSRTQAlG1eRmGtRP0vl4EEDUdDpxi4uQjO
	 iTusOrkMpIrrwhlqy5JZQVwW7Mrg/dEtC4HSCKj4TIYnRBpXqWzK96zohMAlWV96yV
	 TvvojwkkYnp5AU2R93N/QO0m2jFBYcWuzNyEYXIerfzv28+sweuAt85msRzUg2fCkL
	 Aj+NUqmY2zHJw==
Date: Tue, 16 Dec 2025 17:34:17 +0000
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
Subject: Re: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add
 microchip,lan9691-temp
Message-ID: <20251216-circle-difficult-89e6b5e497fc@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jfn8dEKono4ng+N6"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-15-robert.marko@sartura.hr>


--jfn8dEKono4ng+N6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jfn8dEKono4ng+N6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGYGQAKCRB4tDGHoIJi
0lucAP95Xn8+dQf5cqMhlKP0z5T2UY4TZ1LhnUdKhKqFMZDmgwD/Z5SzdHytKXBM
F+XtdGsSGg+d3adzDcAh+ZZETFlj4wQ=
=szMX
-----END PGP SIGNATURE-----

--jfn8dEKono4ng+N6--

