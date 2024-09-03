Return-Path: <linux-i2c+bounces-6016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADC96983A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 11:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12D58B27A49
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 09:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513D71C769F;
	Tue,  3 Sep 2024 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aDHsfxIb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8711C7676
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354291; cv=none; b=Qaw8PWEBO65CmZZMsWr3ZV7anz3i/MaB5x17BMuoWbSQQscAPj4dVRboGw1tHXy9RdU2f4to1PDvvkNZADgMDTy97tGzu0ShujzWwRcmlUqPtVw8t12Id3FxeZv4swl5AA13HP2pH0mx7ELndif1REIT4K71dz5MJxc6f6BB1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354291; c=relaxed/simple;
	bh=HNKnJwweY5e+osURURYraHODvNdW8h+yTvbC3cD9Jq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tE17bO8KL65ERpYIa1WWMn6ttbGbnlUazwQH25RESVPQhHbqM+UnpJISb5nQLmbUSi2V/lAZtCXDDwk+EjvFq+Oai9biAWGNhS8jyBSmXbQgC0uNZcyiUGfOSKlpdFsBX9IKIuoQWYFmAH0+ADkIFYcBSkFPZOjoP1gmxhfOVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aDHsfxIb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ia84
	vY2WJq5acaDEubWgZY8HT104OC/RMhEmvePGa1c=; b=aDHsfxIbNei7cx4YFoHY
	l5Uwy91lFLW5VTZ1EUJyS2cpzjSuO+itwhT5p4S7wmsFW78poQoKR+XBlyU07cBD
	ujpiVIRpxiwM1ARqeFyNCZwAuv5Q3yWDlbyd/joUe1AC7rHdEYGpc2x6OHef2aFh
	nbV4xnK2xgN7i+EfsbbLX1wn5Tx9Xfv1B0wlu1FxxjCiOTOoFJDADffmZuROZwq0
	/gTdpH49RvLweFLV9wMJzrMhPQpDHy4OGJnLMFz/zSIQkqtWDJJO+KeGfWZFOTke
	yeRv1L7uL881V/9zjkkDdKDfu23K84HlsLRMcWDlpGrFilOmC4QM9fAMPHhnuYHP
	HA==
Received: (qmail 193007 invoked from network); 3 Sep 2024 11:04:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2024 11:04:44 +0200
X-UD-Smtp-Session: l3s3148p1@2Ws6WTMhes8gAwDPXwdRANgvu6DX4+2c
Date: Tue, 3 Sep 2024 11:04:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
Message-ID: <ZtbRLOUO48PzOKmC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
 <2024090242-smother-preview-a1d2@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zT2ZY26Hj8wvXt21"
Content-Disposition: inline
In-Reply-To: <2024090242-smother-preview-a1d2@gregkh>


--zT2ZY26Hj8wvXt21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	pr_warn("Compatibility class %s will go away soon, please migrate use=
rspace tools to use bus devices\n",
> > +		name);
>=20
> That's not going to do anything except annoy users who have no control
> over this, sorry.  Please just fix up all of the kernel and then delete
> this function.

So, we deprecated this sysfs-class 15 years ago and hid it with a
Kconfig symbol. However, we never pursued this further, so e.g. Debian
has the Kconfig symbol still enabled. Can we really remove this from one
release to the next without another transition period? I am not afraid
of tools like lm-sensors which were converted long ago. But custom code
might rely on sysfs-paths created by this class. It was even advertised
in IPMI docs until last week (fixed now).


--zT2ZY26Hj8wvXt21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbW0SgACgkQFA3kzBSg
KbaXHA/+OaFYR3SuuGEMiqSHnAMcj6WrHF7N1FaM/2mcuBm15g3xlnTiKQFrXwHs
/GCxxFPqiw7hkFPJZgv7PVnRuGVtSRCF74r/MnNe2aUrtf2jOUIDuNyJSrMkKCz3
vLSU/bNunfuNDPkjD6vvlbW5s+Um+ogUDTDIqjJYVbH/wjceekXZU9FhRx0Bf4pJ
X5bolJd5GHQNdNePFKy9aPlutc3CHAkDEl1XWHPeGIGj12gkXUVnpS1YYDt38YlE
uSTeuu4lxv1ZdelQZl2FBsb4yfsSQgj1Vo/oI1xOoPNZ4ZL/bU3i8Rih0W7CrytR
D5V4rjeQa+AFS3pZWzB/1b32wtRv67f0YdG7ShjEVm2fx8NhONbzP8+nD0ZlD8lp
wZ/KWq8mZAYQf8t7ehbOGd9csHYJ+zBEq1ng82ZEKXLiRTex/YKIo1N6HExTxxxs
vD5ZPjhue3TeQh7ZwAl5sXDmdLe2OOxwhd+OeMXQAjGSS8OrLELjpDHTdPG1pmpx
vALLj+1w4Rh0Q/l7gcqOOccIMaBJCZpASODUdxnpvsGB5Xboy4YmSlSpADRDmF1i
f/oZb/BWmRdty7AWJA7A2JZ3L8Rb2OycCjBSoI7SXw753ez+vJ1mRmZTFNhWk2/P
fSSRWVxJVwViob6HBuzUAfahn3u2UdkUc9427TXI+HEO+/+le0c=
=Z+GB
-----END PGP SIGNATURE-----

--zT2ZY26Hj8wvXt21--

