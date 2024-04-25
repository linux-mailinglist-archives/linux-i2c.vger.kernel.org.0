Return-Path: <linux-i2c+bounces-3156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C18B26B0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 18:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 334A3284C15
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 16:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2E314A09A;
	Thu, 25 Apr 2024 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGgY6OGw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACD14EC4F;
	Thu, 25 Apr 2024 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063182; cv=none; b=V49+CzrbmtdaVhuou7hEnvR46FUYFi7qI+dj0vM9dE/NW7XO7fK8ag+XDMy+MfrrA1LZhk6A0Vz2i4xpqbw6a6W4rtXNB0GFmSVlgKel5G96Yr4SxSveVmertyQKRBV1q1hwhoOAMiGOJO7qgkml2401+brtKr7xt2sFqxVJKZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063182; c=relaxed/simple;
	bh=reXQCxjwgVF/vSZVFWzLCBgG6BHAY7X83818MVuU3B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb4xI3deFlpCpTcLQDMniw/xzpULJuODQMWluwgJxSiPH2W3XP8JicJ5GNGx7xLONz1ZaHOidKYPeRgxIDEeLpAVlGsCoO1MnDwZQvKnFk5+Y0z7xpeuDSuHAOZ5KEeX3zQ0y+OrWYh0NSV9QtL6zG4JWBMdFYfRXdJ8Fwxasn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGgY6OGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A19C113CC;
	Thu, 25 Apr 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714063182;
	bh=reXQCxjwgVF/vSZVFWzLCBgG6BHAY7X83818MVuU3B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGgY6OGwP8j5o0gXQ5YBFCAx0dtvyMnXPn6O/Ay4ELwGgXDtMS4+y9uaoGkixv6BV
	 /3tcMzjQxV4dczr26rO6F8V62Sx/JhLVrDflNufIsiflIRWEmAzdoREKtz8uT6tOJp
	 Y6E58kfQVvu8cQLTBRXFtznjdlup7xq6sh/FZFFkJJvbQQ5ZrD3uQEzzoJxElhm3zg
	 Kv4hMKbLr/90KpPDftAIZvMUI113nZEjbWj4Qt7Md+aVuqldoY3m4emQKskj6OEx4p
	 fxC7ZErw6M3JTA/bMBSHsYAiBtmMpvKZRK0aqwsGa/6AAaZNTXBjo75YLzI0vrWDnT
	 O2ep8AALwLF/A==
Date: Thu, 25 Apr 2024 17:39:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH 2/4] riscv: boot: dts: thead: Fix node ordering in TH1520
 device tree
Message-ID: <20240425-mouse-unfair-1e0d9b19c713@spud>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <20240425082138.374445-3-thomas.bonnefille@bootlin.com>
 <bc69023d-5e70-4d5d-96d1-f298cec5b59d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s+/8stqRgDeN0Bg6"
Content-Disposition: inline
In-Reply-To: <bc69023d-5e70-4d5d-96d1-f298cec5b59d@kernel.org>


--s+/8stqRgDeN0Bg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 11:49:10AM +0200, Krzysztof Kozlowski wrote:
> On 25/04/2024 10:21, Thomas Bonnefille wrote:
> > According to the device tree coding style, nodes shall be ordered by
> > unit address in ascending order.
> >=20
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>=20
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.

Ye, odd when the rest of the commits don't have it :)
I picked up this patch cos I'm prob gonna finalise what I'm sending
for 6.10 by the end of the week and saw no reason to not take the
cleanup.

--s+/8stqRgDeN0Bg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqHSQAKCRB4tDGHoIJi
0vqrAQCSXRqNkEyrhHeiXz2NM/l7Al4/TFpt6Oz2uAWFe6CoJgD+PG9g8oooPxrF
aPl3LhX8ZNU0ceFECdkMYDfzEIhTWQ8=
=0yNn
-----END PGP SIGNATURE-----

--s+/8stqRgDeN0Bg6--

