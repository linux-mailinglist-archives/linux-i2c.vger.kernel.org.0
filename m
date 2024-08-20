Return-Path: <linux-i2c+bounces-5603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081AE958C78
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 18:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3E11C2223C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 16:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0FB1BD4F7;
	Tue, 20 Aug 2024 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfYfre4U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02378198E75;
	Tue, 20 Aug 2024 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172011; cv=none; b=qN4zkzbukNShsKGR3SXFSP/YOGaWaTfp0xdUFyVku7WFarfiU/EL36IxL2o0lz62tLZ0IKTW5htgvEW8hxE1s3sQQlTdlNbIimwTWTaOKu9xBxdO6rxnivxttBfH/UXmytYXT7ZsLZsJvaEo68uBsBAD1cpu3N+X2SpsAEzG4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172011; c=relaxed/simple;
	bh=BHd6kvh31vcs/slQoIR8bY6zjNdEH3hVv63WtnyIoyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8akSZ0gL6oQtF92XXtyv5cMP2u4qxucvl4jZgxKMLCiQxkyu6q9KBaq10HbUJRrjI2vOIpyCBR9mnYsvMSOmVIhJDnWSw4Y5Dr5R55lkz05+VmfN9PlxNvH9pUp/9RNqQiOG/R0zFwC78v/Q3g+DJ/QaQN80RG0f3YlwB65VAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfYfre4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29925C4AF14;
	Tue, 20 Aug 2024 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724172010;
	bh=BHd6kvh31vcs/slQoIR8bY6zjNdEH3hVv63WtnyIoyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfYfre4Uoz/Kx27j2UZB08UHtWUPsAQR8BH61G/0oz6DEmleYS56i8kuKdLvvApyB
	 hh/bjjuMhHD6dtRbDYPpqJZFaIXmKvu9vz1nda4zVkDmR7br6/Yts1TqM5Fk2btpAX
	 S4tnY2ReV0+kCCYUZ0z8Itzz7FBPEWRQoQvzuleJK3kRUbBUBnabcf4uS+/rj7Lfih
	 FfeEZmLXpc9kOWCcxT5h7CIAXN1UVfC7+i9wya58KpCMSMSS3+rMXG5R/5e9kgLxjH
	 6FsrcBuIVg0oMY6cDKf8QoPAIzJCWwmZaT9/GXomQLI7n+6whLC/RRNaphqEr9hnyb
	 Y5DYtD5Lln9cQ==
Date: Tue, 20 Aug 2024 17:40:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-cci: add missing clocks
 constraint in if:then:
Message-ID: <20240820-carat-hangup-a890ffa166f5@spud>
References: <20240820063124.9242-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9TWJiJFNcNtKqGNR"
Content-Disposition: inline
In-Reply-To: <20240820063124.9242-1-krzysztof.kozlowski@linaro.org>


--9TWJiJFNcNtKqGNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 08:31:24AM +0200, Krzysztof Kozlowski wrote:
> Top level defines clocks as variable from 3 to 6 items, so each clause
> in if:then: should narrow it further with explicit min and maxItems.
> Without minItems, the constrain from top-level is being applied, thus
> qcom,msm8996-cci allows between 3 and 4 clocks.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--9TWJiJFNcNtKqGNR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsTG5QAKCRB4tDGHoIJi
0kRfAP9cb6itjjKUbb5tJ2ODvpw5MpyjsyOHNDbr28DhjSsk3gEA4q8OJA0Ov2gG
05cKJcixhwAUtHnpLB+3ipoTNmwFMgM=
=7Vmx
-----END PGP SIGNATURE-----

--9TWJiJFNcNtKqGNR--

