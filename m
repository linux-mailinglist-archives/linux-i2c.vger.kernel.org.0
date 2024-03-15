Return-Path: <linux-i2c+bounces-2365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFD87CB8E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131601F22795
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E54F18EAF;
	Fri, 15 Mar 2024 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2tRegHu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B618B14;
	Fri, 15 Mar 2024 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710499229; cv=none; b=tG5mZ17OV7/ReWZtwAKcXScrwksAR9nSIi6zAg9NC0iLI7EdFnmPcKdus1Cc47QleFB3XIRYwT2m1L/X6TuAkxFW2Trv1UcX87pCE6rvPaXuxGGI5Zg1NMorjwpHMt7SnqVT+XW0R7ImZhJ/9yAbI4z7JK4m6Kq1OcNqVTdH4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710499229; c=relaxed/simple;
	bh=k4abZ3gj2MM2yAAU6UY4yVMKK/pLuf/l7Nrl9jCTX4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0D4QHHLmpb11AGKv/0XwRSDEjrYOgVBoXOy5qlfz+FI0KeQOs8/9SE8BYcnT+0J1AZ2pLdwKkb5kuzYfpMjGnrufSpZJjLa3K2wW4JOGHlVNiMuHBu4PN6V3GFwLUmvV9xA+D4A4GiiAjhos0U3ZcCqYIJCga1BcjmADqE08KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2tRegHu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7C2C433F1;
	Fri, 15 Mar 2024 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710499228;
	bh=k4abZ3gj2MM2yAAU6UY4yVMKK/pLuf/l7Nrl9jCTX4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2tRegHu9vnYnl//zqIhm6uWtA7CY+pLO6K9mjX5jzGg82ixLKOtNEy64nANIGru1
	 EMuST6BwKfmvnohAJZ5qeBEcM8pIjtwfNYBTnclX4jhccRpFWudcNPimOcfsA7KzvO
	 fyCQYXtwq7tPuxN7DOj6BAI+JFRZpDa04TMqaJpwCq1V65WMus1b7a8cl2uQWp6ovv
	 yhwpqKXAyLNsPfwZHiJTmaUxfKJXjCIgM61a/BKgZu+2JilPKnnx3Qz32epXogxCSa
	 R/N4BIbsSgzcF/JFwvo/pbcVGzM197paYsiCF4PcCqYIIByZ0gbu3sTm/2YE1Ou1xi
	 uZRhOppOyhyPg==
Date: Fri, 15 Mar 2024 11:40:25 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [GIT PULL] i2c-host changes for v6.9 - part 2
Message-ID: <ZfQlmbAKzFf5dNyw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
References: <xhohtljc7lvguz6inuqgwwzw7b752q3noa3umiqebfraxedco7@3yw2ea2eibjo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28lVfv9tFe50XtpU"
Content-Disposition: inline
In-Reply-To: <xhohtljc7lvguz6inuqgwwzw7b752q3noa3umiqebfraxedco7@3yw2ea2eibjo>


--28lVfv9tFe50XtpU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Time for a new, last-minute pull request.

Thanks. I just sent out the first pull request. I'll wait until it is
upstream before pulling this one. Cheers!



--28lVfv9tFe50XtpU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX0JZkACgkQFA3kzBSg
KbanURAAozYhGT6EIGjfxnd/tK84BskqH6vKgAFAo8ieKveFUFTRi2p2EsZQd+UR
2nDA5LKptjpniHbmrZxdI6WMxJwVAdPx9qrB9Vw782WJns00OyqorcYD8cYsae+G
6H9rAQetC8uvHfl2D5x33ZzmJjr71BYTDzX7z2gPdn8b1iQ5FYXMxABuQMda5LVp
sQso/dMJjhbdEU0bpUl7+hREOEeSfRhb1U7TIQgXBI+TbgaPSzr2YqQ6J16yZYxM
0DuIRvkE+wiTIeDOaHwP8g39nl9C3iJlI8X2uP4XXuk2JCcptQwfkLTZrctuu5i/
rOohQoqyhnLKsyoDvxUZML33IQsT3MF230Lu82c1qoZSRdoj7TvmZm9CgZVxz9n3
LNJmWHto++1VBV6vXzQ7GjcADUmznZrugOH21t/IVmtNaz7dhetDo02K5llbm6ld
C/tJjJnP1OiUzrL9EsWSHvgL9DbkyIxMCpBKlmtaPbDY9F1EU59UeqWEkHm8ochU
LkeiVbM10jgpcSzTOydUYR1col1LuIkeTHDFt0qsunz+AdepO1y3ZDYQpkNlbdMh
EOzkShJdOtj7sF/qYCaRZfn7Zzamq1CQrWJ1EHJvk7S5DHMkBoaqjDgFvP1ufgGv
8btRrZdkDZ8iXiyR0X/pSYIJjLpc/jSe3ahvGuiMS0zZEs9beJ4=
=2uhj
-----END PGP SIGNATURE-----

--28lVfv9tFe50XtpU--

