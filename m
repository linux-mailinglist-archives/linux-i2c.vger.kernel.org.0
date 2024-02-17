Return-Path: <linux-i2c+bounces-1849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A602858F4D
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Feb 2024 13:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208D12826EF
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Feb 2024 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4636A023;
	Sat, 17 Feb 2024 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkRhRVdd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2069E03;
	Sat, 17 Feb 2024 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708172297; cv=none; b=e7wR55Aa5l644k8evDxmfhvRkT1KBas5EY2a4MBk0Yy+KVC2AaBGJFiPZzh2YqvxFW61KfiwMAqRGea4YIyGV20YlEuA/aQfMX2rcAttkBxjBzC+q9oxdizz4CjcEB8jLpOBCyLoF9FmMrkECCk2Y6pj33w0g7kSDPYigIxgPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708172297; c=relaxed/simple;
	bh=/E/MynKORulWdcZ+7q48yIRXb8NDuNofQIEQN5JW+Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xpgsv5Jjs6OHDJkn56cDFH0akB2eaI0aO6fHcvvKW8l1+kFcba/kBPZKq6bf9gBNAR+yxXkgQd0Z0TobsGqh6jcCtwK2/eyqsUdfT4NMFUQunYPBcHg0KPH9pTKjgeY/kESUAVyBrRFgxZu5bWD2ZnOJcKusffxbvii+VbbELaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkRhRVdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3B7C433F1;
	Sat, 17 Feb 2024 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708172297;
	bh=/E/MynKORulWdcZ+7q48yIRXb8NDuNofQIEQN5JW+Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkRhRVddkWVC8eF9JH/8t1QclE8crAmRtpLTRPmlphJoqCwmfUXynbj4snHeVLzJ0
	 dXgq8FeqquEAXjLRUVg3K/35LPLsbW47qDoW9dOq+6vSBlKNXQLTlqeClrSlTe2/JK
	 tTNMXWhJVPriWQZA6O/ak4h51HOP7rqu3r3S2raYQGpaXBkM1kl1U5htvJdyXkS3ty
	 b+Zow+Kzq746WSwy0wg2/zWTN0BiYudqNpO3XzSlyj8eyG18TEXnKlfRpcyR91xp8t
	 ZQzG5Tib/RXdV9gw7KqwuIvOLUnGtWArbIvFE4xt5UHr9dEEhC2yucqpzGSYXVi3ZV
	 iZrQ5LkQTcCcw==
Date: Sat, 17 Feb 2024 13:18:13 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>
Subject: Re: [GIT PULL] i2c-host fixes for v6.8-rc5
Message-ID: <ZdCkBV793vDud7WT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
References: <6utwghfmlmpaasdtoel5faalrrnfhyg3iupeditg4w7bgd7g35@cxplq2kipgfb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yZmkPVdAdvkW4jm3"
Content-Disposition: inline
In-Reply-To: <6utwghfmlmpaasdtoel5faalrrnfhyg3iupeditg4w7bgd7g35@cxplq2kipgfb>


--yZmkPVdAdvkW4jm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, Feb 15, 2024 at 08:34:28PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> This week, I'm submitting three fixes: two address hardware
> issues with the i801 and qcom-gen devices, and the third resolves
> a compilation error that occurs when including both pasemi and
> apple i2c in compile tests on PowerPC.

Thanks, pulled. buildbot is already happy or is the report still
pending?

Have a nice weekend,

   Wolfram

--yZmkPVdAdvkW4jm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXQpAEACgkQFA3kzBSg
KbZhHw//YPd1lBILSSSPt6FxTcqVzYYsit7ziwAKRxt3WaRk9jL0ZccpafUOzJp7
sI+EVjJPiwWNkoO03EGBFlnTIHIcLkFNfFRGEHmgXDMmYcjmj69JXYAqwG4VOOrn
9Lb1lPbvu3JBjd6k1kj3IqAUpXLgdU8dfsz68iFo4sgM+5fhvEQv/VbwE9jr61Vy
DMdrMchoq/oVzO2auPbjqJyIgBv1ZFeCKo9dM1k8ZHElZ7cLAfHqqxr9jzFHfH+x
P+QdDio0yTQ4au97ljmDVQqKD4BZ4quE1ai5pAGL5slHjd13oooWnKnSVaECoUWz
kID42jGgq329fCw2MQghWjB4kguF70/pS+pgzKQULNCgrt6JTdraWUWXoQuQpqhG
P7OstcsFEWahw327PZnFDfZeH7rbKcoCzL56yV6XH3uVqTtb6gywKkvT9d/xnoZT
//OC6Q+7eXz9OEdVGzFHCUqhBZKnAuBP0yjpCvhUY29ydlwwRB5NPazfcORLM006
9VYns2muAe4PhTbPeQZTfSqjY+H8Zpi4f4hsmaMKhk9R6kQAey9ku8IAhN8PgdJ/
Erkp+MdU6WH9ewVsYhI0mPFniWuGIrMEgvu4HMbgcrX03Kkc+/LjfiuoufQXn7Du
OMzlc2OQbBljBu7udq7A9FcWfziOWvoQnk6qLN6t0mX3AYM2f2I=
=OVbT
-----END PGP SIGNATURE-----

--yZmkPVdAdvkW4jm3--

