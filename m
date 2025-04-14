Return-Path: <linux-i2c+bounces-10319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6767DA87AAE
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723E4172A31
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 08:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1CF25D90F;
	Mon, 14 Apr 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NqsneIr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7104A25A337
	for <linux-i2c@vger.kernel.org>; Mon, 14 Apr 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620201; cv=none; b=DKXj72ozZskq9HnfjYRtDbFzNJv/55Df3RrEKp8qXnIZhaCkO0AwaNnlv+DrYEjWoHKnOXJkQCFs9PIDdfZI/ifYicIJAPihvYla6D8SnCafcCvxPqnzgCWMdB0YLzJ+Y2OU90AVhtC75w41/AwzgqIkBIF0KNh+QdmUVDHB6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620201; c=relaxed/simple;
	bh=cAhotz+p7zLvpkFQGb6VeYL51bzXWDDvCYSAKsuPpmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKQM8JkXN5Ex9OPTMH5Mrw3ybzDjxwCzEuo4CCaY6qCM92zDX16W95lr9fGt2p76Y76Y4p9H1/c5kEGFdDrY8YjDfCrCAAKcxZ4aoDVUzxxrpwP6zgQOdguRTddstq6U41MgPk8U2GKU+2hYINCUmBHaTB7PyhuxlS1ac5JDx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NqsneIr2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L41X
	ugcrkaJng0prf37fGGoaHP1NXudqBFve14cC7xA=; b=NqsneIr28pIeJGCagotS
	vZlS/SxIUDDvm7Hlhne+IQEy02mKcT87tQff51xNqd/iEN44wpudJ8DhU4gJRUCf
	zog1NXHDkuq4L//auLYPr8/dkDTnUKczcvnMJOqMWX8Eah0wpYQwGEbOdCpti6/k
	zyDxRVvWwqz3UoWD206vet5Xm8FdyoZvMUBB7+zsAdwbOBVKi8D5RkXsbA1pcrb9
	TP4RIhv5w6VKIfKP4V3cHTQ/sn5xry2JNlKgGnwloBZG0tZbXDzwe0AzHHDolJRT
	kHqi6MCbV6X87Xns/9uYMEDdYukfDHFEWv1nZBwhX33Mfj3HUCOk6vM8CuJJMtGF
	Mw==
Received: (qmail 2210223 invoked from network); 14 Apr 2025 10:43:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2025 10:43:08 +0200
X-UD-Smtp-Session: l3s3148p1@HUmSCrkyLtQujnth
Date: Mon, 14 Apr 2025 10:43:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ende.tan@starfivetech.com, linux-i2c@vger.kernel.org,
	jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org,
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com,
	endeneer@gmail.com
Subject: Re: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Message-ID: <Z_zKmx-60iWOjgs9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ende.tan@starfivetech.com, linux-i2c@vger.kernel.org,
	jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org,
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com,
	endeneer@gmail.com
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
 <Z_yxVJVc69ljaDZe@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ph+qQ7hk96GPnDr5"
Content-Disposition: inline
In-Reply-To: <Z_yxVJVc69ljaDZe@smile.fi.intel.com>


--Ph+qQ7hk96GPnDr5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	/* i2c-core-smbus.c: Only I2C_SMBUS_QUICK has msg[0].len =3D 0 */
>=20
> Please, remove filenames from the code, better to refer to the actual fun=
ctions
> as func(). This helps also to grep for all usages in case of renaming.

The comment can be removed. Regular I2C messages can also have a length
of 0.

> > +			     DW_IC_DEFAULT_FUNCTIONALITY;

Sidenote: Why do we have this define? It is used only once and makes
reading the actual functionalities harder, I'd say.

Also, I wonder if this patch really works in practice. The
I2C_AQ_NO_ZERO_LEN flag is still set, so the core should prevent such
messages to be passed on to the driver?


--Ph+qQ7hk96GPnDr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf8ypgACgkQFA3kzBSg
KbY5xg/9HLrcI4n/1KoiEoBHqhpKj/4r5Ff4LiSnYuCNrSV6zirpR6eLtw7eGuFB
mAbYWHCY9EjkfOTEa9Fw8cbwm8aHCgUw68sMNkBizDc6HNv1vyHSwuSwM/huNR5c
Vs079FKgPEik9zT292ns5qPA4eJJdStEV3/hST0RfTd7g14gpnLQ3ywY+lfu4j88
tR/UdIRXItKMna5s9bS+wFqswtFZdrjDjAN+oAanfVqVDifyhuApx4BwNHPhQZ0G
YaLr+ZzelQpNAVr76aWJjbNnFJjDgOk0FiT977noqHdPAyjeq/pQTU087khJRCYs
4YFu37l55XJjgbwAZ3Mh61YpHh9AqutDtTjDlDdeF9QZMD4dz2Qjg0ZSM9uICkga
wxkUmZj0Q3z7F1ZPdJet/mE4kxKBp7etFtIMYKFWk1jHVxGwLxrYxn9mOFun/rkS
tJ76HrserUnMPgtREW2+tPCDvI/YQPc8pOxJngdK4huWHYXoP2V4/9ziIrWtjjtb
gtpa5/9fG0gu7R9Uq7rvFFlp4rxxwe4DkDZytPHixx0S4DwgAYvd8Yey9w9kfCeo
gC+vchAzH9HAGHe4IFGmmX5eNFCbNdj4HnlsWSSDD0FRkroMC7Dy71SXPlqzq46F
AQt5b1jGSs9STTOSoycOUYcV2BYNuTmIaDdmgkq/DFI09BLXsNs=
=zBZm
-----END PGP SIGNATURE-----

--Ph+qQ7hk96GPnDr5--

