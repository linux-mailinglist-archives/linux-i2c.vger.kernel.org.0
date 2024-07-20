Return-Path: <linux-i2c+bounces-5040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6C9380EC
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DDD3B20F5D
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 11:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6678526A;
	Sat, 20 Jul 2024 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jexY+Z/W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E7B64A
	for <linux-i2c@vger.kernel.org>; Sat, 20 Jul 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721474126; cv=none; b=gg9w8SXckgI0STfLLz2woWzIHeIbg0zAixCfSpcO8JdJt/mk6UuVxj69c/ai5FMwgweGydg5UUY+rcAjT3CbR8LPCPJCS7CX0HGy8SF8rxZY2UyDsNn9f4/9h3+EVjUC/QV1qpEqKObJ//RLIWPhaK3T6g0gSeK8oG/TwfKWV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721474126; c=relaxed/simple;
	bh=WyW+xAKxuVqkwcnc3wAUlfzEAWrnU158/uhu9ra5Bj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JShl/RIv9MRzg0yM8PTq9IoZW964whL3eEPLPHxGepa0I7IGMjYFQjcEBsDV17MJA0Z90z5RhR7HsQgoKfJMvzLfbKzDrVt65Ry5fyYLMEcVDJX7YlTnahGXOwHe+Geh6v7RwgGrdq34FHqhvMQYJaqlVoxo1Vm/JGTbsZ1ziNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jexY+Z/W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=y67Q
	EyrQW3XCuGhgRMfKFmkudt3RugwpMwb3qaIuVtM=; b=jexY+Z/W8zWbegeUo5GG
	YKjDr2YSPnRQ2EnuY00v3NiL9CLmLz1+nqq3gn8zBTrgcuClkm+eH02UgHsSvZOX
	AtEZ6Yce/lhS6Dhb4iM5gJbw2E/2l8etLZZGB4xVHeDzLLRxaLas9dTrqSLyVz+2
	b53qJFsVtFKKv/ELEUdsQYmI/r7sSzD7yolZbk1rt11imFwaatiAjVIuOztCvRM/
	75Kpbtg++uWqUXCAexDsT9slFbyTwKluOwgAtLLx9xZTruX1TFWCK6rSw8yT0zRi
	WDUXqh/fgikqZ+YlK4AsMhaA0sZQI3Ifc/jfAmxrUQgy/3RLEui9bKSWrsEg9mkN
	7Q==
Received: (qmail 1449073 invoked from network); 20 Jul 2024 13:15:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2024 13:15:11 +0200
X-UD-Smtp-Session: l3s3148p1@IRDq7Ksd8roujnsv
Date: Sat, 20 Jul 2024 13:15:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11 - part 2
Message-ID: <ZpucPj5Nde_psOfg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="306urj4jFM8Djj7o"
Content-Disposition: inline
In-Reply-To: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>


--306urj4jFM8Djj7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The following changes since commit 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b=
74:
>=20
>   Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/dtor/input (2024-07-19 16:51:39 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.11-part-2
>=20
> for you to fetch changes up to 930e5186862b115953fb560be357f4e0bf496f94:
>=20
>   i2c: piix4: Register SPDs (2024-07-20 03:07:56 +0200)

Thanks, pulled!


--306urj4jFM8Djj7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmabnDoACgkQFA3kzBSg
KbbV3A//RnIt7QExqpEBQJ8croSHYkNnGcI7PUZZt0R+eAhPzvsm2YuAfiV0DgSu
Hy6GGo2gx2o1kEr40GNeBs7GSQKXIuCLKXa2Y1BF1lkftkWz650bK1HO0smPqhi4
LIedc4Oj3PKZWRZb9WwpFJQz4qvp4jHF65K9p/ATKQSvYRd8GWX1jfRZxoZ96mq3
dGVo3w6uXgMlem2MEnyZxEDW7raPu6e0h4BZ34H6eMaDQK6OLQShnOGlx2QjEMKT
1UtsrDaZkrtKoDs10r7a8sTAjnIDOlPJODTdIkUcShhW3jS084xXkAzrkV5QCQFD
WLlmC5kG6Y8PJMdzqIFI112mRpp+2cFg+GSFCVip8CW+QUOuVyrrG4Ud/qNVnyam
+HaEhHz9oBmdYP34ptGgSM6om+n//9FwPVfmH24txI4zKTu5eScg10BTbWlym/02
47b+rLN3dfbfwkyIJ2p6GEcjY2gy8SBlzF1lag0j7bxhS0lPyk4RdelLTw7l1oTI
hxT2zjU5dmbe69bMec4J8fTO++uEXobm9t2dVlDk6CtyNDAXIsl+ICznO26YJfa7
GUqQzClOt9CiAJK5GhtClekDDJDWOg8wlm0GZ0ZGMTXjQ3n53Bh776Rb/XoRhCeO
AHkbdBjZUrBysMwx7J/7aJJuE8wws4Xoi6x0oKNIRRJQ8sAat18=
=VdaL
-----END PGP SIGNATURE-----

--306urj4jFM8Djj7o--

