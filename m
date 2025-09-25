Return-Path: <linux-i2c+bounces-13154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52679B9EC89
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083542A8070
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 10:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6892ECE94;
	Thu, 25 Sep 2025 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YqW5NQ29"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977C2DEA80
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 10:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796965; cv=none; b=UmqIa5cyigDoI/5bBFngMK9+TDeWzYXjrmY06btangxkUcxl0g9vVFFDGXjhQC4B/qqzQnE/lLhttvNJ6AWsNgDX/zRyWFSSqpaHiB1SCwo1Zj2qRjgipoff00MCO2P1U55RkWa0+shM1fOhTy3jWv/v7iqXM0WswLq0ZLJzS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796965; c=relaxed/simple;
	bh=QYW7vTqIqppaMyRdgMCxa2TDAFX3GCBWjvrJDX3nuqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjIjhUlGnXQPap0wSiyZfUt7J0gHm2Q7MWR/nFt5JXHG2sA8qBxAEvRIYBMuuv07yldLf8GUIo3a7eTmwrolUg6nMoMJGY6v0x2qc1smI8LHRYYpkBpJDc69ZdD9fu92DMvI7Gg6NhvTEAfD1d3RxvMA1pd8RwMwHqvkDWKs5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YqW5NQ29; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ql2y
	PjhJ6bXgAfOQFX8GpFf8TtThVA82JWh9xH1b+2U=; b=YqW5NQ29xvlF935gBh4l
	azrcrjFdoVftUoAi+ymECgBOL6xt/IWq3pLYvgC47eGvb9jRfGntXNniDDbd69zU
	ZIphPuapWOuHx44h7YxZTcsqsc49MxukEzdE6hSTkUW4kWk3mhU9dw087XaVTzjd
	IZNmDbTu5wDqh1pRk8UTxqMFZdJlTLWaxTFVTTP0kfRRPL8qx4EK7n7ID2RQxof1
	egxSqujF+023K9YwD4pyd0SZL1wbK0yK7I3sdmEmAJRVnOYfKecniiY4Q83vTJrO
	Tz0YHzV6NQRmY3osDEZCzx1QvzMpIdjZ8ZG3ZKEV48GPjvwZ7lPQXdnSDYd/11Qi
	4A==
Received: (qmail 1832509 invoked from network); 25 Sep 2025 12:42:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 12:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@/ZcE1J0/jpkgAwDPXwQHAL/S9V79e5yL
Date: Thu, 25 Sep 2025 12:42:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c : i2c-algo-pcf : fixed errors and warnings in header
 file
Message-ID: <aNUcn7TxcnwG0OLw@shikoro>
References: <20250907090344.30917-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sd2Zz6K7Ww5k2nRa"
Content-Disposition: inline
In-Reply-To: <20250907090344.30917-1-chiru.cezar.89@gmail.com>


--Sd2Zz6K7Ww5k2nRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 07, 2025 at 12:03:44PM +0300, Cezar Chiru wrote:
> Fixed code indent should use tabs error, missing '*' from
> multiple line block comment warning, space prohibited after
> paranthesis error and no space before tabs warning.
> My motivation was to fix all errors and warnings in
> drivers/i2c/algos/i2c-algo-pcf.h file.
>=20
> Testing:
>     * built kernel with my changes and I2C_ALGOPCF=3Dm enabled
>     and it built successfully.
>     * installed kernel and external modules generated by build
>     * rebooted and loaded using modprobe i2c-algo-pcf kernel module
>     with param i2c_debug=3D3 and no message was found related to
>     module in dmesg. But also no error was generated.

Because these are only whitespace changes, the object file (.o) should
not have change after your change. You can check for that.

> -#define I2C_PCF_REPSTART (              I2C_PCF_ESO | I2C_PCF_STA | I2C_=
PCF_ACK)
> +#define I2C_PCF_REPSTART	       (I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)

checkpatch is wrong here, this is less readable than before.


--Sd2Zz6K7Ww5k2nRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVHJ8ACgkQFA3kzBSg
KbY5lQ//TEruHsz+VgoGAvD5+cKLIxq6evPc/WB0jGpPtBwxmpim07PPnBFVgxzL
WerTzHglDYzEoMa9TIUpbgxE4zzZr4M80EGnb28rhRfUNzkXxfSMgL0WjYaVZdP7
5Scif/quTIDS5Lk3gN5pH6RLvX73efC4aBtImKm8Odv14dR0LnjkNEv3pdSrdqwD
WupwDC5rcUMApDpR1Moecqu4QhS0QH9AxCfIeQJcdC5H4191Uqohudb5o62zVFsd
S1mNQknkxuPv4RYzO1q2yvgI75wHbhB7zWlq51W5GAADb4xk0gpEboXqNjtn3GV2
24p8ryF6KXGyj4BjquBXspncV98J/bTyg8InZqd0gcjGt3Upqw7ZSqyB0HBZxhgU
CYaLhF0803v/e3RvkaUh9IbvueLdX5iGv2KVsdWBF+OuclKyRnM44pyt3cfobE6a
eygUtpMtVSStk+imHHt6l16/i0qkc220i4nqv2AKq3g402eLbF7mVDREhskrmhGM
6Jmp4JwI1OB05yPUhe8ct5aoY9hHvJbPhqpWUQNWI42OxOk7YbReUx7H+5rkxorc
EbS3HEKrWJa92iW7g+QUHvGSp0crWu9foCCnI2AXkS/ctNaCCnAr70YQW2WzCq4P
1AUkX4lD7dh5Bfo14QafcllyCR1/d4RKgAv7dhipkrQKK//4CRg=
=/ts9
-----END PGP SIGNATURE-----

--Sd2Zz6K7Ww5k2nRa--

