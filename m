Return-Path: <linux-i2c+bounces-13721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9DBFB052
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 10:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C4E84F52BD
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64A430E0DD;
	Wed, 22 Oct 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZQyiqIJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D630CDB6
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123542; cv=none; b=XY8xPQKuTt8ZL+R+pV/Vs6QqJkYpYRbsvQU/TU7m2VtZgmp7RF97QxhDyY08IvzO6NtQpOQKMTcEvrzDIlHsZi0qTNUE9fwjk4aggB+iu4vOvZo0QQ8pb3UrRuJspkbe1+1qvar0Gy+CDHCnT3DukgDEldF0rmPobhh9HHUYUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123542; c=relaxed/simple;
	bh=ieTS/2AUSqHmza1HrKfNJtn1CeAfB7G7H5as9i2ecb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNyw6MxF+BtPmYBPU28zHuNUiWR9OEpo47vazDr09zzuLxYL/lC2pUsbk5CtcVhPgtOAAZciCSyMhRHvYx2icw87x2IU1hFSodNiL6HBa90jlaHw958qkN53I4HoayA2BVnnVuL5ZuJbn5oaKLzza24xJboibiDrBHlemIkooag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZQyiqIJl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=d7p6
	HBZFL98YK3UIk5xyMNXr+3fHwObVudCqHrAoNEg=; b=ZQyiqIJlKs2JLxWHP4eZ
	828KNP80At3xIh4/erA/AzWw3JI24eB3DFOQkw/VBx/l04ZU79g9KPEdLR312quT
	FqqsjpVzDh0UInnXizNvubF8hiWWgcLXyhwap9QrCwPTgYaVcSGs7WQlDb7N+dSf
	yfooIFIDygDr7Q25J8gVg8Xnajl7+/5nEnJFi4zmRxpumhnqxq9YcaKPgp9P3K5Y
	v8ZannYYolOIvVxb9WE+pjhLAh8qKp8JUnM8YiiXmquMVr7hmOvI3/a8hOkkue38
	PprcBOAxwD8hGLaxCLpzK9M7DTbplhIRwW6eCNLOMf5VF5GcsQ1CjL/QbXdJg7va
	UA==
Received: (qmail 1759180 invoked from network); 22 Oct 2025 10:58:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2025 10:58:56 +0200
X-UD-Smtp-Session: l3s3148p1@NIzHhrtBaHttKPGR
Date: Wed, 22 Oct 2025 10:58:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/3] i2c: designware: Enable transfer with different
 target addresses
Message-ID: <aPic0NtVkzpZJUuz@shikoro>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <22296119.4csPzL39Zc@benoit.monin>
 <aPaS4c-AX0P66T30@shikoro>
 <5779084.ZASKD2KPVS@benoit.monin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aj5Xj/8WAdTUbVl4"
Content-Disposition: inline
In-Reply-To: <5779084.ZASKD2KPVS@benoit.monin>


--aj5Xj/8WAdTUbVl4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Beno=C3=AEt,

> This patch replaces a -EINVAL in the middle of the transfer by a
> STOP-then-START, but you are right, the expectation is to have a single
> STOP at the end of a combined transfer. I somehow overlooked that part.

Yes. Sadly, the designware controllers are broken in that regard, it
seems :(

> Maybe I could add support for the I2C_M_STOP flag instead? Or does an
> adapter has to support all the protocol mangling if flagged with
> I2C_FUNC_PROTOCOL_MANGLING?

It doesn't. It is a known weakness of I2C_FUNC_PROTOCOL_MANGLING. Maybe
we could extrapolate it like we did for I2C_FUNC_NOSTART? Just an idea,
I haven't really looked into it.

> That would still allow to group multiple accesses to device that support a
> STOP in a transaction when done via i2c_dev I2C_RDWR ioctl, in a single-m=
aster
> configuration.

I'd think such transfers are super rare but if you still want to
implement it, please do. Note that some devices will still not work
because they reset their state machine on STOP. See Hans' example.

Happy hacking,

   Wolfram


--aj5Xj/8WAdTUbVl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj4nM8ACgkQFA3kzBSg
KbYI/g//cLJ/JoqLW9jmoOBeTgsxe5XPQ0LDgze+g7As3CooBUleoVReBZ/4ontl
cu5sj17UHSOv8l1X1TGGxa5zXXDOPTmg2vQvCiYauCJ/IMfwmAz8GfzgYfJliTB+
qXO6ZlCeW5I8iHdPtVDbw3a/maZtpHJs9lUDINAX3jLVsLeRqqAIKp7AdEgY7AHb
uoyLFADhrXmJVlHttL/EHvjKTvsFGHWUxVKf8Cqnir/1/oCQZiCp02ABqTb8LqNw
OJvnQIDJTHFfPfFcHOG0B5gf8rJhN9p+tJgdsZpz6Eodh/TsoJIlzdkRvIglLVMa
sAzQCUNapvjf0ZdBJpLqGh3m4+87Wi65qSt6w2KDrVswch8/NA4TI7CWBSXQPBrf
0fqkuQTSE+O+mFQcqT0ji8H6NftJjtBgWbtK2C4B53mRoXMquB5y9W+QvYXB/z/X
CXq+xyDOP5lvj9kiQV0zjWXi4U/dDY8iiBfmvfK3H/XIxOaGl3WDmitcioZesKvN
TCltFrEH3wEnyVztv7mICcVsWQ8iDTZIJPmfv5joYPv7OUQpkPAE4dCqFXSx/R4F
YVcESi0h+vZJsJlTV9GhN0EB4DKQ5fdVUa9d1V9Id65Y+qsuNpXPqyAZGiMwoe8g
yusLjBzQYns5Y+ZuITRqGpt2Gnt+SwomG0B/AtU/YtHSvqmf/ZA=
=PxPl
-----END PGP SIGNATURE-----

--aj5Xj/8WAdTUbVl4--

