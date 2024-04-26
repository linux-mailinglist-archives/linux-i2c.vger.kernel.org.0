Return-Path: <linux-i2c+bounces-3185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D508B3007
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 039CAB20D9F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE84013A3F9;
	Fri, 26 Apr 2024 06:06:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87E713A25C
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714111582; cv=none; b=TG9yD9gCGKYLhIoO+2I1o6wTwf6mRo+/yTYHW32GTNlS44nY/OozA8XzZdnpGByK6Wbo1tLDxaLnfgsx75QGkjQq9ICDf/xvl22qo6W31dLYvQM9uA2c94YrEYRPz1XRgpoN2cJRhxAC3lfEZI2PTqyIYtSZNuAcR38u7XyTxJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714111582; c=relaxed/simple;
	bh=xFmoi7cdUlJu8W+MNikyiSQ7xGiXIvd0oqDPENbrh3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUO+BJUqYb0yL+eu6BUcGesxYkOQQ8dOigE2WfqCHo4hb6PQoRSlppz9ruSdkoNnzhj/wLhR/7QPw6tp92loI17MgG74ztpqwGOtswBCKgrVzlHfDUGFfo74sLo1sn+WlqojRSJt3XXGtvoAMx2ILf+oEHSs5MtndXA/ElVOxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (233-123-142-46.pool.kielnet.net [46.142.123.233])
	by pokefinder.org (Postfix) with ESMTPSA id 7F824A442F5;
	Fri, 26 Apr 2024 08:00:30 +0200 (CEST)
Date: Fri, 26 Apr 2024 08:00:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: fixes for v6.9-rc6
Message-ID: <20240426060029.2mimblyjhcqf3q5s@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240425115847.18359-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5end5z3whxcuj7a"
Content-Disposition: inline
In-Reply-To: <20240425115847.18359-1-brgl@bgdev.pl>


--q5end5z3whxcuj7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 01:58:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Wolfram,
>=20
> Please pull the following set of fixes for the next RC.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
fixes-for-v6.9-rc6
>=20
> for you to fetch changes up to f42c97027fb75776e2e9358d16bf4a99aeb04cf2:
>=20
>   eeprom: at24: fix memory corruption race condition (2024-04-23 10:07:48=
 +0200)

Thanks, pulled!


--q5end5z3whxcuj7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYrQvoACgkQFA3kzBSg
KbYrrw/8DF3CvagzsEUsD3bvl/vgQID/9fahYEEa4UyN34rJ6ppgS7Vo3eiJkxlO
TqsufoMiR8KsM2NSc3QHgD/76RBCBxWFyvwEss0Tfy3YX8m8bzmYfL/R4k4ctary
r9jUnSo5Nmj505+EnUW9Btu6e5INzI3Nhj3X4Z+bYkn8GV6cgDJJ4JESKEQJN+u3
qeqn3CfPAHVpmGPbyG7wg2VrV8k8LxHx2tRmuXyrh6GlSqNSaCmxf5S4fUiBPFyK
uRRrma88iuAQu0kKPHmGl6NaR26YXDr2rMthd6TxyZrNP/+EpV7li7WLFU+G9oOD
IA3Zh+B3VzlNgTRKG1FcssYV2NUfDSJi5yPitvNw/HbbKZdJf6wol9UTnGHncXTE
049YcGYrcLFRk4McjRzsiMVgbElVR0EeZfll4TX8yaVI7eg2wMi7OMdmZF5p2C81
xbKoKnIMJnrc3FQcnNwBMk8CPHXpqBnfC+2pEgs8kK8JtPfFwMz2JLsabHbdp8yZ
OFnYSai7HKqLah2VPmO1Q79QLMMy+A3Qb9tLBRADtcoMfHMciMXqUXKzOktCZQ45
V5T+TLVBQZCyztjXIgY3mcrvEZlWLDuHN6YbzWC1iqT7pgmv273AgpG9yFKOVavM
VZzIkaBhqDTHw06XHCDO3QkTiNECJoa3n25awBF4PbbsiBewsmk=
=YZFh
-----END PGP SIGNATURE-----

--q5end5z3whxcuj7a--

