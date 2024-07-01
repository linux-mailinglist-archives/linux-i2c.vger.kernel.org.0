Return-Path: <linux-i2c+bounces-4553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4691E483
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEDEE1F24FAF
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B21316D4C0;
	Mon,  1 Jul 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krz8D/e2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C203126F1E;
	Mon,  1 Jul 2024 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848836; cv=none; b=ldJDkcIao3thIYQicIbpzImCaQLHOeEwHmkff8YWWvG3NQs0GARmZUpCTQzmPzHScLeqgHzEtlfZLJDSi+3DK2d06f6ZS6dNfSoWM8Nmzp+02305MwmvhZ0keeddb1c/yMKbsiIF3ykRw4NtM432nkGXPuRwW+lCUHeKvPvczts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848836; c=relaxed/simple;
	bh=cgDZXg9wLV4DysNwoHJXiG7s2kLDhDus3KCRIoKm4lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWRFmr07uze4VbzNQ2/GW9qzTHshUGBjrsBRCxrNXxTmK1bPA0MdjEfdIdL1By/aDzumAecyR25tr2dMNweYjou3IJxEchBP7aP2oAmfGXhU+kw6B3TX/otLMKpUigY6XW07K83UB2JpB8pXPTHAwZ54JeG54ux9Euuz/tDwlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krz8D/e2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF920C116B1;
	Mon,  1 Jul 2024 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719848835;
	bh=cgDZXg9wLV4DysNwoHJXiG7s2kLDhDus3KCRIoKm4lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krz8D/e2ipDBO5Eqmu3QevhSVroIhs2OVp1//t3Ag9V1hq2ZBWicolNkH6qMy79tr
	 8YNNoErrhdToPxVcuvTNzZhBcJAIKG7JOtwJzB6agQMbxGo0Ol4aLKTYQ6LkYtm72a
	 HfcxUCHLLkWM8nKYVK/nK54/8TddTRenwgd3fV0lfHeIzN1TvJk5xZjeN30rK+IBif
	 tTUUkSO5OK/OuuQsu7ELTkrQ8ajPgQ0ulyuc8Xa6SoV5u619n13MDoLjVNpOqTXv5h
	 0RSvDCzn26xA37SQ19ewY/HMgsNFFKwll93Ny6ST3ifVBKkoMJay2azP8dXmja6IYO
	 Aagzf4ZeBAS1w==
Date: Mon, 1 Jul 2024 16:47:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Vdovydchenko <keromvp@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Alex Vdovydchenko <xzeol@yahoo.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp5920
Message-ID: <20240701-mug-scuttle-dfe4c84b4e0b@spud>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
 <20240701145603.1507516-2-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OOkMTkyQ+HJ7f1to"
Content-Disposition: inline
In-Reply-To: <20240701145603.1507516-2-xzeol@yahoo.com>


--OOkMTkyQ+HJ7f1to
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 05:56:00PM +0300, Alex Vdovydchenko wrote:
> Add support for MPS mp5920 controller
>=20
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>

Missing an ack from v2:
https://lore.kernel.org/all/20240627-swivel-grower-002af077b654@spud/
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index ff70f0926..cb2fc26d9 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -296,6 +296,8 @@ properties:
>            - mps,mp2975
>              # Monolithic Power Systems Inc. multi-phase controller mp2993
>            - mps,mp2993
> +            # Monolithic Power Systems Inc. multi-phase hot-swap control=
ler mp5920
> +          - mps,mp5920
>              # Monolithic Power Systems Inc. multi-phase hot-swap control=
ler mp5990
>            - mps,mp5990
>              # Monolithic Power Systems Inc. digital step-down converter =
mp9941
> --=20
> 2.43.0
>=20

--OOkMTkyQ+HJ7f1to
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLPfgAKCRB4tDGHoIJi
0o6MAP0ah9d98rZ6tJdV5mXQutgTtJMF5zQNz+Tbp5DwrnxhKAEA6f7FjGXZ7C2e
yng7aXu7w+jRuBnVFQj2HWB8vBG0Nw0=
=nK1N
-----END PGP SIGNATURE-----

--OOkMTkyQ+HJ7f1to--

