Return-Path: <linux-i2c+bounces-12143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C71EEB19EA7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 11:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E296917953E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6D023497B;
	Mon,  4 Aug 2025 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TSq/rR8l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E66245038
	for <linux-i2c@vger.kernel.org>; Mon,  4 Aug 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299074; cv=none; b=DUHV1RvPvo9ZvStXvyiZFXmt/LaSdHbcAcHJpDiFPipDzLjlVT/KKH77FOfKMASZThJ3gqSvdhV997fFm78WSFotQWXIPWP50xvABmBHP/E2hOrrtGWFYRfE6596FN7mSwTYqw2t9k2gdgQ0RDGyvcCRwpllQdH/6qDUIkjlv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299074; c=relaxed/simple;
	bh=IzNHPYdI73ZzUeDw+fqUQqQoSqogdsgdeLV26SJWKNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOV1cMOhoJAPAAV9nogofRYWVP8qtVWORd1nbrHaTrpSWcQejhEP9fI7c6CSZFi+RDHp7CIhVublKNHT4pChW6gKb3MBNtOkjy7qlXKAujACbF3rrve6pFnZoEgnugkOW3ZpBXv0YprIYw0XfVHuOT7HotunU6SHjncojokGbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TSq/rR8l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IzNH
	PYdI73ZzUeDw+fqUQqQoSqogdsgdeLV26SJWKNk=; b=TSq/rR8lMOHRWUGfOTnS
	fV2aUjGo4FRjajE692PPeIOthLiyaCgXdQMoZyyC18SSJV5svkyybVWmwQ97Cia3
	o7gu9u68QdRQ/78lj+89/7fyG5BmQAsfcAhSEHoJ9AR7nFlqVQ8O96w4bXGAHP6A
	UBLhSO91ut4vgpy7f1gsAP2V8L8rimFcsZexWV2CoycBknO5hX2DSlKYfjlwRFdR
	48WSlZWJmLiKmLcJPB8VO1rcujqgEjAeFtmo+T1Dxj0faNMtpdRK620cVBB6o6sA
	wTKVLRgsR4pUsstY5T+Q1u6txLpzWcbfbgnyBNMhm4urXMeESEGj6KsExIvJruKz
	DA==
Received: (qmail 1872277 invoked from network); 4 Aug 2025 11:17:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2025 11:17:47 +0200
X-UD-Smtp-Session: l3s3148p1@kI3AlIY7LJQujnuw
Date: Mon, 4 Aug 2025 11:17:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: chris.packham@alliedtelesis.co.nz, Alex Guo <alexguo1023@gmail.com>,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in
 rtl9300_i2c_smbus_xfer
Message-ID: <aJB6u1WoNjiE-tZz@shikoro>
References: <20250615235248.529019-1-alexguo1023@gmail.com>
 <4670491.LvFx2qVVIh@ripper>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aWRsTPaHeXaj3TkJ"
Content-Disposition: inline
In-Reply-To: <4670491.LvFx2qVVIh@ripper>


--aWRsTPaHeXaj3TkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 10:18:53AM +0200, Sven Eckelmann wrote:
> On Monday, 16 June 2025 01:52:48 CEST Alex Guo wrote:
> > The data->block[0] variable comes from user. Without proper check,
> > the variable may be very large to cause an out-of-bounds bug.
> >=20
> > Fix this bug by checking the value of data->block[0] first.
> >=20
> > Similar commit:
> > 1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
> > ismt_access()")
> > 2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
> > bug in xgene_slimpro_i2c_xfer()")
> [...]
>=20
> Please correct me but it looks like this fix was not yet applied to the t=
ree.=20
> But Chris Packham pointed out that this conflicts with my fixes for SMBUS/
> SMBUS_I2C.
>=20
> I would like to add my patchset on top of this (to avoid problems with st=
able=20
> submission) and add the Fixes: and Cc: stable@vger.kernel.org.
>=20
> I hope it is ok for you when I would pick this up. I would resubmit the f=
ixes=20
> patchset this evening (GMT+2).
>=20
> You can preview it at=20
> https://git.open-mesh.org/linux-merge.git/log/?h=3Db4/i2c-rtl9300-multi-b=
yte

Yes, we can do that. In general, it doesn't make sense to add this check
when the ultimate goal is to support SMBus v3 which doesn't need the
check anymore. But if it is blocking further development, we can apply
this. The check will be removed when SMBus v3 support comes in.


--aWRsTPaHeXaj3TkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiQercACgkQFA3kzBSg
KbYDBQ/7B4fiaRmvGDN5pEU7nLeehM/NGNtwbWW8b4ayoEhsUDzsj/ba4b2xG2nN
ZoMgnJrXV8sKhnsci9bbpPXf0UXNlOHI4BhsERrdloKao8yOkJ/Z4eJiR/wAL7gz
sAm0HkaMMiW3Yvq3AuOjA5OaOZbLOXZwpLjqJu5xhAi0QjRBUna5VTGc3Pt3gZAl
wAhmHybaStdoak2nKEJtF5HWHX6pEMYxZZ6avSYDTUDc8UBDKQpOk4Lq5z93d5Np
zT4Ig+VdL/AkFQrcNWfuzt/lPGz6AuOSPpjlZuK1I8mEc/uw8zNluknrsjz8UJ2l
jQTdY8UdfpOXW0jjnRyfjxuMT2/VpR2cx4xp8GRqtEjXB5msmousw0ZnaURMx6l3
Q2O7LcqODGLH3eYNXZpL8HQDy+cpeBkD+pa5oD/KHIglhTOZ3oLYwwKZ5/i6lfMM
2aWQZ0TVYWM3nOM6QTw9N4XMvyQ7mPpSKpkI7FCU9B+pG0H6RbmQiteVgeTySNl7
NWokKykY8g8fwQh5204PzlcURY6X3jOXKiAnJ9Q9RArHsDmaxlkHFn0Co7FKjrJm
Jf59AUqSS32U5rsVlLb0MFxFbJA92zhVc55ifYyP8NDrOEz6FIaazSYROj/FMUYn
qmRmE5PDnjWxAPWPXbmBLwRjDgdSkgfCxSoBmcngmKq+vUOfs9g=
=kan7
-----END PGP SIGNATURE-----

--aWRsTPaHeXaj3TkJ--

