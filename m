Return-Path: <linux-i2c+bounces-13152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF5B9EBCC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC0D18841E8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 10:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAA62F7AC8;
	Thu, 25 Sep 2025 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WwruKCUe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870672F7AB7
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796557; cv=none; b=i9oxLvgl5q4e6vGpRGaqAs5vpmHQLhl63A1siYyON/fIIOrfjP49TYP4YMUxmp0TUdNX6nfJ1LzcX3+0mjk96XZmJ7x9Y+1S3r/M5tvfTlnTs/S75IFHBnDuQfT2k6wwKrV4A6DOL1bPaYn4vRoSfhxo4Hfhc758/2QlYlLK3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796557; c=relaxed/simple;
	bh=xUDZBEawqOGe+H9LJVtGe34jEeAiE+59fdHMls2e9t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quwvO5z/avxqvWBc2K2X4nkxO45Ui1tOXh/8UpN8cue3OzX0xm2Nth2aGj/5nyQnb8T51Mr7uxH9tTrs0UzcOGfOCspioXGjbUR/BQxFuFn4YX/Nb97ZYF3gPfKm03xmmz8ZSvn0ebtnwGcedqyHAsi31YLsEPpiCSoHg6vCK0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WwruKCUe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xUDZ
	BEawqOGe+H9LJVtGe34jEeAiE+59fdHMls2e9t0=; b=WwruKCUeGlpOYyRR8mOb
	7KNT2ioUQzBlmaycNHKtNFlyin2I2ARkzKm88KXDNBZQDiEtn3kcP1ATfXWcsMR8
	CbOnd5K3DEmVmHNOqRKmOOcMrZRsIuJ7tSW4i5AS8wFp1impZGIZnOck5uFcIRNr
	y14UeLh8AzpzuEyNF6ZpKFZpsY0EW4NZtbZ04mW390OHxdFE0zAfY2ArFLLPyv+8
	Fx7h8hbcsVAym8aopawZS05eiqp/cc4omN6+RAqACNlJBY9hCfXMyVgfi15RQWkd
	7SCR6olfmu3S4b62cmrlWUNBW3kRjVEeLsMGjicYFDh3mb6PyqJfr10H6t1eKan7
	Bw==
Received: (qmail 1830445 invoked from network); 25 Sep 2025 12:35:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 12:35:53 +0200
X-UD-Smtp-Session: l3s3148p1@hzfLu50/xq8gAwDPXwQHAL/S9V79e5yL
Date: Thu, 25 Sep 2025 12:35:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c: pcf8584: Fix space(s) required before or
 after different operators
Message-ID: <aNUbCccy3wXadCox@shikoro>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-4-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S0mv/d5gbHeoFj+4"
Content-Disposition: inline
In-Reply-To: <20250917133524.85063-4-chiru.cezar.89@gmail.com>


--S0mv/d5gbHeoFj+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 04:35:24PM +0300, Cezar Chiru wrote:
> Require spaces around or before or after '=3D', ';', '<' and ','.
> Add space(s) around or before or after binary and ternary operators and
> punctuation marks. Enforce errors fixing based on checkpatch.pl output on
> file.
>=20
> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>

This patch is basically OK, but will become smaller if you remove the
DEB2 macro.


--S0mv/d5gbHeoFj+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVGwkACgkQFA3kzBSg
KbZ8MA//b1Kh50KOrTKIuJ87EIt2ykiysa5+/hIaRMRJbzOKsl4pH9c7OE/6vS0F
St2iHtDoY340co8/cZv2Eq73RigVYBRBTkn/7FLZXMAWbcaFThUpSl4v0A/uFhSe
XtnR/7B8upq3Fljf5n+yUr6m2uSQmqQFyGwTBNFG0Id2K/aJDjU0yo+TpAvIW70c
xgrRS0+2VupsddLbB9/p80G38lPzX+fkH0cYZ5N6R8b4AGUMKhmbjVUh3r9K2978
E8NiGIZiSIZKAovbXdNaGiE/2V7ecKaMkOCZiAnYvBaUNppYcw5Wd7cBxD1vNS7w
kCVT+IzsZrQdIWANDdlW49KLX7wu8nIRbetLQFqINO98u6JDR8IMUnrsTdhVyldB
4vo7T+x0kSttX5zfjVXvlk+7+1596TP/7heKgiHGXISQuBP6PJVGbwbg4unS2kmS
CiynUC+xkp/jpX/ZTeQ6zOdyY8Gdg3qLkuvv51D71+Z9FS4R/SeCAHVoDpJ/9DbT
ttIJGO2Y5GPu4epsvNM7l7A09s/c6tkvOqlWJmRdmaNYBAl/9+zmtlPHJ8GfvF0q
znPtslcv62CwJ5hfL0lTwsluwMXEW6peEkRzSmd/R6JRkGsm1ZS9j5RPsfze6i1N
MHfmVtxwqJCeYADKhmClqJLc1v29A8WWPxS2zXFI6ETJJlMy2FU=
=cAsK
-----END PGP SIGNATURE-----

--S0mv/d5gbHeoFj+4--

