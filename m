Return-Path: <linux-i2c+bounces-1619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741968488B7
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304DE28303D
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3DCFBFC;
	Sat,  3 Feb 2024 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxreOzbC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE483F9DE
	for <linux-i2c@vger.kernel.org>; Sat,  3 Feb 2024 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706992677; cv=none; b=GuoOsWhH3CHjGz1QbP3lHYWb6RfTO6QSDxdbkOlMUZ0VOy9fGyPAALEnUMtjhIL8zxlCbUYL2ywasY0iPvwlijuD/wrkQWWd5ToMFgvDlROy4umRjkmS3sbstFR/0c5NIP6u8agyRg6ml3BXiXSBxAYHfXDA92MhDKbuDFfTtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706992677; c=relaxed/simple;
	bh=W8B5GA4aI6bx4wqUX9zAX4Qx8/YjkIEPKsQBl+hu8aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpAUfszGYrbizm7PbNLbxlb+0l/BnOELpKkE2VxcTj1gWo7dtUH8kXgswyBNn3FhJgV+Hk63fa57cgiG14MRrX3c/AC0IHh1Rktups6MJn6EOfxggaxT/gLwL1BPbK92UPM3c+Taz2cZmqDGAq1lWlqueuuAZk9YAnJJKdIMORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxreOzbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972F3C433C7;
	Sat,  3 Feb 2024 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706992676;
	bh=W8B5GA4aI6bx4wqUX9zAX4Qx8/YjkIEPKsQBl+hu8aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxreOzbCMBBz0AsMv75i0BYduZ/DlPEAtZwFXxnpZiB9k+lZWP1pUlH3tBYVKo2l4
	 ri2BZeg7O0cQi7sjZTy50qF989NaEpvhFaHSS77Ja2/fC5CtZAMp8rs8za+lv9/GUu
	 z8Egle3Do+wQJIF9xVhCZgKvfj8JuNWlQNZ8H/H1H36uKr9dl5JQ2b6ZvgCGPNGNBA
	 jvHvaVdx1Y8AxxRV71jiJzMBU/5p06+I9pNwZbhpI0sJwWCwT3wEAUsEFuMRrWxpiR
	 uIGhaGSau8kxUNakH9P0NsyQHPRtofmQbch20zYZpOpIM4JDvXAk5hYZFyIBcO6iSV
	 XJwMFqoErWoWQ==
Date: Sat, 3 Feb 2024 21:37:52 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Corey Minyard <minyard@acm.org>,
	openipmi-developer@lists.sourceforge.net,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] ipmi: ipmb: Remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
Message-ID: <Zb6kIC9CUQTjDVAU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Corey Minyard <minyard@acm.org>,
	openipmi-developer@lists.sourceforge.net,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <18568237-0b57-4b74-86ec-a6c358a4e058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CxYVmCU3aZiSEgm1"
Content-Disposition: inline
In-Reply-To: <18568237-0b57-4b74-86ec-a6c358a4e058@gmail.com>


--CxYVmCU3aZiSEgm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 04:15:06PM +0100, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CxYVmCU3aZiSEgm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pB8ACgkQFA3kzBSg
KbYCEw/8Cp3VA4xTWQdiDEub1oUz3rwtKhb4liAVr0X/f4F0jOYM+YNwhtfdrt3X
LGuSPmAtl2LfbtmaSNC8ExvRyEqB0l76/nMJcIJ4SqTmgm1piY3B1RHM6DcvodV4
tDuY5e4Jr2NYE/rW+/d/DLF5yJicp0J26clD1g6j8SjlycjKGwj+gf7W8ABUsOG3
UzX7bRcIvSiJmm6vXzjUGp3jbOn5xn8FfffRRxmsPcnPs7JZQn9WeqB41w406/1d
cZ+vAS7q/p+hdM3kJHr22RfFtPmMLvFctyMMP4luUpYd56vU7BlO9JKeqQnL6hz9
eMALAjIsLgcMAbrbyQztEZU6Mvi/6KstJ8rR//taQ3LQvkvV3p6bV1pqi+zGrJUb
n0UuPQFxlIBiF6BoWjIkL9vHJIQ6MwoBFSA0UaqmahALq3I5B642jjlJ8EEsvWak
TQrtZxgP88FING7U+wlMH1h9ysNVAlBKa7vbHC+HFmRZh2WybDPeyDJLWBcmik9a
SGndsuy6DqkbU3ymN1T0Bh2dlyuDn/M9U3LYyQCocJByN8JtZm7VV8o+2f+6KHH0
hBe20E2lxCx8nGsukakyFqJfNW9ZyN4rMuHax2BJ8/4rWt181qZkVd430NyHjB4e
WCtONyYLkkLxIaUTlnllrf4kTjfo5D53CRyWNMrKBynFL0L2TCE=
=jQIq
-----END PGP SIGNATURE-----

--CxYVmCU3aZiSEgm1--

