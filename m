Return-Path: <linux-i2c+bounces-4612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A413C926544
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 17:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61005282CD8
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 15:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0199181311;
	Wed,  3 Jul 2024 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JG5+VgDJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938D1DA319;
	Wed,  3 Jul 2024 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021772; cv=none; b=jQC5y2CDKwH10M+vcBNPSJ2X71ZD9v9C9rq1aPAV+Gouz+4kdkMoNiKpFZFrDYmCPa7gjiR7IYgzEHixdfpLDaNz53fxC7C3dIGsTXsicgJ3U9uJayfRI2pPXocrHR5z8oecd3FQbtZ/73GfKvJEoy10bDQ84WZsdAbTpiivK1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021772; c=relaxed/simple;
	bh=TE+q3nPYMa+Qhweu+9Gu/M/HgrkLSfESdT/MO/Fb/kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBbpBDo0WgLYQTXzK7nlG+8J2/tkcRTT18aO+zn/e8ETtGfjTQJe8TGN2LbYWsR/DwIbW4KwTjYTIu7MVpv1pFpl0nH9Pny/QIXIJazVk7i10+9qxxirLL2simwSGAuJLla5IHipTvT9b7OuPFE2Hl/BoVun+NmLiNZMP/OQzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JG5+VgDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC83DC2BD10;
	Wed,  3 Jul 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720021771;
	bh=TE+q3nPYMa+Qhweu+9Gu/M/HgrkLSfESdT/MO/Fb/kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JG5+VgDJ/d5ifE9+1OzaI4mRo0m4MKfQe6OkFLg/rdtYI2lvtA8LTjbfAko7R468l
	 dY0BSkdsk00IqJTDr65vT8lLoQEH+QpfGUcfFUxYnzKQRfFAArRWpFBG5/267PGRm2
	 6U6ZhEIcrk0eQWkigfr2t5h3Y40FiCHiY6F9UO/9IZbHBq2L4FT4PziBQh+sDh/2cg
	 /GSKAdKJkdvc5g3k0Uu+RUAlNnx4tZtXUzVt8eBCRotSZ8cRiC1VGOdyQhy2NgDUV1
	 Rnr0IrAfYa1BDyx/oohSJYMlXkDqXulYvxhEg36UHDOzpw6MDJoxYNZawTY7HOeS3K
	 fclMsDJ661j8Q==
Date: Wed, 3 Jul 2024 16:49:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alex Vdovydchenko <xzeol@yahoo.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp5920
Message-ID: <20240703-unshackle-jump-6178804997ae@spud>
References: <20240702115252.981416-1-xzeol@yahoo.com>
 <20240702115252.981416-2-xzeol@yahoo.com>
 <cdff38fb-ac8c-4f5f-8067-aa99acb7c677@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WOdiMfSW63LgLB7N"
Content-Disposition: inline
In-Reply-To: <cdff38fb-ac8c-4f5f-8067-aa99acb7c677@roeck-us.net>


--WOdiMfSW63LgLB7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 12:29:07PM -0700, Guenter Roeck wrote:
> On Tue, Jul 02, 2024 at 02:52:50PM +0300, Alex Vdovydchenko wrote:
> > Add support for MPS mp5920 controller
> >=20
> > Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> > ---
>=20
> Applied, after adding Conor's Ack from v3.

Thanks :)

--WOdiMfSW63LgLB7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVzBQAKCRB4tDGHoIJi
0kCvAQDYsuGxn3OHhjovDt0iUcEQG+hgReAkvVnkHXnt6tUiHAD9GiO5T2VM6O/h
C74puyB40kuelvzZNfWlGN2EsbYdVAA=
=Yl9s
-----END PGP SIGNATURE-----

--WOdiMfSW63LgLB7N--

