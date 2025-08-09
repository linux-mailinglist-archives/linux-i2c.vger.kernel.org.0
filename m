Return-Path: <linux-i2c+bounces-12172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609EB1F385
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 11:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10CE721B26
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 09:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80408224AFA;
	Sat,  9 Aug 2025 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lKPVquKm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB0719D065
	for <linux-i2c@vger.kernel.org>; Sat,  9 Aug 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730982; cv=none; b=fiJJLSdLAX7QiuOWlUx5+y9S+2t/ueRpr3xOkvtViaXxmezI//6/1CbcJ98c4T37NjQDsKMoVWfS4cCxOT7d0zzUb4c+bV/A+YOZmD67p32OxHlyuEKR0F2KFC1N86ZpUw3nr3V7Wd9ydZ+AKZGO0Z26ah0tqYWIH/PEh9rShiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730982; c=relaxed/simple;
	bh=+niwY8GWPEm0R6Qq5ZIAxq7zT+yGOlTKB6t04XHz6sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiFile5W+Nwp65fHkC+ekodjdlHqACMbgiliB2arfjmfSKqDDqNVqnZFanfp2wvyYp6W/r2CISgQdckPLmek+LY1eKPK0PWTV30dOTd7mgb954oSIc9AW8I5CM1V5u/Vn1ohJFzitchN4d8HqhwC6kAdU/8WX+/vzNBGznon4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lKPVquKm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+niw
	Y8GWPEm0R6Qq5ZIAxq7zT+yGOlTKB6t04XHz6sc=; b=lKPVquKma3b9YasbqQu6
	vAea5Zoanx9Xn7Lb7qn6bCVRM0BKV529J+p39lpxNF0ACQ+BlQlBKplFKlollr37
	57Lvaq3kXG+IJ/wyVCI5Oc8Bo+7p+KCdG+ilqR16tlfilcxY80OE89l0anIwngYT
	Vrzg1s7upWNlXc1d5OOsRKFpkFmLjzpckZoTViYynt27h3jW5lKgmWljknUu9xJK
	/xMIRqc1e8endsd8AfCspIEr4L2m1Nm03N+gBxD4144h5V0cJeOz8aa2Y9BjoUTf
	usl7c0U3Ny+7akkqhd6bBAHzLvAZygoxH8bqCJStouQsPDtlOl5Z1cHUdyVyB4vK
	0A==
Received: (qmail 2032441 invoked from network); 9 Aug 2025 11:09:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Aug 2025 11:09:32 +0200
X-UD-Smtp-Session: l3s3148p1@ZnFkDOs70L5tKDNO
Date: Sat, 9 Aug 2025 11:09:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: chris.packham@alliedtelesis.co.nz, Alex Guo <alexguo1023@gmail.com>,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in
 rtl9300_i2c_smbus_xfer
Message-ID: <aJcQSpYeWYHr9fm5@shikoro>
References: <20250615235248.529019-1-alexguo1023@gmail.com>
 <4670491.LvFx2qVVIh@ripper>
 <aJB6u1WoNjiE-tZz@shikoro>
 <10749199.nUPlyArG6x@sven-desktop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ccho4Pm/OoTM8z1G"
Content-Disposition: inline
In-Reply-To: <10749199.nUPlyArG6x@sven-desktop>


--Ccho4Pm/OoTM8z1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Btw. I've already picked it up in my patchset [2] to avoid conflicts with=
 this=20
> patch. And since they (2-4) fix broken functionality in Linux 6.13, this =
patch=20
> becomes a requirement for backporting those fixes to the stable kernels.

Thanks for the heads up. As I already said, in your case we can surely
include this patch.



--Ccho4Pm/OoTM8z1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiXEEcACgkQFA3kzBSg
Kbamww//eXpn+bOOXHSCQzjHme6SUyCKDDQK9RwcdrG9XXkB1fqRkBxP20I0cPHq
F3u8fkyNR51qZolJnRo/nAUMUyl9RtqLxxCr1yYK266fg+gaWkRR+qbCeHYWU58P
Izvfhua6cLcy0fJPUIHdt0IwjYw2A2IZqY/oB7w1/mOJ9vBetRD7ol4SLQf3zFwa
TW362kio+Tn4uVTpN4B52r+7UjP2jKawPPtnNnohD39MU3IOaPjBzJW84DcYxw/H
7E7AzWN4SGVebc0Y2CFP5fN820kORr6qWujXaS9+nKJ9ErZkxC2Zo0/b3X57OgI/
+4o+qwrQVzoPs/QAvkaMV9fIcbf6ZErrjq6W+aTanRayO5awJ5I9IW3agFiIYdEO
vNEYhqWjeYKIp9eHvYi5BgqNeUyCqyo0XkiTm4PaL2TPAOHhJ5ia7/31S9i2VdmT
IHY5GYcgQVCvqktksKJKd69VBrWp6PtJB3/gLB0NRJ6U07PFBAhMg58OtkT4uaiD
PpFFVzXBm2Wj9MM+34+PbkxKuuiU/QuWdaZCB3ga/ZGCiJn1nH+aaCWEWAsTZt92
62YDeWi0XRdY8iF++tM7e0BpdfczsXvS/JLt9BKZvC0c1x1GnvJQ1OSI+9jc0S+J
uuf4M/d/QepDfczf6JOLF2dtpWMSPzTgUzFO2DXD56DYUKC2RGo=
=+Jon
-----END PGP SIGNATURE-----

--Ccho4Pm/OoTM8z1G--

