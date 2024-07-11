Return-Path: <linux-i2c+bounces-4895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDF92E353
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5352D1C224B3
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1CD155732;
	Thu, 11 Jul 2024 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="geo7Mp2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6241212C559
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689605; cv=none; b=LSeT4i4/uSVWt7t7GdQOl+KgBrK6rYLjDVb5UvzDOWL/hqZp/qDrCDzCm0ccrcbtFOnbKemVESD+hYQqmJy95OTRQSs7ymjFjvTO1gj0U05jxozQwu+0P3odGBrKI6x/U/fsLGSaHAHD4MuhF7ZHhfpJT5Ij2+pnX130/5OU2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689605; c=relaxed/simple;
	bh=5mD8AV0qezADyNQc1mmN7eawcwGm1YXzeHCbe9LJQO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB/gFa7GTufLo4KAXbxr/sUKzEiPwspnOuTx0Zoj4cnQgDYZMlGwwz78m0lSGk9iWhRd9sIp2rWNXYOeiD2/nGX0SJBE4ROGfkax13+LjgTIH0BFeWO7Dt9lBaHl2c8iyp17TsJJfmy2+EUvqG60c3TkcCNKwLzf3xdvkKlEuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=geo7Mp2I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5mD8
	AV0qezADyNQc1mmN7eawcwGm1YXzeHCbe9LJQO8=; b=geo7Mp2IEYdsJT7I20f+
	x+cRjFCvY9n4QrmkCNXgGexDd3CTRX3tiWG723RGeJ+vGpPTAn78/EHtqGizMe8z
	NeTh43G9zjOgbUJ+oP1zLaZcyL4FxSAAja8XAj4X2vTC+acFzw6ASwt1qraNWJAQ
	68U66qXE/OPe1uwIjrkteX0tv/fqX9tls6tJ79VShwx38jGfk/b4Xtv01WljIC/U
	8jNpdLskJbNTukWNF2Y37b0C9raHa24SMJKjusPZG43SAWV8nyjeFA0yJJchrY5d
	01LHeLIhv3tPsJqcLqiRgbRGZTZt3vDAW2BiCFq3ZN8bpHuW72NY1S5X9czca1IM
	4g==
Received: (qmail 791792 invoked from network); 11 Jul 2024 11:20:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 11:20:00 +0200
X-UD-Smtp-Session: l3s3148p1@eYBiRPUcvoQgAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 11:20:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entries for Thor Thayer
Message-ID: <Zo-jwLSEXjgLfstd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-i2c@vger.kernel.org
References: <20240706142313.2028-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2HkTXc/ABsgDERu"
Content-Disposition: inline
In-Reply-To: <20240706142313.2028-2-wsa+renesas@sang-engineering.com>


--x2HkTXc/ABsgDERu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2024 at 04:23:11PM +0200, Wolfram Sang wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history. Delete the entries and let them fallback to subsystem defaults.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--x2HkTXc/ABsgDERu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPo78ACgkQFA3kzBSg
KbZnchAAgvFigyVcg8XxlEMVSeNAb/aNywX6WUEElGujU0KPtrJGfv8qQyzf271W
1cIanVnfNoZTocaylm28OIvKQJLiO9zG1k8pN+ulrGaXjIGbQqSakFWDBIr/9RoA
uBsVnjNoGty47Ts34UydHS/9SKESdrOgIJwWJs3hWdj4LS9OIoy7/Xjo2sLcdYyk
hLc3d0IpXdxIDMobBs8FMSuSbYqJLda7RlZ/P5noay5JOzfKmKjON8vq14b3vozs
SB87bmDd0AagYHOsSLwQ1dWc0JT2YVv0Oc2YWfntASNrWcKA2uCwHBL9IEk82CXD
wbAC317pxTOLHmJTaL6QIXzq5lnM4rAL/K0M7isOg5dL1O7wkPiicW7uBohmQ3sx
LFkZDlU4P7ifONrLm1QvmvJRQKEcQe5QpAubvJn0OPEumlAFjkNSqw5Mse/gZCCH
zHy1sEPs6/fhdVCXxQXeYEV6KjVmSnFkCJ4419rXBPtOetPVRQeXI+6pbGNGFAXF
cGJyxncK6GhFACE9iDroUgE84YaoHHb2Qdnn8rZTkspVtr4l5jQBp+n9HqKIcxZb
sFo4dPuA8CSi6RDZX1ybWnuzJtTIkjbrq0xyWhoNkhwKKvwqgLgKTSi7S89UvZNb
HDB+5roD37ua7+k9m2ygKZkaxZPkRmwDtw0+lqMU8gMUyU+zpTk=
=b4B6
-----END PGP SIGNATURE-----

--x2HkTXc/ABsgDERu--

