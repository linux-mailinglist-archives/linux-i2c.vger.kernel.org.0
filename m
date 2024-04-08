Return-Path: <linux-i2c+bounces-2823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23389BADD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B0B4282ABD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F08E4086F;
	Mon,  8 Apr 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Haai3URt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02C43B290
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712566192; cv=none; b=q5ZzKtLMMvWkepsy0MkTXJAVuwnD9wYJfL5mLy8/Y0HXTDrdznw2qqdIrcQzADiPpRF5xSr/nfCLFFjY4KevF0zYjUsWlB2K9zYTJsSSuym6CbI8MQ9gbFOGC6gBmpD73xn1TQ1pz6zvOqtjmlMaauXz6BcvN8IHDkTpprdDQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712566192; c=relaxed/simple;
	bh=aIsunmh3IiB/jc3jepayB1vK2wqHa7eMFm1k3DrHy3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCGOXOhFk1ZG37AaUelbNQ1IezZ8+XRx5pgvZNpGPq4wwQ1Wqr2mfyiv1/8872Ejrw1EcyxETYhC3W3sSFD6GqJrRQE+Dc24eFok0zPhjCo4RBaa5PkBiAcXl1ofs6iBM56l4xtM4gB/LGWvN+8u75EoTEtksqoLZ4/2Vz7/j/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Haai3URt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JACL
	YWxdYEwIEgim6e//DWojK37KoOlfwCEoQ5NNQV4=; b=Haai3URtuhhvdP7bB1xt
	P42vgF0h7ZIXGO9jkRfDz3vYb3dNyZtanAq6YtiIsWsW45zI8+TbpHbfHyVAZbtA
	HUD36Q4BVtUmnzrZ5LVp1j5IWeY6DDrSMKVLJexFL6GR5VT48o8hDnQlI4M59ETa
	c/nO2uW7MatihveCdP4qZXe7WCMSSF9beH2uMQN8y1OJzyUm4kXCmfpyMXXEj5dq
	nJo4gztK37V2m1fi/jAgOXyFcr14GrWsZlgrWtNkyRLzDNT8Tigzarn3YqKO9PaC
	EtKOeu0thEFmJw0co7kiI6foWTtsCZdAHBcgVmH/QE6rISh0eyxVszgPTY+BMd6K
	Sg==
Received: (qmail 708463 invoked from network); 8 Apr 2024 10:49:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 10:49:47 +0200
X-UD-Smtp-Session: l3s3148p1@22g745EVmJ8gAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 10:49:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/64] i2c: au1550: reword according to newest
 specification
Message-ID: <6zwajix4pwggqyjm7gvjvm3wahwljdkxkauxjmivkfad5dv2jp@x7pw4rxcnh2w>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-7-wsa+renesas@sang-engineering.com>
 <r32ljnxrlpfl4ksqprkteu5jg3zlbfm3qxkxgao7ziajnhqwvr@tqfvqv2ljw3x>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tlci76uk6ycxifvx"
Content-Disposition: inline
In-Reply-To: <r32ljnxrlpfl4ksqprkteu5jg3zlbfm3qxkxgao7ziajnhqwvr@tqfvqv2ljw3x>


--tlci76uk6ycxifvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	/* Wait for Master Done. */
> > +	/* Wait for Host Done. */
>=20
> here, rather than Master/Controller, the change is Master/Host,
> which is different from what is stated in the commit log.

Yes, it should be "controller" here. Preempting the following patches
where I used host: I sometimes used it because "host" is shorter than
"controller", so e.g. variable names would not grow too much in size.
I missed that SMBus has a dedicated meaning for "host", clearly
described in chapter 6.1.3 form version 3.0 onwards. So, I should switch
to controller consistently.

I am also working on a small series updating the I2C documentation so
we have a defined terminology. This should also go in before this series
and is hopefully ready tomorrow.


--tlci76uk6ycxifvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTr6oACgkQFA3kzBSg
KbaQmxAAruuwAdqXqJ1pzGtjYCJ6ulZf+aSkF2vrtDmt7U0rtNdXELE7N3xuK6U4
yi28r6Xj5BrdhfSGRSHBT2wuJpJN4ENJYzdcd/4fAG1BNI5/+3A6qkfQnSsqotFF
2xNgGK9Ffmx3mhuClg9SNPFDsSurrRyLMyVJeMJrCA5LJqbwAwBwUkUv889tx1kJ
khrqm9uv1FnEjhhyInGdMcUc0RVfGh0SaCb+F8F9WXpz6NRyDGc0aKMRKgqLpIj3
K7bGAOl950W6B22vNPriKKeD9hEjgKmvBUEuw7tF8cBol1IytLwXNca85LvLgM3y
/Q4jR7iHUbBBQgtXdPSeCezLd4oNk+GA1K/3n8JEltGrrKUqfRpCvYbykNUsSvfR
ZaEWaPF/yLZ+ip+fIS7iOi1MZgGGTE1N8aaYmsIifl3xsLX8AHVoYhtEDa60pQE4
ytmNkwveg8VCEY/Y9vbUmqbXd0vXnyhw9sUDzWp+PrXdAkUCjsdhSdnDLLQ4+gDA
Ka1InBVv9m1AIPcgfMFTeP0y6R4zzpHELJzcUCahqp9SSnPXnuqdL3RZfYiUlLuW
CXdniU5Q11eM1a0hQgj1dU7uPRBztrKLDArOhYa347kSKnSthh0y3m6pTh4YtSSi
7sjmH8mNNs5n9QGHCbMQ5B8o9P5eCvkhVRuDktZqTRb5Z8s25OM=
=ZnXw
-----END PGP SIGNATURE-----

--tlci76uk6ycxifvx--

