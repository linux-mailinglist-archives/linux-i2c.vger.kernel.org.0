Return-Path: <linux-i2c+bounces-14604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA5CC4E0A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 163F1303D8F3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71376346E40;
	Tue, 16 Dec 2025 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV2qhK0h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057BA346AE2;
	Tue, 16 Dec 2025 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908358; cv=none; b=u2G+AjQK/DCesb1EHTqyRKhOGHtYmVle17uPPY0F4tvmEuSa9p9Fk/Z4q8VYKgGPVwh31T8qMESefGKnJoqnba3cCPXPGZ12yjnMLhCp0wuSz3IpjOm1WuKfc0k3+U+SdWvmdvyDfUINvRNBXkSrQTswHJqshXFAAiPS/Mjdq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908358; c=relaxed/simple;
	bh=OcOSfKsyRyYTTaNvTzmSE5EXN7fBTI65IxmV47xCMCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgKpFAD13ITpLyA0HyZJo3bGryhrUvcwGACfNwoK8qnfkx3reEwuxME2z7sWFZz4g+YkMXtkWZlR9uBucTcjfHPR1XTzc6hBOkJ/4apdJy89i62W2QITu1azcSLqRt7UnzVghl6mlNIFXjnbx4Gn0e3TKIcF6VmsDE8kkVmtzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV2qhK0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E1DC4CEF1;
	Tue, 16 Dec 2025 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908357;
	bh=OcOSfKsyRyYTTaNvTzmSE5EXN7fBTI65IxmV47xCMCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AV2qhK0h+5VwRZmXjneumrbtxhBDj+GVLoMBbyvNAkKZRu+E5x6fBTDzM9zdCzGJN
	 265hQY/eTW9tBc9vgMDApqpgk9JKTO0v5N63qNT3fCjvuFyJLSxPMNdZaw4ejrmp3X
	 iVJSgSKh4kZ1C31c8cawqjnkrLA9ktlOBA19WJEgUDETQ3JiwtEaCBKOGLoU53oNkM
	 oPmx3gKZ5V2jwQt0rQOjL2YwMjTWUBuFnigrfZDqUMdQyHk1Z7GmC2Poij1RZKqwpD
	 Qsa1LTso+yz0+gaoCNCxmfVIYgyEtYxz9txauTATxr7UW4ZhjhGAKIw42ctkiqXUa/
	 OyALyU7TgiuJA==
Date: Tue, 16 Dec 2025 18:05:46 +0000
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
Subject: Re: [PATCH v2 08/19] dt-bindings: spi: at91: add
 microchip,lan9691-spi
Message-ID: <20251216-sulfide-fastness-0304bee107f0@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-8-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TGaWRHQ3wI3+jEOz"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-8-robert.marko@sartura.hr>


--TGaWRHQ3wI3+jEOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=02
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TGaWRHQ3wI3+jEOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGfegAKCRB4tDGHoIJi
0s0yAQDkpPT/zeTAQQuuh/7arOnpaXYQH9zHh4TPV3M/NGNpWQD3bdwYeZx0nMxt
wiSoheA+AsVZqIXoAeGJgvIZu/WsBw==
=eEUz
-----END PGP SIGNATURE-----

--TGaWRHQ3wI3+jEOz--

