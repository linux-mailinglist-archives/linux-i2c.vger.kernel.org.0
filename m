Return-Path: <linux-i2c+bounces-7421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB99A021C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 09:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18781F260E4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 07:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8D21B0F31;
	Wed, 16 Oct 2024 07:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XYNgrNC4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC611991D9
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062379; cv=none; b=mLlAdvM2sSaMCIAc4CIdwKIIZb2il3JHxZx+1AkEm8Hqow2E6P/KJvmlXF5ke1LBdiee5yYVgrNa1fxuVNSFoCh0GHRpYN2J1qqFUtZPgjwErc3uveYv1BzCW2eScv5b/oMaNczVyvsIpn5bB2AfH45XNuT2bCzLJM7dkhkxJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062379; c=relaxed/simple;
	bh=yc+xfgwSoPvDPrKOnbKE9ossxJ1byQdEQSPhJXUtSsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDm3oIfvGxVzMUClNWaOzMY3qzwnnl6JEeozVX68DJj51rtAeh8dt8fl0pLS/yH9xlHNH3E/s/RY2Dpxl5klPABgjhGjPqSR+kh6B+DsRuUpUmXaNwxuONcr2X4qtEQrVmoiUTlUj9fKj4epWDh0DqUXv+5GwlNtgr2JR6jYSPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XYNgrNC4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yc+x
	fgwSoPvDPrKOnbKE9ossxJ1byQdEQSPhJXUtSsU=; b=XYNgrNC4tO4aeMfwLtNh
	AkIWaXNt2TSjrt4sGQrDGLZZgal7KbkBVqDCqfXd49WGW7nXC0j3YEY+v0LbQf8x
	PNDnvousL+Mq+Yg5mDu9Zk2gY2yia+5pkGMXeHqfaVPp9T0/XEdNSn2qfNSR02ma
	+GXv2tx7HKlGVbfCyrWcOom5lT+/t1sh6oocfowaYCskpcYmXgo3A71FlnTzzn6Q
	JxU1SYV3wxX6bffUpnJAPP5BHMN0I4Nvx3ycgiM9xfNnrShjg5b2+pq7WhPKkoN8
	9bBnIIiVxagl9kLHm4IVPKKuTZvSZL2c3YKcognl9BmcaoQQkeIve8slquBR4wHu
	hw==
Received: (qmail 2961051 invoked from network); 16 Oct 2024 09:06:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2024 09:06:13 +0200
X-UD-Smtp-Session: l3s3148p1@VVOFtJIkItpehh9v
Date: Wed, 16 Oct 2024 09:06:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <Zw9l5GoamBe0JJwE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
 <Zw4zPOXSJIWEMd2Y@shikoro>
 <6015d35d-6d91-4ac1-8ebf-4f79b304370f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TGUu8sRgIcCLZI3h"
Content-Disposition: inline
In-Reply-To: <6015d35d-6d91-4ac1-8ebf-4f79b304370f@gmail.com>


--TGUu8sRgIcCLZI3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Only a small number of bit definitions in the registers are the same [1].

Oh my gosh, looks like a RNG was tested when shuffling these bits around
:/ I agree now, combining this into the existing PXA driver will not
only be quite some work, it will also make the code quite unreadable and
has a high chance of introducing regressions for a number of platforms
which are not easy to test these days. Sigh...

> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part2065 [1]

Thanks for this link!


--TGUu8sRgIcCLZI3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcPZeAACgkQFA3kzBSg
KbbURxAAq512m7KIkxw3ohy0Mc/DoB3oE8aQbdkHmo+6TkjZpbq6T6+mXYa04W9W
KDIxHrf/rVOWQlx77r4w1SX8/gW54C4bZFPnDGkOf33JuKkwRTFUV/CybbNJWorl
ydEZ7pLZtfMX5WwU4Zfw5FrXmBrdDCq4jHTyL/OCrGx2oojO6zx7EfxROderlZGi
fj/MPVHKHWyRWWp5x1bnyZeJS5vqwejKbms2SqOdowYTwlrtqy7ITHK45Od/pgEs
G2+VBefLeGuVxqrhiSDNK2dFOLMuVAPkYk0DhUE/rkhvEnQ1zEZqvQV92+iflhKf
jRIH61nH/2WtYq2h2s8yX6/3jFTo7H1kO6QA0kxr0eCdi8jAJYRLlQgIaxl1eaqU
sepDUR6rz5DDsfZYdTRubnV/p0BHG+ogs5bh35Jm6f7lRizkSu4CSIIWUAaQG5c3
NOLy2oSOGW1c95Y68U1wMR9qnDiWk64dmCjHsa6ctuuHfGMilmt2dgX4wpeT8tLn
CJKBA354WmxhCDLG1Jft6XAekl6d9kde/wlK4u2EOojJ/AjSsqM0h/cruFEBUo+3
dRMJKRYxAI+yBN9vsaHHKNLL7J+8RwcsfUOEM0UJSyrlac9gaBChsW0uNaa96x5M
tt01n3t8OQzddYbouqAz9N9cOfgIjtqIhYFlh1tplckDSmlC14w=
=B6AT
-----END PGP SIGNATURE-----

--TGUu8sRgIcCLZI3h--

