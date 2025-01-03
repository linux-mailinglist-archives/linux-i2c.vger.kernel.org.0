Return-Path: <linux-i2c+bounces-8907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7086A01106
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B663A441D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985811BBBFD;
	Fri,  3 Jan 2025 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Co0Tq2UH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C011CA0
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735946935; cv=none; b=RyBMtCBEhE/wjhZIbdQxRSUEoMAQsKCM+2QkeDKZZgYsfu5Y/S9oC8Ak8ggYUCUCEbZqyG4xUfERnVdaqP9Db2vXpKdj6z72eSSlK9pU500slblX5Tk0MHP38x+g7TDfBkZYRycgE1f+o37e5Vcx4Dit6GNfqOObs7sJq95HGIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735946935; c=relaxed/simple;
	bh=/EfLnZXfgP+zvIT5ke/IO9swc2fyK2hqZXkHjgy+V3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbVxkw5KAQu7HRsDIFGjqUeg7rtjLDs0eqAAjMNPZdE6A3x1yP6lw5ik2YXIUPoK/uECjGaNTJ+cJFDCxqtepJUzTjT7P/Y7hqepOws+b63kmtARgrrVKSDwTnyrZ1YCFqlVChcWOVnbD4tihpL81xCX8b6cilCyniJNxriNDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Co0Tq2UH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/EfL
	nZXfgP+zvIT5ke/IO9swc2fyK2hqZXkHjgy+V3o=; b=Co0Tq2UHw8GEBekXFVWr
	pyhGnkwcaf5FYAQaAk8cwcRWX9ksoEUWYxVguX/pR+9PA449KZbgwRe9ODV5fO4J
	h8YFk34BqbG291N9vGE0M5LsG2pAyMYDW8OKCwzXueD+O0GErBG9ey3boATlMfKs
	XYDqTLsNqJEIvA8cT0oFeuvxfuViurzZ3scEl77o3b7dC07i9pRK8Izm8o8J4D8H
	mTLH+nLs5+Q71TGAXfmDOmahX+60XUTMBZHflvVXb420ddi3dVKQlJN5sZA3caqw
	AhTb4QuR9f79scDQmMjZRXy7afzWgolF37m8Uoz4XryHcXC3gDfPH+iy3zph5jPb
	+A==
Received: (qmail 1023943 invoked from network); 4 Jan 2025 00:28:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jan 2025 00:28:48 +0100
X-UD-Smtp-Session: l3s3148p1@eDv9o9Uqxt0ujntM
Date: Sat, 4 Jan 2025 00:28:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <Z3hyr3ZVf4rBuV-N@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M7sTayJ2CinOjIV/"
Content-Disposition: inline
In-Reply-To: <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>


--M7sTayJ2CinOjIV/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Now, you're treating it as a fix, which is perfectly fine. For
> me, it's a 50-50 case.

For me, this is a clear no-fix case as long as nobody really reported
problems (which I am not aware of). Also, looking at the Kconfig text,
it looks unlikely to me that this controller has been used with big
endian systems. Or?


--M7sTayJ2CinOjIV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd4cqsACgkQFA3kzBSg
KbaDsBAApqSN5lNVXs8L/KrrY7MmUwApo+yrm8Rqwl1Gjc8spGXwlOBFcn3/Fyz+
mELPZrDhEr2M0d7xGlm9ldKP3oE1JsEe0IQmmHTKxxdf0pAVEoFM+hjwd6TmHYxo
Dx/LKe4oUZGvEaLh1zOF+YeMv0bKx4mk/TSwWvrqm98kUxZLR6IL9/UqSuEhjPtp
rKGw7GljOstgooQp5EtkM7o7Jvb8CYa2/RMpDdg2IJX5ku/eAgqtPhHeUzmztLlE
h4pTLwUah60+ZtjxwmbTPx/JJu+zcFRYln39q4KYNX1DJmQfYLVgcuanAp5qlgLf
4+PwWDdDXk4vPqVpEp037b0LP3BfDRoOrfa4EivrEVw70r06PWkk5fe+LC3l4J6+
1Q8YWjiZPLLJvkHCxEEpl8F9hXF/aLtVHPKOsUXTFJC/6g1JNbcUEr0zMFwuxrRF
TYp3uOxFNj4r9zVqOTB28Pj7zkq8tG/qaaYIU6Z4EqxnzJNUVksLcW2rIwsE4V6s
wVBa/wB6yHCcpxyMRl9QLs4BFmmt8O8AuZQuIOsXJXtD/HKFGUQu/adBLFjoTwBe
QonlMUC3Y7tYhASpVchvqy5BxcWn45Hagr/23xS0lBSSX/7EeWiPvdR6vh6dwco3
VeKdvptWOee+7gckPJGcvm1cg35vWc5o0dQrDfHHb/CeKcIT2cs=
=Qn9d
-----END PGP SIGNATURE-----

--M7sTayJ2CinOjIV/--

