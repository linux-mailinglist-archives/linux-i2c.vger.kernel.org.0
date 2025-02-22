Return-Path: <linux-i2c+bounces-9529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD26A406EC
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 10:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17FD819C720F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 09:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9986207677;
	Sat, 22 Feb 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eoR+hgdD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B312063DC
	for <linux-i2c@vger.kernel.org>; Sat, 22 Feb 2025 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216655; cv=none; b=TUTawUu5PUOXxeGLESOYR3yHE19cx0MeJnyBrT6T/LiIHSRuXdjscTYsPJpEfHaJp4rMQuxgaWozY07Mtky0aB4CwbKOEGhBH8L8itB9+2kvW6oetHjECLujnoS4ezHGjimmPLt6PFNOojhWnKpUfjjKAC7NCOFNMGdCGSVjUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216655; c=relaxed/simple;
	bh=YEOVvgmg7FxOvmZafWS72ZewGgi0VB1w/eqX5SfWyn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKCF9WK5GNwnyyCpoqKVcOmpckgJxaFCyCaKaPQz7JMeLDh9rKiKv3AIWwkTGn4GjtgIJd/A7MKnMZHwmjq8bT5ymBJbwt/u/Dpd6RlfZoqWPYZCfRcbYs/j63DPwGGxKeixQ4s2wOAijR59ehB1y/aytjxgOTYPLFSElTTLmr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eoR+hgdD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gwvH
	R2pWT+FEQ338AH8GO4XbPqa1gdPGQfyRRNgfKy8=; b=eoR+hgdDrmxsFOnAZasD
	YbaD8lYfrfItqfoeQfuyVjnQRwMt8HfvkD7q7TAI2W83FKcC/GdSXIGULUw+D9X0
	mQUxR+fZBB6Tqwyj58VEIqmDN6Fp5OU1lp3oNzAJl7a9v81ccou4ZsUqsgIgARO/
	Om+cNnutkEXcRfh7uwQQjlcVorwuiXdCakUq6ZAJ6lpl9uGnLsagciFfsLhQilYP
	FbF/+ei9Co4T4mCxSY1B8Ucn0oRA89p9hIbl7uD1gCKkXgj6roEB1KaDahm+awHH
	TiaX5cRUZx5M386kg65W7e0wzGFDSUtc3Tf6DfVnhtUXs6JFmP2MGrf5jgND8k0l
	Lg==
Received: (qmail 1532662 invoked from network); 22 Feb 2025 10:30:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2025 10:30:41 +0100
X-UD-Smtp-Session: l3s3148p1@AeG9wrcualltKPLt
Date: Sat, 22 Feb 2025 10:30:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Su Hui <suhui@nfschina.com>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Allocate temporary client dynamically
Message-ID: <Z7mZQRQhis-DHRFP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Su Hui <suhui@nfschina.com>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHZrXgIteYPz54AL"
Content-Disposition: inline
In-Reply-To: <f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176.git.geert+renesas@glider.be>


--ZHZrXgIteYPz54AL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 04:12:12PM +0100, Geert Uytterhoeven wrote:
> drivers/i2c/i2c-core-base.c: In function =E2=80=98i2c_detect.isra=E2=80=
=99:
> drivers/i2c/i2c-core-base.c:2544:1: warning: the frame size of 1312 bytes=
 is larger than 1024 bytes [-Wframe-larger-than=3D]
>  2544 | }
>       | ^
>=20
> Fix this by allocating the temporary client structure dynamically, as it
> is a rather large structure (1216 bytes, depending on kernel config).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

As Arnd mentioned, this is basically a revert of 735668f8e5c9.
Applied to for-current, thanks!


--ZHZrXgIteYPz54AL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme5mT0ACgkQFA3kzBSg
KbaGeA/9EzW9yZgoVWRbjzsIqng4h3fukQzyBUnluiM+YzmOy0i0OJAjZaoE//zp
NESGZlGIrG7UjTT+FV0GKfCQIOdxx5Tn/fsBIvBeCf0C1JDS2F3EDwdG1/OMGZP8
U0bSIfcE7RPagY/PXQgOCTAhhn2Jq5rZ1EjAgv47jCz0kzhctBu0QhclV0MvULVV
New4PLP/CcgslnZXHSbdL8vQNvb6QaDD2RkUrET5FVk1iSCbOiPGzKMTG7+pFxPQ
n+l1mAHwKqxi5eqBnmZp8873FINQE57jHl+pmBp/Kldf1XGNb5fleCyvB+W7Fea7
CvdtbaCTsJ9unJRTdTS5MS+3DFYLToO+SahMEhnml55PGTrS5GFT804S/abeieei
TOMa4eI8iC2Uqso0x9eZaWohKVqpdKQK26lK1bDFRbbB4URz2KWrDBA4pN3q0U5g
s7KPQftTsU4F8+zUz8LMOhvD7biJZplSTyWXt52BULJJYLNt2KBxtx1IGje309jX
PQtVvdljbqraqGvuUBPvhBUsMCaM3Uzb1+KoSaAK8V/0xpkrx1eBQ7SRDSxu0bHd
7wi75h6HXeFnaJUnjh5SFNt7AJPnvw1y7LBg7FuqbBrZQ/umdOlEi+SfxnsXvovc
ggn8i6yFwtz+HZEnh8IalNWnNX2BG3Apjb8lEMEuUZuM48hgTTQ=
=96CV
-----END PGP SIGNATURE-----

--ZHZrXgIteYPz54AL--

