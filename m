Return-Path: <linux-i2c+bounces-11929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A02B03786
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 09:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44AE189AE38
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 07:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D6622F767;
	Mon, 14 Jul 2025 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZKiXWlEQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63E226CF1
	for <linux-i2c@vger.kernel.org>; Mon, 14 Jul 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752476761; cv=none; b=lZSMZyfg1x3XDsAQEPxQhiFzhaCTBpXirZ4Ic9/WNgonfGOpSRuSd49qXzX9Spgz/SdBs/qmf52KufNl2khKmXW7FaH8cfalw6NpV9+w6uAdqPt+mgSRLcIoOvb1lLezBse2aVyOSR7FwXQnOZz3PWWQZ9XbBG4+JbxxNYBNpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752476761; c=relaxed/simple;
	bh=PFTTtrIpuORXhRZKjU0iNiB9gnyYxhRcUMgU9JImO2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqHkhDe4IPvVwmm/KjpzPpck0br+wJWr8i09Ar01FsOp35zf4f6GArDGxkJ/oUJfugEBGCdaO8VYCt/boV+cDut7rCG2U679J0D6rm8+7EvdnRC6YgRzeDvZgKrDHrga5BvoQSOU73vgt1naGjtzWqoeoACiEB/v2eZbxV87rvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZKiXWlEQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y6vj
	uqwLKZFVmEIDVFmGXIKmsoIIDuTPzS4oauv70vQ=; b=ZKiXWlEQbbQqnkwUbmny
	zIcf0bpoR2rLWfONoJN5VuZ4tPWVC3KOSGDay2o9jfSHxBBKcbalMLjZWwyK/he/
	OPVYpZc+mymelO0v7pEG1BuIWx/bOElqIm0vcLG8alpG+9QUYZVszHnXYq4EKpYR
	+O5SVH2OfuHgeARQrQ5/oTHkdlgMPl6ix/K2jpXc9kZ8B2X+FVrVhq74zHyeEzfy
	fAD6vuR+C4yKLR1FQufG+nSJssxozLpv5zZv09o/d2AU7YtI8qaGPMXURslYAtHd
	jWWmw4uC0ZS0lHK7aMoiXP9i1yd1vIsrclntHedCL3oWKUxMekFvX00EdH5EojJJ
	Zw==
Received: (qmail 2359571 invoked from network); 14 Jul 2025 09:05:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 09:05:48 +0200
X-UD-Smtp-Session: l3s3148p1@V9gISt45xK0gAwDPXxNjAMIr4MhSGEU6
Date: Mon, 14 Jul 2025 09:05:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc6
Message-ID: <aHSsSwLcSzJr5knE@shikoro>
References: <7zjrabdfofykjclb7pv7agfua4mvwepahc2hicis34frpr3ap2@kkbsms4a5c5z>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OJCbTkJFWr/BG4iA"
Content-Disposition: inline
In-Reply-To: <7zjrabdfofykjclb7pv7agfua4mvwepahc2hicis34frpr3ap2@kkbsms4a5c5z>


--OJCbTkJFWr/BG4iA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Here is this week's pull request. One more fix from Akhil arrived

Thanks, pulled. I sadly didn't have time this weekend, so it will all
go to rc7. I am sorry about that!

> a bit too late, so I left it out for now.

Sure, please send an incremental pull request based on this one and not
a rebased branch.

All the best,

   Wolfram


--OJCbTkJFWr/BG4iA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh0rEcACgkQFA3kzBSg
KbbumQ//X8HmWk3qIOHRN94WdMBvpV1KAYb1PWPlSSPe5UoqW4tOC1kC51vUQNbD
CBtkWypyx645uN0QM4Wnv5/W8yYMM0GzvwS123g5V6+4ziwYsg1oSYPDjKxzFvA+
6xuJC8oIosFZI+0Z8AXjLxje9VKJ3rPR2SpTMortrsOMbNckh7G6YoAY5IW4vCr9
GsBivnjjq+Aa4Z05C9ocFDPImGOrm4ti3lFXqxI+xtVlfDyc6gJ8UqMQwnS13jkE
42Plga+93i4xjAjonqHkB8tX9y3Kp6tzv37TOoCsT8Td7bQlQBG8e7sIs72ES57p
5Yqmv2hvZ2ZHyKIpUPv4XYbR20t4UdGvYs+e5cAphGejudb0o5nN/U3bYKWhwaBU
UiKw9CWoYU5TWu6o5hdq/BmHdUuVmkjw9nRRUFHYWHHzQzBErWaMHlmtl4IJaEQk
WZU0RLkcbh7mQN6x9Wdpl5ReOczkscEGk7/25rfd8gdCyyHjpfBeCxj7kD1r2HF2
Xdxnto53gntHN9yDFZt0T2WtQCKOOh8Q6KtfSfJobBqfCOzNstRIghvFLL2ahwHX
YVwORCEI/0mYVZ86Hx9JKpfWz+uj0P0DwF17kn6XsmPZM9wu99gqv7u2fCiNSqDA
qGQKYNU2uf69kiGC9P+V9X2dLjxrqlvS/oZHsHRIbommcMzKYBQ=
=bNbC
-----END PGP SIGNATURE-----

--OJCbTkJFWr/BG4iA--

