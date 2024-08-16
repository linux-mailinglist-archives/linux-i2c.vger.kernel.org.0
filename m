Return-Path: <linux-i2c+bounces-5454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D5954C4C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839F21C232BC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16D01BC069;
	Fri, 16 Aug 2024 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XxYTubHt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A81A2C35
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818313; cv=none; b=cC5LYV34BJvB++6yNQRVv2dRdh2R04g9eqEM0OFauo6Ai+Ukrv2ApbEBYZkRXfFpAvnwy0hbsTeQa+0LEOx7VESPrcUHNbtcDLwhWDY1YWqX0/GBQUrtXX5nXX8MV5xTUkF6nc7AHxCNvD/mHdC4JltO8lMdd/czG9yWyh/yyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818313; c=relaxed/simple;
	bh=v8L7DTGRXeGDMjcfEyvd3R9Khy7TFpK32HAXLbssqCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWOg5IkCPMch312stKaEADF2EBE2idl2iOqhxY3pSHCut1D2ams6Gfy5ODD39IxDP1L8c4zncIut/TVC9T8W54izdF9fRT3f1cD0iU6P/jgoaNrS5/RC6YZobY1Nn9k+8/xPH4imQrPbfISw7a2Un+6WN+UraIqoS86YHLxb+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XxYTubHt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=v8L7
	DTGRXeGDMjcfEyvd3R9Khy7TFpK32HAXLbssqCo=; b=XxYTubHtmKaFeFH6xqDT
	MDoxYRb5Oo6zkHVMZOs2dfc6XcUUbTiMDcRW1tEU2OTmpqOpExP040u58+AeVafY
	LE/eORUonzpqwCOzjgfztuV3dCHeq8gevQjh+unYlJ+FukW6jacm3dqB/boj5dKG
	eq+EkRh+20iSBMJYfnm7V7fk5XiReJcM5RCR84vCNN7xqNR2KoaAvzG9qv6UpnJ5
	B/UowfETLFK9WDM8xRrhG0hpT3Cq+oa/EytbECr1+XSAojeCZGJV9LPbbaiq32XI
	Ovwvai69WSXYRW0ggUEBeGpsquW0RBXBwj0zxcUg990DyCMXE1OnHp9pk3h3Ivw0
	vg==
Received: (qmail 2625143 invoked from network); 16 Aug 2024 16:25:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 16:25:05 +0200
X-UD-Smtp-Session: l3s3148p1@9X+2uc0fLoZehhrc
Date: Fri, 16 Aug 2024 16:25:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc4
Message-ID: <Zr9hQDct691WAlas@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Breno Leitao <leitao@debian.org>
References: <hai5dhvjdh6qrw6hu5smc5kykqnh42mbxjyr4y7odgtorbridf@idkhasdrmoak>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3TTZpTygE1RtsGu1"
Content-Disposition: inline
In-Reply-To: <hai5dhvjdh6qrw6hu5smc5kykqnh42mbxjyr4y7odgtorbridf@idkhasdrmoak>


--3TTZpTygE1RtsGu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 09:41:25AM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> This pull request includes two fixes related to the runtime PM
> functions, which are described in the tag description.
>=20
> Breno's fix will require additional support when backported to
> stable kernels.
>=20
> My fix addresses an issue that was missed by Gaosheng in last
> week's patches and overlooked in my review. With this change, the
> exit path of the runtime_resume() function for the Qualcomm
> controller should fine (there's still a minor cleanup needed,
> which will be handled in a different branch).
>=20
> As always, I wish you a great weekend!

Same to you!

Pulled, thanks.


--3TTZpTygE1RtsGu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/YTwACgkQFA3kzBSg
KbZTPQ/9ECdNFOgDo0FJG2UMZCImD4dJbPnv9FO7qPkVm8f1s3bNw6ylhGJ7/NS/
3PVPaSYMipVPgrbAm8TrnzO2O+hLMIyvPfLQgl1lAeAbTHXQ6zNAAMejnMBo8lVa
SyfzqT3m/UoO+zNUa/Y1LPVj1bK0eYNNpTsHja2ii0GJWuTEUmNhllbnAw5pyfKa
udPNqcFhxvfzzAv5JH6Fq71UjPEqWGw2YC6OzoQijiNtKhJL3lxCYARLadWt5YFk
fupIlxHu5Gy5844FCTRVJdRqS+gbeODs4Wjyx4Ys7K6aqIB8Vh+mTxdTJiRvHfn4
Rv5LDISFVjYm7JupAVUcm06AjoOZ+4kH05/O3Tc9/86efvYvW0Zn9KAfAGAeXaXO
ivTwI89c54F1Q0rJ0DjB8xSSDpnBjyMIKtH7BmmbZ6ilvsRQoNlLewUhuXZXCkHg
sSsHCRBwshRT4EdIERpy26ELCKIjRI+wCjUmPc51ub8gw+BQyhiIOSVHE9JwtJsu
qUIsJBf0/rs7dN9lRCEZWlddqj2Pu0iYsMgwaE//pBZJEACLajAQd48ykQ/t23/C
uwmaE3PBBVFDelgzRfpwb7ACEvUlv6sNWeOgre3/ndHswl6XE/MoOAxhDht4BAw+
toLGhwHQqLBIQwxt/JSvi1pccTY55gMN2bADp4A5DB9/arWVX4Q=
=C5JX
-----END PGP SIGNATURE-----

--3TTZpTygE1RtsGu1--

