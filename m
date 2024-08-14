Return-Path: <linux-i2c+bounces-5396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA99521C6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5261F21BF8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7BF1BBBDC;
	Wed, 14 Aug 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SYWJpFbf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1A1B373D
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658615; cv=none; b=fLbvNcN7JaYudC3W0jntVqeg6zNW35YiisdTBzlJijVilTX2xGEURu3GC1d1KC+h6+HhxHdPPz9RzShzCL9kwO/+lsKxDj8rwNMgsBKssb9uAugsvEmLfmeqnt2ol81j/J5sJA5ImY7oVpgpd5XKDvhBo80kLd605JF9N74LYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658615; c=relaxed/simple;
	bh=aP3yg37n3unysbwfVs7D5hT+Zv/m2SzTRP99ahdTrSQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNI9P3IyWQ9oW+OQ9PPVxyAHQSwnMlvmnJRx3aN4Z4Kh8Gkeur5y3lILJ+OuXO82nqc4LhPelJpe+E/vNhz0tlJbFCMnM28wzg2cUJg8RBeojYaDj1F/9M1fi8Y+kZf27GUPKbBtHhDZw9GEosA2lPjpqoQ9Xm5LwZrZ+4dGMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SYWJpFbf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aP3y
	g37n3unysbwfVs7D5hT+Zv/m2SzTRP99ahdTrSQ=; b=SYWJpFbfARgkOO/Gt8KY
	6HsrZKwji7QAhnZamuq83unvXEZsnXxW/csEXuSsLUzweWlA8ugxNEKVG9MXUWB+
	n9YP+2IQghLaulHx68DmzoicQSpl+ba0bELedPCTf9AYBunBqTsIPsaSNHxgUKbH
	5WGOTbE3ocFIrhiV6fxtnNm5ziW3vWFbxVTIRswLK7BuQXTR9WUWSaYD1X6GAqqS
	HPvPGzwZP8s+dsZbGQwObFWO2xez5/eOQOqae+G5lGX77Ds+8sr81inCtrDVG3BZ
	9YkDZ/L3kIfBnzLCeCFZU4QRXWqoe5bFncczLgHFqigrzp54uD3YuMp2u9ZBQ5kZ
	1g==
Received: (qmail 2061545 invoked from network); 14 Aug 2024 20:03:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:03:31 +0200
X-UD-Smtp-Session: l3s3148p1@IUw5i6gfvKcgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:03:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] treewide: remove FSF address
Message-ID: <Zrzxc2LTR9Agw78y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
References: <20240811090834.5196-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VVnO4n9tna8v8yib"
Content-Disposition: inline
In-Reply-To: <20240811090834.5196-1-wsa+renesas@sang-engineering.com>


--VVnO4n9tna8v8yib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:08:34AM +0200, Wolfram Sang wrote:
> We keep it simply in COPYING. Makes updating much easier.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Pushed to master.


--VVnO4n9tna8v8yib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88XIACgkQFA3kzBSg
KbbwZw/+M9QjqAKhmge7VfnkHXLrs5brV70vYUPGiaMHfMCAyOxyDsfgmr7VqaFb
YIPWdRhlEqswOzIBp2Y1jvYHUzOqMnj98OBmutFDbojIYH1oEncFBc9P/YaySYFG
Y7IEN3Zu0jTAKm7JfIC9yzWZZKATEct3lchPG13TMdSC4aQNA7f7tfTI/wHpgkMW
2vVDRysE9/mfo4yH+VW2nTHcASrseVNr0RPTnd1FLWaCxcrWmytLB/YaeoxvFaGb
hANpWzgTeB//XfllK4z7oE/1ZEWGpzhICAR9hFHN2piGMJF+QMOgMl+KlfmvAdaS
k/hA7jBEMj6dDYAKqyxpizXc11Q+TSDdNIXgvrLU3jPqfRfxttblhxzbSoyQy4Gi
NoZW0g2Ip+6O4fCFMUTcM13Qr5F8PGzVw7WidxicId/gHwifEc6MzjE6OVWloh35
jdyQ3xgDqcSe+mG5/G0k4lSuBkZDmxrC2rax0huh8X4uU6P3rWewlQTy8iGfAv2w
sM5uB3g9ZiUyW+owJUWb41gOWsirFc+M489UuTHwp2/hQ5mDFHWvQmHNCpJHDRTe
xSkmc6pVT/U32Dwt7cCWP/g1zR8kwocmzeSjq6JQMusDBQVcpl7FP/AzyzTVwP77
TwU0Khb/QHHF0GkzEhnWp8OjPwAS93ptjVYaMYkx9+u854hWrVo=
=rQSe
-----END PGP SIGNATURE-----

--VVnO4n9tna8v8yib--

