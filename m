Return-Path: <linux-i2c+bounces-10920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85CAB2306
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 11:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 861E44A3481
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 09:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B306221F2C;
	Sat, 10 May 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B7WvgvF8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA21E51EB
	for <linux-i2c@vger.kernel.org>; Sat, 10 May 2025 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746870303; cv=none; b=rTeby6uYNEM+WS6Unlh/ta42n1lj4CSpx7g7XsaYVB+azmhn6U7lS2BkfgbUvATWZe34yo5tuyx2dvPdL8dBr9hBfxXkN4wlHJXT5Tv9KrfoKH38bkavtxm6woi3OtBHMrVz84jaWF9Y48ZrDl59brQHLMAuoKWg2t6h5H6bEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746870303; c=relaxed/simple;
	bh=zqlh9T6lprqhOCs89lpTlZP7/3GWg+hgKWkX6nmed60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lv4MwLgqaHhUDesN+6HTxNk3n2JTki8T+RNVXQsynqAAkPdm5gp/N3c9ot8884P88b3SnYbu0yF74DLHGkDCPtmICoqW+IbLUnElYZFLcQLnbny0+4X7UL/H8k6kzcSwFZYFi4RgcUwklU55Z4wV9I4ytbfloulVFeO6Rf9h8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B7WvgvF8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zqlh
	9T6lprqhOCs89lpTlZP7/3GWg+hgKWkX6nmed60=; b=B7WvgvF8dMkzBKswDZJx
	FA06frZF6aUJ9Cx86BMAHbRcooYVmQ2zZtSmmEASUcXvVfYa7joQ983d1ixz+YMp
	ZcK2Jkx38Ccq0veZvOxX+0EN3HfrjmRcbkztrn/ZuFGvcpqq58ssN+uePGzVrGT5
	pUpZpIDxlD5WWlj+WWIqf+vnz/ceeZDoocGU0ipfkmIXiF9WP4COXduTKewr35Wp
	CkpyaNBEaTO7cbItu2GgdXdOtxowtYnR7iZrkqTij9sCWnoYbzxN6u8/MqApfqjt
	0u/EyTrwuY6unSlcIpyMGR01dzdtDh7G/rerMhObSHGGikB25nqfdAZ5P7jwr0rW
	MA==
Received: (qmail 263804 invoked from network); 10 May 2025 11:44:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 May 2025 11:44:49 +0200
X-UD-Smtp-Session: l3s3148p1@H4AG78Q0lk4vQDLS
Date: Sat, 10 May 2025 11:44:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.15-rc6
Message-ID: <aB8gEAEBtIW3ATB4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <xpvrz2zt7jm7k56vu6txgyorg73yrfag2omwyqbkpqdkxyoikl@rh5wcugtqwhf>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvN/djnseQK5rpJl"
Content-Disposition: inline
In-Reply-To: <xpvrz2zt7jm7k56vu6txgyorg73yrfag2omwyqbkpqdkxyoikl@rh5wcugtqwhf>


--IvN/djnseQK5rpJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 02:09:01PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Two patches in this pull request. The first one updates the
> MAINTAINERS file to remove Seth from the ISMT entry. His email
> bounces, and he no longer works at Intel. I had a chat with him
> before he left, and he did not intend to continue in the role.
>=20
> The second patch is a minor fix, barely worth a Fixes tag, but
> we decided to include it since it addresses a warning introduced
> in the latest merge window. We preferred to keep the patch and
> its fix in the same release cycle.
>=20
> That said, I hope to see you soon, and in the meantime I wish
> you a great weekend.

Thanks, pulled. Yes, see you soon :)


--IvN/djnseQK5rpJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgfIAwACgkQFA3kzBSg
Kbb0VA/8DwLyAx0UwZ2an+52TdkTsf0FQyoUoqLb7HvGKQ01kpC4pYTVlXdYDpPY
OBknU8LFdEdAEvLCdzImc9IBDuRzGTyO0jonI00T6+48s8WVkU2Tl9umPfz+T9+L
zdRRE7kXR8GW25YY5SILsXBGcJTEe6nY8YRS6TRXiL7IvSOL2eotU0/p6WehBrGD
uQZh8awbmHpO+oYiOiHWKLKFYVajsd8GplbKAwup3FNIUWkWgabreyDhc1NPxFdZ
hBz3N1bmnWVw/NTQKZzSzCHZVhr9JLAcsIDPe34D/VnOK60v7SNoq7SEd+UFsEAw
9oOJZte8kPIiWq52VZkzUdHl/MqyX0dlf+HMXYTppAfFDs5OWT9RX8EGXwlsA+5W
GxFXZ6HkUUvIyzYh62/x2QyCQVas9CgQq4RqFnH0/JtkTeTJLMd0/NyGhcYbBbcB
fkNu+G16vEFDODsqX9+TKN6cCuegyxQ0HBikTs5v4HnoHZSW5/AH8dlJA2KrnQnO
7rMftNpupMRfqwKu9XLCAaWdg1JI0WeBHDhYM4/PxQecAmnyFAz1s4w6vgi0d4aZ
hlbl40RuVKIg1sO1fR55T3kEmQhKOBUTur5wUmAJaWiSfEjIIceetRvqJtdlzdC/
yZJi+04hrhhAM4i71E7yCBwPiGS7L9uYAa37dyxAgNI4/6fXV/g=
=QTrs
-----END PGP SIGNATURE-----

--IvN/djnseQK5rpJl--

