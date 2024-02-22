Return-Path: <linux-i2c+bounces-1922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88585FF45
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 18:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FE5EB26075
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 17:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461193DB9A;
	Thu, 22 Feb 2024 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYQYgpOY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063CD14601C
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622779; cv=none; b=abRT9jlCC52aisCOgMU/UV05HHaeKuTrbMEtuAz/s1mpcBcLmRb0qONUacm8QUQI957LaVK+y2yXQ6b010xxHRxjia6StwEPrw4xsx7LAsjRRwUktlpTwYk4DC02UqWkoblyLKgIWFFCkY7zinMhG3qMsaH4iRgJKa3Bi06y9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622779; c=relaxed/simple;
	bh=4oBd/jcdcTn6sTLsHm2plaxj5EggSNpv62XZRcbcdC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRZpqkp1DwVhwGulgPJQIRXGWVH9Gqcqr3J+9o+aPHU64/bqzXUd6qL44kV+veYoCnLAzJO+mVihUGO0d87D6YQm54CBbCx4z5mlHHIqeOUq14ErcaJs1iAWAgTf/0XPvUOBgjvHqobhgiSjt9i/tAgohL813V+beBGfoCljFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYQYgpOY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA0FC433F1;
	Thu, 22 Feb 2024 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708622778;
	bh=4oBd/jcdcTn6sTLsHm2plaxj5EggSNpv62XZRcbcdC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYQYgpOYEB1gzr+62CNRu1z8EtL5WD516ue/5R72aVrWQiJ5kmM1sxgqut7NtrzHR
	 ZHv4sMRb5tSjbrk2wqxhVFGlL2vq4q1F6sbPb4ED+sn/IrGrqhQzPrWewVAtFhkExX
	 dGL0sqTJlHhDB3if/d5NYocbDNqt2idp8M4fg4hKV1IuHB6vmB/93GjIzMKAN2SPSO
	 FzGY7+uez2ix1pXhAMPW+ggjiyLZVM2+OUeJkbbiGBHNfxnFk1c1larhlQa4aU+KGq
	 juUKhmqDCeB4qc4EcPzpW42/QDt6BuD817e8DrUOUp9X7Ne9rjsNsnfbsPkoftu5hC
	 Al25/oxD/DDbQ==
Date: Thu, 22 Feb 2024 18:26:14 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <ZdeDtjDytsuo_1tC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <HansHu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXunlc5KQ5JlCA7@ninjato>
 <439eb65d-88de-4e7f-9138-000aefc1c1e4@zhaoxin.com>
 <ZdcVwJ6iOTEGWYz7@shikoro>
 <bf3eecf8-59d9-41ef-b58a-5198146ac631@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nkDJOaJ/HUCUjyOr"
Content-Disposition: inline
In-Reply-To: <bf3eecf8-59d9-41ef-b58a-5198146ac631@zhaoxin.com>


--nkDJOaJ/HUCUjyOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 06:42:20PM +0800, Hans Hu wrote:
>=20
> > > Thanks for your suggestion, the purpose of this approach is to
> > > reduce the clock stretching caused by the system. Therefore,
> > > I try to put almost all of the processing in the interrupt context.
> > Well, I think per-msg handling in interrupt context is enough. The
> > transfer (consisting of multiple messages) handling is usually best left
> > in process context.
> >=20
>=20
> OK, I understand now.

If you need inspiration, check i2c-digicolor.c for a simple driver
implementing it.


--nkDJOaJ/HUCUjyOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXg7IACgkQFA3kzBSg
Kbb8OQ//cXCnoG3DQUPIpKLIy0cKQWm22/Ukvc5IA+GWW8NtrzHshq2HUy3pd544
vWACHm/VOvqEmhGbUM0nkeLA5RRIs+/jH8IAE86z3aEP7KXuworzkzVB/7jCzKbv
rXLDHoDQbbnn3G9vH7lV5AQYWd42jMD1XSgtwo/XCxQ6F3sqb6mBrbk3kUpJ2DjU
EewSgKJHfO9LyzPspRl5SBNqh+BbGmxwipn17/zRSklX1KceXYmM8o+seEoGqn8v
hBQ4ybWj8vSmBIoF/4BNRBHn2KZ43js5uSfqXmvEKUzlkh1ykwoRvd1sOqG06cVb
2Pp+9TGjlBTDWTJ5qsWjRoFv8g8XCjrO2woDzayJD5AYcg/EAcGwYpxu5CFpgx5w
14BYjadTwvwkkXcQAQmn0DGRB2uDy5CEbjqPKdci7HOQ4k1Etvd55RnAqBALTeZh
qVF3top0EY6Vw9GtBCH/4XaUA0zgNfo5380zqGattZalU5zobpLkFvWoN3J40oZ8
5HvUK5VDm+nJPRURpZd9hZUV/8dhlqWh4ZGMFo/4Xtl2nWA3w40xfeVTz/9Wqwg4
6VEkDQcb90J9XzTiOQugc1ggFP7823Fvib8sV7W7/4gbEZcJT/ukdhhbUavpu2sY
sZaltbeGwoCNwsif1tZcFl8hPsXkv4RtQJIICMPkrQkfGf3HQKo=
=pXiO
-----END PGP SIGNATURE-----

--nkDJOaJ/HUCUjyOr--

