Return-Path: <linux-i2c+bounces-4049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A471B909F7D
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 21:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FD62B22807
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 19:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADB04AEC3;
	Sun, 16 Jun 2024 19:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tqxi+ACd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499E1C6A0
	for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718565289; cv=none; b=F2Wd6p1yiDpHBUwE0RUSbqzPTQT/ejTIMijOnc8JNFYbWnXs2JZbEJGp9ByR/MGHcomM6iO943FnDbp+S9pUS12vTPhojJI+erIeWM3Z+XUpup7/CtQC1aBxbEWeEec6HQ/dP5CnAjZoqgBwF+dK0qCwLZlzxL45OGLfKJghl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718565289; c=relaxed/simple;
	bh=V0RL8eC+fHJJXnwr36ZznnspIogMAQ2bi0BDVYM8uAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUwnL0MbD9fvLvoOFLYNqlZNSIEYm+WAKwItUTX2lib6tepL8l/e3BWEd1LNM8VpHGERtCx08NisKz32kwKr1RY7FSnQds93PbFbxJj7iLC9NDTjAXFD/rJzi2T8Um5VI7KtnE+V/yyNrgWRPtUmj3iacz+kDeaQS1iY2rkSXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tqxi+ACd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E3c+
	rE9O/gHyw3I/AZQMe5HK1HGXZDCGy8v16XB4IEQ=; b=Tqxi+ACdFFAUVfAFuOQf
	D+ub9dbKuL4GK6dG+wFlo4twbp6Ty6Q/wdA/jZAmohsfDGMuWh6nRmn9DbbrIvvf
	TCegAOKWyDb3V4FGY/qEX3CGbC3X7TteWJEH3ZB/UAdsIBmttZxAxNRwzqc8plmG
	a2bGUXYIQ4dllTQQc1IrW6H9S/kHFC5wuO1Qac0x8nILKJnV6WJcU+T3VtYVWwzh
	LeO1d6gQTEWdYeDImdJrbhsjNolCq65JA3Zq3zW1boJHrZscLz/2rLTYAxilTSb5
	pzSWCXTeXIwg/JlYWApo4LG1TDDHQcrKJCIHGd7oekK91NbtPPIa19rpTSNa8KjH
	KQ==
Received: (qmail 2103200 invoked from network); 16 Jun 2024 21:14:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jun 2024 21:14:41 +0200
X-UD-Smtp-Session: l3s3148p1@0MMYqQYbdsJehh9j
Date: Sun, 16 Jun 2024 21:14:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqgjfqkwqmmuhuwd"
Content-Disposition: inline
In-Reply-To: <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>


--nqgjfqkwqmmuhuwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> I am not a big fan of the use of the word client. It's not used
> anywhere in the documentation and it's too generic as a name for
> giving it a specific meaning.
>=20
> I've seen already some confusion amongst reviewers and
> maintainers when Easwar sent the patch in drm.
>=20
> If it depends on me, I would stick to the only controller/target
> and render obsolet the use of the word "client" in the i2c
> context.

Have you read the paragraph "Synonyms" from patch 6? I don't think we
can obsolete client because:

$ git grep 'struct i2c_client \*client' | wc -l
6100

All the best,

   Wolfram


--nqgjfqkwqmmuhuwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZvOZwACgkQFA3kzBSg
KbbP/Q/8CBzfCJomMlj1tACYIrqZi7OIqg7HiRw0UD2icgPT56QxIFoItHRzaGao
zxcIxNN+awz1N54FRAumgZ0N73rBK4lNarM7GeLgSQ2rZ3SkeqaUpV+QpqIClcvT
s8TZ7t3GU+V/zYTNJxz0Rrp9exdSR7yMquw/yLcD9QAnOxuq6nCTcyIKqVUkjl1p
AQGkNd13qPaa0na0GD63WzFXJcIcnHeFmpUV0ZoYtsCH1EEgVjcRRXm6s7b2afIy
83XonLvSNJKtgNXUJ1agXbYyNfx7O5Q+xEYJf9g2rvQCxfs31yRVvOYgpuwg5P52
AMdzzwvqgHCLxlUOC55KiFsjSsE+tV+pyO3wDLsRrmxZPROShtjD4mQ4oAeFutpK
YbiGWKpyZNBg7WXPVndn99YT2tSwnsA/1rYDKAJ7pPyh9Ol6bG5AzszdpFqnOJe+
2+D66v9jIq5ujhIYqsLVE6CKS2068OnIpJ8LNpIxbAy99DgGk97+FIlpJ47A/Gdg
mbYv8NEBADWv7jxfMpka/kVC+ibdDqbZtg75qzDW4SUCWJfPd+Q7WSxsp8zPotEe
ypz2gZnEkdL9q5u8ncRUuSOa3jNwQ2oU5k1WOqBCaLeb8cE3yLHi0/Q1djolmXLi
hd6AcAZRw5EyuLK4+YIUTKwclh+tAyytsbqMEPmTmtKpo7H4il0=
=YWfB
-----END PGP SIGNATURE-----

--nqgjfqkwqmmuhuwd--

