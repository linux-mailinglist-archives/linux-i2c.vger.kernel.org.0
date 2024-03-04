Return-Path: <linux-i2c+bounces-2184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB0870BE7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68BE8282C87
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86796FBE4;
	Mon,  4 Mar 2024 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aduAZA22"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BC6E54D
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585701; cv=none; b=Yz6yetN1gRQNJmBmSaF0mZ+ZBdLPDsO7pEVBW3RyYD7+cHuHymxEs7XeZ0jRxoK/d28A+RKeKCs2VexX0uU1FEdp/+zM1ARDG+JaS00jMbzkPL/6qwaop91C4koFDYh2b15hweAs7SEXl8/gXVdTQiFA1wxAfSOm3XtsrNbSms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585701; c=relaxed/simple;
	bh=i1NxfXVwknX6nwJHYlrjnQJNGqbRSZIaN4tsxwRHf98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abPJJDD0nGmdjPNrnJ1iit2OCFsArz2NXjoP9t71dLp1e0dzHDq99nSpdlfixnPgW9n48/zkHwHLIu+Ft4ta1NBowN6hCxo46F8aUBNsC5xqXrU4pqi4Y1lQ/6y0m6YTdX9c1G3w6tPqoltLU2CBPsMGF/lZ1lvmdz4kc1OAB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aduAZA22; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=21Zd
	vrWBN7+6IdtKG1ZTHcL0qqV9nuTD3P213oWlxQc=; b=aduAZA22NKnY9WJR9/V8
	Ts68UDEk+OzFgTc5uuLMT6Eb+aHEYRWuLJvzJMqWsaL8zr7IaY38g+QPu8YjzU2q
	9etvF7Zr9a9kENj2hdiYlw8AvwaTb/mFP8ivnFFRK3spxt/yXOOWs3NhjkJwSb8K
	AnrBrZjsahwMoQMnNTDhr8MrRmZFNf9YYv7IYH0wR2KXvS4g86IvMDYjfLPrGeuj
	ROJkOajLtOANB4avIDj7e0pa9HFF2Fna2wb0ZA8+WFin1qkclAaqYHSyJhCkPmpS
	ijNUf3wBkDHnuLbCVRJK3gIDZKHrvVwZsfC0Res7O4iD1w/99CErx0nYICfFC7mq
	0A==
Received: (qmail 3622885 invoked from network); 4 Mar 2024 21:54:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2024 21:54:53 +0100
X-UD-Smtp-Session: l3s3148p1@5dny79sSnpcujnuA
Date: Mon, 4 Mar 2024 21:54:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: zoanana990 <harry021633@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove redundant condition
Message-ID: <ZeY1HMLVuDC1UUL4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	zoanana990 <harry021633@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240224115050.3199-1-harry021633@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1yseQqP+F0ToDfD"
Content-Disposition: inline
In-Reply-To: <20240224115050.3199-1-harry021633@gmail.com>


--y1yseQqP+F0ToDfD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 07:50:50PM +0800, zoanana990 wrote:
> I2C_M_RD is defined as 1, "flag & I2C_M_RD" is 1 or 0
> One more condition does not need to be met to obtain the value
>=20
> Signed-off-by: zoanana990 <harry021633@gmail.com>

=46rom 'Documentation/process/1.Intro.rst':

It is imperative that all code contributed to the kernel be legitimately
free software.  For that reason, code from anonymous (or pseudonymous)
contributors will not be accepted.  All contributors are required to "sign
=2E..

Please sign off with your real name.


--y1yseQqP+F0ToDfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXmNRwACgkQFA3kzBSg
KbaZJA/+O37+CJyYlB1OiLtijUzVftGYhQ31wWYJHwN+eFhpU3eWNdLsK6DS1HKF
KbD47TKeFtkS2LkMxawWcOHnl3lSnJDszjs4hk/Udrwe3PqYzz9OXdIP2oR7vdsb
1lMobRT6R/yB3Jy9rDFn8nSorAnjIZ538w3w9rJ8RxFYfMghnpuTfauAY72sMN8U
I/pNc4cQrdPJnwnMu6br3vjux1y9UjYXpToTmrNKh2qDDqePJt2LTQnYZ6D+oZ+E
vt4+5y2sK5GkEktuvUAbqPVA8QbQgZnHTmRivVNSfNhJiCmYpgfqMXb9f5n/0yDF
7K7KsrFRKC2wewXk8kiIgKwXF+Sn0YNrsfypLytabvhtCNmPE8kLten9mRbu2Aur
3UkaRnYyK64IqJPH0TAkEyKp0aV/e/VYgELYYEy1J0K3oblf2HpmN3/vnd8769AV
sMq74gbCwx3KG9RE4bcu85mglXvlDi1EFJxWjxYyFLZaxqvt7tw22ALkzgkpnJTF
PA1pXD2u3h+/XBDggdldtrS2JWEoSCKsTa8ORXUnx4h94o2J8Bmk3wevibzB9zgL
/aoDuZjofPhgaqcW32SQ7hDn+TNHZt1IZ3dmrQiJ7rHVEl0s/2CApRoP3SDKcDwY
NAJ/JIPc13c6BozLQyLyd5meCazAoxam+fAtIQAO6B9jLTCchbo=
=1GLv
-----END PGP SIGNATURE-----

--y1yseQqP+F0ToDfD--

