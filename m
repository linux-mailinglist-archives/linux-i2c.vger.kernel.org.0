Return-Path: <linux-i2c+bounces-11576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB40AE7D72
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 11:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7D716545F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 09:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA72C08C1;
	Wed, 25 Jun 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hRibJiBQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571642D3215
	for <linux-i2c@vger.kernel.org>; Wed, 25 Jun 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843578; cv=none; b=VLyYlR2IIoj5cIKhW5EF5gjOIb+wB99f3CdxoGnYhZtPpBh2DlkgR4ouGVdtkCfFOVpTAo8NJN3b37ZroY5EDQFfy1Ak+8ZnW/1HMbiokW5NOa8UnPXOBka0zjtz3ley2URG6KdwgetAZsQyfRZPTsDPH7KmDUfzqrcrYGIQHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843578; c=relaxed/simple;
	bh=i5r60Tsu8spq+T7mS1rYkF5bymhbpl4o6cazscGpgX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irr9My0eb5hbZF/w1RMnklGVQBwxEzwJZfaoXNlCuT4FbZwYm87U8UDnOPPG2NDp0hZLvRCuW+fSpPjXlqt4B5x/79EVs3W2GJ1+nmlcmsc4aOvAmoiCt7B7V62hA7c3nHJwMCs04A6PnZC8fX7WriXUq5ka6jXP2r7Erb/VeTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hRibJiBQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l1Pg
	OZheUsI8ZgLgWtfmvgHNHnT9bsH9ajc2wwvcsMw=; b=hRibJiBQybeTM2v5XK0W
	UYZ9wJcabp75bbZJz/bMN3Ed3oqI5dZERxrovMrgN5DcTPD82nsfgmpa0FMgYTyQ
	v19+GPcv35o8CqI3tPbAJ5/X7Px6pntHECMBoIV4/KdcMa8B+xSQS77MgFYQy6EO
	81t3HIf35IaYF8erAdQLzGxM4V0Smq2rtKgB0BuzOPwK6MygtXa6wtf/onqop6F7
	2ZEdhmRW5kJp4tc5HaJ24aj7Q3WvKhnP4713++izPVv0PTzF6R69QkvsxVdDypM/
	SC+t+AawO8uy0NgO+4gvgolKJyOZd5NjNjtIDn17welo08c6OtvJlyo6eZedVMIb
	RQ==
Received: (qmail 590769 invoked from network); 25 Jun 2025 11:25:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 11:25:53 +0200
X-UD-Smtp-Session: l3s3148p1@2lP+B2I4oJhtKDAs
Date: Wed, 25 Jun 2025 11:25:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
Message-ID: <aFvAlSQICukBzt7K@shikoro>
References: <aFgDHBHwY5ElWILx@shikoro>
 <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JMbvFv9CHOhDS+6+"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>


--JMbvFv9CHOhDS+6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

> If you do conversions after the merge window, make them DAMN OBVIOUS.
> Make them minimal, make them automated, and DO NOT DO OTHER RANDOM
> CRAP AROUND THEM.

Okay, I don't want to do annoying things, so let me rephrase what I got
out of this. I should have 2 cleanup patches, one for the callback
changes and one for the whitespace changes?

Because I think the whitespace patch is needed. This is still the
beginning of a larger refactoring and having struct members initialized
according to coding style will greatly simplify next steps. And this
paragraph should then be the commit message of the whitespace patch.

I assumed that it was obvious that everything in this pull request was
automated. I honestly really don't enjoy pushing whitespaces around
manually.

   Wolfram

--JMbvFv9CHOhDS+6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbwJUACgkQFA3kzBSg
KbaoBhAAh88bS4Eu1XiE9ReKbEZYWw6wqEKTeq9gbsPvzdXWnQ5Z1VwspnaFqHUl
UwlPAEW/OF4jAPqNBdfnd2PJBbS/A1lFWUPkSV2WlXT3PKGMULNCvdPL0BoVulbF
N4giPCtygW0fImzmHj/S8th1VcZdtxd6IarVuzED3gYzPVTPfIeZFHg6GqDbeU9a
P+FhzkGRNbkZs/k863PWLjzjN/cvh1Z9DOY3otEIbEzjk2FZ0Tux6RiEO0ASKkfj
iN3IcOibkyVdMQAu7Hl9FEYCwQg8VJwdhkVl/MzQ/T9FVHl7AmfVr9qlcjh6uPPU
25M4SxxmjU3i8IpE7mcYKF8y72JBr9E2HzMwDYkcmr/Y3yrUloo4WviYklecqWIw
k39MSmE87d8DBg3Owwrd+ex9w/1zAMYYmYFB85izzQp5Yl2Cp6a2WYgwqXXY79gR
vZIDeaRCbJm7baxxR2dxQtB/3AmhjcPlai9ARqW/cA4D7LoONU521oFFLWD7YWBR
wMLCa2QBnmtg6XPQ/28OHT+dkaKAO5AL2mJFnz1InWK6fI6uHzXw5AFAp5xD+p/9
XqY85k8fXr2urNzZ/R57p09Ff8Oc/0JtPBNCdMtyOjUqP8V0Gkr99cRfIPZXnjcm
uz9GKiDXNmu5yyrEauDIZ/dLBPRJNpqSn6TFLeZ2OjccKsGQLTY=
=B/56
-----END PGP SIGNATURE-----

--JMbvFv9CHOhDS+6+--

