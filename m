Return-Path: <linux-i2c+bounces-4412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227691AACF
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75D01F23B7F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7723F1991A6;
	Thu, 27 Jun 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9T/VVBS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162901990C4;
	Thu, 27 Jun 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501157; cv=none; b=ik7jLvjyDWfD8Et0/lU8+dPxQD9djd1xOFAXX0Mnovnym4ZTVtQkp21gWqpDgcAx8mQZft54nf2yNCqghPkBQUp9YHkkkgkN+BAuJ5u1UmKwQb/qUIxqbFtwSq0Jyk3Fz8o0Z2QeR0jgY8AXSDKIHldVrh7GKmPXUOi+iGUOEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501157; c=relaxed/simple;
	bh=BLte6At7ixoiAZA1MyTPlTAmzQk/XIy+UqKAJC+JXh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSQ9F4jnDDHfHUMffWehffOYsJdXU+BkL+0tkb6o/u1kD/LjIT4yJ75N0vfobGHXI4vj29BP9H7eb9WVxgDzNAYhdkjYyWdn2dwtvDzkHtMz7HV4uwZkI+1LJBbfloNR6LKqMlF4d79W8AabUCuDYpD0coiNulBDp6mragjYAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9T/VVBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3A7C4AF0B;
	Thu, 27 Jun 2024 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501156;
	bh=BLte6At7ixoiAZA1MyTPlTAmzQk/XIy+UqKAJC+JXh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9T/VVBSaVs+miPscG7rUMyPJIdw1iEuh8q0Mij+Kkp85ACsMY8SPISKzUosYtSzf
	 ce/DZl10yT1L9i7TyepIb3mgHBakGSc173AVhjO3nPPl2uOs1UXDgR/WHPYRBG4Krk
	 Zy2wdLd28diQAxnDu5k610W1G/9950PXQMT3zq2FUMQgUnakUvWBG4zNfeYEyYKo8N
	 QaOJNKKwF/uB5Z7BD+IZHrdWz6zK79EhJsrde2pikAfZ+bfmq6INw6DrqCs80O82xL
	 kO+5lMauuG2ZJRoJk9TstPg/xHoxFhU/eELARCNgXnkHSA3jccj29WuNkqjSxJyDBV
	 jEVqeaaYNNW+g==
Date: Thu, 27 Jun 2024 16:12:31 +0100
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
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add MPS mp5920
Message-ID: <20240627-swivel-grower-002af077b654@spud>
References: <20240627090113.391730-1-xzeol@yahoo.com>
 <20240627090113.391730-2-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RPgB/PKWlchm0czC"
Content-Disposition: inline
In-Reply-To: <20240627090113.391730-2-xzeol@yahoo.com>


--RPgB/PKWlchm0czC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 12:01:07PM +0300, Alex Vdovydchenko wrote:
> Add support for MPS mp5920 controller
>=20
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--RPgB/PKWlchm0czC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2BXwAKCRB4tDGHoIJi
0lwGAQC1i8MZZpU7iOI+vllUkWLkJbg0/o+VXsEFKfEl08w0VwD/SB/f3092bw/G
E05WRIggJqljvcsGS0+hrAMNC5zQTgA=
=6KO+
-----END PGP SIGNATURE-----

--RPgB/PKWlchm0czC--

