Return-Path: <linux-i2c+bounces-4016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E1907CFD
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 21:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0361F23F63
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 19:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9435E7D3E8;
	Thu, 13 Jun 2024 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JBKk/n8k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA371757E0
	for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2024 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308552; cv=none; b=HETviKYuaUINyEVBJMVcrWHzJyfqx+Ln7G7pMzW1dG4n4f9AzX+l0dAgN6CgC5jBqRFE/4MnCdOyqobx+WVHxC19oe/Hk0+csfIu3zOpTQV9Gk7Ltwi8jsuKO4GdGPUHHI4yednVqeQTXZt99wpj6vlHK2RFpDJolhXVAOpP7Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308552; c=relaxed/simple;
	bh=w4UUvhxuIZN7XzLEYUmcj8CjOdcJzT8ROLuZGNCEQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpOeS5CpQmIqCc2wyW7pTUUZM24TF4DgeI6mx0lT3D+BHhtn0Z7QhIC1wvfo4jAyoKnrVmIFnGs3cog3ZWbf6pknESvEgTewHibsEM5fq9664vpQVXkgN5jh0PyDVoZeiYMOAVHTwZgKs/wBINIUjRhROCaadyEeNlaz3GrrkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JBKk/n8k; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=w4UU
	vhxuIZN7XzLEYUmcj8CjOdcJzT8ROLuZGNCEQXY=; b=JBKk/n8ki5F430MRvZif
	8WjKb5AO4vPTGFEmQEd6NBqwCyA7h2CbHpjnJ/oKhHA4GnmhHwi6j/h/4utlS4gl
	BTk0/39YMEGFzpfOZikiBVlZrW9vRyD0znMGgi6CvczZc0weX14Qc1MdSq9ZNjtv
	ZvQcNHNTOwedQ31YllyQxUYoJ8bhUb3PJxG8QCtTa6g9qw/IeV30aC0dr77kuK/M
	BKcODr475nLLVrRISgI0C8jkt4GH6e0GHpTLDHA3cCJYDSdCG/Wnw/by15d/BHkl
	JqjXI54mud1AU9rDl17ToP1CdBqqMx3OHMzQTuz3lTWrYHMtRjSuxP4Tfk7YgQZR
	eA==
Received: (qmail 1285977 invoked from network); 13 Jun 2024 21:55:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2024 21:55:48 +0200
X-UD-Smtp-Session: l3s3148p1@Z26h4soalpNehh9j
Date: Thu, 13 Jun 2024 21:55:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <tldnefwvpkjd55xln2j3g26cgt243vruilz4e4susdqbbpfj4z@rd3nmpb6zk6w>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ygpdmoxg77rq2vu"
Content-Disposition: inline
In-Reply-To: <20240610081023.8118-6-wsa+renesas@sang-engineering.com>


--3ygpdmoxg77rq2vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for

Heh, for four years, nobody (including me) noticed that there is no
'drivers/media/gpio' directory...


--3ygpdmoxg77rq2vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZrTsMACgkQFA3kzBSg
KbYBpQ/+LQfftPgGlBz6A++zGEfeluX0vcG/Z0HHAa/zFgO+6z2sIcg0AkhRnskp
/5wZpc7lTkuLQtsqmh9mh0a0NyVMmrwtsrP/GAHCc8XfMxX3JORcFWddt6leIHAB
BzeX1TucgqSx7/60pn/OblvEgWS5Q1E+eaZNeRhQvOCdnQPT6M52tPWIYIMqBD1C
qL9t6hqmNzILwr2snEiPHHrYuEz8NYKO87GyilBMD7mDpZNnJFMpoCNcLEcDjbcl
FNtFn9i6ShgVctGa6xhDloIWJKUxuM9qIN5VI8I/hAYljAo40lfKv0Pt137DB69C
R2yKOx3tTEr/cLOk+4c9X45b7iI7grc+9w2HmsEjE6nEYuM5EUg4wXKVu9rzexS0
2pSxHbGqTI3ZZ6kOhWSe9TgIapZkhF1Qd1MRiNqG/J4+AlvoaTi2ipWuOuvUV5RI
foO42y0dCwSKptpmKSdm7up+Y8Whvfm8EWgIDJzjF4aQCVqd/McWwfYRhpcXRLW9
uNVPHMXc/0bgXyiR7rme+ixkHURPfl9FED0AOowvHkPMohj8HGO2vsdTwt7LxxUY
6yYcUWEmI2ND3h6T8IT0X9wuRxwnX96GEaBqdtT9piuIXUSbq0zev7C3lluxn4zd
f0QG9ktGdQ3X8r5c12rWSyTHjx2A2UODo52G7wJF9j7aedDmJzU=
=pAga
-----END PGP SIGNATURE-----

--3ygpdmoxg77rq2vu--

