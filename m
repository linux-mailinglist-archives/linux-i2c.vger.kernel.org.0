Return-Path: <linux-i2c+bounces-2827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD589BB61
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6294C281279
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E024EB5C;
	Mon,  8 Apr 2024 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D7b7JHh1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF04E1CA
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567668; cv=none; b=Edgty0xOouPw//8C8Dzt65PqS6/GS+9L8YZPFURCdJH/vr3v40aBLfcRNViNfKtoQQxYnxy/QIX/wlczqxH3GMvH+BnzWQjW7RpmwPZ53tvIKqtbRKHcVLXQKvFRvChtN3Lal+fjByQBP3SrAD4aXCgmsfPbke1aoz2whCT2r7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567668; c=relaxed/simple;
	bh=z4CDEMFIMTjvOLif5sUmisJHGO9R4pf0qmsvsjOnpUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK/W+nuUnSncJFwTUqUpyhFyewkHOW78oM//WNEQWuNOhMT56T0Cla0EzGI02X08ttpemCO7BmBXxVlbtITSG5A0QC0dJMVeMs+ADbfuf+OfTNJ3swu1dwIOguoo1ouyWXDZ2ozVozPxmcnEKcMnJxFQEEE1PjK67Vi4F1mhzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D7b7JHh1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=B1xU
	GkiU6dmYPsBjCTtb6mRNv0nuvWzUMFCwA7SNs6U=; b=D7b7JHh1oY0gpZfVrcWm
	bVLPU9k9q3DbofnpH/OfhR3aO1Pu7vm5BC95ccqnukqiFFrq8C8rPxn+wKmX3yhe
	BeF1G4lEhOejWaSv785LLOpfbA2CXkv1tFklvdZHYUEIBrQu1f4Ov4LfTvbfJ8FQ
	srPASuPZeYyzeQCSkLa4XimHy9jV7libC24ca6Cm23+2VCkgt5bO/P6hWlEPimz2
	kB3OLKKsljxZDx4L5vzs51QWIhBGtq16LdG5EmnAQf8bwUuO/BWDKyrP3N7GQHUL
	ShiqM5VjAaxQdgLg/BpK6XAgAO/ji5/Ms71bCFHMNseI49LHGHg5d8N/hxz4Dxk3
	/g==
Received: (qmail 716288 invoked from network); 8 Apr 2024 11:14:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 11:14:24 +0200
X-UD-Smtp-Session: l3s3148p1@3RREO5IVVpwgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 11:14:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-i2c@vger.kernel.org, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 53/64] i2c: st: reword according to newest specification
Message-ID: <zpaizt3dhjbabotqylxph6hti7z4o4oq3mjqy4zmxjk74lpzdf@apnyh6m2fjst>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-54-wsa+renesas@sang-engineering.com>
 <f94f293c-4756-458e-8ffa-a10baa8379d0@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zc6r4szvuyukhmxj"
Content-Disposition: inline
In-Reply-To: <f94f293c-4756-458e-8ffa-a10baa8379d0@linux.microsoft.com>


--zc6r4szvuyukhmxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > -	unsigned long timeout;
> > +	unsigned long time_left;
>=20
> Thanks for doing this. Is the timeout v/s time_left language also due to =
the specification change?
> A link to the specification(s) in the commit message would be nice to have

I admit it is probably a seperate change...

> > -	if (!timeout) {
> > -		dev_err(i2c_dev->dev, "Write to slave 0x%x timed out\n",
> > -				c->addr);

=2E.. motivated by this "if (!timeout) dev_err("timeout!")" which is super
confusing to read because the logic is paradox.


> > +	if (!time_left)
> >  		ret =3D -ETIMEDOUT;
> > -	}
>=20
> Why did we lost the dev_err() here?

Agreed. Another seperate change. A timeout is not something the user
need to be aware of. It can regularly happen while an EEPROM is erasing
a page. The client driver will probably handle it correctly by trying
again. Only if the client driver sees a problem, then the user should be
notified. But not in the controller driver.


--zc6r4szvuyukhmxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTtW8ACgkQFA3kzBSg
KbaxqxAAqwfl+isJvw+Tbn4zWASNYgUCF88fdAOUyScMYpiIlRk2c7CR4M4BipLs
ppKwIrsKht9D++ljltU34nnMNsirMRI+QBRVrOubmvln130b6d5PzLvw0LmL92BR
9sBawa9Ow1y14b6htJXMB0fjmbUtubcB4vn0vgPNl9DwOyZXGawSQbEDW7eB9Dag
FePIO6KW1d01J54d3B0R+nBdbhB4Lr23Q99EEiO2N/f/Oa7cb6wc7nuqUkg1ymgG
4sTRUK95w+FQd2DhaAsXhjzRy1AqCCaW8O6RVDDhR71q808K+L+R4G/Ip/OvuPKS
nEd1r9HEG4jOVhNNbjtE8vILhIYU0bwdHR45YNCUQDXWNdfvkXa5A3THpfpE0iF/
D1dsp030Ogwex0OFYtEcUOT9nMeE1Io46sTIwfhO/kmAx5zaZqNB/u0Duv5i6zPA
vbG5yO6VEOU5wiJR97RTu1kzCs+UenOXSQ3mRjT3MJM5X8XvS/jQR6SSJflUsc7e
E1tj9COegSg9APc+i0kMeJdqk6wV6JGS3XzYI5fOwaHaEK8eDORj/Al95Y/g1F3W
yIYZbkL/TAV60Y4Z/VHYqblRa/eFvgzvyrkmZ3jjsTi7Zsh/2r8Dknx5l/tRiN6I
Vi+ogc1ZQL8awmqdG2FR8V3hrTEQNp/QxphmSJ5M79Dv8t7iIcU=
=4MpW
-----END PGP SIGNATURE-----

--zc6r4szvuyukhmxj--

