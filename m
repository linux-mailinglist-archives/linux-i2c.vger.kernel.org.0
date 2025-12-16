Return-Path: <linux-i2c+bounces-14605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0FCC4E4F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EEC30B0A59
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9935D347BCC;
	Tue, 16 Dec 2025 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg8flxg7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F98346FC6;
	Tue, 16 Dec 2025 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908381; cv=none; b=GjhQNaNusFXXFwrpzVpQwkNjydDZmtUVfYft473WzBgPmwjL2hfXrWfmxmcBp3wi3XA1qt/F8QO+z/qIjKWFcQgyerd3NOzhIWTQh8O2PLyTBMz6o8Ev/zPUBNKSUqnZ3GB+l9zTN/jZT4izTBuUQ884A4Xo8vFaOji7cIljpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908381; c=relaxed/simple;
	bh=Vk4PbbceALGPz0CzuqlPGpdBVd4ii+3seXY2QzMFCss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e99bfVQwyk7CKRPvDutX4z+fVOMQpKwIcOg6nUfGmPoFKFsh2lzc7mNURCoyFCvAQMXtN2J6rsTrlOJrsI2bjHABorfup6vM5KNxO+A59DXHOsXJzNiTLhOQ6QjdIAisBZX5Lf6D9BWfr17rNgoIDzFRh0dJcJvOinF5l6Gy8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg8flxg7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED6FC4CEF1;
	Tue, 16 Dec 2025 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908380;
	bh=Vk4PbbceALGPz0CzuqlPGpdBVd4ii+3seXY2QzMFCss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gg8flxg7V4q8ARtnZvyjCnU8dbvmE3HGVzVoaIxbgsZkV5pP23vNUM8jqV5MqB69W
	 VFk6c7k8Ckwv/nDF1Zgpw12RpnDgVolFpe3k9XCHAwQfqV+i+G2uCnVFH4WhrZesAZ
	 7//KAX0Fq0+/tNibhS3O52jbYKstf35b7KTKCaK7m/UhgY0zHtv1OVCbBNhvt2SEN1
	 84jeuqOZGfklx/JkhWrWdPswXbshxOAM8/DGuL5Q5BlKwmZ1GswQRsDSw8vOjgeGvC
	 ytF8ZhMCnSv3C418GMvbQu5MuxBHKC0Mzdbj8q5VQpipEyXRm++zNL/vltF2la3DWE
	 VfSU5RejHM/7Q==
Date: Tue, 16 Dec 2025 18:06:09 +0000
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
Subject: Re: [PATCH v2 07/19] dt-bindings: serial: atmel,at91-usart: add
 microchip,lan9691-usart
Message-ID: <20251216-sulfur-growl-ca451d845a5d@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-7-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nWQJu7IR7o2M7HAi"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-7-robert.marko@sartura.hr>


--nWQJu7IR7o2M7HAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nWQJu7IR7o2M7HAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGfkQAKCRB4tDGHoIJi
0moRAQCqSaatI61iIIQ9uyMZ6xfS7aRicQkD674VJq8tbj4GEgEAxcYLkTfCetQr
MhTj9BGTs2f+HLwIcr5hTiAm78BZkAo=
=MAdl
-----END PGP SIGNATURE-----

--nWQJu7IR7o2M7HAi--

