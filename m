Return-Path: <linux-i2c+bounces-15136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C8D1AACF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFB11300D640
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816C23793C7;
	Tue, 13 Jan 2026 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RkfdHWXo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258BD28FFFB
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325900; cv=none; b=KoysYGArA9uiXLibZ/t0DviRSlwMcK96Go6zBrH4K+CswODo+B5rm9e3yGWbkEWZlFTmUeOZ/RmVNKEc4Iq4V1DAd1qeun7hO5ZcZVVjpmrm4lL9IHsh/3Rc3qAlyUdyCyJBx+vyzyG3QiDZ1cZVTLIpuEXSvrYwFUX6xSTvBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325900; c=relaxed/simple;
	bh=mqBcLRTFt878mlRrk6xNBQon+iJC4vM2o96VAwnekTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lV09PSQJdOWUBsv5hSMP13TnquaHS9wLqT5T2sDIxt/L0L+Qs+qmdEtiwCWChWE1oNpZko3tf+jTh6BOmc+EJBqUg430KbyEm4WBnWyzU5XAPpTeftjmOLZYpN17YFbvN25ZI3shmGO/Z4NvzM7xdLgtXzVQf38N3X2O6i30uWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RkfdHWXo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2rTn
	yrHAYqEllwmMDsrpox1NcgA89IWQy0DTN8p0KqU=; b=RkfdHWXoSk+sUZNxRZ11
	b+0gSS0irO2I5yUGFKaTtxBxJMCl5caVyNLe3gXuSEndvjD7XwgAofMuHRlWD8EX
	mLAf+MUv1+UwuMuP/5cqRv0OXy+e6V72REoxM4WgJ0nkrA1oBM4HWuOBOsrj1AyB
	Lo3kJUfa2q0qoxQjq+P/d8OSjHd7ZuNluQuskOc6zHQxTUKtkdq82HFD2iffdmjA
	rOqhV5lUfG25Hvb94+GFt+zZHxjMTDLawLDmz/diVX6zMfYNYGtKDL3ikJmTQlZu
	UOc0yegtbwPdzBrb4ZZ3Mc+RbKgjEl0dLVdDnawHhqzURnpkV7cHYKz05Nj0YaPF
	2w==
Received: (qmail 1798359 invoked from network); 13 Jan 2026 18:38:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 18:38:17 +0100
X-UD-Smtp-Session: l3s3148p1@hrzudEhIMrEujnvx
Date: Tue, 13 Jan 2026 18:38:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Message-ID: <aWaDBzAOm86XSZgP@ninjato>
References: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
 <aRIPsOOgs5jtxv9D@shikoro>
 <aUAUAG3KwQHHqgKq@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZX4czvajIc6eOBd/"
Content-Disposition: inline
In-Reply-To: <aUAUAG3KwQHHqgKq@shikoro>


--ZX4czvajIc6eOBd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gero,

On Mon, Dec 15, 2025 at 10:58:24PM +0900, Wolfram Sang wrote:
>=20
> > > I'm working with multiple hotpluggable I2C adapters and have the
> > > following proposal:
> >=20
> > From my side, this all sounds reasonable. But we need Jean's opinion
> > here, too.
>=20
> Seems Jean is busy. So, from my side, let's go. I can apply it if all is
> well...

Did you have time to develop this?

Happy hacking,

   Wolfram


--ZX4czvajIc6eOBd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmgwcACgkQFA3kzBSg
KbYwGA//VQ0Hy1B089XjzbIrlGM3B8vWn3mOzrEkHlPoMbLR352bbtSYEJn4ZlcJ
au+9lG5keJckQHx/8V6uyj0v8TAfCodumk0hyQ71YVK0wLlr/gXV/DFUvs1iEc6K
NnrFu/DAqoYfewEUNNEVZl4i9LhcXHaNj7RbJ/dVxR5HlTdhiCT3dh5+Imi0nDI4
ALc0/2QiS3AUSHeFh18Ju+/p3bsxNcgKWG4UC4+sNpXVk8osz50ClFAoj00nbGPz
1RVmc4BtdH0yjqfhiLOqUcEXPf217YKlve0fLtOyVQe/NkggSTH+nASxa4tTSSQj
vwkspvSkjWkAG3S/37c+yYqYukKovp4s8Jr1aUNpwboUetXLDQUzPw0rsyc7Ilm2
d12pS2Xn2MJOgHKwN4MQO/ADXVtTpzOmYmgSWeD1NRdWXfCc/hNZ+75uMR+GvNDK
Ohd4cVnWkXc7TvRbEnj7+vb98k0LwUfRL5KvSb+De0en2wqI3YuMIBNNXvlVtwrC
58DGD4JTxU4ahpLZ4ryejZ2ZXZp7ewFe0sLZ1ZX9/1c8PXUhAKYACTxunozlk6jV
QEDZMFVPIOeNCEEV6T6r2nn3XPdEzJ4xL6FjmOnrSMQ/+lspjn6QoT1r6rHYywos
Hw8RVI7Al2DawtwKGO51TA1brx2viA+Wf/B26imSfz1SV/tHT/o=
=y7MY
-----END PGP SIGNATURE-----

--ZX4czvajIc6eOBd/--

