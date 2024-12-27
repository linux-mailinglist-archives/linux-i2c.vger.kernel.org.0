Return-Path: <linux-i2c+bounces-8751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A699FD3D8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5D61883EB4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895021F131A;
	Fri, 27 Dec 2024 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ErmWf4uh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C0D155741
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735298980; cv=none; b=GVUIkNRXxQ06m3J6wU08uzMivJcffNRSQdXY5jenAXXdLyfH5YaR924eNZoTHu6AdCEudlHGzHRqmWo6XDP4Wz6sM7BcQaj9ffe1AfRi1EPhYEJf1SX9kZdSMBAhRXVB4duzBMQskfAeIGq8q5xTOPLcO9fWVnt1UrdBmHyoZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735298980; c=relaxed/simple;
	bh=ksx7Ot8vtDZrQXeuw7Z0LdEfo6iBn2KNmcgRbd+8hqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQ7uVE4gRHoLJ7JIybNyxWA0humMevnLdH4T1FnW7xeigSUV1VLS9J61EjCVgEuwmRMmas8w+KJinM//tExSfMNhxogEh1DScwP0YNxy4BjTnQvwvssUQF+QOoQegHT6IYJVbjDWmE7xqMUcWZzoNewsFh5Upr9LxphJKYQ0AdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ErmWf4uh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dPk6
	PxFYDEyK9WNAi+OubY2Mj8yTkE3oWGL8T9R8A1M=; b=ErmWf4uhHN6Ilz1aOw1w
	Pry0Li1zpmcj/iqLMZpcAVexP0X53w1an7aW8Go3hw1hZ7W7BqvSCz3pGhRYHkAw
	0dn9yY4vk1TzbvHzjcwyEtFeyuqbPv5CcM/p/WAALcTrlw1syMt9Qc5xaD6VuIRI
	izB7msOtSsRuKPzgxmiAMO1D8CPQTuNrSeDXYGLhL41/zw5/9U92xOTRoNcGutp0
	4K47PUOdm9baZG6W5wBvRpx4deSHCxacU99npZyolu41imrg6WVmx7Gu9J/NhTky
	err7RGnXER0VLCa0gkc+qfVYuBd1ooKD1A0sid714bvas/5V9EekiFPmw3jcJ1Rd
	OA==
Received: (qmail 3129943 invoked from network); 27 Dec 2024 12:29:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2024 12:29:36 +0100
X-UD-Smtp-Session: l3s3148p1@JWEOxz4qoM8gAQnoAGJMABv1nVc14PuX
Date: Fri, 27 Dec 2024 12:29:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.13-rc4
Message-ID: <Z26PoKKl8xh6K46v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <hwrubrr7qaqak2azgrpnixrchhiu5yvzev4eccts7up5ozq3ml@qsagtzlhrc4x>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lHbQ6AFwrD951pnp"
Content-Disposition: inline
In-Reply-To: <hwrubrr7qaqak2azgrpnixrchhiu5yvzev4eccts7up5ozq3ml@qsagtzlhrc4x>


--lHbQ6AFwrD951pnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> With that said, I wish you a wonderful holiday season and a
> Merry Christmas to the entire I2C community.

Thank you. I was already in Christmas mode, so I missed this pull
request. Could you kindly add it to the next one? I am back now and am
ready to send the next request for rc5.

All the best to you!

   Wolfram


--lHbQ6AFwrD951pnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmduj6AACgkQFA3kzBSg
KbYzvg/+Liu6t2OLpx8ecTByn+5bScM6mRuXwdIg8ijnrySRtw6D8UGSidTj0/Jp
oBOhK+lj5/TiVhTrRbsDtjcNmrA0MB7ddsaqLRGnolwokX8s+fUNKgLpoUHjCVMk
eJjbGgWoY9lJWKILAQb9sDBIhwP34gL3DOw2xvGFKnpHONE3eXpBTRQEJS3rnhwG
dEB6bf3e2m/93kFRugVgTO9Xc5rqcZdvrjbCJzfWcd9hkK6Rx0sGbzOM/7XrLD3m
QavEUrdMMZ/HOVfkxIP+eYiVMjjhVVNtod5vVy3tkWGzJenwRrkiFk+g+9A6+ppv
BVwRpeAXSEuRk41clkfnoB5QyE7FVadBvpVQu9a59Xa7tQ+pZju11WNb99qT+RhC
+veVJ1/AJ5NKTiP7Be4j2LyfSQRUaenXY+a0/LDKiEpReVHyAQ5BjigKMa3Wg+Tg
NtR71+OWP8iVXMVnA2h9qsJvX4bIItH0DqqELhbAplRNrD3vUrVUhQe6n9t2OY9i
OjInaiS1aArbB+CcqUGqDPcGZjrOhhR8DBd/M9JAgi/VO1QXGnBeznTxZko68TWG
eC8wwDcaLLfXA8oW0eeKouDCezansWFGx+PSMTV1NyysvEW82I6om74k/sNAiHrD
H09dxkSZygugknxitgmTHE08+ypPvKunI9UJxX/WF2ZErRBQHbM=
=CwI2
-----END PGP SIGNATURE-----

--lHbQ6AFwrD951pnp--

