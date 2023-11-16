Return-Path: <linux-i2c+bounces-193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C37EE2CF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 15:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFA7F1C209DA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 14:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56B630FA6;
	Thu, 16 Nov 2023 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEvYKp6t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4213159D;
	Thu, 16 Nov 2023 14:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ADFC433C8;
	Thu, 16 Nov 2023 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700145020;
	bh=hOIVPvdhoBjFYKhZmULCCqOEbzSpvXG69XSPRnCcnc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEvYKp6tn+edJXFASdLS/4hWvLo1b/esOxXyhHMo0UM/FDr+10bpe/WwnV7H3Ik70
	 lIcurmbMrf9VqoPOKZ64HHuZUdC2luHb19tjIRf3a/tKdvKD4XBdXGVTZkkqb0B2po
	 Z13GuuU/892TnfQJKEI4mYrKrSpYTUQmii6tpTF8pRye4wBrl4P5mICxCJFhZJOrHT
	 mS4FQxcOQp7833BkOg4fBy8pESRBK7V+4iZcAPwgcUWGH9xFVy4JyBXFF2LDFgUybw
	 zuhM80oCmmO+N9uqr9yi+GTwuCLjugRvstlJ2gcKzYeYl1lqLlf61qxSI1R7+gpPsJ
	 i+Mq60EfYRh1A==
Date: Thu, 16 Nov 2023 14:30:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231116-iodize-wildfowl-f5d72c182658@squawk>
References: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231116023027.24855-2-Delphine_CC_Chiu@Wiwynn.com>
 <caff5743-265f-43ac-83fb-4e0fb23a9ff4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lStQTFIwxdtm5lrO"
Content-Disposition: inline
In-Reply-To: <caff5743-265f-43ac-83fb-4e0fb23a9ff4@linaro.org>


--lStQTFIwxdtm5lrO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 01:13:58PM +0100, Krzysztof Kozlowski wrote:
> On 16/11/2023 03:30, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 device.
> >=20
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >=20
> > -------------------------------------------------------------
> > Changelog:
> >   v5 - Add hyphen under "Changelog" in commit message
>=20
> Apply your patch from the list and check the result... You can easily
> see it's broken. We asked about ---. Please read the message carefully.

My reviewed-by was also omitted again, but I suppose that is a good
thing since I conditionally gave that based on the changelog being
fixed!

--lStQTFIwxdtm5lrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVYndQAKCRB4tDGHoIJi
0g9pAQDuDPX4/eIC8rfODFMv4qArSDILjwy36Q/U/4fiERcTpgEA3Z9fHBFWkFKS
oJYaFHnrTAdjn3WnmV9MY9RcWT6kIQY=
=akaG
-----END PGP SIGNATURE-----

--lStQTFIwxdtm5lrO--

