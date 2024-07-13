Return-Path: <linux-i2c+bounces-4973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D99304AE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 11:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D1A1C210D5
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 09:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B95C381D9;
	Sat, 13 Jul 2024 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h44VWUV2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3761CA84
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jul 2024 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720862179; cv=none; b=UhurO2JgZ7Pk36uddWowCuynZRm4IdYHY7aFfxlYn4m8Y1saQOutVU7sap/8dXgCkayAx/ooGO33JUFA6ImPMhFuOp/tvbxeKI7CfHkRdxjcXR36ouWj7LKRpQahCy8D1S6Up9ZupdMpiybtRjhQUvkVE/e3O14v2Y6RJLkKj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720862179; c=relaxed/simple;
	bh=f5XH7GE7UW+5NxurpuuNWVoWS5u4W0/2oFYnOLscQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLuF1DiFnMXFhjwO6aTu6a3Cjn5eKa+qHV14zKH0nrj0zBdGgZxjTT3igeqYpx03/6T+pzjWohMeu2SGWfynqOwHTk7wMEuZg5TfAqx2PSG23KKJIm4qo7WbvT1Ny/8fINOuYjO00uOfCd0BAPcDWWnxjwMxjpFrkRbFrZYC0jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h44VWUV2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XDRS
	/6cs5bdPFA+LrH3rGhIIHv1K5EwCRbp5pZE62JQ=; b=h44VWUV2WAzCzwXrhbzD
	ivZYzo8iT2MnQEX0o2S5L3XpK6G8hDcR4K67KruFhQBtN4p8x8ZR3V5fH5xGOqE6
	gXz1FpIPigJZ+bLUs/aY6xkTvSivXhCBuqjbcuY3ie2y/yE9oDhpEWUxth93/V7N
	EMBlGYMisdlP4GeowtRNk78SAqFb3lJvDE9XO58mn3Cq7ne1vDDkGDh6+GDtxn1f
	45m6PzgWeEKriaiNYX912u95Lf1DamwnmfffoWlyZJviBAtnUIGaghVHAKwVzmbP
	f0mSQCMObi2yQnwlO8SONWj7h6BEZ8jf4CTg8lYQ9x2iuigAucu9GxMkjDh+6m3s
	AQ==
Received: (qmail 1388966 invoked from network); 13 Jul 2024 11:16:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2024 11:16:15 +0200
X-UD-Smtp-Session: l3s3148p1@lzmtch0dFJhehhtW
Date: Sat, 13 Jul 2024 11:16:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11
Message-ID: <ZpJF39FFqnJfinQn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N6CllmnFtRXh3XUM"
Content-Disposition: inline
In-Reply-To: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>


--N6CllmnFtRXh3XUM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Not a massive pull request. The majority of changes relate to the
> naming convention updates. Other than that, the holiday period
> has given us some slack in the number of patches queued for this
> pull request.

Thanks, pulled!

> There is still one pending documentation fix required for an
> issue reported by Stephen that I haven't noticed. I need to add
> the documentation check to my workflow. If you don't have the
> bandwidth, I can take care of it.

I applied the fix on top to silence the warning now in linux-next.

> I also have a pending patch for a v2 pull request from Hans de
> Goede ("i2c: i801: Use a different adapter name for IDF
> adapters") that is waiting for precedence.

Can these patches be included, too? I think they are good to go.

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=410673

Or are there issues with them?

> I wish you a great rest of the weekend,

Thank you! Same to you (and everyone else!)

   Wolfram

--N6CllmnFtRXh3XUM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaSRd8ACgkQFA3kzBSg
KbZ8xRAAkyDxEofHH6jMPS9U4FRx3tFdoJhWVtt4PPfojd4BJbYDFgdmauLUBMiY
0oFVOTAEd8KRuXfPvUCfXyAaPDcUK1kQ3c3FQaradHt6OCkZ1gGM8Wnzt7Cn2huf
RP2wIgsc2Ya7wClecXRpnRj7m88pWc9Lw0zKrWdl154FMZSbMsndRD3QJLVXNFcp
LCAYetsxW+bOPgNus0pyaX9P4YYP25s42XhxRLDsHvC/t1AcT+pkwrbCpq7DF6rl
/ZLNcbaosFCeMb692cKCfgf8uHQcy0zUqbzl1CwQH6yoSO7MNh75j9OaLbfT9C5v
mMuTO4xnHdqlkC2/fof2ZH+37t0hcEFMIqkX7GyA73u3KxLO9U+lHrQ9YhVpZkwn
BMV5LO5InZcJ4dF1pZXhuNtT5dr1HWtYuqJ/MSVUGM2SyXtGZ9EAH2MjbA/9I9x1
crioa1m0nApWafjqUX9NLvx6z8A56oVjuAqXV3MhKOef7kS4fVNaQ5iJxNqLMmI7
4HO8IlPkgMEg9HRVU37MvS2o0WkZj3h6udYYpUw7+slGCc4gTbLD97gRdwpVJkn/
XValydLPzMKbdiG1k/mnHKJIfI1otKdey8hoOYkhsQelQrTnZvYK63ad7nDCqzhP
tjkWGmOIqeK+RymkGZyFpnOSqziXQPrnyyh2yvu8HWIZdu2kgfU=
=ySo1
-----END PGP SIGNATURE-----

--N6CllmnFtRXh3XUM--

