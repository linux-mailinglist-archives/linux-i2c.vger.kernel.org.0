Return-Path: <linux-i2c+bounces-8934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B7A03129
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 21:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6B51610B4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 20:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C801DF993;
	Mon,  6 Jan 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puK09+u6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E21D5CF4;
	Mon,  6 Jan 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194230; cv=none; b=Itp0rk5zRYZOjbUt6G4ZxhfJXc9h9R/FlEMnglUzBxv1tsXnuNbPNaLU1tZzD+e+dVx+8TTu6CrkUPHNPi5fB5mzwykFj8a4anxhxu23l9PHDg8C2Fegzg3Wd8wlw/wcgbsB2oUGvQS8C36sjE6p7S53rXMKwdN1O0dGQh4x/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194230; c=relaxed/simple;
	bh=GySwZvwHq/rQKcdNFGju7/mc17U4Z+zs03kdm5nnP8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9GczMncrz44UJLZXIjSa3tTH+lOnsMOpN/mpvQq0QgTOWLNm8d6FQwFOZiGrVSq6xu8EaLc5du1UgD4i4ucviAv0FLZn9nee/I9fjOuZ9hhzEzFhuRxNB8FVfFxGJYabfHkmao8XUMGL2V1DEs/GM0SmvXhJh2HUrCHjNedcxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puK09+u6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41B8C4CED2;
	Mon,  6 Jan 2025 20:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736194229;
	bh=GySwZvwHq/rQKcdNFGju7/mc17U4Z+zs03kdm5nnP8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puK09+u6w1nNc+80ZSC6EBo9hxb1uaOz7+CX9s9J/B/qPTv1+VYbqp7AxIds4MdrP
	 I4BVa8JSACW+mpHB40KYK5HemQ0qGD7vpVWhxlraL855BeyEtcJ/+WGOYV4vEBTAxW
	 L1KFEks++sQ2C47SAX9WD2IKrS+u0ETYyWCUMG3Cr9JyCym/ubxkU1a1aypgR/1KEn
	 VTp1Xj/FZdnMVsE6k8brGBEHk4NV/FwC4fNuuNrIRaDPkLubstbCAqu7hf9wSbOoXe
	 H+gM8ayTSD+wtl2NA6Zon/1R4OpHzTakAO8W9nXd0jqi5AmiHsAxDDARj4o+0qeFOp
	 6KW/yPV9gM5gQ==
Date: Mon, 6 Jan 2025 20:10:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Message-ID: <20250106-reabsorb-polygon-dc16642f6725@spud>
References: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
 <20241230-fpc202-v4-1-761b297dc697@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x2ndQYfNbQ223Djg"
Content-Disposition: inline
In-Reply-To: <20241230-fpc202-v4-1-761b297dc697@bootlin.com>


--x2ndQYfNbQ223Djg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 30, 2024 at 02:22:03PM +0100, Romain Gantois wrote:
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - reg

nit: this should be after compatible, like it is in the property
definitions.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +  - "#address-cells"
> +  - "#size-cells"



--x2ndQYfNbQ223Djg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ3w4rwAKCRB4tDGHoIJi
0n9XAQC0d63BP3SE13K/FHLL58blt3sV1piP1mi8Hh+3IcBdlAD/T7hYSgVqKvjb
ZY9sAbpGaFYqrlEFoh2+mO1zOi9KuAw=
=ZduG
-----END PGP SIGNATURE-----

--x2ndQYfNbQ223Djg--

