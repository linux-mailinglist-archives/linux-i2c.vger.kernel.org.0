Return-Path: <linux-i2c+bounces-3788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6E8FADFB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 10:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 113B1282EDD
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 08:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A782B142E83;
	Tue,  4 Jun 2024 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FJ6agKLZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D649142E6C
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491037; cv=none; b=gS0CMYOTkXC1wcTjFBGGS29rhA8pCUJqtkNblHs5WBS6tngF62XYiM/TmO0/iGc3HS1juKXcF12CLq3mRSAZHMyXkXyd+i9fYfl7nOKHDS+QSaERaVS1xuwSY20PU+1/5Z8uTBxhrQSX0akIF8A48uEapfL5Q+ZGC8h/HG+bxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491037; c=relaxed/simple;
	bh=/82jAxl1bZX5xtR/X9gizbSQ2/4wMrIRGo3/dkUnlT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0c1YIVYoQ85DGAfEMGuOd2j40/jFKYptG5hMnvptMdpvDv2fPG8CKMyawUQpKDvxL7I3FHU1XSSgVz5N4/7pr0e4PbHCtUv+0rOx3wQVGgdHl7r0N7YlxrM1u9mrYvJTktp6RlcDsoUenngHuhFW0ICcl9JVgLz2zMUAB6G2UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FJ6agKLZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9m0u
	dGVcBfGslrF6YCgHx585x/QcfuEfa9X406f+ogE=; b=FJ6agKLZJSbSFnGfeZay
	qwhVAeYvizTy72wVpjvbp6NKJQuYQvoAiah/GQNrLsR7KlZpWQcRlX/RZiA/79pz
	A+Dwj7VS6SgV82Gb9w80ZhNEmQzUMKXZea7bG2iO9zcbRJU6xq7sRzbDKbSOKT1t
	TCjbKOAnc6MFqSjlzFuKWESadlK7fGS3BD9XdpwKHk6NF8Ug9qm/DmJdOaL/3c8y
	UDBQ/R50KXnN5mc8nsKC+1HXz4Q5Rm7PgTuLukTVZTRzvG0fneFZjv6MSxsfOjSe
	7WONQm+LJ7ON0bI3JbSOVFzsQ8visq03LhDzRRrouI/7XbUEcXYW8rALk8WWYiAS
	RA==
Received: (qmail 2254511 invoked from network); 4 Jun 2024 10:50:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 10:50:30 +0200
X-UD-Smtp-Session: l3s3148p1@psbEigwakq0gAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 10:50:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <b2tnimag62ty6wndyjsy7u5fay6y52zn47vvifw6rh5abeqzpu@pqyyczutxcwu>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.de>, linux-renesas-soc@vger.kernel.org, 
	Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
 <1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ksynbm66oyue3y2r"
Content-Disposition: inline
In-Reply-To: <1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>


--ksynbm66oyue3y2r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

> I have a hard time establishing a formal link between the reported bug
> and the commit listed above. I do understand that it wouldn't make
> sense to register an i2c_adapter with neither .master_xfer nor
> .smbus_xfer set before .reg_slave was added to struct i2c_algorithm,
> but there were no checks in i2c-core preventing it from happening.

Well, yes, correct.

> It was also possible for any (broken) device driver to call
> __i2c_transfer() without first checking if plain I2C transfers were
> actually supported by the i2c_adapter. I would argue that such an issue
> should have been fixed at the device driver level by checking for the
> I2C_FUNC_I2C functionality flag before calling __i2c_transfer(). That's
> a theoretical issue though as I'm not aware of any device driver having
> this issue.

In theory, checking against I2C_FUNC_I2C should happen. In practice,
most I2C drivers do not do this. Being picky here could results in bad
user experience because of OOPS. If we really want to enforce checking
I2C_FUNC_I2C, then we should have this safety net while we convert all
users. No, actually, I think we always should have some safety nets.

> The call stack in Baruch's report shows that the real issue is with
> i2c_smbus_xfer_emulated() being called with the i2c bus lock already
> held, and thus having to call __i2c_transfer() instead of
> i2c_transfer(). This code path did not exist before commit 63453b59e411
> ("i2c: smbus: add unlocked __i2c_smbus_xfer variant"), which was added
> in kernel v4.19. Therefore I claim that CVE-2024-35984 only affects
> kernel v4.19 and newer. Do we agree on that?

(There is a CVE for it??) For Baruch's case, this is true. But there are
__i2c_transfer users all over the tree, they are all potentially
vulnerable, or?

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!adap->algo->master_xfer=
) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dev_dbg(&adap->dev, "I2C level transfers not supported=
\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EOPNOTSUPP;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
>=20
> Not related specifically to this commit, as it is only moving a check
> which already existed before, but this looks inefficient to me.
>=20
> We end up performing the check with every I2C-level transfer, while the
> availability of such support can almost always be checked once and for
> all in the I2C device driver (i2c-dev and i2c_smbus_xfer_emulated being
> the exceptions).
>=20
> I see two ways for us to reach this check:
> * __i2c_transfer() or i2c_transfer() gets called directly by a device
> driver. This driver should have checked for the I2C_FUNC_I2C
> functionality flag before calling either function. If they did not,
> it's a driver bug, which should be fixed in the driver in question.

I see the performance penalty, yet I prefer handling the buggy driver
gracefully because kicking off I2C transfers is not a hot path. Maybe we
could turn the dev_dbg into something louder to make people aware that
there is a bug?

> Note that i2c-dev currently lacks this check, I think it should be
> added.

True, it should be a role-model of a good citizen :)

> * __i2c_transfer() gets called by i2c_smbus_xfer_emulated(). We should
> add a check for I2C_FUNC_I2C in __i2c_smbus_xfer() before calling this
> function. This is more or less what Baruch proposed initially, and I
> think it would have been a more efficient fix.

As I said above, more efficient but not thorough. One driver not
checking I2C_FUNC_I2C and boom...

> And if you are concerned about functionality flags not being set
> properly (specifically I2C_FUNC_I2C being set while .master_xfer isn't
> set [1]) then we should add a consistency check at i2c_adapter
> registration time, so again it's done once and for all and we don't
> have to check again and again at transfer time.

I think this check is worth to have. It is not complete because drivers
may still not check the flag, but it is one step to be more robust.

> Or is this optimization not worth it?

I think so. It is one pointer check against a kernel oopsing somewhere
somewhen.

> [1] BTW, looking at the only two in-tree slave-only I2C adapter
> drivers, i2c-at91-slave and i2c-designware-slave, both are setting
> functionality flags other than I2C_FUNC_SLAVE. Unless I don't
> understand how the slave functionality works, this is a bug. I'll
> prepare and post patches later today.

Thanks for doing that!

Happy hacking,

   Wolfram


--ksynbm66oyue3y2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZe1VEACgkQFA3kzBSg
KbYpeQ//dIw4KlFvx97wH/kz2omtgShRsM4PBlclKbm20ZkoYdTr1F5Rya2uE3tm
+xEF83Pg/m3t64S2PVpLIhfQmN0u3z7/+hcPH6CpXE0hGpLoO41JHPELd5p9FYB2
LS300jBoSgcLryw8IAFjR3YQA/UaSeXk5OHKyAZgJPJTdY+aDFCFbJnJnAl2hyEs
pEirJeX0Ajqp7B01YcCeD5AeImMQQalBV2zHYlKfmmCTN4w9NQj969igBi0O6gSA
XcLxno7rqOamgSmdcouxEI7e1uSWdnIReAyw8nGKfZ9bzYKJUa8C9cBfJ7JJ6XGt
Rb3Y8INN6rJZv9V4oi+5xzNCEYaiyYDgALMp0OfMG664isMzaVMT7DqTo8S8Qw7H
4MMDmSQJTYIKoh2XpKABL8USm3SDKEglAoSN+RD0wEuEOu5BGDKMQqlOIukQwfqf
ssQuLVklbLrtMgNsxJibDBdMYJnOYfBYoNljVaRs9MIf0oypT6zO7Px7wv2sYyGo
HpUcbFmovXAlmqwljNACIqAYms9Kw4P/istl//wd+yr6MI5Qkx0IftQiC6/bqf5e
mdYbqOuXNbwnVLd8nGMVRMYUMxTU+LeC1clNWAXzBhlgAqFo2gQmZMgsEll3X0Jq
g2qHB8KoF8KlqulH7WBm7SRL2zmbCaV5xqN0BSozutvjqs0kJgY=
=eDfQ
-----END PGP SIGNATURE-----

--ksynbm66oyue3y2r--

