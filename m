Return-Path: <linux-i2c+bounces-11034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC37ABC225
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD73161C67
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDA3284665;
	Mon, 19 May 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QhO1Yl29"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF9277800
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667941; cv=none; b=tTykcmturEgiwOoBhYhHaQaaQ0dyqf7mh1VA56epLK+lF7BwugAa5YQTwbWa23BR98eOUfK4c9MW0idU5euPjxCdQlp1j6GIf6eEgCYZ/iS6hOzWbrBJehUsFaNI/gbDtFldCs5KAbxvTYz5ef1FENSDXsLGVAnRPpTYrGZNw2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667941; c=relaxed/simple;
	bh=wvxuEtEBpgbRUTTzKdb2SAiepO4rgesJm5Ce/kwGzYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq6Ugu321gYqhvcB0en8RbJ12d4tVGWAlHxKB/ZdAFZNag0nCOtk5j7IWfg3/GKi88bD2qD/D1UuDDQg7vQQSEsLYk7/R/7Pp3vGyxQ+5TeLIk5AnDpWn6pF42hSzINJJIj5fT7eWVey9dPXkR0aqsCH9+g5JnineNXDaTT94M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QhO1Yl29; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wvxu
	EtEBpgbRUTTzKdb2SAiepO4rgesJm5Ce/kwGzYU=; b=QhO1Yl29y5ZPMS2GjAAm
	FCd2ParSN5FsB4aZTwz8haYscB2syMipOXnPRonBXrfmzL2ORxh0ye7tUAz6WGBQ
	o6ghVjCsW9sz9wcVHotbc+emPPALYp2Co2uV3RQAvcteY3AQNJvSW0Y+S2Xsv8eG
	Q09pVIjtdVQCn0OrQGCEv37Ja8gP6EP7qZk9O2I4ObtEPkiHDmMMetiquGC9pLyb
	gSTZPm7LTyJi2E9L9/w0nH4pqnTU5OZ42ug6mkMP3GZ23MnI+wY8yKLXqksJ8Drg
	p/WoQLYvEMX23DodrcjnYXO5nRols+SD7WAga+0ElQomglSDkwlW243SgmknOZpW
	kA==
Received: (qmail 2538004 invoked from network); 19 May 2025 17:18:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:18:56 +0200
X-UD-Smtp-Session: l3s3148p1@8H54pn41BO1Zz6uL
Date: Mon, 19 May 2025 17:18:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2ctransfer: Don't link with libi2c
Message-ID: <aCtL3zo8w3f8cWeZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>
References: <20250513133551.584e4366@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QW0TYsvi2nTc78KS"
Content-Disposition: inline
In-Reply-To: <20250513133551.584e4366@endymion>


--QW0TYsvi2nTc78KS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 01:35:51PM +0200, Jean Delvare wrote:
> i2ctransfer doesn't make use of any function from libi2c so it should
> not link with that library.
>=20
> Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied, thanks!


--QW0TYsvi2nTc78KS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrS9UACgkQFA3kzBSg
KbbWJQ/9ES6o0mq7sHUJlpwZiLLQETQ0MI/7lVR/ElHnWEo9LM3HlT7kwUKTjvYM
DSq+XAKFDDAdIhUwRsxZj4vWMpOzzwr26LAm3hptmg1Ciqtd5gaO4tHjUBjeZBeW
2HT3V4piFf8M0BCTAbj/jN2OlPXAIUWEopMT2x6SGGFihi3mHITB3q1Vm7uQuEJ6
dIyTHagwvz5y0qvGk9JmevX4Ps1ce//ZQ1yjW+F6YHK9hC+iru+DcYGeqzwy4ydQ
CapIFUS4XuXcE3Rj2mtHwK3olYjeGexzmPkRjyWTbDbaQC15fD45bcncQVKv+3tH
BWeK8bPjQakLdJ/RtO37UTIQspU2vAtcfsbSsjrf8LlJe3VhfRdzkW6hkJAZDcV6
acVWGDBL9QLR5axMQuHTlozUegDvmlFYVNJ+fchAA/PxY1I/vrMm+d3AAB4jpVzl
5Ss3FZjZEyzk4M2wA/3dXI1R2cuCKDCisrgFHblvMZaFZ7bLr+TGqqF5QULgS0eD
0+PyqLWg0Z2hbpnfNTjE2CQr4bHtQ3VRjTyBJmwpWXeFJUgZTlh18OwtSm0xWTvj
+oIQlLraYrBLYXCMV98k+hCe9GYO0DfUAmqotUllVAd4gpxQjfsv1Z6ouZDVN0Nf
9nKDYys/laBQgp12itKzwdhJKGCy1UCgwipYQRI74Uwd9j9pzKg=
=+JaS
-----END PGP SIGNATURE-----

--QW0TYsvi2nTc78KS--

