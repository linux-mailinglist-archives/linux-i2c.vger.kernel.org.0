Return-Path: <linux-i2c+bounces-4586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A38889242B0
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 17:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602FC285989
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 15:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D871BC086;
	Tue,  2 Jul 2024 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoPr7mrI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51C14D42C;
	Tue,  2 Jul 2024 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935062; cv=none; b=Svb2Q8/Txs3xlYCugZPUG97mzgt7LI6ARgNZAxsAeZYWrWVcANrS/FUQKHFI+op3ksRGMRPdpBKrG/2fhfzDgIQLT/wmexQa+pOIQ/agDaxz7i4R3Cb5iZYVf+CcGQ7rGCDxxamw8KZ7VmpybUTJXTE7jyeyzN+CFdwGls/z7Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935062; c=relaxed/simple;
	bh=v1t1MaxBQImoIXMUPjRrALLxH2leye75HXLGWWUFfKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQaGoSYEJVa5PlmbSCHa1wsqjmZvTFPr1FNb2XLfqkKXnMnKnnSjhPL911qu2P9wkqRgJa0VMWijPCEvexWbaPYMGMSiZXmiO61IBbiHFHScNqIOn0M1PT1Q6uADCWqQDASbM62NnSWmrq+xSy7rXOnfZ9Fl6M8NFLPJ9qc2hrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoPr7mrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC0C2BD10;
	Tue,  2 Jul 2024 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719935062;
	bh=v1t1MaxBQImoIXMUPjRrALLxH2leye75HXLGWWUFfKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoPr7mrIRVJM8iEaeui0mZbM3fDnT8SdwrLSTWjW0PiG2xDM5sNxeVaUU6hCqYahu
	 VPQcXNCNvg5khueBu7asJhJmnnOTFoRyEWgIT2HERr1QgD9lK0g2hVP6YkUCo83rJr
	 9I+Rx5Mf0VjuFAiA08CwhLp9Zv9zhxPw0S4TyonHUb0iC53DblnqHdewTr72gZpv1k
	 u3TB5x9/e1ZTV08qPfIKs3/8Uq0t7WWcFpAJ+T3P/S5XEHrJU3rBfq6SMs+r68qdLL
	 tw+qNz2vnbGiJ/qGMffJsXmQLQfvCMOwQNQVZgaEfncUNLMlxcTSTtr2hP2OFDk2u/
	 92jalahj1ULGw==
Date: Tue, 2 Jul 2024 16:44:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Vdovydchenko <keromvp@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Alex Vdovydchenko <xzeol@yahoo.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp5920
Message-ID: <20240702-hacked-uncorrupt-f47bdc0ca8e3@spud>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
 <20240701145603.1507516-2-xzeol@yahoo.com>
 <20240701-mug-scuttle-dfe4c84b4e0b@spud>
 <fcd91462-f8bb-4713-afc1-ba9473405396@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cnwz3vA9WW8lYRuE"
Content-Disposition: inline
In-Reply-To: <fcd91462-f8bb-4713-afc1-ba9473405396@kernel.org>


--cnwz3vA9WW8lYRuE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 03:10:38PM +0200, Krzysztof Kozlowski wrote:
> On 01/07/2024 17:47, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 05:56:00PM +0300, Alex Vdovydchenko wrote:
> >> Add support for MPS mp5920 controller
> >>
> >> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> >=20
> > Missing an ack from v2:
> > https://lore.kernel.org/all/20240627-swivel-grower-002af077b654@spud/
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> That's third time you give the same ack. I suggest give up...


Yeah, I guess. It's just not really any slower to re-ack than it is to
complain about the ack being missing.

--cnwz3vA9WW8lYRuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQgUQAKCRB4tDGHoIJi
0jjwAP9FGIR2sKM6PEyujeg3Aa1yFh8BuTEEcQ6LkcO2cVVsBwD/Q2bFhdQ4M8mC
Mf8Js+efMEtSMDxrvPHMe7pqcXq+2wg=
=REgq
-----END PGP SIGNATURE-----

--cnwz3vA9WW8lYRuE--

