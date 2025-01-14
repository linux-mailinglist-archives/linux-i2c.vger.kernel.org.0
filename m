Return-Path: <linux-i2c+bounces-9075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C3A103C0
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4345B3A5AD3
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98D122DC28;
	Tue, 14 Jan 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZHGJwV/B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1A33998
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849604; cv=none; b=oD/Q/1WeqgyVXs3xuxQQk1xaKCggSVg5+MiLvKv2ao2ko6jwthLdfrJUtN/EmglRrX0ZCfLLTCwZQml3O6+VnlHnWb0qq7bVeog2aN3FHUxYCu8uyqV4Ws2JZpuHPn3u5DYArMgsa7EpPmypTJz0EMKxQnC/SKAR2fZTnBhk+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849604; c=relaxed/simple;
	bh=XyuwupjflOinh4JaFfF1V9PVJBcHyycumrn5HxGzx/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh89SrzvTsTmqENaPq4D1VavoLS3eYxUYJk0ThaJnB4e5Ons+uFQC+A4NEVQZJhw2OyxKs4KDykpF1V/Fz9VFEsDv00Q45jYIPzRtU4Ri0N76AtAlwls43jDuqC9M82TsEj+/vreo/TYx0psfL+WkJ1Et/M0vwW2B17EP2ySiy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZHGJwV/B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Xyuw
	upjflOinh4JaFfF1V9PVJBcHyycumrn5HxGzx/Q=; b=ZHGJwV/B0+A8FTCJvyyo
	T6djywRWux4mXCrnDQHyoXh2nc6FjTaA7d3/5pn+bXd0ZPSw1D93J/o/YNWcscnw
	f8yJqFkaNj41TDEI+vMEyRlGb1Qd53jPd8mNdm7tQW/ZPEYQ26s89JVNBY/SEust
	2XRN3Dyi7iJ8AGOgIELsnVc9z1VwmDX8CvB1uM+vM0Tse3LPfUIWM428FoguuoSn
	xWFWIQ8I7eE/Z40/aKDeXeOhLXHegtxqNuzUJOeNNcYKVUgBbf8IdALnydd8l2jD
	959EIforia9Vhz+7VztyqJf5DyvsR9EgWAmt7jcZ+DCxtFSc0qsFrlmN/SrV3uSo
	yA==
Received: (qmail 161923 invoked from network); 14 Jan 2025 11:13:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 11:13:14 +0100
X-UD-Smtp-Session: l3s3148p1@G0YQz6crlU9tKPLS
Date: Tue, 14 Jan 2025 11:13:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Remove TODO
Message-ID: <Z4Y4uZMdfUpbFNY6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250113125729.3014-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQkTKseIAX0kDxDA"
Content-Disposition: inline
In-Reply-To: <20250113125729.3014-1-evepolonium@gmail.com>


--gQkTKseIAX0kDxDA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 06:27:28PM +0530, Atharva Tiwari wrote:
> removing TODO in i2c-amd756.c because Andi Shyti said on
> https://lore.kernel.org/all/ovddzx2zitp6lqjdasinn2zaaefp35y4mspol3v3x5rk3=
tddgo@kgcwexuai2ir/
> : "I think the real solution would be to just
> remove the comments altogether" so yeah this patch
> just removes TODO
>=20
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>

Reverted your original commit, reworded the commit message (please check
how once I pushed out) and applied to for-next, thanks!


--gQkTKseIAX0kDxDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGOLUACgkQFA3kzBSg
KbaGeQ/9EIzetbGzOPwiY13XfNq5i/z6x3z9ENbY0ZyQkGIlhxfOdIGyr3u7Hfck
9Q7v4Hbw8GS7U2aHFtScdD4BGs8aHukjY4Aiy8/gyp+/jd0ePl8m+OURMSqbmtoo
5xmVlVCdhUcZKZpdOCX/fd6/GYnPxbhDoUn8OUJiw4jTajX3+tvLGiszLiMcc5n7
hBjv+lbInZjh8MZf88aktg+AVYZtjiRcz426YaCcC6nOrtTpK9+UhnDSjf0q6ixL
GPgIK+u+WtRZ9Lwqc6HHVvCknZZ/9aQ5UGeJDBFmSyZPuIf6+xTNNaj3+nFNtC4f
21ndDsbMmO9lSQmhL6Yza1Z0Evpb7hUUbtYxHu5sGl00whgFJFOel6yXs4LO3h9i
Wje1U03ShtS3SyTi8GtBHgLzfbdru7b4AUpCXhdrbYnyfLcQ4D63EJ36BzNHzLTG
GC3TkjJiKMqlHdyj5FQK1WlAl+eJrbrtII9XPQpeDhoQrGWmno1vpUaSu2n/W4ug
YGmmyoerffkPPFwDrnh4Qun2wVHhJAfCXOJWimzCzNhcYd1PwgdxFwWhefyhv8nS
ueao27RCfdnS/oCdR2+KzAZcGmjGslYO/VFOn0x9ojZeL2bI0Ykjzl6O4wLtxCHo
q/ZKfnyM9IGjh3AJD7IyhC5hyPkZMI4s9h8U87r1A71MhLD8z/s=
=Ml8I
-----END PGP SIGNATURE-----

--gQkTKseIAX0kDxDA--

