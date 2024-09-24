Return-Path: <linux-i2c+bounces-6957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F37489847A2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 16:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4701282A14
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF2F1AAE0A;
	Tue, 24 Sep 2024 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JIjOCBXZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870C1AAE02
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187891; cv=none; b=ubrcSo7AGcJyi91C3lzUltuCsf8PXw7VE6VF70TVt0sbuxBL/7csrvpX83oIYA8WtVdF8t2IabYM5WykGEKze4WZ3omlLFubiQglnm7d/wx7cM5OKE8WuSTMSHZa6TajQIqfSNy6R6SOVaWMySbNavHgtdMXVnP++6y9W+1YYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187891; c=relaxed/simple;
	bh=pY3SHint/mcnx94L9QuqHG4SLLg6BljxoPHrIFGTE84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibcWtqKH54Xp5TSwBSi9NaDR3Hi3nm0gayNa4VKf10Rd6Y9KNG6gX4FCmvBjEUA6YUGWDwywNjZCe5RpNwOjj6osOJpYfXSj8UxdAKBjtTwHTR/F9oQRGzdt2VtvfdjrQyLOOEwtx65ebzuS1JkOZ1Ls4Lj/gKVWSmmwP0WeYOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JIjOCBXZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pY3S
	Hint/mcnx94L9QuqHG4SLLg6BljxoPHrIFGTE84=; b=JIjOCBXZaXtSLxZc7aVZ
	xHwTq58QFJdnx39Mgc887WPxPaMR1VyUWBAaZeYZIqLE2Lco67M1zAY54p4MlX6Q
	scXHbwx1cbUpl/QbLSP0Ziw3GiYivkbgh0YA+dTDociOrP/Qn6q5S1teNtHAbj2p
	WQOK519P1Zhm1dlMbuxRGNjPw/IJOzN2Ef/cgqaSrVYWe1F+MjZHIedZhtGAkRhQ
	cayOAq4tcT40hJS/sY8cq0cqb7qoKttBI6A1dydKdRYYJOFcx1mc8iwbWfj7YbG5
	soB0QG4CD5MpBm4AtIGWdbnuirkeiqdaMdG0lAeg4ds3zRp2plN9pUNSrM+uUoNl
	Rg==
Received: (qmail 278259 invoked from network); 24 Sep 2024 16:24:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2024 16:24:38 +0200
X-UD-Smtp-Session: l3s3148p1@O97qQ94iSuy5aIod
Date: Tue, 24 Sep 2024 16:24:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1
Message-ID: <ZvLLoH-Xk_9iVNVY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
References: <ZvEaHWH0IndyeMvs@shikoro>
 <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Eom38cNtuNYhetF"
Content-Disposition: inline
In-Reply-To: <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>


--3Eom38cNtuNYhetF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Stop describing pointless noise. The pull request - and the resulting
> merge message - is about USEFUL INFORMATION.

Noted, accepted. We will do better in the future...

> Is this some broken attempt at AI summary? Because it sure isn't real
> intelligence.

... but this comment is too much. We have a new maintainer here (Andi)
trying very hard to get up to speed. And one maintainer who could have
known better (me), sending this pull request a little hastly during the
short time I had during my holidays.

So, the pull request looked like this because we *are* humans, and not
because we are not humans.


--3Eom38cNtuNYhetF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbyy6AACgkQFA3kzBSg
Kba0jA//WAc5tjxfy1vqmtK8TJvdjAI3xggaqJUeMooFH9wG2lqmnnSTyrAltpHY
tsMOb3hJN0nJzFyT+QxI9BE5+Ky1ywfUaKPPXy62vbkDdzI5fBFM1Pdjs7xGjFcu
KP7OodTTDveRGdJWKkZE5wDLeHyGULBzRDDg44mhJ33y8yhBBK4ZtZu7+NuB9w72
kCfK2+PgczYrWIWX6CAit2XDN7mIkZi2MpaTwSFP5nx+woC/FeO1v1kgT7jcg1mK
lK4AuXqvb3Bje2tvvwHXbsVb8xJf1Y0Qst4DXDxSkUmVHlteIXVm4PLcTfrPMSDc
vlsKh87Tsjs1d78nPvyy7qV4iN8SHaWFliLdbAL0CUpHrf6XJWPfMF448/ELUWZB
NKip5bpOfWFsyfWxGuqt29JCeIn1IM/ODERcZLJaBZxLXL7ILv0/DgKEZZxJp7z5
IYM9r8/4J83TW66ObeFqziTcQOH/t8A5SVYd20xY73u3PH/MQ8rR5Ln10NWdMXrv
5WP60P7YsThWhQrelqsr/447xURNWHYes0vAtiae2KBa86VXmdvfP/s2e8TBjubw
c/B+Z2/H+P2XrMwBQ0U+vXQ17uGMq1oKCYt2d44geMan3ptPCWhdFDM1WCLTxeoe
jvbf73PLUk/tCLREJuG5i8c42DuaGdfp2gIzu/T6Z3DoyKP2UXE=
=+oTu
-----END PGP SIGNATURE-----

--3Eom38cNtuNYhetF--

