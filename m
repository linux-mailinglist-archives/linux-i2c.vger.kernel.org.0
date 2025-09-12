Return-Path: <linux-i2c+bounces-12935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610BB55942
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3695C3060
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBF426D4E6;
	Fri, 12 Sep 2025 22:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LXQEQ561"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893F267B89
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716418; cv=none; b=DeNxK5PNOKoHV59sItaIa1AyKNRUnzSduZMqSyaGK/YHNWI927daIkSQSPc4eeLMxDRQTD/OnJkIe3ik5bS4AkAcH/TQhXuj773Mpab40CoboDjhKFyBQXnQOGRT3iE0EgEIcqvCCw3YBaHxuYZcUllkmLxxniOZ3anWuXPiDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716418; c=relaxed/simple;
	bh=XAdtu2bAi4sOTeuz5ngUGzTwS3XsFoaZiTi58qZgMLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZrFVG7dbmG69H9Ml3XOGRQNspnejJzYqthI5GIU7KcSChEgzWZ7FbK6oSpfJgidK6O5gwRCwwpv5SnoxWS8fBGgGxlhsmUOQX1kfGO5eeZaJ+qgpI7XvSPwZL7yZJ0HR9RLXvbqaz5k4D2oDttus3ANaDiAB9rEFkbcwUgx41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LXQEQ561; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XAdt
	u2bAi4sOTeuz5ngUGzTwS3XsFoaZiTi58qZgMLg=; b=LXQEQ561QHjVRWu+sBzr
	f8/tdS4guI1wa5Lo2FeCX0/NuGobrBNHA/wbMzkEMACgCHMpRLKyGg0b6F8QPZib
	y46UlqFLeXh+r178P/yISivHdER5VVvSQkREGDuY/h+UdNUcFIzFP5T7jK9SPm5z
	anRZWhtbYzoTYWpb9XG3+5uJFExpXeH6N2/ZE1JYKyGl/shcy1oFiFPnR5ftug6I
	uZ7566/21GNhHKNasVVtJF3vYm8gem6ngxJMfdY7Y23olLb7x+lETh/g24WCP1fK
	kNesdRPB3cNqFL46z5LQWCFVJegPp3dsDAahTmLo4C2AzwrbvTR1OxpcKJHlRoM/
	bg==
Received: (qmail 1505294 invoked from network); 13 Sep 2025 00:33:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:33:34 +0200
X-UD-Smtp-Session: l3s3148p1@vvN2PqI+EIQgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:33:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, ldewangan@nvidia.com, robh@kernel.org,
	thierry.reding@gmail.com, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
Message-ID: <aMSfvWpxur6nPVq7@shikoro>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
 <20250818043345.65899-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dM/kChvv04Z/JsdG"
Content-Disposition: inline
In-Reply-To: <20250818043345.65899-3-akhilrajeev@nvidia.com>


--dM/kChvv04Z/JsdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:03:45AM +0530, Akhil R wrote:
> Add compatible and the hardware struct for Tegra256. Tegra256 controllers
> use a different parent clock. Hence the timing parameters are different
> from the previous generations to meet the expected frequencies.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
>=20

Applied to for-next, thanks!


--dM/kChvv04Z/JsdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjEn70ACgkQFA3kzBSg
KbYc0A//f4jC0BLjTJDmADL5sJ/whNLEeFuLuiJLOkKTtJhpmvHY0vozOVebiU9O
TG+d3NOAtu1Twvwnwofuxaqq8JkfsyXShsu4jyha9MX558TfJKW31XRQv1M9vhfU
odm6SnNCzBNpTuiuu2HAVjR3fikOp8gVzVJuLEH0FINi7fBlcQLsTIaEjZ+ovUax
YisUg1XD4l6WKzQ0hSxeAZDXfTCPcYw+Y1hVsGBNUhGNzH/C6BvGprm3d4t9vujD
Zk8j6pja8k7WfJvgXGe69gcArHytqOXZu5FfPOEOvaC8KeZywY3T5aXzgc4KgX8Y
LbMlUbtcb6FmPcdjycdxSbKnVFxT1AcyrqneCzLQjLtJSPmO8OHEme1JXNnaGOIx
8ap2wOXBgzZL76OJjQ86Y1Z6YEp2SRTeCSYNL8q1UU8tj+I4CSk8L5rnvpqfVbmd
qE0y8hH+lO4XHis8l7u1TPx1Ciqd5ChMQzY6eQbkZFcNe1bvhsOKHosPLLM2jArT
0oRCiSiw6Z9MtZP+F/glyDxFSl/VfPBuDLEYQsbEpjnNAw3IJ8qFXmDh8o2wr1OQ
8o3/4T3h4xvhIa7zAryS39pDv6YESVBMcAjhSobcT/z+a/gc2SA+Qqur0ahmov3Y
19wEji9I30+XP9k34A81mpaTv+A0m7O3u4rF1S8OxZJWTqg3U2o=
=nQ5g
-----END PGP SIGNATURE-----

--dM/kChvv04Z/JsdG--

