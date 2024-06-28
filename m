Return-Path: <linux-i2c+bounces-4488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D391C5F3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DFACB24B8D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FBE1CD5DA;
	Fri, 28 Jun 2024 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eGB+npoi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C861CD5B1
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719600041; cv=none; b=ezHtUx3IV6Lpi1rUsJfe0uDIuGEIYqcTbiNx5q+2pnjonSAT3A9ANxxOubyjNRE7s59Z2p14U/IguroQOjgwMQKygQohJiQbrjqtdeHUvG1ztSpTIOF6rK1BJiu07xfMuEnegw7ceiiHfY6eXeuKRDG5z/jk3HWPp3tDN8O0+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719600041; c=relaxed/simple;
	bh=bJ5Xgsw3brVjuOFra0daPm8yVAjvD4M4fnEbLTyXt50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3FWhJ8uW+JH1+XDQKBmhQ9h/oCWZPCYysAV8qW0Ol95BbCUbKvnMsZq1/v4ojYfZp3HhrN2ME0AsGhZrhDSIy0wuCjDIrYNpR1Q+8yY+Bh7m+xNGvREamqI8wg1LSwGVkQ4epEITE5QF9o7V1zRZhGBPKarSE1xIb/GM4Tycrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eGB+npoi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bJ5X
	gsw3brVjuOFra0daPm8yVAjvD4M4fnEbLTyXt50=; b=eGB+npoinurDXFo4hrX3
	NtuEXutWy8P9XH2/JL62SfBEGImIOx81jZy0ucerroRBvOQ1zFqnG+C+VgUns3qO
	dz+9hwNiUsJs+Av9Oejebc3AAvFryA0SbwAxGVrmcOS83XANmmUcF9RhGXzNmoeP
	J+gRdYcmti81AtTFWRiFDyKLjyoJtqOAgfhj2oRIp0vnI8gVxAdDDVo99Z02kpGe
	SVu7Ol1nUuDEt9ghQFxJU40CyW+Zt1ifQ1gBHK+BLdR5LzIqwPiqmYXBBfmC2tQY
	1I6PzbTCQdfHfDsBvuNakpOsSlVA9hinRKGrYxGGV965eZJPBZ/2QuBSd0WA96V5
	eg==
Received: (qmail 1339684 invoked from network); 28 Jun 2024 20:40:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2024 20:40:38 +0200
X-UD-Smtp-Session: l3s3148p1@DglolfcbsMtehhrE
Date: Fri, 28 Jun 2024 20:40:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: testunit: don't erase registers after STOP
Message-ID: <Zn8DpYNh20oWr-RV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
 <20240627111445.29751-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+T6FgdQXRsgftlwO"
Content-Disposition: inline
In-Reply-To: <20240627111445.29751-5-wsa+renesas@sang-engineering.com>


--+T6FgdQXRsgftlwO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 01:14:47PM +0200, Wolfram Sang wrote:
> STOP fallsthrough to WRITE_REQUESTED but this became problematic when
> clearing the testunit registers was added to the latter. Actually, there
> is no reason to clear the testunit state after STOP. Doing it when a new
> WRITE_REQUESTED arrives is enough. So, no need to fallthrough, at all.
>=20
> Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--+T6FgdQXRsgftlwO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ/A6UACgkQFA3kzBSg
KbbzIg/+M/iP86cZLA2se9qOUB1hLhpdUi7NAqrJ3j7r+kJUiwFqMqAUp2zfzWch
s3gs7kH0nimOOjp5M6ZkIIem4lm/WQfrKGY4WJYrXA8HqoazHHW35H0LqCpo/Gtb
9I5wVMT/IScKX5QGEk/VzvLuXpIryKxKkKl5uATrvk0F8Sx7//L2KI7PuDu9MB0Q
aCfUE8FSXCqWEWm3zWrr8tj7m4OzlRZ0FuXHtMdnO00/dEQabXcBXCR/MIRJSX15
US8FmpFgRmWmvnfyqzyDxLR7jFxtZ5s+45RPUtZz8u342qaTQB+vgNvnt435CY18
gNiIPtILQBriau4m+Ak7UwlvlaZJ24lTLpJBsLaFlHFCR43EVeV+7PvkbdNImOnO
BbtnfjaqiQFRnAN3hMmQCHbsiPnyLg848QtxFkMR/uqveiFor0evt6YzerewID7h
oigAIVUhmydeZpugyd3tPJguyAClq1rP+oGSv3MLPhkMR3CDOroD5mAVgUX944Jj
/JMVOj0/2CaI0DUzIfpWLBdxqWlBof/mc6uTETPdWyEBUpwZXMSaX6bz7l06KYUF
z7Zeh22zb8+lilmq3y1PJpJ6d/D8Tzu0GRtYR/lz3WKtFiCFAPUXnWMIgBNFiU1y
1z+fNxJOLR/dADFZTiP6yYxoRfkq/NxfBMeytv0eqkw/DFoSzUk=
=Ys3m
-----END PGP SIGNATURE-----

--+T6FgdQXRsgftlwO--

