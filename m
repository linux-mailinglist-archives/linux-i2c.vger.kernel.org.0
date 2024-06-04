Return-Path: <linux-i2c+bounces-3801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD08FBD28
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 22:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57A31F25CE4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 20:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93F514265F;
	Tue,  4 Jun 2024 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Beev9rSt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712C14036B
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717532128; cv=none; b=Lw15gQXK+hdQpIBgjbAJDU5ScfyHgZTyAYdm32L/N/JrXYYVxm+6Elj56vd9BRLIzorVsKlrjKEm17wcbNEU1wnQ7slVcbtJhkI3ApRDiwTRzwCzr4xfdYZoSUoBS+gXbR/sAkYSUlwyewhEPxn6fK1FykkhMcJf/RNAcZuvlR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717532128; c=relaxed/simple;
	bh=843Pxj9q/wszPDCTdOObwl7gl9BDaaPWFGEg1gnkF10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR7HzPQm95U3C8RFrKDpXSNsbNwcbQdvOrOHZclezZzTFAGAEJj1qVmo9OHvBc1DjXDi5XcJ+IQKA8C9q39P6tx4Xd5cEMnTuJM1akRKAwIZWNM2WlP6/mzNBZVee3eMISvSSVwPyso+SchIG7mxpZ4gbkkzSiyoTosHxS1uNw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Beev9rSt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=80M9
	/oFeQrdHA5qzmIt/EiiNd4PHMkgSxg0oOqw3y5U=; b=Beev9rStyx1sTek2gs0e
	VVLK3gieGjFU6iGVBwpNVS9US/BFN25KxB6txKVv7eTWTkoIzuXH+7CJtv/ipJJu
	zzCIh9x9Avn1dZ8u4x7O6oUcHRrb4GqPWPHfsrYopdtQkOyPlI8DQr9VWHyhM4kg
	coh1nGvp2+kzJ1rFxm3cFXDcjLfBsyYwiOJVm11uzw9JxBt69UCMmeNT9qd0FUAG
	/IWdEpDNS+/Shc4PlipLA850UO1CnSSqFXk8j6GUZnwEa8MNT65VnTfvXMGfIONz
	tfC7BC5EqEa8rcyHfl/dTFM4jYdJ77QoyhhIpeNm9Vaso3BZgmzbuv1PO72/8Jvj
	gA==
Received: (qmail 2434857 invoked from network); 4 Jun 2024 22:08:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 22:08:41 +0200
X-UD-Smtp-Session: l3s3148p1@VjAmBBYawNFehhtB
Date: Tue, 4 Jun 2024 22:08:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <bk6rgqfcn5op5iuojoisogvtrp24ldblgkq4g62ffr4z7wnzug@xlp3ce5bx7bs>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.de>, linux-renesas-soc@vger.kernel.org, 
	Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
 <1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>
 <b2tnimag62ty6wndyjsy7u5fay6y52zn47vvifw6rh5abeqzpu@pqyyczutxcwu>
 <20240604171113.232628f9@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bhsazqdizvel7kz"
Content-Disposition: inline
In-Reply-To: <20240604171113.232628f9@endymion.delvare>


--4bhsazqdizvel7kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

> Note that we still want I2C_FUNC_I2C to be set properly, because it
> allows device drivers to optimize transfers (the at24 driver is a prime
> example of that) or even just to bind to the I2C bus (for device
> drivers which properly check for it).

I agree. We definitely want I2C_FUNC_I2C to be set and make use of it as
much as possible. We should just not completely rely on it.

> > (There is a CVE for it??) For Baruch's case, this is true. But there are
> > __i2c_transfer users all over the tree, they are all potentially
> > vulnerable, or?
>=20
> Yes there are many, but I think we shall differentiate between 2 cases:
> * Missing check in a specific kernel device driver. These are unlikely
>   to be a problem in practice because (1) these devices are typically
>   instantiated explicitly, and such explicit code or device tree
>   description would not exist in the first place if said device was not
>   compatible with said I2C bus, and (2) if such an incompatibility was
>   really present then it would have been spotted and fixed very
>   quickly. Arbitrary binding through sysfs attributes is still possible
>   but would definitely require root access and evil intentions (at
>   which point we are screwed no matter what). I'm honestly not worried
>   about this scenario.

OK, can be argued.

> * The issue being triggered from user-space through i2c-dev, which is
>   what Baruch reported. The user doing that can target any arbitrary
>   I2C bus and thus cause the oops by accident or even on purpose. For
>   me this is what CVE-2024-35984 is about. What limits the attack
>   surface here is that slave-only I2C buses are rare and you typically
>   need to be root to use i2c-dev. But this is still a serious issue.

Agreed.

> Also note that the first case could happen ever since __i2c_transfer()
> was introduced (kernel v3.6, commit b37d2a3a75cb) and is not limited to
> slave-only adapters, as any SMBus-only i2c_adapter would also be
> vulnerable.

Which makes handling this gracefully even more important.

> So the "Fixes:" tag in commit 91811a31b68d is incorrect for both
> scenarios.

Ack. Sorry! :)

> > gracefully because kicking off I2C transfers is not a hot path. Maybe we
> > could turn the dev_dbg into something louder to make people aware that
> > there is a bug?
>=20
> My previous message initially had a suggestion in that direction ;-)
> but I first wanted your opinion on the check itself. dev_dbg() is
> definitely not appropriate for a condition which should never happen
> and implies there's a bug somewhere else. A WARN_ON_ONCE would probably
> be better, so that the bug gets spotted and fixed quickly.

So, are you okay with keeping the check where it is now and turning the
dev_dbg into WARN_ON_ONCE? I am.

All the best,

   Wolfram


--4bhsazqdizvel7kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZfdEUACgkQFA3kzBSg
Kba6Tw//ZXtwgs1Z64LmhwEfpaTqY+W5nFX6jknwWjmZovfxNwQw8d/YqCuQKKfP
07P18mNfynJxN/H/QQZi6QW4XSyW0vEv18co4QNmW9YRRWRcyT18U0Onhf4NzwH2
uZBta6T2zoPiCAAiALKUCXCg1KTG0rm2usWZzuBG6dtlNnTQtmbNj6GyqTg9+NkB
i5Il7D9Vq2OvryNAe0dBgJYbd58rESLNeTYk99+4vqzR+bzTt3DPWvwuFa8JBEaH
RvQHHEMxYol3Jdp60WwRaWDIvMvFdVT6qmxkrSZDTLGSw3VwZdJ+YMY1B2dPAXPr
JFPwNEQftVaf7uRFj7lsBqgtzHkDtvAWbJtZP4DCdaMPOZKSV4oc0qm4iF8MV/Oj
jtBWFEJ68H4DCd89l2Y4I5EbA8eTpDRHQNLsjI7cMw5+bg8/z71rqSLa5nLNetLY
roHH/3+hMvOACaxKxv7EVGGZXoSfTid/hp7CpSciiwcI5h8uFkEnw3QHWgyS7b7v
EORXybfUyv/CCPJNybhoJdCsupmtFohn48NiWr1fVcvpCimvpiTatXuBP7uuOspN
EwqUW31YYobHybDmaIhD7DetIWPwGMZItcztkUfM3T7LbWFxGh44mbmGdfEobscT
AW0o7GioHbwSeU78vAUrjje8hVmmQwJE1DQ8gda/RtmFmjQEmoY=
=8vSS
-----END PGP SIGNATURE-----

--4bhsazqdizvel7kz--

