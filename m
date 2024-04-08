Return-Path: <linux-i2c+bounces-2825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD489BB29
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083101C21BC3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845B64D9F7;
	Mon,  8 Apr 2024 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XJjGzyTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635504D9E2
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567079; cv=none; b=ji7rRvjeGk7hCMDGw5Jg2wq6cA9f0hfp3hMUUilUZB5SNx+Z6spxceEIcNzL3NRpIHhs1sKTzdy2bt8A46S87GhE0HJbhu4q803Do63s9rQOkd7oRg8wPFQklNfmIWbOOrz+7ol0YOVEEchXDYp4spDOlmRLKTss96tchh9G9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567079; c=relaxed/simple;
	bh=kjDjXKKoE8Ayi+1GrmxBgboTFb2pUfu6mHNkhO8ngac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llH9i8CJ1BBYfnKhN5ub/eKH61EzdAckQtxOM6s+ZVj/prATDiyr1W4hOtD+uwAgvtNXUW4Yw2EJlhUj9LvfEG9kfOcKuUOEEaVq4nX2VYw92FykuHKOxNKvSefG2/HJOar2x352kYWJ2ITLyuFh6yAfuhxA0InALao3vwA88Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XJjGzyTS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lh0X
	YsdX9X7r+2LfLut3yBKFYOyg97EUMVhcdGoaLIo=; b=XJjGzyTSVij7r9HRza6z
	sWYNWwG61nhB7EyH5ca89Wl0/Fpvdj0+EIjvMtK+S+JG1yvPn/qH6QKJ55SL1Flc
	VyQECrU3n3+PV7wMLcOpF8AVxCJ6ooDXSmC2aALkuHJ3CclgS4XjMhnZ3cc5Fs3C
	gzNepVtYURM/uyuRHz0WJxtdNrBfZZZYCMaKtcBJU0688a4TFj/uLeMA4nSlvmMV
	527TnoKEaOR2QLV/rgf6po1Ej5vzgfOXbgSm302RpwOa/MTwc5b4WxQfxUvReVm2
	ePYrkjkTyfDgiGtaTUHu1x+WHt7tN6jji5W9aXBkKMrhH/U8w22qTKrxw/LsNEZz
	ag==
Received: (qmail 713144 invoked from network); 8 Apr 2024 11:04:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 11:04:34 +0200
X-UD-Smtp-Session: l3s3148p1@YmsjGJIVvNAgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 11:04:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5r3yanqecrrgaxn"
Content-Disposition: inline
In-Reply-To: <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>


--e5r3yanqecrrgaxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> > -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> > +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
>=20
> I2COM_MASTER might be coming from the datasheet.

Maybe we can just drop the comment? The value we write is pretty
self-explaining.


--e5r3yanqecrrgaxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTsx4ACgkQFA3kzBSg
KbYO6g/5AedCCDQIWj4C4jH7ScNJsrMsQsNgW1n2+FdZUbvt0sA7ZQcuIVZnbQEP
bHkMsZmy6ftTFuxN5a10qk/jpmIAGDBgP6MYa568mAPsBp4G9/9tK6sMo/q6Hvcl
YWqiCbbhD5h3/EqcEEEzOr8ft+79mXdtLawdQH5BuwKtBNJPHdKvhtrc9Y9whFxg
M4cWJUOgANxPIogyi6sWSsC2iaJTT4R14+ReipObubq32mZiGz7lk93wwAg0pF94
jMzH3fpEMXmJHpcqob9oj9Rsg/ymefKh9aU/p/uCC4seFrvS94KYb4xjsSBFU1RZ
a3vYArJNg3gclCE3AH6hks3UpQWHm6OYrQBX/VUZEhw/V013ymrIDWCpZY7nGgBr
BIgEqWbn8pnOTCRXQ7E4WmoR0fyF+eWTK98EFQ5QI5Itxj+fyFuffWfvzo8PoXQI
GqFT7LoEa1TvbL7pitevPMLzjKCWpdIDkLnvzzhe02oyd09AZlRhtM6wZ9oby3fc
TZO9NP9OFH9iR+MEQ5awHBKlTim4VaBkCndqtw01ehQ2OgPD5fdlyNXgw3MIqFBf
bsnitjgnu2lbv/xtL7aW1GOsHzRP4Z8t3aeYRUA0+PbYqD6Nq5QQGfRrLxCRxxTN
RKgM6DeDl3dWXkU9NqV2W4HnKTsZQpegdg0cxYXZTcJAHwHvciE=
=8GgV
-----END PGP SIGNATURE-----

--e5r3yanqecrrgaxn--

