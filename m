Return-Path: <linux-i2c+bounces-9080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E9A10606
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 12:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D253F164972
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B22361E8;
	Tue, 14 Jan 2025 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kQAVCuAz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940812361C8
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855911; cv=none; b=tWiTY8Qclx1znCBJaUVMf0WHLZ4gTF5AzcpwbdM4B7gbPCqifSGOjylawxSJ2oeVDcYfQl33XQtA1tuvhuBWWcW5x2xLYBLZoYMJV37nndJgR/dweu5iglZuEA+rSM6FG3ZHMf4jENQx7XBGqSs6OOcd1aEs6qm+TFtI5MEqz+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855911; c=relaxed/simple;
	bh=BZ5LtWIv3w2bEe9vzjZ/DfqBb2U4RTsmTLKb0L8Soeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hm28CwkxjeE7+lyw5h8Unu/jVxOoGU5irqItuWWgWsAqjizyBlGyHaz0xLN1xCz/T28z2Byaj0Go4mZNLfJaxiCMmhp+j34Xgl451fIf+VbeT0NW0SdXq5qljQcNTWNISbfXm0Qwj/cmQCrqkqRAanCjYIl4uSmamc5IfR1JsGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kQAVCuAz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BZ5L
	tWIv3w2bEe9vzjZ/DfqBb2U4RTsmTLKb0L8Soeo=; b=kQAVCuAz8VnJAGZNsiMO
	fQ7Og/bxQt+CicVERqUi5rk67r/zQGPaxLpgehjYDKNxaMtiDgWIrogNs+pLCqbS
	R9TQlbYfLzK1F7M2/gTQG4wRgCqzIZDnhIYZQwBNJ+lowD0z8eudilGZdN7uQLRB
	r74MjFTwJA8PctQKpsaAAp0ZXcoFMZEv2/UzGb1JLqi1JziOtXTVAFhiEIpPZkFh
	u7DFgchf4pTj8tJARV/f/v+3SOc5qk1joVLt90wSg72BsluDbPu4cTnJ7c74kYAf
	Y0M+eUqWnmwzKdDYD2BxsSLdjCZ1Ppj3HibvXZAYEEW29yUPRgQtOeCLrhTOYQPq
	1Q==
Received: (qmail 193969 invoked from network); 14 Jan 2025 12:58:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 12:58:23 +0100
X-UD-Smtp-Session: l3s3148p1@ZRMjR6krsjVtKPCo
Date: Tue, 14 Jan 2025 12:58:22 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Randolph Ha <rha051117@gmail.com>
Cc: mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org,
	jarkko.nikula@linux.intel.com
Subject: Re: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <Z4ZRXo2uYZlvWI2r@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Randolph Ha <rha051117@gmail.com>, mika.westerberg@linux.intel.com,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	trivial@kernel.org, jarkko.nikula@linux.intel.com
References: <20250113064802.GJ3713119@black.fi.intel.com>
 <20250113195308.244372-2-rha051117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PgHnAkI/6gQPWSdw"
Content-Disposition: inline
In-Reply-To: <20250113195308.244372-2-rha051117@gmail.com>


--PgHnAkI/6gQPWSdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 02:52:37PM -0500, Randolph Ha wrote:
> When a 400KHz freq is used on this model of ELAN touchpad in Linux,
> excessive smoothing (similar to when the touchpad's firmware detects
> a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
> V15 G4) ACPI tables specify a 400KHz frequency for this device and
> some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
> force the speed to 100KHz as a workaround.
>=20
> For future investigation: This problem may be related to the default
> HCNT/LCNT values given by some busses' drivers, because they are not
> specified in the aforementioned devices' ACPI tables, and because
> the device works without issues on Windows at what is expected to be
> a 400KHz frequency. The root cause of the issue is not known.
>=20
> Signed-off-by: Randolph Ha <rha051117@gmail.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to for-next, thanks!

Some comments for next contributions. Please send new patches always in
a new thread. It was a bit confusing here to find the latest one.

Also, while the code change looks easy, this is not a trivial change, so
trivial@ is not appropriate here. Trivial patches are more like typos or
whitespace fixes.

Nonetheless, thanks again for your efforts in timely debugging this!


--PgHnAkI/6gQPWSdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGUVsACgkQFA3kzBSg
KbYPZg//W1SNQpD+GHkhY1UsRxTDoa3XpFseVrvcx3i5+fxSxSixapIDoZB2gxlM
kTPKnTY3iO86EjVU1IhSF965fQI3+uMhuWHrdGtdXldRMaJHMHF5MZ3wiphwyequ
a8AoKdvtV6otGh+78mntAXymbk9aEdDOuRwU/QMVmqglT6wiy5tBeVEN733bPWYC
EgJ59lWHHt0Q/70DskJrohc4JJ3I70dTeRqlF/HICHFL45uTSaGfVnCHFXWkyWR1
W+mlwmc54U6We5HI7IIBQfJHOXKHZLUUbFWBLM6udoDs81gAcMiPB5k3Z7sEp7JQ
K0FZCoqpklMZs+QtvzhZyHAUQP0WfLx8p+XIzdstlvJryEJ/isMAGBTb02sZFBl2
qfmYAYQj60H2MXgZEgbG+ZtzY05BehI2EUPM8JQRtVy8+pM8BXr3uNpPuQsEK3ZP
4+hbnmPPPMW7RPNd/cKBevR3PrQk3tEugL9Cda3p1lX2YSm5Jp3oF0adiV0LW5oL
WSDV+eVVBW7wpFNJTyA0pJ7FEbInXJ2P90ulTN2XZe+/K54fdvDcPFsuCkLPohMD
DyZ5i3oILOIn3Nj1xOBKBs+4IRdOiNOj5d7SECZuryypwkhm2d6xdtBu5bVm7HeB
GWCed4VIB846/DSLmM6UKdi3kwZd8QQfnof/Mz/fHZKfxtTo5YQ=
=MoQW
-----END PGP SIGNATURE-----

--PgHnAkI/6gQPWSdw--

